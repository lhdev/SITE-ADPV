import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'institute_page.dart';
import 'widgets/banner_carousel.dart';
import 'widgets/church_info_sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _homeKey = GlobalKey();
  final _scheduleKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      alignment: 0.04,
    );
  }

  void _openInstitute() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const InstitutePage()));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width >= 1200 ? 48.0 : 20.0;

    return Scaffold(
      drawer: _SiteDrawer(
        onNavigate: _scrollTo,
        onOpenInstitute: _openInstitute,
        homeKey: _homeKey,
        scheduleKey: _scheduleKey,
        aboutKey: _aboutKey,
        contactKey: _contactKey,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            key: _homeKey,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  18,
                  horizontalPadding,
                  0,
                ),
                child: _Header(
                  onNavigate: _scrollTo,
                  onOpenInstitute: _openInstitute,
                  homeKey: _homeKey,
                  scheduleKey: _scheduleKey,
                  aboutKey: _aboutKey,
                  contactKey: _contactKey,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(
            child: _HeroSection(topPadding: width >= 900 ? 64 : 72),
          ),
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
                  _BannerSection(key: _scheduleKey),
                  SizedBox(height: 24),
                  WhoWeAreSection(key: _aboutKey),
                  SizedBox(height: 24),
                  PastorsSection(),
                  SizedBox(height: 24),
                  InstituteIntro(),
                  SizedBox(height: 24),
                  ItepavSection(),
                  SizedBox(height: 24),
                  ContactFooter(key: _contactKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItepavSection extends StatelessWidget {
  const ItepavSection({super.key});

  static const _images = [
    'assets/images/Itepav 1.jpeg',
    'assets/images/Itepav 2.jpeg',
    'assets/images/Itepav 3.png',
    'assets/images/itepav 4.jpeg',
  ];

  Future<void> _openWhatsApp() async {
    await launchUrl(
      Uri.parse('https://wa.me/5511978620015'),
      webOnlyWindowName: '_blank',
    );
  }

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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          final imageWidth = isMobile
              ? (constraints.maxWidth - 16) / 2
              : (constraints.maxWidth - 48) / 4;

          return Column(
            children: [
              const Text(
                'ITEPAV - Instituto Teológico Palavra de Vida',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 24),
              if (isMobile)
                BannerCarousel(
                  itemCount: _images.length,
                  mobileHeight: 500,
                  viewportFraction: 0.82,
                  itemBuilder: (context, index) => BannerImageCard.asset(
                    assetPath: _images[index],
                    fit: BoxFit.contain,
                    backgroundColor: const Color(0xFFF8FAFC),
                  ),
                )
              else
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    for (final imagePath in _images)
                      _ItepavImage(path: imagePath, width: imageWidth),
                  ],
                ),
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: _openWhatsApp,
                icon: const Icon(Icons.chat_rounded),
                label: const Text('Saiba mais'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF168C4B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 15,
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

class _ItepavImage extends StatelessWidget {
  const _ItepavImage({required this.path, required this.width});

  final String path;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ColoredBox(
            color: const Color(0xFFF8FAFC),
            child: HoverZoom(child: Image.asset(path, fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.onNavigate,
    required this.onOpenInstitute,
    required this.homeKey,
    required this.scheduleKey,
    required this.aboutKey,
    required this.contactKey,
  });

  final void Function(GlobalKey key) onNavigate;
  final VoidCallback onOpenInstitute;
  final GlobalKey homeKey;
  final GlobalKey scheduleKey;
  final GlobalKey aboutKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 560;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 14 : 20,
            vertical: isCompact ? 12 : 16,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF10285E),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: isCompact ? 40 : 44,
                height: isCompact ? 40 : 44,
                child: SvgPicture.asset(
                  'assets/images/logo-palavra-de-vida.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ADPV',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isCompact ? 18 : 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (!isCompact)
                      const Text(
                        'Assembléia de Deus Palavra de Vida',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (isCompact)
                Builder(
                  builder: (context) => IconButton(
                    tooltip: 'Abrir menu',
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu_rounded),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                )
              else
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _HeaderButton(
                          icon: Icons.home_rounded,
                          label: 'Home',
                          onPressed: () => onNavigate(homeKey),
                        ),
                        _HeaderButton(
                          icon: Icons.event_note_rounded,
                          label: 'Cronograma',
                          onPressed: () => onNavigate(scheduleKey),
                        ),
                        _HeaderButton(
                          icon: Icons.groups_rounded,
                          label: 'Quem Somos',
                          onPressed: () => onNavigate(aboutKey),
                        ),
                        _HeaderButton(
                          icon: Icons.park_rounded,
                          label: 'Instituto',
                          onPressed: onOpenInstitute,
                        ),
                        _HeaderButton(
                          icon: Icons.mail_outline_rounded,
                          label: 'Contato',
                          onPressed: () => onNavigate(contactKey),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.topPadding});

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: isCompact ? 700 : 560),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/adpv.jpeg', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF071A44).withValues(alpha: 0.90),
                    const Color(0xFF0E2A66).withValues(alpha: 0.78),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              isCompact ? 16 : 20,
              topPadding,
              isCompact ? 16 : 20,
              48,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Container(
                  padding: EdgeInsets.all(isCompact ? 22 : 32),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(isCompact ? 28 : 32),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Assembléia de Deus Palavra de Vida',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Seja bem-vindo à ADPV.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isCompact ? 38 : 46,
                          height: 1.08,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        '  Uma igreja comprometida com a sua vida, com a sua família e com o Reino de Deus. \n \n Conecte-se à nossa comunidade e acompanhe nossa programação, eventos, comunicados e tudo o que acontece na ADPV.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.84),
                          fontSize: isCompact ? 16 : 18,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerSection extends StatelessWidget {
  const _BannerSection({super.key});

  static const _assets = [
    'assets/images/Domingo.jpeg',
    'assets/images/Segunda.jpeg',
    'assets/images/Quarta.jpeg',
    'assets/images/Sabado.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'NOSSA AGENDA',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Confira nossa programação e fique por dentro de tudo o que acontece na ADPV.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        BannerCarousel(
          itemCount: _assets.length,
          desktopHeight: 560,
          desktopMaxWidth: 760,
          itemBuilder: (context, index) => BannerImageCard.asset(
            assetPath: _assets[index],
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _SiteDrawer extends StatelessWidget {
  const _SiteDrawer({
    required this.onNavigate,
    required this.onOpenInstitute,
    required this.homeKey,
    required this.scheduleKey,
    required this.aboutKey,
    required this.contactKey,
  });

  final void Function(GlobalKey key) onNavigate;
  final VoidCallback onOpenInstitute;
  final GlobalKey homeKey;
  final GlobalKey scheduleKey;
  final GlobalKey aboutKey;
  final GlobalKey contactKey;

  void _select(BuildContext context, GlobalKey key) {
    Navigator.of(context).pop();
    onNavigate(key);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: Row(
                children: [
                  const Icon(Icons.church_rounded, color: Color(0xFF243B87)),
                  const SizedBox(width: 12),
                  Text(
                    'ADPV',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF10285E),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            _DrawerItem(
              icon: Icons.home_rounded,
              label: 'Home',
              onTap: () => _select(context, homeKey),
            ),
            _DrawerItem(
              icon: Icons.event_note_rounded,
              label: 'Cronograma',
              onTap: () => _select(context, scheduleKey),
            ),
            _DrawerItem(
              icon: Icons.groups_rounded,
              label: 'Quem Somos',
              onTap: () => _select(context, aboutKey),
            ),
            _DrawerItem(
              icon: Icons.park_rounded,
              label: 'Instituto',
              onTap: () {
                Navigator.of(context).pop();
                onOpenInstitute();
              },
            ),
            _DrawerItem(
              icon: Icons.mail_outline_rounded,
              label: 'Contato',
              onTap: () => _select(context, contactKey),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF243B87)),
      title: Text(label),
      onTap: onTap,
    );
  }
}
