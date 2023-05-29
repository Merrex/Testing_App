import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../screens/favourite.screen.dart';
import '../screens/home.screen.dart';
import 'init.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Testing App', () {
    testWidgets('Sample Favorites Button test', (WidgetTester tester) async {
      await pumpMainApp(tester);
      HomeScreen homeScreen = HomeScreen(tester);
      FavoriteScreen favoriteScreen = FavoriteScreen(tester);
      await homeScreen.navigateToFavorites();
      expect(await favoriteScreen.isPresentOnFavoritesPage(), true,
          reason: 'User is on Favorites Screen');
    }, skip: false);
  });
}
