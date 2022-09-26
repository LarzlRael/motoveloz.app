part of 'widgets.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.isDarkTheme,
  });
  final bool isDarkTheme;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: SearchShopStoreDelegate());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDarkTheme ? Colors.black54 : Colors.grey[200],
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: isDarkTheme ? Colors.black12 : Colors.white12,
                    blurRadius: 5,
                    offset: Offset(0, 5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SimpleText(
                  text: 'Buscar...',
                  lightThemeColor: Colors.black54,
                  darkThemeColor: Colors.white54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  Icons.search,
                  /* color: Colors.white70, */
                )
              ],
            ),
          ),
        ));
  }
}
