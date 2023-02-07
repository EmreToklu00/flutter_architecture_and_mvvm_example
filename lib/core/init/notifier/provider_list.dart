import 'theme/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProviders {
  static ApplicationProviders? _instace;
  static ApplicationProviders get instance {
    _instace ??= ApplicationProviders._init();
    return _instace!;
  }

  ApplicationProviders._init();
  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
