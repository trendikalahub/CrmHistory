import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.black87,
            child: Text(
              'C',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Welcome, Chandan',
            style: TextStyle(
              fontFamily: 'PortLligatSans',
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.notifications,
            color: Colors.redAccent,
          ),
          const SizedBox(width: 16),
          const Icon(Icons.add, color: Colors.black),
          const SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Colors.cyan,
            radius: 15,
            child: Text(
              'C',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Chandan\nAccess Level : 7',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
