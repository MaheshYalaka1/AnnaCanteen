import 'package:flutter/material.dart';

bool showCard = false;
foodsList(
  String mahi,
  String a1,
  String a2,
  String a3,
  String a4,
  String a5,
  String a6,
  String a7,
  String a8,
  String a9,
  String a10,
  String a11,
  String a12,
  String a13,
  String a15,
  String a16,
  String a17,
  String a18,
  String a19,
  String a20,
  String a21,
  String a22,
  String a23,
  String a24,
  String a25,
  String a26,
  String a27,
  String a28,
  String a29,
  String a30,
  String a31,
  String a32,
  String a33,
  String a34,
  String a35,
  String a36,
  String a37,
  String a38,
  String a39,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      // Dropdown that toggles the card visibility
      GestureDetector(
        onTap: () {
          // setState(() {
          //   _showCard = !_showCard;
          // });
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        a39,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  Icon(
                    showCard ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    size: 36,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),

      Card(
        color: const Color(0xfffdeaea),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Breakfast',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffE20736)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.red.shade700,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a1,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a2,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a3,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a4,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a5,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a6,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Color(0xff3C3B3B),
                      thickness: 1,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'or',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xffE20736),
                            fontSize: 20),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Color(0xff3C3B3B),
                      thickness: 1,
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a7,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a8,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a10,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a11,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a12,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a13,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a15,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a16,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      a17,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffE20736)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.red.shade700,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a18,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a18,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a19,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a20,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a22,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a23,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a24,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a25,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a26,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a27,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dinner',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffE20736)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.red.shade700,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a28,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a29,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a30,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a31,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a32,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a33,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a34,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a35,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      a36,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      a37,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

class monday extends StatefulWidget {
  const monday({super.key});

  @override
  State<monday> createState() => _mondayState();
}

class _mondayState extends State<monday> {
  bool _showCard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo food list'),
      ),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  _showCard = !_showCard;
                });
              },
              child: foodsList(
                  'Monday (సోమవారం)',
                  'Idly Chutney (ఇడ్లీ చట్నీ)',
                  '3 Pcs (45 gms/Piece)',
                  'Powder (పొడి) &',
                  '15 gms',
                  'Sambar (సాంబారు)',
                  '150 ml',
                  'Puri (పూరి) &',
                  '3 No.s 45 gms each',
                  'Subji (కూర)',
                  '100 gms',
                  'Lunch',
                  'White Rice (అన్నం)',
                  '400 gms',
                  'Sambar/Pappu (సాంబార్ / పప్పు)',
                  '120 gms',
                  'Subji (కూర)',
                  '100 gms',
                  'Curd (పెరుగు)',
                  '75 gms',
                  'Pickle (పచ్చడి)',
                  '15 gms',
                  'Dinner',
                  'White Rice (అన్నం)',
                  '400 gms',
                  'Sambar/Pappu (సాంబార్ / పప్పు)',
                  '120 gms',
                  'Subji (కూర)',
                  '100 gms',
                  'Curd (పెరుగు)',
                  '75 gms',
                  'Pickle (పచ్చడి)',
                  '15 gms',
                  "a34",
                  "a35",
                  "a36",
                  "a37",
                  "a38",
                  "")),
        ],
      ),
    );
  }
}
