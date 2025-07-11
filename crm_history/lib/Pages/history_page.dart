import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  final List<String> historyTexts = const [
    'Lead is created by user chandan@heartratehealthcare.com , Customer STEVEN BARCUS',
    'Lead is created by user chandan@heartratehealthcare.com , Customer JOSEPH AMLEY',
    'Lead is created by user chandan@heartratehealthcare.com , Customer LEONARD J HARRIS',
    'Lead is created by user chandan@heartratehealthcare.com , Customer CAROL L HENSLEY',
    'Lead is created by user chandan@heartratehealthcare.com , Customer ROBERT W HOLLEY',
    'Lead is created by user chandan@heartratehealthcare.com , Customer JOHN WALKER',
    'Lead is created by user chandan@heartratehealthcare.com , Customer RDJ',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: historyTexts.length,
      itemBuilder: (context, index) {
        final isBlue = index % 2 == 0;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // delete buttons
            Column(
              children: [
                Container(
                  width: 40,
                  height: 42,
                  alignment: Alignment.bottomCenter,
                  child: const Icon(Icons.delete, color: Colors.red),
                ),
                if (index != historyTexts.length - 1)
                  Container(
                    width: 2,
                    height: 70,
                    color: Colors.red,
                  ),
              ],
            ),

            const SizedBox(width: 8),

            // list cards
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: isBlue
                      ? const Color(0xFF4B778D)
                      : const Color(0xFFF4EAD5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Text(
                  historyTexts[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isBlue ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
