import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/providers/create_or_update_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CreateOrUpdateEventProvider(),
        child: Consumer<CreateOrUpdateEventProvider>(builder: (context, provider, child) {
        return  Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    SearchBar(
                      leading: ImageIcon(
                        AssetImage('assets/icons/searchIcon.png'),
                        color: Theme.of(context).primaryColor,
                      ),
                      hintText: "search".tr(),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemCount: provider.categoryList.length,
                        itemBuilder: (context, index) {
                          return SizedBox.shrink();
                          // return EventCard(
                          //   imageName: provider.categoryList[index],
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        );
  }
}
