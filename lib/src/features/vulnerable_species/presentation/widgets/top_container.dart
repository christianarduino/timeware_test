import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timeware_test/src/shared/app_router.dart';
import 'package:timeware_test/src/shared/user/presentation/view_model/user_view_model.dart';

class TopContainer extends StatelessWidget {
  final String text;
  final bool? back;

  const TopContainer({
    super.key,
    required this.text,
    this.back = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.maxFinite,
      height: height * .25,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(70),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/cheeta.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(70),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 32,
            ),
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (back == true && !kIsWeb)
                      IconButton(
                        onPressed: context.pop,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )
                    else
                      const SizedBox(),
                    GestureDetector(
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                      onTap: () async {
                        await context.read<UserViewModel>().logout();
                        if (context.mounted) {
                          context.goNamed(AppRoute.login.name);
                        }
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(.6),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
