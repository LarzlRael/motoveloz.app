part of 'widgets.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

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
              color: Colors.black54,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SimpleText(
                  text: 'Buscar...',
                  style: TextStyle(color: Colors.white70),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white70,
                )
              ],
            ),
          ),
        ));
  }
}
