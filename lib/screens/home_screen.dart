
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../core/constants/app_constants.dart';
import '../responsive/responsive_layout.dart';
import '../sections/about/about_section.dart';
import '../sections/contact/contact_section.dart';
import '../sections/experience/experience_section.dart';
import '../sections/hero/hero_section.dart';
import '../sections/projects/projects_section.dart';
import '../sections/skills/skills_section.dart';
import '../widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _drawerKey = GlobalKey();
  int _currentActiveIndex = 0;
  bool _isManualScrolling = false;

  // Track global block dimensions for dynamic alignment offsets
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());

  void _scrollToSection(int index) async {
    setState(() => _isManualScrolling = true);
    _currentActiveIndex = index;

    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
    setState(() => _isManualScrolling = false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Scaffold(
      key: _drawerKey,
      appBar: NavigationBarWeb(
        activeIndex: _currentActiveIndex,
        onNavItemSelect: (index) {
          _scrollToSection(index);
        },
      ),
      drawer: isMobile ? Drawer(
        backgroundColor: AppColors.background,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: List.generate(AppConstants.navItems.length, (index) {
            return ListTile(
              title: Text(AppConstants.navItems[index], style: const TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(index);
              },
            );
          }),
        ),
      ) : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1140),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
            child: Column(
              children: [
                _wrapSection(0, HeroSection(onHireMePressed: () => _scrollToSection(5))),
                _wrapSection(1, const AboutSection()),
                _wrapSection(2, const SkillsSection()),
                _wrapSection(3, const ProjectsSection()),
                _wrapSection(4, const ExperienceSection()),
                _wrapSection(5, const ContactSection()),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _wrapSection(int index, Widget sectionWidget) {
    return VisibilityDetector(
      key: Key('section-$index'),
      onVisibilityChanged: (visibilityInfo) {
        if (_isManualScrolling) return;
        if (visibilityInfo.visibleFraction > 0.3) {
          setState(() {
            _currentActiveIndex = index;
          });
        }
      },
      child: Container(
        key: _sectionKeys[index],
        child: sectionWidget,
      ),
    );
  }
}