import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewDetailPage extends StatelessWidget {
  const PreviewDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          stretch: true,
          onStretchTrigger: () async {
            print('Load new data');
          },
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(),
                ),
                const Flexible(
                  flex: 1,
                  child: Text('Item detail'),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
            centerTitle: true,
            titlePadding: EdgeInsets.zero,
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
            ],
            background: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[
                    Theme.of(context).colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Image.asset(
                'assets/images/train.jpg',
                package: 'flutter_common_widgets',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: List<Widget>.generate(
              20,
              (index) => LabeledSection(
                label: 'Section $index',
                child: SizedBox(
                  height: 64,
                  child: Center(
                    child: Text('Section $index content'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
