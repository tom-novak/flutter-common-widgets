import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class UserProfilePage extends StatelessWidget {
  final Stream<Option<Either<String, User>>> dataStream;
  final Future<void> Function()? onLogout;
  final ImageProvider? image;
  final TextStyle? textStyle;

  const UserProfilePage({
    Key? key,
    required this.dataStream,
    this.onLogout,
    this.image,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Option<Either<String, User>>>(
      stream: dataStream,
      initialData: none(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.fold(
            () => const Center(),
            (failureOrSuccess) => failureOrSuccess.fold(
              (userFailure) => const CommonErrorPage(),
              (user) => UserProfile(
                user: user,
                image: image,
                onLogoutTap: () {
                  _onLogout(context);
                },
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _onLogout(BuildContext context) {
    if (onLogout != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            ProgressIndicatorOverlay(
              label: CommonLocalizations
                  .of(context)
                  ?.logoutProgress ?? 'Logout',
            ),
      );
      onLogout!().then((value) => Navigator.of(context).pop());
    }
  }
}
