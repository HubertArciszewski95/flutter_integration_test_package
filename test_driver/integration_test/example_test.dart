import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// The application under test.
import 'package:flutter_integration_test_package/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('Offstage element test ', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Finds last element that is offStage
      final Finder lastElement = find.text('offstage element');

      await Future.delayed(Duration(seconds: 5));

      // This assertion should fail, because 'lastElemnt'
      // is not visible on the screen
      expect(
        lastElement,
        findsOneWidget,
        reason: 'This assertion should fail',
      );
    });
  });
}
