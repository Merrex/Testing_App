import 'package:flutter_test/flutter_test.dart';

import '../finder/finders.dart';
import 'base.screen.dart';

class HomeScreen extends BaseScreen {
  HomeScreen(WidgetTester tester) : super(tester);

  final _favoritesBtn = findByText('Favorites');

  Future<void> navigateToFavorites() async {
    await element(_favoritesBtn).tap();
  }
}
