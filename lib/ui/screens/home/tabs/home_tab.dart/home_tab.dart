import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/providers/category_event_provider.dart';
import 'package:event_planning_pojo/ui/screens/event_details/event_details_screen.dart';
import 'package:event_planning_pojo/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  static const String tag = 'home_tab';
  final String? userName;
  const HomeTab({super.key , required this.userName});

  @override
  Widget build(BuildContext context) {
   // final userName = ModalRoute.of(context)?.settings.arguments as String?;
   // final String? userName = arguments?['name'];

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
                  userName?? 'User',
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
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                      itemCount: 20,
                      itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffF2FEFF), width: 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/icons/sport.png'),
                              color: Color(0xffF2FEFF),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "sport".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    /* fontFamily: GoogleFonts.inter().fontFamily,
                                fontWeight: FontWeight.normal, */
                                    fontSize: 14,
                                    color: Color(0xffF2FEFF),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: provider.categoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, EventDetailsScreen.tag);
                        },
                        child: EventCard(
                          imageName: provider.categoryList[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
