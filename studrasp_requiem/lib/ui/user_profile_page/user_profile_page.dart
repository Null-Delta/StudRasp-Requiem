import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_auth.dart';
import '../../styles/build_context_extension.dart';
import '../timetable_list_pages/timetable_list_page.dart';
import '../widgets/app_avatar.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {
  void logout() {
    ref.read(userAuth.notifier).logout();
  }

  void toTimetablesList() {
    //context.go(context.namedLocation('profile-list'));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TimetableListPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles;

    final user = ref.watch(userAuth);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              AppAvatar(
                name: user.name,
                size: 128,
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: textStyle.title!.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(user.email, style: textStyle.subtitle),
              const SizedBox(height: 4),
              Text(
                user.isVerified
                    ? 'Почта подтверждена'
                    : 'Почта не подтверждена',
                style: textStyle.subtitle!.copyWith(
                  color: colors.disable,
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: ElevatedButton(
                  onPressed: toTimetablesList,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    minimumSize: const Size(double.infinity, 42),
                    textStyle: textStyle.label,
                  ),
                  child: const Text('Список расписаний'),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: ElevatedButton(
                  onPressed: logout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    minimumSize: const Size(double.infinity, 42),
                    textStyle: textStyle.label,
                  ),
                  child: const Text('Настройки'),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: ElevatedButton(
      //   onPressed: () {
      //     ref.read(userAuth.notifier).logout();
      //   },
      //   style: ElevatedButton.styleFrom(
      //     primary: colors.destructive,
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 16,
      //     ),
      //   ),
      //   child: const Text('Выйти из аккаунта'),
      // ),
    );
  }
}
