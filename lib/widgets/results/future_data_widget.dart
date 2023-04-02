import 'package:WaraShops/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FutureDataWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T data) builder;
  final NoResults noResultsWidget;
  const FutureDataWidget({
    required this.future,
    required this.builder,
    required this.noResultsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
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
