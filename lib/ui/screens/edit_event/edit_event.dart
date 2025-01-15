import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:event_planning_pojo/ui/providers/create_or_update_event_provider.dart';
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
    var args = ModalRoute.of(context)!.settings.arguments as EventModel;
    return ChangeNotifierProvider(create: (BuildContext context) {
      return CreateOrUpdateEventProvider()
        ..initCategory(args.image)
        ..titleController.text = args.title
        ..descriptionController.text = args.description
        ..selectedDate = args.date
        ..selectedTime = args.time;
    }, builder: (context, child) {
      var provider = Provider.of<CreateOrUpdateEventProvider>(context);
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "edit_event".tr(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: provider.formKey,
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
                          controller: provider.scrollController,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 8),
                          itemCount: provider.categoryList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                provider.changeCategory(index);
                              },
                              child: CategoryEventItem(
                                  isSelected:
                                      index == provider.currentCategoryIndex,
                                  imageName: provider.categoryList[index],
                                  title: provider.categoryList[index].tr()),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "title".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      controller: provider.titleController,
                      validator: provider.titleValidation,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(24),
                        hintText: args.title,
                        prefixIcon: Icon(
                          FontAwesomeIcons.penToSquare,
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle!
                              .color,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "description".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 6,
                      controller: provider.descriptionController,
                      validator: provider.descreptionValidation,
                      decoration: InputDecoration(
                        hintText: args.description,
                        contentPadding: EdgeInsets.all(24),
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
                          "date".tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            provider.chooseDate(context);
                          },
                          child: Text(
                            provider.selectedDate == null
                                ? DateFormat('dd/MM/yyyy').format(args.date)
                                : DateFormat('dd/MM/yyyy')
                                    .format(provider.selectedDate!),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
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
                          "time".tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            provider.chooseTime(context);
                          },
                          child: Text(
                            provider.selectedTime == null
                                ? args.time.format(context)
                                : provider.selectedTime!.format(context),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "location".tr(),
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
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(Icons.my_location_sharp,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "cairo".tr(),
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
                      onPressed: () {
                        provider.validate();
                        provider.updateEvent(
                            args.id,
                            provider
                                .categoryList[provider.currentCategoryIndex],
                            provider
                                .categoryList[provider.currentCategoryIndex],
                            context);
                      },
                      child: Text("update_event".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedItemColor)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
