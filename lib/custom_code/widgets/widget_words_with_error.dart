// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class WidgetWordsWithError extends StatefulWidget {
  const WidgetWordsWithError({
    Key? key,
    this.width,
    this.height,
    required this.fullText,
    this.wordsWithError, // Agora é nullable
  }) : super(key: key);

  final double? width;
  final double? height;
  final String fullText;
  final String? wordsWithError;

  @override
  State<WidgetWordsWithError> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<WidgetWordsWithError> {
  @override
  Widget build(BuildContext context) {
    if (widget.wordsWithError == null) {
      // Se wordsWithError for nulo, retorne apenas fullText
      return Text(widget.fullText);
    }

    final errorWordsSet = widget.wordsWithError!.split(',').toSet();
    final words = widget.fullText.split(' ');

    return Container(
      width: widget.width,
      height: widget.height,
      child: RichText(
        text: TextSpan(
          children: words.map((word) {
            final trimmedWord =
                word.replaceAll(RegExp(r'[\W_]+'), ''); // Remove punctuation
            final isError = errorWordsSet.contains(trimmedWord);
            return TextSpan(
              text: word + ' ',
              style: TextStyle(
                color: isError ? Colors.red : Colors.black,
              ),
            );
          }).toList(),
          style: DefaultTextStyle.of(context).style,
        ),
      ),
    );
  }
}
