import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../models/developer/developer.dart';
import '../../styles/build_context_extension.dart';
import '../widgets/app_back_button.dart';
import 'widgets/developer_card.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final developers = [
      Developer(
        image: Assets.images.iAmGirya.image(),
        name: 'Гиренко Даниил',
        email: 'iamgirya@yandex.ru',
        description: 'Front, Firebase',
        gitURL: 'gitURL',
      ),
      Developer(
        image: Assets.images.starProxima.image(),
        name: 'Прозоров Максим',
        email: 'StarProxima@yandex.ru',
        description: 'Front, Firebase',
        gitURL: 'gitURL',
      ),
      Developer(
        image: Assets.images.deltaNull.image(),
        name: 'Хахук Рустам',
        email: 'delta.null@vk.com',
        description: 'Design, Front',
        gitURL: 'gitURL',
      ),
    ]..shuffle();

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              SizedBox(
                height: 128,
                width: 128,
                child: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Assets.images.studRaspLightIcon.image()
                    : Assets.images.studRaspDarkIcon.image(),
              ),
              Text(
                'StudRasp',
                style: textStyles.title!.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Удобное приложение для просмотра твоего расписания',
                style: textStyles.label!.copyWith(
                  color: colors.disable,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Разработчики',
                  style: textStyles.title!.copyWith(),
                ),
              ),
              const SizedBox(height: 20),
              DeveloperCard(
                developer: developers[0],
              ),
              const SizedBox(height: 16),
              DeveloperCard(
                developer: developers[1],
              ),
              const SizedBox(height: 16),
              DeveloperCard(
                developer: developers[2],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
