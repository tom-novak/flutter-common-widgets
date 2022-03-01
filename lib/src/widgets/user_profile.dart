import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class UserProfile extends StatelessWidget {
  final User user;
  final ImageProvider? image;
  final TextStyle? textStyle;
  final VoidCallback? onLogoutTap;

  const UserProfile({
    Key? key,
    required this.user,
    this.image,
    this.textStyle,
    this.onLogoutTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = Theme.of(context).textTheme.headline1?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 3) ??
        const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w300, letterSpacing: 2);

    return CustomScrollView(
      physics: const ScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: CircleAvatar(
              radius: kAvatarLarge / 2,
              foregroundImage: image,
              backgroundColor: Colors.amberAccent,
              child: Center(
                child: user.firstName.isNotEmpty || user.lastName.isNotEmpty
                    ? Text(
                        getInitials(user),
                        style: textStyle ?? defaultTextStyle,
                        maxLines: 1,
                      )
                    : const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: kAvatarLarge,
                      ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              if (user.firstName.isNotEmpty || user.lastName.isNotEmpty)
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.headline4,
                  maxLines: 1,
                ),
              if (user.email.isNotEmpty)
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kContainerPaddingValue),
                child: TextButton(
                  onPressed: onLogoutTap,
                  child:
                      Text(CommonLocalizations.of(context)?.logout ?? 'Logout'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getInitials(User? user) {
    var firstName = user?.firstName ?? '';
    var lastName = user?.lastName ?? '';
    return '${firstName.isNotEmpty ? firstName.characters.first : ''}'
        '${lastName.isNotEmpty ? lastName.characters.first : ''}';
  }
}
