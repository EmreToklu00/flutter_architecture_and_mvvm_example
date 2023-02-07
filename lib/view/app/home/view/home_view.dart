import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../product/locale/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/language/language_manager.dart';
import '../../../../core/init/notifier/theme/theme_notifier.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        await model.fetchProducts();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          buildScaffold(context, viewModel: value),
    );
  }

  Scaffold buildScaffold(
    BuildContext context, {
    required HomeViewModel viewModel,
  }) {
    return Scaffold(
      appBar: buildAppBar(context, viewModel),
      body: buildBody(viewModel),
    );
  }

  Observer buildBody(HomeViewModel viewModel) {
    return Observer(
      builder: (context) {
        if (viewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: viewModel.products.length,
          padding: context.paddingNormal,
          itemBuilder: (context, index) {
            return buildHomeCard(context, viewModel, index);
          },
        );
      },
    );
  }

  AppBar buildAppBar(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    return AppBar(
      centerTitle: false,
      title: RichText(
        text: TextSpan(
          style: context.theme.textTheme.headline5!.copyWith(
            color: context.theme.textTheme.titleLarge!.color,
            fontWeight: FontWeight.bold,
          ),
          children: [
            // ignore: prefer_adjacent_string_concatenation
            TextSpan(text: "${LocaleKeys.home_appbar.locale}\n"),
            TextSpan(
              text: viewModel.formattedDate,
              style: context.theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
      actions: [
        changeTheme(context),
        changeLanguageButton(context),
      ],
    );
  }

  Widget buildHomeCard(
    BuildContext context,
    HomeViewModel viewModel,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        viewModel.navigation.navigateToPage(
          path: "/home_detail",
          arguments: viewModel.products[index],
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: context.theme.primaryColor,
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              viewModel.products[index].image.toString(),
            ),
          ),
        ),
        child: Wrap(
          runAlignment: WrapAlignment.end,
          children: [
            Container(
              width: context.width,
              height: context.height * 0.075,
              padding: context.paddingLowHorizontal,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color:
                    context.theme.textTheme.bodyLarge!.color!.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${viewModel.products[index].title!.substring(0, 12)}...",
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${viewModel.products[index].price.toString()}",
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.theme.scaffoldBackgroundColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton changeTheme(BuildContext context) {
    return IconButton(
      icon: Icon(
        context.watch<ThemeNotifier>().currentThemeEnum == AppThemes.DARK
            ? Icons.sunny
            : Icons.dark_mode,
      ),
      onPressed: () {
        context.read<ThemeNotifier>().changeTheme();
      },
    );
  }

  IconButton changeLanguageButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.change_circle),
      onPressed: () async {
        Locale currentLocale = context.locale;
        if (currentLocale == LanguageManager.instance.enLocale) {
          await context.setLocale(LanguageManager.instance.trLocale);
        } else {
          await context.setLocale(LanguageManager.instance.enLocale);
        }
      },
    );
  }
}
