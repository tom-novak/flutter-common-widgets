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
  late ScrollController _controller;
  late Function() bottomReachedListener;
  var loadingStatus = LoadingStatus.idle;

  @override
  void initState() {
    var repository = Provider.of<ItemsRepository>(context, listen: false);
    repository.loadNext();
    bottomReachedListener = onBottomReached;
    _controller = ScrollController();
    _controller.addListener(bottomReachedListener);
    super.initState();
  }

  void onBottomReached() {
    if (_controller.position.pixels >
        _controller.position.maxScrollExtent) {
      setState(() {
        loadingStatus = LoadingStatus.loading;
      });
      Provider.of<ItemsRepository>(context, listen: false).loadNext().then(
            (value) => setState(
              () {
                loadingStatus = LoadingStatus.idle;
              },
            ),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(bottomReachedListener);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsRepository>(
      builder: (context, repository, child) {
        var items = repository.items;
        return RefreshIndicator(
          onRefresh: repository.refresh,
          child: SliverListPage(
            controller: _controller,
            itemBuilder: (context, index) {
              return CommonListTile(
                  item: items[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const BaseVerticalScreen(
                            body: PreviewDetailPage(),
                          );
                        },
                      ),
                    );
                  });
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: items.length,
            layoutStateBuilder: (context) {
              return LayoutState.content;
            },
            footer: LoadingIndicator(
              status: loadingStatus,
            ),
          ),
        );
      },
    );
  }
}
