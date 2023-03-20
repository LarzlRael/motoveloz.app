part of '../widgets.dart';

class SearchShopStoreDelegate extends SearchDelegate {
  HistoryBloc historyBloc = HistoryBloc();
  @override
  final String searchFieldLabel;

  SearchShopStoreDelegate() : searchFieldLabel = 'Buscar por nombre';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    /* TODO return something */
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    historyBloc.getAllHistory();

    if (query.isEmpty) {
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
    } else {
      final suggestionList = shopData
          .where((element) =>
              element.shopName.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return suggestionList.isEmpty
          ? NoResults(
              icon: Icons.search_off,
              message: 'No hay resultados para "$query"',
              showButton: false,
              iconButton: Icons.search_off,
            )
          : listViewItems(suggestionList);
    }
  }

  ListView listViewItems(List<ShopModel> suggestionList) {
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, i) {
        return renderItemList(context, suggestionList[i], true);
      },
    );
  }

  ListView listViewBlocHistory(List<HistoryModel> suggestionList) {
    final pinterHistory = suggestionList
        .map((e) => shopData.firstWhere(((shopData) {
              if (shopData.shopName == (e.querySearched)) {
                shopData.id = e.id;
              }
              return shopData.shopName == (e.querySearched);
            })))
        .toList();

    return ListView.builder(
      itemCount: pinterHistory.length,
      itemBuilder: (context, i) {
        return renderItemList(context, pinterHistory[i], false);
      },
    );
  }

  Widget renderItemList(
      BuildContext context, ShopModel suggestionItem, bool registerHistory) {
    final double sizeImage = 40;
    if (!registerHistory) {
      return ListTile(
          leading: const Icon(Icons.history),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(suggestionItem.imageAsset,
                width: sizeImage, height: sizeImage),
          ),
          title: Text(suggestionItem.shopName.toTitleCase()),
          onLongPress: () => showAlertDialog(
                  context,
                  "Eliminar de historial",
                  SimpleText(
                      text:
                          "¿Desea eliminar ${suggestionItem.shopName.toTitleCase()} de su historial?"),
                  () async {
                await historyBloc.deleteHistoryById(suggestionItem.id!);
                historyBloc.getAllHistory();
              }),
          onTap: () => openBrowserTab(suggestionItem.goToUrl));
    }
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(suggestionItem.imageAsset,
            width: sizeImage, height: sizeImage),
      ),
      title: Text(suggestionItem.shopName.toTitleCase()),
      onTap: () {
        openBrowserTab(suggestionItem.goToUrl);
        if (registerHistory) {
          historyBloc
              .newHistory(HistoryModel(querySearched: suggestionItem.shopName));
        }
      },
    );
  }
}
