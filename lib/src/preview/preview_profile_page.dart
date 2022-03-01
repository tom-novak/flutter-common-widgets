import 'dart:async';

import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';

class PreviewProfilePage extends StatefulWidget {
  const PreviewProfilePage({Key? key}) : super(key: key);

  @override
  State<PreviewProfilePage> createState() => _PreviewProfilePageState();
}

class _PreviewProfilePageState extends State<PreviewProfilePage> {
  late UserRepository _userRepository;
  late Function() _userRepositoryListener;
  late StreamController<Option<Either<String, User>>> _controller;

  @override
  void initState() {
    super.initState();
    _userRepositoryListener = _onUserRepositoryEvent;
    _controller = StreamController<Option<Either<String, User>>>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userRepository = Provider.of<UserRepository>(context);
    _userRepository.addListener(_onUserRepositoryEvent);
    _controller.add(_userRepository.failureOrSuccessOption);
  }

  @override
  void dispose() {
    _userRepository.removeListener(_userRepositoryListener);
    _controller.close();
    super.dispose();
  }

  void _onUserRepositoryEvent() {
    _controller.add(_userRepository.failureOrSuccessOption);
  }

  @override
  Widget build(BuildContext context) {
    return UserProfilePage(
      dataStream: _controller.stream,
      onLogout: () async {
        return Future.delayed(const Duration(milliseconds: 500)).then((value) {
          Provider.of<UserRepository>(context, listen: false).clear();
        });
      },
      image: const AssetImage(
        'assets/images/train_small.jpg',
        package: 'flutter_common_widgets',
      ),
    );
  }
}
