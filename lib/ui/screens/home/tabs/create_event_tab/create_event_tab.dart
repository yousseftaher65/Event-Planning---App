import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEventTab extends StatelessWidget {
  static const tag = 'CreateEventTab';
  const CreateEventTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'Create Event',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontFamily: GoogleFonts.inter().fontFamily,
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
