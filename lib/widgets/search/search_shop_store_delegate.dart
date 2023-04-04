part of '../widgets.dart';

class SearchShopStoreDelegate extends SearchDelegate {
  HistoryBloc historyBloc = HistoryBloc();

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

  List<StoreModel> _lastSearchResult = [];

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
    if (query.isEmpty) {
      return _lastSearchResult.isEmpty
          ? NoResults(
              icon: Icons.search_off,
              message: 'No hay resultados para "$query"',
              showButton: false,
              iconButton: Icons.search_off,
            )
          : listViewItems(_lastSearchResult);
    }

    _search(query);
    return listViewSuggestResult(_lastSearchResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    historyBloc.getAllHistory();
    _debouncer.value = query;
    if (query.isEmpty) {
      return _lastSearchResult.isEmpty
          ? NoResults(
              icon: Icons.search_off,
              message: 'No hay resultados para "$query"',
              showButton: false,
              iconButton: Icons.search_off,
            )
          : listViewItems(_lastSearchResult);
    }

    return StreamDataWidget<List<HistoryModel>>(
      stream: historyBloc.scansStream,
      builder: (data) => listViewBlocHistory(data),
      noResultsWidget: NoResults(
        icon: Icons.history,
        message: 'No hay historial de busquedas',
        showButton: false,
        iconButton: Icons.search_off,
      ),
    );
  }

  ListView listViewItems(List<StoreModel> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, i) {
        return renderItemList(context, suggestionList[i], true);
      },
    );
  }

  ListView listViewBlocHistory(List<HistoryModel> suggestionList) {
    return ListView.builder(
      itemCount: _lastSearchResult.length,
      itemBuilder: (context, i) {
        return renderItemList(context, _lastSearchResult[i], false);
      },
    );
  }

  ListView listViewSuggestResult(List<StoreModel> suggestionList) {
    return ListView.builder(
      itemCount: _lastSearchResult.length,
      itemBuilder: (context, i) {
        return renderItemList(context, _lastSearchResult[i], false);
      },
    );
  }

  Widget renderItemList(
      BuildContext context, StoreModel suggestionItem, bool registerHistory) {
    final double sizeImage = 40;
    if (!registerHistory) {
      return ListTile(
        leading: const Icon(Icons.history),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(suggestionItem.imageUrl,
              width: sizeImage, height: sizeImage),
        ),
        title: Text(suggestionItem.storeName.toTitleCase()),
        onLongPress: () => showAlertDialog(
            context,
            "Eliminar de historial",
            SimpleText(
                text:
                    "¿Desea eliminar ${suggestionItem.storeName.toTitleCase()} de su historial?"),
            () async {
          /* await historyBloc.deleteHistoryById(suggestionItem.id); */
          historyBloc.getAllHistory();
        }),
        onTap: () => goUrlSelected(
          context,
          LoadWeb(
            title: suggestionItem.storeName,
            url: suggestionItem.storeUrl,
            imageAsset: suggestionItem.imageUrl,
          ),
        ),
      );
    }
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(suggestionItem.imageUrl,
            width: sizeImage, height: sizeImage),
      ),
      title: Text(suggestionItem.storeName.toTitleCase()),
      onTap: () {
        if (registerHistory) {
          historyBloc.newHistory(
              HistoryModel(querySearched: suggestionItem.storeName));
        }

        goUrlSelected(
          context,
          LoadWeb(
            title: suggestionItem.storeName,
            url: suggestionItem.storeUrl,
            imageAsset: suggestionItem.imageUrl,
          ),
        );
      },
    );
  }

  Future<void> _search(String query) async {
    final searchResult = await StoreServices().getSearchStores(query);
    _lastSearchResult = searchResult;
  }
}
