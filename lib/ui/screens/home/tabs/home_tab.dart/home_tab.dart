import 'package:event_planning_pojo/ui/providers/category_event_provider.dart';
import 'package:event_planning_pojo/ui/screens/event_details_screen/event_details_screen.dart';
import 'package:event_planning_pojo/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(create: (BuildContext context) => CategoryEventProvider(),
    builder: (context, child) {
      var provaider = Provider.of<CategoryEventProvider>(context);
      return Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back ✨',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        /* fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.normal, */
                        fontSize: 14,
                        color: Color(0xffF2FEFF),
                      ),
                ),
                Text(
                  'Balf',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        /* fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.normal, */
                        fontSize: 24,
                        color: Color(0xffF2FEFF),
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
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/mapIcon.png',
                      ),
                      Text(
                        'Cairo, Egypt',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  /* fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.normal, */
                                  fontSize: 14,
                                  color: Color(0xffF2FEFF),
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
                              'Sport',
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: provaider.categoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, EventDetailsScreen.tag);
                        },
                        child: EventCard(
                          imageName: provaider.categoryList[index],
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
