import 'package:flutter/material.dart';

class WarmUpSetUpRow extends StatelessWidget {
  final String txt;
  const WarmUpSetUpRow({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.add,
            size: 30,
          ),
          Text(
            txt,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          )
        ],
      ),
    );
  }
}
