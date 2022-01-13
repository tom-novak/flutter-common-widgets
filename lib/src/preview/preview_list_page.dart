import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';

class PreviewListPage extends StatefulWidget {
  const PreviewListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewListPage> createState() => _PreviewListPageState();
}

class _PreviewListPageState extends State<PreviewListPage> {
  late ItemsRepository _repository;

  @override
  void initState() {
    _repository = Provider.of<ItemsRepository>(context, listen: false);
    _repository.loadNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsRepository>(
      builder: (context, repository, child) {
        return CommonListPage(
          items: _repository.items,
          layoutStateBuilder: (context) {
            return LayoutState.content;
          },
        );
      },
    );
  }
}
