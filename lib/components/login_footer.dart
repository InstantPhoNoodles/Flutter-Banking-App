import 'package:banking_app/pages/placeholder_page.dart';
import 'package:banking_app/components/hover_text.dart';
import 'package:flutter/material.dart';

/// Class that builds a widget that gets displayed at the button of a page.
/// Currently only used in the login page. Can be expanded.
class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10.0)
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          // Row widget with clickable text that routes to other pages.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverText(
                text: 'Open an Account',
                color: Theme.of(context).colorScheme.secondary,
                hoverColor: Theme.of(context).colorScheme.tertiary,
                pressColor: Colors.purple[400]!,
                route: PlaceholderPage(),
              ),
              Text('  |  '),
              HoverText(
                text: 'Privacy',
                color: Theme.of(context).colorScheme.secondary,
                hoverColor: Theme.of(context).colorScheme.tertiary,
                pressColor: Colors.purple[400]!,
                route: PlaceholderPage(),
              ),
              Text('  |  '),
              HoverText(
                text: 'Questions',
                color: Theme.of(context).colorScheme.secondary,
                hoverColor: Theme.of(context).colorScheme.tertiary,
                pressColor: Colors.purple[400]!,
                route: PlaceholderPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
