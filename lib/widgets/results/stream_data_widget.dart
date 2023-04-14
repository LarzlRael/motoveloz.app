part of '../widgets.dart';

class StreamDataWidget<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(T data) builder;
  final NoResults noResultsWidget;
  final T? initialData;
  const StreamDataWidget({
    required this.stream,
    required this.builder,
    required this.noResultsWidget,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data is List && (snapshot.data as List).isEmpty) {
          return noResultsWidget;
        }
        if (snapshot.data is Map && (snapshot.data as Map).isEmpty) {
          return noResultsWidget;
        }
        return builder(snapshot.data!);
      },
    );
  }
}
