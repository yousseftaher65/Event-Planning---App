import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/firebase_utils/firebase_utils.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:event_planning_pojo/ui/providers/create_or_update_event_provider.dart';
import 'package:event_planning_pojo/ui/screens/event_details/event_details_screen.dart';
import 'package:event_planning_pojo/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CreateOrUpdateEventProvider(),
      child: Consumer<CreateOrUpdateEventProvider>(
          builder: (context, provider, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                      child: StreamBuilder<QuerySnapshot<EventModel>>(
                        stream: FirebaseUtils.getFavoriteEvent(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}',
                                      style: Theme.of(context).textTheme.bodyLarge));
                            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 16),
                                itemCount: snapshot.data?.docs.length ?? 0,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, EventDetailsScreen.tag,
                                          arguments:
                                              snapshot.data!.docs[index].data());
                                    },
                                    child: EventCard(
                                      model: snapshot.data!.docs[index].data(),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: Text("no_favorite_events_found".tr(),
                                style: Theme.of(context).textTheme.titleMedium),
                              );
                            }
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
