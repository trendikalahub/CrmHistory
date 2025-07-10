import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  final List<String> historyTexts = const [
    'Lead is created by user chandan@heartratehealthcare.com , Customer STEVEN BARCUS',
    'Mail sent to user ankit@hrservices.com , Subject: Follow-up',
    'New customer added: Ritika Sharma',
    'Lead status updated for manhar@clients.com , Status: Interested',
    'Reminder set for call with Anand tomorrow at 3 PM',
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
                margin: const EdgeInsets.only(bottom: 0),
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
