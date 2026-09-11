import 'package:flutter_test/flutter_test.dart';
import 'package:site_adpv/main.dart';

void main() {
  testWidgets('exibe a pagina inicial da ADPV', (tester) async {
    await tester.pumpWidget(const SiteAdpvApp());

    expect(find.text('ADPV'), findsOneWidget);
    expect(
      find.text('Seja bem-vindo a Assembleia de Deus Palavra de Vida.'),
      findsOneWidget,
    );
    expect(find.text('Login'), findsNothing);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Cronograma'), findsOneWidget);
    expect(find.text('Quem Somos'), findsOneWidget);
    expect(find.text('Contato'), findsOneWidget);

    await tester.tap(find.text('Cronograma'));
    await tester.pumpAndSettle();

    expect(find.text('Cronograma de Cultos'), findsOneWidget);
  });
}
