# 🙏 ADPV — Assembleia de Deus Palavra de Vida

> **“Cultuamos a Deus em espírito e em verdade, exaltando Seu nome em tudo.”**

Site institucional da **Assembleia de Deus Palavra de Vida (ADPV)**, desenvolvido com o objetivo de apresentar a igreja, seus cultos, atividades e conteúdos, proporcionando uma experiência moderna, responsiva e acessível para os membros e visitantes.

🌐 **Site:** https://site-adpv.lhonoratoalves99.workers.dev/

---

## 📖 Sobre o projeto

O **Site ADPV** foi desenvolvido para fortalecer a presença digital da Assembleia de Deus Palavra de Vida e facilitar o acesso às principais informações da igreja.

A proposta é oferecer uma interface moderna e intuitiva, adaptada para diferentes dispositivos, permitindo que visitantes encontrem informações sobre a igreja e suas atividades de forma simples.

### 🎯 Objetivos

* Apresentar a identidade e propósito da igreja;
* Facilitar o acesso às informações dos cultos;
* Divulgar atividades e programações;
* Disponibilizar conteúdos e informações relevantes;
* Criar uma presença digital moderna para a ADPV;
* Garantir uma experiência responsiva em computadores, tablets e smartphones.

---

## ✨ Funcionalidades

* 🏠 Página inicial institucional;
* ⛪ Apresentação da igreja;
* 📅 Divulgação de programações e cultos;
* 🖼️ Conteúdo visual e identidade da ADPV;
* 📱 Layout responsivo;
* ⚡ Carregamento otimizado;
* 🌐 Publicação na infraestrutura da Cloudflare;
* 🎨 Identidade visual personalizada.

---

## 🛠️ Tecnologias

O projeto utiliza tecnologias modernas para desenvolvimento web, com foco em desempenho, responsividade e facilidade de manutenção.

### Front-end

* **Flutter**
* **Dart**
* **HTML**
* **CSS**
* **JavaScript**

### Hospedagem / Deploy

* **Cloudflare Workers**
* **Workers.dev**
* **Wrangler**

O projeto está atualmente disponibilizado através de um endereço `workers.dev`, fornecido pela infraestrutura da Cloudflare.

---

## 📂 Estrutura do projeto

Uma estrutura simplificada do projeto:

```text
SITE ADPV/
│
├── assets/
│   └── images/
│       ├── logo/
│       ├── Domingo.jpeg
│       ├── Segunda.jpeg
│       ├── Quarta.jpeg
│       └── Sabado.jpeg
│
├── lib/
│   └── ...
│
├── web/
│   ├── icons/
│   ├── favicon.png
│   ├── index.html
│   └── manifest.json
│
├── test/
│   └── widget_test.dart
│
├── .gitignore
├── .metadata
├── README.md
├── analysis_options.yaml
└── pubspec.yaml
```

---

## 🚀 Executando o projeto localmente

### 1. Clone o repositório

```bash
git clone https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git
```

### 2. Acesse o projeto

```bash
cd SITE-ADPV
```

### 3. Instale as dependências

```bash
flutter pub get
```

### 4. Execute em modo desenvolvimento

```bash
flutter run -d chrome
```

---

## 🏗️ Build para Web

Para gerar a versão de produção:

```bash
flutter build web
```

Os arquivos gerados estarão em:

```text
build/web/
```

---

## ☁️ Deploy

O projeto pode ser publicado utilizando o **Cloudflare Workers**, através do Wrangler.

Exemplo:

```bash
wrangler deploy
```

O endereço `workers.dev` permite disponibilizar o Worker publicamente sem a necessidade de configurar imediatamente um domínio personalizado. Para um ambiente de produção definitivo, a Cloudflare recomenda considerar uma rota de Worker ou domínio personalizado.

---

## 🎨 Identidade visual

A identidade visual do projeto utiliza elementos próprios da **Assembleia de Deus Palavra de Vida**, incluindo:

* Logo institucional;
* Imagens de divulgação;
* Elementos visuais da igreja;
* Conteúdo relacionado às programações;
* Tipografia e composição visual voltadas para uma experiência moderna e acolhedora.

---

## 📱 Responsividade

O site foi desenvolvido pensando em diferentes tamanhos de tela:

| Dispositivo   | Suporte |
| ------------- | ------- |
| 🖥️ Desktop   | ✅       |
| 💻 Notebook   | ✅       |
| 📱 Smartphone | ✅       |
| 📱 Tablet     | ✅       |

---

## 🔮 Próximas melhorias

Algumas funcionalidades que podem ser adicionadas futuramente:

* [ ] Página de eventos;
* [ ] Calendário de cultos;
* [ ] Galeria de fotos;
* [ ] Integração com redes sociais;
* [ ] Página de ministérios;
* [ ] Área de transmissões ao vivo;
* [ ] Integração com YouTube;
* [ ] Formulário de contato;
* [ ] Sistema de gerenciamento de conteúdo;
* [ ] Domínio personalizado;
* [ ] Melhorias contínuas de SEO e acessibilidade.

---

## 🤝 Contribuição

Sugestões e melhorias são bem-vindas.

Para contribuir:

```bash
git checkout -b feature/minha-feature
```

Faça suas alterações e depois:

```bash
git add .
git commit -m "feat: adiciona nova funcionalidade"
git push origin feature/minha-feature
```

Depois, abra um **Pull Request**.

---

## 📄 Licença

Este projeto foi desenvolvido para a **Assembleia de Deus Palavra de Vida (ADPV)**.

O uso, reprodução e distribuição dos conteúdos visuais, textos, imagens e identidade visual da igreja devem respeitar os respectivos direitos e autorizações.

---

## 🙏 Palavra de Vida

**Assembleia de Deus Palavra de Vida**

> **Cultuamos a Deus em espírito e em verdade, exaltando Seu nome em tudo.**

🌐 **Acesse o site:**
https://site-adpv.lhonoratoalves99.workers.dev/
