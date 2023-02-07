import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extension.dart';

import '../../../../../core/base/view/base_view.dart';
import '../viewmodel/home_detail_view_model.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeDetailViewModel>(
      viewModel: HomeDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeDetailViewModel value) =>
          buildScaffold(context, value),
    );
  }

  Scaffold buildScaffold(BuildContext context, HomeDetailViewModel value) {
    return Scaffold(
      appBar: buildAppBar(context, value),
      body: buildBody(context, value),
    );
  }

  Column buildBody(BuildContext context, HomeDetailViewModel value) {
    return Column(
      children: [
        getImageBox(context, value),
        getProductsDetails(context, value),
      ],
    );
  }

  Expanded getProductsDetails(BuildContext context, HomeDetailViewModel value) {
    return Expanded(
      child: Container(
        padding: context.paddingMedium,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              value.args.category.toString().toUpperCase(),
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: context.theme.textTheme.headline6!.fontSize,
                fontWeight: context.theme.textTheme.headline6!.fontWeight,
              ),
            ),
            Divider(
              color: context.theme.dividerColor.withOpacity(1),
              thickness: 1.5,
            ),
            Text(
              value.args.title.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.textTheme.headline6!.color,
                fontSize: context.theme.textTheme.headline6!.fontSize,
                fontWeight: context.theme.textTheme.headline6!.fontWeight,
              ),
            ),
            Divider(
              color: context.theme.dividerColor.withOpacity(1),
              thickness: 1.5,
            ),
            Text(value.args.description.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.primaryColorDark,
                    textStyle: TextStyle(
                      color: context.theme.textTheme.headline6!.color,
                      fontSize: context.theme.textTheme.headline6!.fontSize,
                      fontWeight: context.theme.textTheme.headline6!.fontWeight,
                    ),
                    minimumSize:
                        Size(context.width * 0.5, context.height * 0.05),
                    maximumSize:
                        Size(context.width * 0.5, context.height * 0.05),
                    padding: context.paddingLowVertical,
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "\$ ${value.args.price}",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: context.theme.textTheme.headline4!.fontSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox getImageBox(BuildContext context, HomeDetailViewModel value) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.45,
      child: Image.network(
        fit: BoxFit.fill,
        value.args.image.toString(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, HomeDetailViewModel value) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: context.theme.iconTheme.color,
        ),
        onPressed: () => value.navigation.navigateBack(),
      ),
    );
  }
}
