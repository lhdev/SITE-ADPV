import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:site_adpv/institute_page.dart';
import 'package:site_adpv/main.dart';
import 'package:site_adpv/widgets/church_info_sections.dart';

void main() {
  testWidgets('exibe a pagina inicial da ADPV', (tester) async {
    await tester.pumpWidget(const SiteAdpvApp());

    expect(find.text('ADPV'), findsOneWidget);
    expect(find.text('Seja bem-vindo à ADPV.'), findsOneWidget);
    expect(find.text('Login'), findsNothing);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Cronograma'), findsOneWidget);
    expect(find.text('Quem Somos'), findsOneWidget);
    expect(find.text('Contato'), findsOneWidget);

    await tester.tap(find.text('Cronograma'));
    await tester.pumpAndSettle();

    expect(find.text('NOSSA AGENDA'), findsOneWidget);
  });

  testWidgets('exibe o bloco do ITEPAV na home', (tester) async {
    await tester.pumpWidget(const SiteAdpvApp());
    await tester.scrollUntilVisible(
      find.text('ITEPAV - Instituto Teológico Palavra de Vida'),
      500,
      scrollable: find.byType(Scrollable).first,
    );

    expect(
      find.text('ITEPAV - Instituto Teológico Palavra de Vida'),
      findsOneWidget,
    );
    expect(find.text('Saiba mais'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('bloco dos pastores nao causa overflow no desktop', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const SiteAdpvApp());
    await tester.scrollUntilVisible(
      find.text('PASTORES RENATO WILLIANS E DAIANE WILLIANS'),
      500,
      scrollable: find.byType(Scrollable).first,
    );

    expect(
      find.text('PASTORES RENATO WILLIANS E DAIANE WILLIANS'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('exibe instituto e um unico bloco de contato', (tester) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const SiteAdpvApp());
    await tester.scrollUntilVisible(
      find.text('INSTITUTO PALAVRA DE VIDA'),
      500,
      scrollable: find.byType(Scrollable).first,
    );

    expect(find.text('INSTITUTO PALAVRA DE VIDA'), findsOneWidget);
    expect(find.text('Entre em Contato'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('exibe os blocos da pagina do instituto', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: InstitutePage()));

    expect(find.text('INSTITUTO PALAVRA DE VIDA'), findsOneWidget);
    expect(find.text('Sobre nós'), findsOneWidget);
    expect(find.text('Detalhes da instituição'), findsOneWidget);
    expect(find.text('Doar Agora!'), findsOneWidget);
    expect(find.text('Marketing Digital'), findsOneWidget);
    expect(find.text('Aula de Música'), findsOneWidget);
    expect(find.text('Empreendedorismo'), findsOneWidget);
    expect(find.text('Fabiola Pedroso'), findsOneWidget);
    expect(find.text('Pr Renato e Mis Daiane Willians'), findsOneWidget);
    expect(find.text('Daiane Mazina'), findsOneWidget);
    expect(find.text('Diretora'), findsOneWidget);
    expect(find.text('Fundadores'), findsOneWidget);
    expect(find.text('Secrétaria'), findsOneWidget);
    expect(find.text('Institutopalavradevida@hotmail.com'), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });

  testWidgets('bloco dos pastores nao causa overflow em tela estreita', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(737, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const PastorsSection(),
            ),
          ),
        ),
      ),
    );
    await tester.scrollUntilVisible(
      find.text('PASTORES RENATO WILLIANS E DAIANE WILLIANS'),
      500,
      scrollable: find.byType(Scrollable).first,
    );

    expect(
      find.text('PASTORES RENATO WILLIANS E DAIANE WILLIANS'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
