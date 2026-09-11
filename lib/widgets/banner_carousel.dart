import 'dart:async';

import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mobileHeight = 430,
    this.desktopHeight = 420,
    this.desktopMaxWidth = 860,
    this.viewportFraction = 0.72,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double mobileHeight;
  final double desktopHeight;
  final double desktopMaxWidth;
  final double viewportFraction;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  Timer? _autoPlayTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);
    _startAutoPlay();
  }

  @override
  void didUpdateWidget(covariant BannerCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_currentIndex >= widget.itemCount) {
      _currentIndex = 0;
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    }

    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();

    if (widget.itemCount <= 1) return;

    _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_pageController.hasClients || widget.itemCount <= 1) return;

      final nextIndex = (_currentIndex + 1) % widget.itemCount;
      _animateToPage(nextIndex);
    });
  }

  void _animateToPage(int index) {
    setState(() => _currentIndex = index);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  void _previousPage() {
    final previousIndex =
        (_currentIndex - 1 + widget.itemCount) % widget.itemCount;
    _animateToPage(previousIndex);
    _startAutoPlay();
  }

  void _nextPage() {
    final nextIndex = (_currentIndex + 1) % widget.itemCount;
    _animateToPage(nextIndex);
    _startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 600;
        final carouselMaxWidth = isCompact
            ? double.infinity
            : widget.desktopMaxWidth;
        final carouselHeight = isCompact
            ? widget.mobileHeight
            : widget.desktopHeight;
        final inactiveVerticalPadding = isCompact ? 28.0 : 38.0;
        final itemHorizontalPadding = isCompact ? 4.0 : 10.0;
        final buttonInset = isCompact ? 0.0 : 12.0;

        return Column(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: carouselMaxWidth),
                child: SizedBox(
                  height: carouselHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        padEnds: !isCompact,
                        itemCount: widget.itemCount,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },
                        itemBuilder: (context, index) {
                          final isActive = index == _currentIndex;

                          return AnimatedPadding(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic,
                            padding: EdgeInsets.symmetric(
                              horizontal: itemHorizontalPadding,
                              vertical: isActive ? 0 : inactiveVerticalPadding,
                            ),
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOutCubic,
                              scale: isActive ? 1 : 0.86,
                              child: widget.itemBuilder(context, index),
                            ),
                          );
                        },
                      ),
                      if (widget.itemCount > 1) ...[
                        Positioned(
                          left: buttonInset,
                          child: _BannerCarouselButton(
                            icon: Icons.arrow_back_ios_new_rounded,
                            onPressed: _previousPage,
                          ),
                        ),
                        Positioned(
                          right: buttonInset,
                          child: _BannerCarouselButton(
                            icon: Icons.arrow_forward_ios_rounded,
                            onPressed: _nextPage,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            if (widget.itemCount > 1) ...[
              const SizedBox(height: 16),
              _BannerCarouselIndicators(
                itemCount: widget.itemCount,
                currentIndex: _currentIndex,
              ),
            ],
          ],
        );
      },
    );
  }
}

class BannerImageCard extends StatelessWidget {
  const BannerImageCard.asset({
    super.key,
    required String assetPath,
    this.fit = BoxFit.contain,
    this.imagePadding = EdgeInsets.zero,
    this.overlayText,
    this.onDelete,
    this.fallbackContent,
    this.elevated = true,
    this.backgroundColor = const Color(0xFFEAF1FB),
  }) : source = assetPath,
       isNetwork = false;

  const BannerImageCard.network({
    super.key,
    required String imageUrl,
    this.fit = BoxFit.cover,
    this.imagePadding = EdgeInsets.zero,
    this.overlayText,
    this.onDelete,
    this.fallbackContent,
    this.elevated = false,
    this.backgroundColor = const Color(0xFFE2E8F0),
  }) : source = imageUrl,
       isNetwork = true;

  final String source;
  final bool isNetwork;
  final BoxFit fit;
  final EdgeInsets imagePadding;
  final String? overlayText;
  final Future<void> Function()? onDelete;
  final Widget? fallbackContent;
  final bool elevated;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    final content = fallbackContent ?? _buildImage();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(
              color: backgroundColor,
              child: imagePadding == EdgeInsets.zero
                  ? content
                  : Padding(padding: imagePadding, child: content),
            ),
            if (overlayText != null && overlayText!.isNotEmpty)
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.48),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    overlayText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            if (onDelete != null)
              Positioned(
                top: 12,
                right: 12,
                child: IconButton.filledTonal(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (isNetwork) {
      return Image.network(
        source,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.broken_image_outlined, size: 42)),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
      );
    }

    return Image.asset(
      source,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Color(0xFF1E3A8A),
          size: 48,
        ),
      ),
    );
  }
}

class _BannerCarouselButton extends StatelessWidget {
  const _BannerCarouselButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        minimumSize: const Size(48, 48),
      ),
      icon: Icon(icon),
    );
  }
}

class _BannerCarouselIndicators extends StatelessWidget {
  const _BannerCarouselIndicators({
    required this.itemCount,
    required this.currentIndex,
  });

  final int itemCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentIndex ? 28 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? const Color(0xFF1E3A8A)
                : const Color(0xFFD7E3FB),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}
