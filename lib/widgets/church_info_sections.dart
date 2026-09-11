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
                      title: 'Nossa Missao',
                      description:
                          'Proclamar o evangelho de Jesus Cristo, discipular vidas e servir a comunidade com amor e excelencia.',
                      backgroundColor: Color(0xFF243B87),
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(height: 16),
                    _MissionCard(
                      title: 'Nossa Visao',
                      description:
                          'Ser uma igreja referencia em adoracao, ensino e acao social, alcancando milhares de vidas com o amor de Cristo.',
                      backgroundColor: Color(0xFFF4B400),
                      foregroundColor: Color(0xFF0F172A),
                    ),
                    SizedBox(height: 16),
                    _MissionCard(
                      title: 'Chamados para Servir',
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
                        title: 'VIDAS E FAMILIAS',
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
                    title: 'Amor ao Proximo',
                    description:
                        'Demonstramos o amor de Cristo atraves de acoes praticas e cuidado com cada pessoa.',
                  ),
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.groups_2_outlined,
                    title: 'Comunidade',
                    description:
                        'Somos uma familia unida em Cristo, onde todos sao bem-vindos e acolhidos.',
                  ),
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.church_outlined,
                    title: 'Adoracao',
                    description:
                        'Cultuamos a Deus em espirito e em verdade, exaltando Seu nome em tudo.',
                  ),
                  _ValueCard(
                    width: valueCardWidth,
                    icon: Icons.public_rounded,
                    title: 'Missoes',
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
                        text: 'Av Prof Osvaldo de Oliveira, 611',
                        addressUrl:
                            'https://www.google.com/maps/search/?api=1&query=Av+Prof+Osvaldo+de+Oliveira+611+Jardim+Helena+Sao+Paulo+SP',
                      ),
                      _ContactLine(text: 'Jardim Helena - Sao Paulo, SP'),
                      _ContactLine(text: 'CEP: 08420-280'),
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
                    title: 'Email',
                    lines: const [
                      _ContactLine(
                        text: 'secretaria@adpalavradevida.com.br',
                        emailUrl: 'mailto:secretaria@adpalavradevida.com.br',
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
