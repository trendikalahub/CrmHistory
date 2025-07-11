import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final String selectedMenu;
  final void Function(String) onMenuSelected;

  const Sidebar({
    super.key,
    required this.selectedMenu,
    required this.onMenuSelected,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = false;

  void toggleSidebar() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0A3D62),
      child: SizedBox(
        width: isCollapsed ? 70 : 200,
        child: Column(
          crossAxisAlignment: isCollapsed
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 40,
                      height: 40,
                    ),
                    if (!isCollapsed) ...[
                      const SizedBox(width: 8),
                      const Text(
                        'CRM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            MenuItem(Icons.person, "Customer"),
            MenuItem(Icons.dashboard, "Dashboard"),
            MenuItem(Icons.mail, "Mails"),
            MenuItem(Icons.history, "History", isHighlighted: true),
            MenuItem(Icons.insert_chart, "Reports"),
            MenuItem(Icons.settings, "Settings"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isCollapsed
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: toggleSidebar,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MenuItem(IconData icon, String title, {bool isHighlighted = false}) {
    final bool selected = widget.selectedMenu == title;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: selected && isHighlighted
                ? const Color(0xFF00BCD4)
                : Colors.transparent,
            borderRadius:
                selected && isHighlighted ? BorderRadius.circular(8) : null,
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: isCollapsed ? 8 : 16),
            onTap: () => widget.onMenuSelected(title),
            leading: Icon(
              icon,
              color: selected && isHighlighted ? Colors.black : Colors.white,
              size: 20,
            ),
            title: isCollapsed
                ? null
                : Text(
                    title,
                    style: TextStyle(
                      color: selected && isHighlighted
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        const Divider(
          color: Colors.white24,
          height: 1,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
