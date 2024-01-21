import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsineWrapper extends StatelessWidget {
  const ResponsineWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
        // width to device TO RENAME IT
        breakpoints: [
          const Breakpoint(start: 0, end: 400, name: "SMALLMOBILE"),
          const Breakpoint(start: 401, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: Builder(
            // width of desigin by name if device
            builder: (context) => ResponsiveScaledBox(
                width: ResponsiveValue<double>(context, conditionalValues: [
                  Condition.equals(name: "SMALLMOBILE", value: 450),
                  Condition.equals(name: MOBILE, value: 490),
                  Condition.equals(name: TABLET, value: 1200),
                  Condition.equals(name: DESKTOP, value: 1900),
                  Condition.equals(name: "4k", value: 2300),
                  // There are no conditions for width over 1200
                  // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                ]).value,
                child: child)));
  }
}
