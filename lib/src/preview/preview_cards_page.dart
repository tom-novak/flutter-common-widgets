import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';

class PreviewCardsPage extends StatefulWidget {
  const PreviewCardsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewCardsPage> createState() => _PreviewCardsPageState();
}

class _PreviewCardsPageState extends State<PreviewCardsPage> {
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
          itemCount: repository.items.length,
          itemBuilder: (context, index) {
            var item = repository.items[index];
            return Padding(
              padding: item != repository.items.last
                  ? const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0)
                  : const EdgeInsets.all(8.0),
              child: ImageCard(
                title: item.title,
                description: item.description,
                image: item.image,
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
                },
              ),
            );
          },
        );
      },
    );
  }
}
