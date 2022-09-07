part of '../widgets.dart';

class SearchShop extends SearchDelegate {
  @override
  final String searchFieldLabel;

  SearchShop() : searchFieldLabel = 'Buscar por nombre';
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
    return Text('buildResuts');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? sortedShopByName()
        : shopData
            .where((element) =>
                element.shopName.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(suggestionList[i].imageAsset,
                  width: 50, height: 50)),
          title: Text(suggestionList[i].shopName.toTitleCase()),
          onTap: () => launchURL(suggestionList[i].goToUrl),
        );
      },
    );
  }
}
