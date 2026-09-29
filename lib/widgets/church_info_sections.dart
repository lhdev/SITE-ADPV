import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhoWeAreSection extends StatelessWidget {
  const WhoWeAreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final stackMissionCards = constraints.maxWidth < 900;
        final contentPadding = isMobile ? 18.0 : 28.0;
        final valueCardWidth = isMobile
            ? constraints.maxWidth - (contentPadding * 2)
            : 265.0;

        return _SectionBlock(
          padding: contentPadding,
          title: 'Quem Somos',
          subtitle:
              'Uma igreja comprometida com a sua vida, com a sua família e com o Reino de Deus, Somos a Assembleia de Deus Palavra de Vida, uma igreja que nasceu há aproximadamente 7 anos com o propósito de anunciar a Palavra de Deus, conduzir pessoas a um relacionamento com Jesus Cristo e construir uma comunidade de fé marcada pela comunhão, pelo cuidado e pelo serviço ao reino. Desde 2019, Deus nos permitiu iniciar esta caminhada como a igreja Assembleia de Deus Palavra de Vida e, temos vivido uma história construída por muitas vidas no altar, famílias, orações, aprendizados e experiências com Deus. A cada ano, celebramos em novembro o aniversário do nosso Ministério, relembrando com gratidão tudo o que o Senhor tem feito e renovando o nosso compromisso com aquilo que Ele ainda fará. Cremos que a igreja é uma família e que cada pessoa tem um papel importante nessa caminhada. Por isso, buscamos crescer na Palavra constantemente, desenvolver nossos dons, servir com excelência e viver de forma que reflita Cristo em nossas atitudes diárias. Somos uma igreja que caminha com pessoas, cuida de famílias e serve ao Reino de Deus.',
          child: Column(
            children: [
              const SizedBox(height: 28),
              if (stackMissionCards)
                const Column(
                  children: [
                    _MissionCard(
                      title: 'PALAVRA QUE TRANSFORMA',
                      description:
                          'A Bíblia é nossa referência de fé, prática e vida. Buscamos conhecer a Palavra de Deus e permitir que ela transforme nossa maneira de viver.',
                      backgroundColor: Color(0xFF243B87),
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(height: 16),
                    _MissionCard(
                      title: 'VIDAS E FAMÍLIAS',
                      description:
                          'Valorizamos pessoas e famílias, entendendo a igreja como uma comunidade de fé, comunhão, cuidado, respeito e amor ao próximo.',
                      backgroundColor: Color(0xFFF4B400),
                      foregroundColor: Color(0xFF0F172A),
                    ),
                    SizedBox(height: 16),
                    _MissionCard(
                      title: 'CHAMADOS PARA SERVIR',
                      description:
                          'Cremos que Deus chama e capacita para servir, com estudo das Escrituras, disciplina, compromisso com a obra e com excelência.',
                      backgroundColor: Color(0xFF243B87),
                      foregroundColor: Colors.white,
                    ),
                  ],
                )
              else
                const Row(
                  children: [
                    Expanded(
                      child: _MissionCard(
                        title: 'PALAVRA QUE TRANSFORMA',
                        description:
                            'A Bíblia é nossa referência de fé, prática e vida. Buscamos conhecer a Palavra de Deus e permitir que ela transforme nossa maneira de viver.',
                        backgroundColor: Color(0xFF243B87),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _MissionCard(
                        title: 'VIDAS E FAMÍLIAS',
                        description:
                            'Valorizamos pessoas e famílias, entendendo a igreja como uma comunidade de fé, comunhão, cuidado, respeito e amor ao próximo.',
                        backgroundColor: Color(0xFFF4B400),
                        foregroundColor: Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _MissionCard(
                        title: 'CHAMADOS PARA SERVIR',
                        description:
                            'Cremos que Deus chama e capacita para servir, com estudo das Escrituras, disciplina, compromisso com a obra e com excelência.',
                        backgroundColor: Color(0xFF243B87),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 32),
              Text(
                'Nossa Essência',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 18,
                children: [
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.favorite_border_rounded,
                    title: 'Amor ao Próximo',
                    description:
                        'Demonstramos o amor de Cristo atraves de ações práticas e cuidado com cada pessoa.',
                  ),
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.groups_2_outlined,
                    title: 'Comunidade',
                    description:
                        'Somos uma familia unida em Cristo, onde todos são bem-vindos e acolhidos.',
                  ),
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.church_outlined,
                    title: 'Adoracão',
                    description:
                        'Cultuamos a Deus em espírito e em verdade, exaltando Seu nome em tudo.',
                  ),
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.public_rounded,
                    title: 'Missões',
                    description:
                        'Levamos o evangelho ate os confins da terra, cumprindo a Grande Comissao.',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class PastorsSection extends StatelessWidget {
  const PastorsSection({super.key});

  static const _biography =
      'O Pastor Renato Willians e a Miss Daiane Willians são casados há 17 anos e são pais de Ana e Arthur. Juntos, servem a Cristo e exercem o ministério pastoral à frente da Assembleia de Deus – Palavra de Vida – Sede | Jd. São Pedro/SP, em São Paulo.\n\n'
      'Há 10 anos, o Senhor deu ao Pastor Renato e à Miss Daiane a visão e a direção para iniciar um ministério com o propósito de cuidar das famílias por meio da Palavra de Deus, fortalecendo lares e conduzindo pessoas a uma vida firmada em Cristo.\n\n'
      'Durante aproximadamente três anos, permaneceram em oração, buscando a vontade e o direcionamento do Senhor. No tempo determinado por Deus, receberam a resposta e a direção para seguir adiante e, assim, nasceu a Assembleia de Deus – Palavra de Vida (ADPV).\n\n'
      'Desde então, o ministério tem como fundamento a Palavra de Deus, o Evangelho de Cristo e o cuidado com as famílias, entendendo que um ministério sólido também começa em um lar firmado nos princípios do Senhor.\n\n'
      'O Pastor Renato Willians é fundador, diretor e professor de Teologia do ITEPAV – Instituto Teológico Palavra de Vida, contribuindo para a formação e capacitação de homens e mulheres para o serviço cristão.\n\n'
      'Para os pastores, a família é uma base sólida para o ministério e para a vida cristã. Com profunda convicção na Palavra de Deus e amor pelas Sagradas Escrituras, seguem servindo a Cristo com fé e dedicação, buscando viver e ensinar os princípios do Evangelho, edificar vidas e fortalecer famílias para a glória de Deus.';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final stackColumns = constraints.maxWidth < 1116;
        final padding = isMobile ? 18.0 : 32.0;
        final textContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PASTORES RENATO WILLIANS E DAIANE WILLIANS',
              style: TextStyle(
                color: const Color(0xFF0F172A),
                fontSize: isMobile ? 23 : 28,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              _biography,
              style: TextStyle(
                color: const Color(0xFF334155),
                fontSize: isMobile ? 16 : 17,
                height: 1.7,
              ),
            ),
          ],
        );
        final pastorPhoto = ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/images/Pastores-instituto.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        );

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isMobile ? 22 : 28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: stackColumns
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    textContent,
                    const SizedBox(height: 24),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: AspectRatio(
                          aspectRatio: 0.55,
                          child: SizedBox.expand(child: pastorPhoto),
                        ),
                      ),
                    ),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 4, child: textContent),
                      const SizedBox(width: 32),
                      Expanded(flex: 2, child: pastorPhoto),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class InstituteSection extends StatelessWidget {
  const InstituteSection({super.key});

  static const _placeholderText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n'
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final padding = isMobile ? 18.0 : 32.0;
        final instituteImage = ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/Pastores-instituto.png',
            fit: BoxFit.cover,
            semanticLabel: 'Instituto AD Palavra de Vida',
          ),
        );
        final instituteText = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INSTITUTO AD PALAVRA DE VIDA',
              style: TextStyle(
                color: const Color(0xFF0F172A),
                fontSize: isMobile ? 23 : 28,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              _placeholderText,
              style: TextStyle(
                color: const Color(0xFF334155),
                fontSize: isMobile ? 16 : 17,
                height: 1.7,
              ),
            ),
          ],
        );

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isMobile ? 22 : 28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        instituteText,
                        const SizedBox(height: 24),
                        AspectRatio(aspectRatio: 1.5, child: instituteImage),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 3, child: instituteText),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 2,
                          child: AspectRatio(
                            aspectRatio: 1.1,
                            child: instituteImage,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}

class ContactFooter extends StatelessWidget {
  const ContactFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final horizontalPadding = isMobile ? 18.0 : 32.0;
        final contactItemWidth = isMobile
            ? constraints.maxWidth - (horizontalPadding * 2)
            : 250.0;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isMobile ? 26 : 32,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2F69),
            borderRadius: BorderRadius.circular(isMobile ? 22 : 28),
          ),
          child: Column(
            children: [
              Text(
                'Entre em Contato',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Estamos aqui para acolher, servir e caminhar com você e com Cristo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.82),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 48,
                runSpacing: 24,
                children: [
                  _ContactItem(
                    width: contactItemWidth,
                    title: 'ENDEREÇO',
                    lines: const [
                      _ContactLine(
                        text:
                            'Av Prof Osvaldo de Oliveira, 611, Jardim Helena - Sao Paulo, SP CEP: 08420-280',
                        addressUrl:
                            'https://www.google.com/maps/search/?api=1&query=Av+Prof+Osvaldo+de+Oliveira+611+Jardim+Helena+Sao+Paulo+SP',
                      ),
                    ],
                  ),
                  _ContactItem(
                    width: contactItemWidth,
                    title: 'CONTATOS',
                    lines: const [
                      _ContactLine(
                        text: '(11) 94496-5446 - SECRETARIA',
                        whatsappUrl: 'https://wa.me/5511944965446',
                      ),
                      _ContactLine(
                        text: '(11) 98925-0465 - FINANCEIRO',
                        whatsappUrl: 'https://wa.me/5511989250465',
                      ),
                    ],
                  ),
                  _ContactItem(
                    width: contactItemWidth,
                    title: 'E-MAILS',
                    lines: const [
                      _ContactLine(
                        text: 'secretariaadpv26@gmail.com.br',
                        emailUrl: 'mailto:secretariaadpv26@gmail.com.br',
                      ),
                      _ContactLine(
                        text: 'renato.willians@iadpalavradevida.com.br',
                        emailUrl:
                            'mailto:renato.willians@iadpalavradevida.com.br',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Text(
                'REDES SOCIAIS'
                '\n Acompanhe a ADPV e fique por dentro das nossas programações, eventos e novidades. ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              const SizedBox(height: 12),
              const _SocialLinks(),
            ],
          ),
        );
      },
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks();

  static final _links = <_SocialLinkData>[
    _SocialLinkData(
      label: 'Instagram',
      icon: Icons.camera_alt_rounded,
      url: 'https://www.instagram.com/ad.palavra.de.vida/',
    ),
    _SocialLinkData(
      label: 'Facebook',
      icon: Icons.facebook_rounded,
      url:
          'https://www.facebook.com/renato.daiane.142?mibextid=wwXIfr&rdid=Y0tcIGq8BnkctAo2&share_url=https%3A%2F%2Fwww.facebook.com%2Fshare%2F17uxKY2Ckm%2F%3Fmibextid%3DwwXIfr%26utm_source%3Dig%26utm_medium%3Dsocial%26utm_content%3Dlink_in_bio',
    ),
    _SocialLinkData(
      label: 'YouTube',
      icon: Icons.smart_display_rounded,
      url: 'https://www.youtube.com/@AD.PALAVRADEVIDA',
    ),
  ];

  Future<void> _openSocialLink(String url) async {
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final link in _links)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: IconButton.filled(
              tooltip: link.label,
              onPressed: () => _openSocialLink(link.url),
              icon: Icon(link.icon),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.14),
                foregroundColor: Colors.white,
                minimumSize: const Size(48, 48),
              ),
            ),
          ),
      ],
    );
  }
}

class _SocialLinkData {
  const _SocialLinkData({
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({
    required this.padding,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final double padding;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 22 : 28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 26 : 30,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF334155),
              height: 1.7,
              fontSize: isMobile ? 16 : 18,
            ),
          ),
          const SizedBox(height: 26),
          child,
        ],
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard({
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String title;
  final String description;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 280;
        final horizontalPadding = isCompact ? 18.0 : 24.0;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isCompact ? 22 : 26,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: isCompact ? 19 : 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foregroundColor.withValues(alpha: 0.92),
                  fontSize: isCompact ? 15 : 16,
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({
    required this.width,
    required this.icon,
    required this.title,
    required this.description,
  });

  final double width;
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Icon(icon, color: const Color(0xFF243B87), size: 32),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF475569), height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.width,
    required this.title,
    required this.lines,
  });

  final double width;
  final String title;
  final List<_ContactLine> lines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ...lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (line.emailUrl != null)
                    _ContactAction(
                      label: 'Enviar e-mail para ${line.text}',
                      icon: Icons.email_outlined,
                      url: line.emailUrl!,
                    ),
                  if (line.whatsappUrl != null)
                    _ContactAction(
                      label: 'Conversar no WhatsApp com ${line.text}',
                      icon: Icons.phone_outlined,
                      url: line.whatsappUrl!,
                    ),
                  if (line.addressUrl != null)
                    _ContactAction(
                      label: 'Abrir endereço no mapa',
                      icon: Icons.location_on_outlined,
                      url: line.addressUrl!,
                    ),
                  const SizedBox(width: 2),
                  Flexible(
                    child: Text(
                      line.text,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.88),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactLine {
  const _ContactLine({
    required this.text,
    this.emailUrl,
    this.whatsappUrl,
    this.addressUrl,
  });

  final String text;
  final String? emailUrl;
  final String? whatsappUrl;
  final String? addressUrl;
}

class _ContactAction extends StatelessWidget {
  const _ContactAction({
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  Future<void> _openLink() async {
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: label,
      onPressed: _openLink,
      icon: Icon(icon, size: 20),
      color: Colors.white,
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
    );
  }
}
