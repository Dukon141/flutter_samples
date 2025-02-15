import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/size_constants.dart';
import 'package:flutter_samples/ui/widgets/custom_button.dart';

import 'notes/notes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: SizeConstants.verticalMargin,
            horizontal: SizeConstants.horizontalMargin,
          ),
          children: [
            CustomButton(
              text: 'Notes',
              onPressed:
                  () => _navigateTo(context: context, widget: NotesPage()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo({required BuildContext context, required Widget widget}) {
    final materialPageRoute = MaterialPageRoute(builder: (context) => widget);
    Navigator.of(context).push(materialPageRoute);
  }
}
