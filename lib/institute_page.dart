import 'package:flutter/material.dart';

import 'widgets/banner_carousel.dart';

class InstitutePage extends StatelessWidget {
  const InstitutePage({super.key});

  static const _carouselAssets = [
    'assets/images/Instituto.jpeg',
    'assets/images/instituto_1.jpeg',
    'assets/images/instituto_2.jpeg',
    'assets/images/instituto_3.jpeg',
  ];

  static const _courses = [
    _CourseData(
      title: 'Marketing Digital',
      description:
          'Aprenda a comunicar ideias, projetos e negócios no ambiente digital.',
      icon: Icons.campaign_outlined,
    ),
    _CourseData(
      title: 'Aula de Música',
      description:
          'Desenvolva seus talentos musicais em um ambiente de prática e comunhão.',
      icon: Icons.music_note_rounded,
    ),
    _CourseData(
      title: 'Empreendedorismo',
      description:
          'Transforme ideias em projetos sustentáveis com visão, planejamento e propósito.',
      icon: Icons.lightbulb_outline_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width >= 1200 ? 48.0 : 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instituto Palavra de Vida'),
        leading: IconButton(
          tooltip: 'Voltar para a página inicial',
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.park_rounded),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                28,
                horizontalPadding,
                40,
              ),
              child: Column(
                children: [
                  InstituteIntro(),
                  const SizedBox(height: 24),
                  _InstituteCarousel(),
                  const SizedBox(height: 24),
                  _CoursesSection(),
                  const SizedBox(height: 32),
                  _InstituteTeam(),
                  const SizedBox(height: 32),
                  _InstituteDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstituteIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _InstituteSectionCard(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sobre nós',
                style: TextStyle(
                  color: Color(0xFF243B87),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'INSTITUTO PALAVRA DE VIDA',
                style: TextStyle(
                  color: const Color(0xFF0F172A),
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'O Instituto Palavra de Vida nasceu com o propósito de cuidar de pessoas, fortalecer famílias e contribuir para a transformação da comunidade. A nossa atuação é por meio de ações sociais, projetos, palestras, campanhas e iniciativas de apoio às famílias, buscando identificar necessidades reais e criar oportunidades que promovam acolhimento, desenvolvimento e qualidade de vida. Acreditamos que cuidar de pessoas vai além de atender uma necessidade pontual. É também ouvir, acolher, orientar, capacitar e criar caminhos para que cada pessoa e cada família possam seguir em frente com mais dignidade e esperança. Ao longo de nossa caminhada, desenvolvemos ações voltadas para diferentes públicos e necessidades, sempre buscando construir parcerias e unir pessoas que desejam fazer a diferença. O Instituto Palavra de Vida é um espaço para servir, conectar, fortalecer e transformar, porque quando cuidamos de pessoas, também fortalecemos famílias e contribuímos para uma comunidade melhor. Instituto Palavra de Vida | Cuidar de pessoas. Fortalecer famílias..',
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 17,
                  height: 1.7,
                ),
              ),
            ],
          );
          final image = ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: ColoredBox(
              color: const Color(0xFFF8FAFC),
              child: Image.asset(
                'assets/images/logo-instituto.png',
                fit: BoxFit.contain,
                semanticLabel: 'Instituto Palavra de Vida',
              ),
            ),
          );

          return isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    content,
                    const SizedBox(height: 24),
                    AspectRatio(aspectRatio: 1.1, child: image),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: content),
                    const SizedBox(width: 36),
                    SizedBox(width: 360, height: 320, child: image),
                  ],
                );
        },
      ),
    );
  }
}

class _InstituteCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _InstituteSectionCard(
      child: Column(
        children: [
          const Text(
            'Atividades do Instituto',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Conheça um pouco das ações e dos momentos que fazem parte da nossa caminhada.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF475569),
              fontSize: 17,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),
          BannerCarousel(
            itemCount: InstitutePage._carouselAssets.length,
            desktopHeight: 470,
            desktopMaxWidth: 720,
            itemBuilder: (context, index) => BannerImageCard.asset(
              assetPath: InstitutePage._carouselAssets[index],
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _InstituteDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2F69),
        borderRadius: BorderRadius.circular(28),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 760;
          final details = Wrap(
            alignment: WrapAlignment.center,
            spacing: 42,
            runSpacing: 24,
            children: const [
              _InstituteDetail(
                icon: Icons.badge_outlined,
                label: 'CNPJ',
                value: '63.305.185/0001-62',
              ),
              _InstituteDetail(
                icon: Icons.location_on_outlined,
                label: 'LOCALIDADE',
                value:
                    'Av. Prof. Osvaldo de Oliveira, 611 - Jardim Helena, São Paulo - SP, 08420-280',
              ),
              _InstituteDetail(
                icon: Icons.email_outlined,
                label: 'E-MAIL',
                value: 'instituto@palavradevida.com.br',
              ),
            ],
          );

          return Column(
            children: [
              const Text(
                'Detalhes da instituição',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 24),
              details,
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link de doação em breve.')),
                ),
                icon: const Icon(Icons.volunteer_activism_outlined),
                label: const Text('Doar Agora!'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFF4B400),
                  foregroundColor: const Color(0xFF0F172A),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 28 : 36,
                    vertical: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CoursesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Cursos disponíveis',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 760;
            final cardWidth = isMobile
                ? constraints.maxWidth
                : (constraints.maxWidth - 40) / 3;

            return Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                for (final course in InstitutePage._courses)
                  _CourseCard(data: course, width: cardWidth),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _InstituteTeam extends StatelessWidget {
  static const _members = [
    _TeamMember(
      imagePath: 'assets/images/fabi.png',
      name: 'Fabiola Pedroso',
      role: 'Diretora',
      email: 'Institutopalavradevida@hotmail.com',
    ),
    _TeamMember(
      imagePath: 'assets/images/Pastores-instituto.png',
      name: 'Pr Renato e Mis Daiane Willians',
      role: 'Fundadores',
      email: 'Institutopalavradevida@hotmail.com',
    ),
    _TeamMember(
      imagePath: 'assets/images/Dai.png',
      name: 'Daiane Mazina',
      role: 'Secrétaria',
      email: 'Institutopalavradevida@hotmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Nossa equipe',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 760;
            final cardWidth = isMobile
                ? constraints.maxWidth
                : (constraints.maxWidth - 40) / 3;

            return Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                for (final member in _members)
                  _TeamCard(member: member, width: cardWidth),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({required this.member, required this.width});

  final _TeamMember member;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: ColoredBox(
                    color: const Color(0xFFF8FAFC),
                    child: Image.asset(
                      member.imagePath,
                      fit: BoxFit.contain,
                      semanticLabel: member.name,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                member.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                member.role,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF243B87),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                member.email,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.data, required this.width});

  final _CourseData data;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(data.icon, color: const Color(0xFF243B87), size: 42),
              const SizedBox(height: 16),
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF475569), height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstituteDetail extends StatelessWidget {
  const _InstituteDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _InstituteSectionCard extends StatelessWidget {
  const _InstituteSectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _CourseData {
  const _CourseData({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class _TeamMember {
  const _TeamMember({
    required this.imagePath,
    required this.name,
    required this.role,
    required this.email,
  });

  final String imagePath;
  final String name;
  final String role;
  final String email;
}
