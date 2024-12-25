import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/gaming.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Meeting for Updating The Development Method',
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                          ),
                          Spacer(),
                          ImageIcon(
                            color: Theme.of(context).primaryColor,
                            AssetImage('assets/icons/favIcon2.png'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '22',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Text(
                    'Nov',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
