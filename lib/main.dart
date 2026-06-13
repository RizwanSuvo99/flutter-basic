import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Stack Venger",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF810B38);
    const Color deepBg = Color(0xFF2D0A1E);
    const Color accent = Color(0xFFE8956D);
    const Color cream = Color(0xFFF1E2D1);
    const Color muted = Color(0xFFA0617A);

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0), // warm off-white body bg
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: cream,
        title: const Text(
          "Stack Venger",
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search, color: cream),
            tooltip: "Search",
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: deepBg,
        child: Column(
          children: [
            // Header
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: primary,
                border: Border(bottom: BorderSide(color: accent, width: 2)),
              ),
              accountName: const Text(
                "Md Rizwan Uddin",
                style: TextStyle(
                  color: cream,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              accountEmail: const Text(
                "rizwanshuvo@gmail.com",
                style: TextStyle(color: Color(0xFFD4A899), fontSize: 13),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: accent,
                child: const Text(
                  "R",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: deepBg,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Nav items
            _DrawerItem(
              icon: Icons.home_rounded,
              label: "Home",
              selected: true,
              accent: accent,
              muted: muted,
              cream: cream,
              onTap: () => Navigator.pop(context),
            ),
            _DrawerItem(
              icon: Icons.person_rounded,
              label: "Profile",
              accent: accent,
              muted: muted,
              cream: cream,
              onTap: () => Navigator.pop(context),
            ),
            _DrawerItem(
              icon: Icons.mail_rounded,
              label: "Emails",
              badge: "3",
              accent: accent,
              muted: muted,
              cream: cream,
              onTap: () => Navigator.pop(context),
            ),
            _DrawerItem(
              icon: Icons.settings_rounded,
              label: "Settings",
              accent: accent,
              muted: muted,
              cream: cream,
              onTap: () => Navigator.pop(context),
            ),

            Divider(color: muted.withOpacity(0.3), indent: 16, endIndent: 16),

            _DrawerItem(
              icon: Icons.help_outline_rounded,
              label: "Help & Feedback",
              accent: accent,
              muted: muted,
              cream: cream,
              onTap: () => Navigator.pop(context),
            ),

            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: const Icon(Icons.logout_rounded, color: Color(0xFFFF6B6B)),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Color(0xFFFF6B6B), fontWeight: FontWeight.w500),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "App version 1.0.0",
                style: TextStyle(color: muted.withOpacity(0.6), fontSize: 11),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: cream),
      ),

      body: const Center(
        child: Text(
          'Tap ☰ to open the Drawer',
          style: TextStyle(color: Color(0xFF810B38), fontSize: 16),
        ),
      ),
    );
  }
}

// Reusable drawer item widget
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? badge;
  final bool selected;
  final Color accent;
  final Color muted;
  final Color cream;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.accent,
    required this.muted,
    required this.cream,
    required this.onTap,
    this.badge,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color deepBg = Color(0xFF2D0A1E);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: selected ? accent.withOpacity(0.15) : Colors.transparent,
        leading: Icon(
          icon,
          color: selected ? accent : muted,
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: selected ? accent : cream,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 15,
          ),
        ),
        trailing: badge != null
            ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            badge!,
            style: TextStyle(
              color: deepBg,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
            : null,
        onTap: onTap,
      ),
    );
  }
}