import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

enum LoadingStatus {
  idle,
  canLoading,
  loading,
  error,
}

class _PreferredLoadingIndicatorSize extends Size {
  _PreferredLoadingIndicatorSize({this.indicatorHeight})
      : super.fromHeight(indicatorHeight ?? kMinInteractiveDimension);

  final double? indicatorHeight;
}

class LoadingIndicator extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  @override
  final Size preferredSize;
  final LoadingStatus status;

  LoadingIndicator({
    Key? key,
    this.height,
    this.status = LoadingStatus.idle,
  })  : preferredSize = _PreferredLoadingIndicatorSize(indicatorHeight: height),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (status) {
      case LoadingStatus.idle:
        content = const Center(
          child: Text('No more data'),
        );
        break;
      case LoadingStatus.canLoading:
        content = const Center(
          child: Text('Load more...'),
        );
        break;
      case LoadingStatus.loading:
        content = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: kProgressIndicatorSmall,
              height: kProgressIndicatorSmall,
              child: CircularProgressIndicator(),
            ),
          ],
        );
        break;
      default:
        content = const SizedBox.shrink();
        break;
    }

    return SizedBox(
      height: preferredSize.height,
      child: content,
    );
  }
}
