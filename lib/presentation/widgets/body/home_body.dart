import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_styles.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import '../app_bar/vertical_headers_builder.dart';
import 'about_me/about_me_section.dart';
import 'contact/contact_section.dart';
import 'intro/intro_section.dart';
import 'projects/projects_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();
  final introKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();
  final ValueNotifier<bool> _showBackToTopNotifier = ValueNotifier<bool>(false);

  double? _cachedIntroHeight;
  double? _cachedAboutHeight;
  double? _cachedProjectHeight;
  int _lastHeightCacheTimestamp = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final double offset = _controller.offset;

    // Cache section heights with throttle to avoid querying RenderBox.size 120 times/sec
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_cachedIntroHeight == null || now - _lastHeightCacheTimestamp > 1500) {
      _lastHeightCacheTimestamp = now;
      _cachedIntroHeight = introKey.currentContext?.size?.height ?? 600;
      _cachedAboutHeight = aboutKey.currentContext?.size?.height ?? 800;
      _cachedProjectHeight = projectKey.currentContext?.size?.height ?? 1200;
    }

    final double introH = _cachedIntroHeight ?? 600;
    final double aboutH = _cachedAboutHeight ?? 800;
    final double projectH = _cachedProjectHeight ?? 1200;

    int newIndex = 0;
    if (_controller.position.extentAfter < 50.0) {
      newIndex = 3;
    } else if (offset < introH * 0.75) {
      newIndex = 0;
    } else if (offset < (introH + aboutH * 0.75)) {
      newIndex = 1;
    } else if (offset < (introH + aboutH + projectH * 0.75)) {
      newIndex = 2;
    } else {
      newIndex = 3;
    }

    if (context.read<HomeBloc>().appBarHeaderIndex != newIndex) {
      context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(newIndex));
    }

    final bool shouldShow = offset > 450;
    if (_showBackToTopNotifier.value != shouldShow) {
      _showBackToTopNotifier.value = shouldShow;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _showBackToTopNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AppBarHeadersIndexChanged) {
          const duration = Duration(milliseconds: 400);
          final keys = [introKey, aboutKey, projectKey, contactKey];
          if (state.index >= 0 && state.index < keys.length) {
            final keyContext = keys[state.index].currentContext;
            if (keyContext != null) {
              Scrollable.ensureVisible(
                keyContext,
                duration: duration,
                curve: Curves.easeInOutCubic,
              );
            }
          }
        }
      },
      child: Stack(
        children: [

          // Main scrollable content
          SingleChildScrollView(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width < 600
                        ? 20
                        : (context.width * 0.08).clamp(30.0, 160.0),
                  ),
                  child: Column(
                    children: [
                      RepaintBoundary(child: IntroSection(key: introKey)),
                      RepaintBoundary(child: AboutMeSection(key: aboutKey)),
                      RepaintBoundary(child: ProjectsSection(key: projectKey)),
                      RepaintBoundary(child: ContactSection(key: contactKey)),
                    ],
                  ),
                ),
                // Footer
                RepaintBoundary(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    decoration: const BoxDecoration(
                      color: AppColors.appBarColor,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.cardBorder,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '© 2026 Ahmed Mohamed Ali. Built with Flutter Web & Clean Architecture.',
                        style: AppStyles.s14.copyWith(
                          color: AppColors.textMuted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Mobile Header dropdown
          const VerticalHeadersBuilder(),

          // Floating Back-to-Top Button
          ValueListenableBuilder<bool>(
            valueListenable: _showBackToTopNotifier,
            builder: (context, show, child) {
              if (!show) return const SizedBox.shrink();
              return Positioned(
                bottom: 28,
                right: 28,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: FloatingActionButton.small(
                    backgroundColor: AppColors.cardBgElevated,
                    foregroundColor: AppColors.primaryColor,
                    onPressed: () {
                      _controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    child: const Icon(Icons.arrow_upward_rounded, size: 20),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

