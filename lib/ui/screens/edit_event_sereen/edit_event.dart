import 'package:event_planning_pojo/ui/providers/category_event_provider.dart';
import 'package:event_planning_pojo/ui/widgets/category_event_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditEvent extends StatelessWidget {
  static const tag = 'EditEvent';
  const EditEvent({super.key});

 @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CategoryEventProvider(),
        builder: (context, child) {
          var provider = Provider.of<CategoryEventProvider>(context);
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Theme.of(context).primaryColor,
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/${provider.categoryList[provider.currentCategoryIndex]}.png',
                        height: 235,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8),
                        itemCount: provider.categoryList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            provider.changeCategory(index);
                          },
                          child: CategoryEventItem(
                            isSelected: index == provider.currentCategoryIndex,
                            imgaeName: provider.categoryList[index],
                            title: provider.categoryList[index].toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Title',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(24),
                          labelText: 'Event Title',
                          prefixIcon: Icon(FontAwesomeIcons.penToSquare)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Event Description',
                        contentPadding: EdgeInsets.only(left: 24, top: 24),
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined,
                            size: 30,
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Date',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Spacer(),
                        Text(
                          '30/11/2024',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.clock,
                            size: 30,
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Time',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Spacer(),
                        Text(
                          '11:22PM',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(16)),
                          backgroundColor: Colors.white),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(Icons.my_location_sharp,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Cairo, Egypt',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).primaryColor),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Update Event',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}