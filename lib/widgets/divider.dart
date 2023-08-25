import 'package:flutter/material.dart';

class SpaceDivider extends StatelessWidget {
  const SpaceDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 30,);
  }
}

class WidgetDivider extends StatelessWidget {
  const WidgetDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10,);
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20,);
  }
}
