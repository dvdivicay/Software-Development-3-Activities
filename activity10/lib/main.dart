import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF3E3F29);
    final Color secondaryColor = const Color(0xFF7D8D86);
    final Color accentColor = const Color(0xFFBCA88D);
    final Color backgroundColor = const Color(0xFFF1F0E4);

    final ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor).copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: backgroundColor,
        background: backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );

    return MaterialApp(
      title: 'Mini Portfolio',
      theme: theme,
      home: const PortfolioWithPillNav(),
    );
  }
}

class PortfolioWithPillNav extends StatefulWidget {
  const PortfolioWithPillNav({super.key});

  @override
  State<PortfolioWithPillNav> createState() => _PortfolioWithPillNavState();
}

class _PortfolioWithPillNavState extends State<PortfolioWithPillNav> {
  int _currentIndex = 0;

  final List<Widget> _sections = const [
    AboutMeSection(),
    SkillsSection(),
    ProjectsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    final Color secondary = Theme.of(context).colorScheme.secondary;
    final double pillHeight = 44.0;
    final double pillPadding = 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
      ),
      body: Stack(
        children: [
          // Section content
          Positioned.fill(child: _sections[_currentIndex]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 64.0),
              child: SizedBox(
                height: pillHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    final bool isActive = index == _currentIndex;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: pillPadding / 2),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: pillHeight,
                        width: isActive ? 110.0 : 60.0,
                        decoration: BoxDecoration(
                          color: isActive ? secondary : Colors.transparent,
                          borderRadius: BorderRadius.circular(pillHeight / 2),
                          border: Border.all(color: secondary.withOpacity(0.6)),
                        ),
                        alignment: Alignment.center,
                        child: isActive
                            ? Text(
                          index == 0 ? 'About' : index == 1 ? 'Skills' : 'Projects',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            : const SizedBox.shrink(),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface?.withOpacity(0.6) ?? Colors.black54,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
        ],
      ),
    );
  }
}

// About section
class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 180,
              height: 180,
              color: Colors.grey.shade300,
              child: Center(child:Image.asset('assets/ID.jpg')),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Hello! I’m Donald.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'a Computer Engineering student exploring the world of software, hardware, and everything in between.',
          ),
          const SizedBox(height: 16),
// Image slot 2
          Center(
            child: Container(
              width: 320,
              height: 150,
              color: Colors.grey.shade200,
// Image.asset('assets/images/cover.png'), // replace with your asset
              child: Center(child: Image.asset('assets/2.png')),
            ),
          ),
        ],
      ),
    );
  }
}

// Skills section
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Map<String, String>> _skills = const [
    {'name': 'Java', 'level': 'Advanced'},
    {'name': 'Full Stack Web Development', 'level': 'Intermediate'},
    {'name': 'Circuit Design', 'level': 'Intermediate'},
    {'name': 'REST APIs', 'level': 'Advanced'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _skills.length,
      itemBuilder: (context, index) {
        final skill = _skills[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: Text(skill['name']!),
            subtitle: Text('Proficiency: ${skill['level']!}'),
          ),
        );
      },
    );
  }
}

// Projects section
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> _projects = const [
    {
      'title': 'Portfolio Website (Flutter Web)',
      'desc': 'A responsive portfolio site built with Flutter Web.'
    },
    {
      'title': 'Task Manager App',
      'desc': 'A cross-platform to-do app with local storage.'
    },
    {
      'title': 'Chat UI Kit',
      'desc': 'A reusable chat UI component library.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _projects.length,
      itemBuilder: (context, index) {
        final p = _projects[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: const Icon(Icons.web),
            title: Text(p['title']!),
            subtitle: Text(p['desc']!),
            trailing: SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('View'),
              ),
            ),
          ),
        );
      },
    );
  }
}