import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDivider(),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "Hoặc",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildDivider(),
      ],
    );
  }

  Expanded _buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}
