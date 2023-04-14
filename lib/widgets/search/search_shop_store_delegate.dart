part of '../widgets.dart';

class SearchShopStoreDelegate extends SearchDelegate {
  HistoryBloc historyBloc = HistoryBloc();
  ResultBloc resultBloc = ResultBloc();

  final SearchProvider searchProvider;

  @override
  String get searchFieldLabel => 'Buscar';

  Timer? debouncerTimer;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  SearchShopStoreDelegate(this.searchProvider) {}

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => {
        close(context, null),
        /* cleanStreams(), */
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    query = searchProvider.getQuerySearched;
    _onQueryChanged(context, query);
    /* resultBloc.getSearchStore(query); */
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            text: query.isNotEmpty
                ? 'Resultados de busqueda para "$query"'
                : 'Mostrando todos los resultados'),
        Expanded(
          child: StreamDataWidget<List<StoreModel>>(
            stream: resultBloc.resulStream,
            builder: (data) => listViewSuggestResult(data),
            noResultsWidget: NoResults(
              icon: Icons.search_off,
              message: 'No hay resultados para "$query"',
              showButton: false,
              iconButton: Icons.search_off,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    historyBloc.getAllHistory();
    _onQueryChanged(context, query);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            text: 'Historial de busquedas'),
        Expanded(
          child: query.isEmpty
              ? StreamDataWidget<List<HistoryModel>>(
                  stream: historyBloc.historyStream,
                  builder: (data) => listViewBlocHistory(data),
                  noResultsWidget: NoResults(
                    icon: Icons.history,
                    message: 'No hay historial de busquedas',
                    showButton: false,
                    iconButton: Icons.search_off,
                  ),
                )
              : StreamDataWidget<List<StoreModel>>(
                  initialData: searchProvider.getStores,
                  stream: resultBloc.resulStream,
                  builder: (data) => listViewSuggestResult(data),
                  noResultsWidget: NoResults(
                    icon: Icons.history,
                    message: 'No hay historial de busquedas',
                    showButton: false,
                    iconButton: Icons.search_off,
                  ),
                ),
        )
      ],
    );
  }

  ListView listViewBlocHistory(List<HistoryModel> historyList) {
    return ListView.builder(
      itemCount: historyList.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: const Icon(Icons.history),
          trailing: Hero(
            tag: historyList[i].storeName,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                historyList[i].storeImageUrl,
                width: 40,
                height: 40,
              ),
            ),
          ),
          title: Text(historyList[i].storeName.toTitleCase()),
          onLongPress: () => showAlertDialog(
              context,
              "Eliminar de historial",
              SimpleText(
                  text:
                      "¿Desea eliminar ${historyList[i].storeName.toTitleCase()} de su historial?"),
              () async {
            await historyBloc.deleteHistoryById(historyList[i].id!);
            historyBloc.getAllHistory();
          }),
          onTap: () => goUrlSelected(
            context,
            LoadWeb(
              title: historyList[i].storeName,
              url: historyList[i].storeUrl,
              imageAsset: historyList[i].storeImageUrl,
            ),
          ),
        );
      },
    );
  }

  ListView listViewSuggestResult(List<StoreModel> suggestionList) {
    final double sizeImage = 40;
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Hero(
            tag: suggestionList[i].storeName,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                suggestionList[i].imageUrl,
                width: sizeImage,
                height: sizeImage,
              ),
            ),
          ),
          title: Text(suggestionList[i].storeName.toTitleCase()),
          onTap: () {
            historyBloc.saveHistory(HistoryModel(
              storeName: suggestionList[i].storeName,
              storeUrl: suggestionList[i].storeUrl,
              storeImageUrl: suggestionList[i].imageUrl,
            ));

            goUrlSelected(
              context,
              LoadWeb(
                title: suggestionList[i].storeName,
                url: suggestionList[i].storeUrl,
                imageAsset: suggestionList[i].imageUrl,
              ),
            );
          },
        );
      },
    );
  }

  void _onQueryChanged(BuildContext context, String query) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    if (debouncerTimer?.isActive ?? false) debouncerTimer!.cancel();

    debouncerTimer = Timer(Duration(milliseconds: 500), () async {
      print(query);
      if (query.isEmpty) {
        return;
      }
      searchProvider.setQuerySearched = query;
      searchProvider.setStores = await resultBloc.getSearchStore(query);
    });
  }

  void cleanStreams() {
    historyBloc.dispose();
    resultBloc.dispose();
  }
}
