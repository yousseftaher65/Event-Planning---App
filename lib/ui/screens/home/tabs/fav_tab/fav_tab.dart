import 'package:event_planning_pojo/ui/providers/category_event_provider.dart';
import 'package:event_planning_pojo/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CategoryEventProvider(),
        builder: (context, child) {
          var provider = Provider.of<CategoryEventProvider>(context);
        return  Scaffold(
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
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemCount: provider.categoryList.length,
                        itemBuilder: (context, index) {
                          return EventCard(
                            imageName: provider.categoryList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
