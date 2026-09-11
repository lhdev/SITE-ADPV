# SITE ADPV

Site institucional da Assembleia de Deus Palavra de Vida, separado do aplicativo Ekklesia Finance.

## Executar

```bash
flutter pub get
flutter run -d chrome
```

O botao de login usa `/login` no mesmo dominio por padrao. Para apontar para o endereco do aplicativo financeiro, informe a URL durante a execucao ou o build:

```bash
flutter run -d chrome --dart-define=APP_LOGIN_URL=https://app.exemplo.com/login
flutter build web --dart-define=APP_LOGIN_URL=https://app.exemplo.com/login
```
