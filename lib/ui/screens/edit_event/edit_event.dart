import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:event_planning_pojo/ui/providers/category_event_provider.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => CategoryEventProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => CreateOrUpdateEventProvider(),
          ),
        ],
        builder: (context, child) {
          var provider = Provider.of<CategoryEventProvider>(context);
          var editEventProvider =
              Provider.of<CreateOrUpdateEventProvider>(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                    key: editEventProvider.formKey,
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
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    provider.changeCategory(index);
                                  },
                                  child: CategoryEventItem(
                                      isSelected: index ==
                                          provider.currentCategoryIndex,
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
                          controller: editEventProvider.titleController,
                          validator: editEventProvider.titleValidation,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(24),
                            hintText: args.title,
                            prefixIcon: Icon(
                              FontAwesomeIcons.penToSquare,
                              color:
                                  Theme.of(context).inputDecorationTheme.hintStyle!.color,
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
                          controller: editEventProvider.descriptionController,
                          validator: editEventProvider.descreptionValidation,
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
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color),
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
                                editEventProvider.chooseDate(context);
                              },
                              child: Text(
                                editEventProvider.selectedDate == null
                                    ? DateFormat('dd/MM/yyyy').format(args.date)
                                    : DateFormat('dd/MM/yyyy').format(
                                        editEventProvider.selectedDate!),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color),
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
                                editEventProvider.chooseTime(context);
                              },
                              child: Text(
                                editEventProvider.selectedTime == null
                                    ? args.time.substring(10, 15)
                                    : editEventProvider.selectedTime!
                                        .format(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
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
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
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
                            editEventProvider.validate();
                            editEventProvider.updateEvent(
                                args.id,
                                provider.categoryList[
                                    provider.currentCategoryIndex],
                                provider.categoryList[
                                    provider.currentCategoryIndex],
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
