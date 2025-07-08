import 'package:flutter/material.dart';

class TextPropertyForm extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<double> onFontSizeChanged;
  final ValueChanged<Color> onColorChanged;

  const TextPropertyForm({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.onTextChanged,
    required this.onFontSizeChanged,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: text);

    return Container(
      color: const Color(0xFF121212),
      child: Center(
        child: Container(
          color: const Color(0xFF222222),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                decoration: const InputDecoration(labelText: '텍스트',labelStyle: TextStyle(color: Colors.white),),
                style: const TextStyle(color: Colors.white),
                controller: textController,
                onChanged: onTextChanged,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('폰트 크기',style: TextStyle(color: Colors.white),),
                  Expanded(
                    child: Slider(
                      min: 8,
                      max: 64,
                      value: fontSize,
                      onChanged: onFontSizeChanged,
                    ),
                  ),
                  Text(fontSize.toStringAsFixed(0),),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('색상',style: TextStyle(color: Colors.white),),
                  const SizedBox(width: 16),
                  _ColorCircle(
                    color: Colors.black,
                    selected: color == Colors.black,
                    onTap: () => onColorChanged(Colors.black),
                  ),
                  _ColorCircle(
                    color: Colors.red,
                    selected: color == Colors.red,
                    onTap: () => onColorChanged(Colors.red),
                  ),
                  _ColorCircle(
                    color: Colors.blue,
                    selected: color == Colors.blue,
                    onTap: () => onColorChanged(Colors.blue),
                  ),
                  _ColorCircle(
                    color: Colors.green,
                    selected: color == Colors.green,
                    onTap: () => onColorChanged(Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _ColorCircle({
    super.key,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: selected
              ? Border.all(color: Colors.blueAccent, width: 2)
              : null,
        ),
        child: selected
            ? const Icon(Icons.check, color: Colors.white, size: 16)
            : null,
      ),
    );
  }
}