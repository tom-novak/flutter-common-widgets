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
  late ItemsRepository repository;

  late ScrollController _controller;
  late Function() bottomReachedListener;

  @override
  void initState() {
    super.initState();
    repository = Provider.of<ItemsRepository>(context, listen: false);
    repository.loadNext();
    bottomReachedListener = onBottomReached;
    _controller = ScrollController();
    _controller.addListener(bottomReachedListener);
  }

  void onBottomReached() {
    if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
      repository.loadNext();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(bottomReachedListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsRepository>(
      builder: (context, repository, child) {
        if (repository.isLoading &&
            repository.failureOrSuccessOption.isNone()) {
          return const CommonListShimmer(itemCount: 7);
        } else {
          return repository.failureOrSuccessOption.fold(
            () => const SizedBox.shrink(),
            (failureOrSuccess) => failureOrSuccess.fold(
              (failure) => const CommonErrorPage(),
              (items) => RefreshIndicator(
                onRefresh: () async {
                  repository.refresh;
                },
                child: SliverListPage(
                  controller: _controller,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommonListTile(
                        item: items[index],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const BaseVerticalScreen(
                                  body: PreviewDetailPage(itemId: 0),
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
                    status: repository.isLoading
                        ? LoadingStatus.loading
                        : LoadingStatus.idle,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
