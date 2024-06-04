import 'package:flutter/material.dart';

class ToggleBtn extends StatefulWidget {
  // State variable to track selection
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  ToggleBtn({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);
  @override
  State<ToggleBtn> createState() => _ToggleBtnState();
}

class _ToggleBtnState extends State<ToggleBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: 70.0),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.yellowAccent : const Color.fromARGB(255, 236, 236, 236).withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black, // Adjust colors
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}