import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  final EventModel model;
  const EventCard({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
                  child: Image.asset('assets/images/${model.image}.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            model.title,
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
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.date.day.toString(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Text(
                    DateFormat('MMM').format(model.date).toUpperCase(),
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
