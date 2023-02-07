import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/notifier/theme/theme_notifier.dart';
import '../../../product/locale/locale_keys.g.dart';
import 'package:provider/provider.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/language/language_manager.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
        viewModel.init();
      },
      onPageBuilder: (BuildContext context, TestViewModel value) =>
          scaffoldBody,
    );
  }

  Scaffold get scaffoldBody => Scaffold(
        appBar: buildAppBar,
        body: Column(
          children: [
            textNumberValue,
            Observer(
              builder: (context) {
                if (viewModel.isLoading == true) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  width: context.width,
                  height: context.height * 0.5,
                  color: context.theme.backgroundColor,
                  child: ListView.builder(
                    itemCount: viewModel.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(viewModel.posts[index].title.toString()),
                        leading: Text(viewModel.posts[index].userId.toString()),
                        subtitle: Text(viewModel.posts[index].body.toString()),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: floatingActionButtonIncrementNumber,
      );

  AppBar get buildAppBar {
    return AppBar(
      title: Text(LocaleKeys.test.locale),
      centerTitle: true,
      actions: [
        changeLanguageButton,
        changeTheme,
      ],
    );
  }

  IconButton get changeTheme {
    return IconButton(
      icon: const Icon(Icons.dark_mode),
      onPressed: () {
        context.read<ThemeNotifier>().changeTheme();
      },
    );
  }

  IconButton get changeLanguageButton {
    return IconButton(
      icon: const Icon(Icons.change_circle),
      onPressed: () {
        Locale currentLocale = EasyLocalization.of(context)!.locale;
        if (currentLocale.languageCode == 'en') {
          EasyLocalization.of(context)!
              .setLocale(LanguageManager.instance.trLocale);
        } else {
          EasyLocalization.of(context)!
              .setLocale(LanguageManager.instance.enLocale);
        }
        setState(() {});
      },
    );
  }

  Widget get textNumberValue => Observer(
        builder: (context) => Center(
          child: Text(viewModel.number.toString()),
        ),
      );

  FloatingActionButton get floatingActionButtonIncrementNumber =>
      FloatingActionButton(
        onPressed: () => viewModel.incrementNumber(),
      );
}
