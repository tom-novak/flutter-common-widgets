import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class UserProfilePage extends StatelessWidget {
  final UserInfo? user;
  final ImageProvider? image;
  final TextStyle? textStyle;

  const UserProfilePage({
    Key? key,
    this.user,
    this.image,
    this.textStyle,
  }) : super(key: key);

  String getInitials(UserInfo? user) {
    var firstName = user?.firstName ?? '';
    var lastName = user?.lastName ?? '';
    return '${firstName.isNotEmpty ? firstName.characters.first : ''}'
        '${lastName.isNotEmpty ? lastName.characters.first : ''}';
  }

  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = Theme.of(context).textTheme.headline1?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 3) ??
        const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w300, letterSpacing: 2);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: CircleAvatar(
              radius: 64.0,
              foregroundImage: image,
              backgroundColor: Colors.amberAccent,
              child: Center(
                child: user?.firstName != null || user?.lastName != null
                    ? Text(
                        getInitials(user),
                        style: textStyle ?? defaultTextStyle,
                        maxLines: 1,
                      )
                    : const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 128.0,
                      ),
              ),
            ),
          ),
        ),
        if (user != null)
          SliverToBoxAdapter(
            child: Column(
              children: [
                if ((user?.firstName ?? '').isNotEmpty ||
                    (user?.lastName ?? '').isNotEmpty)
                  Text(
                    '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                    style: Theme.of(context).textTheme.headline4,
                    maxLines: 1,
                  ),
                if (user?.email != null)
                  Text(
                    '${user!.email}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
