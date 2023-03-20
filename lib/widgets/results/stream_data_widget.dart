part of '../widgets.dart';

class StreamDataWidget<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(T data) builder;
  final NoResults noResultsWidget;
  const StreamDataWidget({
    required this.stream,
    required this.builder,
    required this.noResultsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data is List && (snapshot.data as List).isEmpty) {
          return noResultsWidget;
        }
        return builder(snapshot.data!);
      },
    );
  }
}
