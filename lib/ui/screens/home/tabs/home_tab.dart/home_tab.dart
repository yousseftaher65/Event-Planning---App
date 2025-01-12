import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/firebase_utils/firebase_utils.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:event_planning_pojo/ui/providers/category_event_provider.dart';
import 'package:event_planning_pojo/ui/screens/event_details/event_details_screen.dart';
import 'package:event_planning_pojo/ui/widgets/category_event_item.dart';
import 'package:event_planning_pojo/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  static const String tag = 'home_tab';
  final String? userName;
 const HomeTab({super.key, required this.userName});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CategoryEventProvider(),
        builder: (context, child) {
          var provider = Provider.of<CategoryEventProvider>(context);
          return Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "welcome_back".tr(),
                    style: TextStyle(
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedItemColor,
                        fontSize: 14),
                  ),
                  Text(
                    userName ?? 'User',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedItemColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              bottom: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                toolbarHeight: 90,
                centerTitle: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/mapIcon.png',
                          color: Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedItemColor,
                        ),
                        Text(
                          'Cairo, Egypt',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context)
                                        .bottomNavigationBarTheme
                                        .selectedItemColor,
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 8),
                          itemCount: provider.eventslist.length,
                          itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            provider.changeCategory(index);
                          },
                          child: CategoryEventItem(
                            isSelected: index == provider.currentCategoryIndex,
                            imageName: provider.eventslist[index],
                            title:
                                provider.eventslist[index].tr(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: StreamBuilder<QuerySnapshot<EventModel>>(
              stream: FirebaseUtils.getEvent(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16),
                            itemCount: snapshot.data?.docs.length ?? 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, EventDetailsScreen.tag , arguments: snapshot.data!.docs[index].data());
                                },
                                child: EventCard(
                                  model: snapshot.data!.docs[index].data(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                      child: Text("No data available",
                              style: Theme.of(context).textTheme.titleMedium)
                          .tr());
                }
              },
            ),
          );
        });
  }
}
