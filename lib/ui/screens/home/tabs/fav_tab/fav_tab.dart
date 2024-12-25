import 'package:event_planning_pojo/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              SearchBar(
                leading: ImageIcon(
                  AssetImage('assets/icons/searchIcon.png'),
                  color: Theme.of(context).primaryColor,
                ),
                hintText: 'Search for Event',
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return EventCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
