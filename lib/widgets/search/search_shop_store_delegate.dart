part of '../widgets.dart';

class SearchShopStoreDelegate extends SearchDelegate {
  HistoryBloc historyBloc = HistoryBloc();
  ResultBloc resultBloc = ResultBloc();

  @override
  /* final String searchFieldLabel; */

  /* SearchShopStoreDelegate() : searchFieldLabel = 'Buscar por nombre'; */
  late final Debouncer<String> _debouncer;

  SearchShopStoreDelegate() {
    _debouncer = Debouncer<String>(
      const Duration(milliseconds: 500),
      initialValue: '',
      onChanged: (query) => _search(query),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    resultBloc.getSearchStore(query);
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            text: 'Historial de busquedas'),
        Expanded(
          child: StreamDataWidget<List<HistoryModel>>(
            stream: historyBloc.scansStream,
            builder: (data) => listViewBlocHistory(data),
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

  Future<void> _search(String query) async {
    resultBloc.getSearchStore(query);
  }
}
