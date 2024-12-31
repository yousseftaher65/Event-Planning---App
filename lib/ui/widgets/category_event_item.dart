import 'package:flutter/material.dart';

class CategoryEventItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String imageName;
  const CategoryEventItem({super.key, required this.imageName , required this.title , this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                    border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage('assets/icons/$imageName.png'),
                        color: isSelected? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14,
                                  color: isSelected
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).primaryColor,
                                ),
                      ),
                    ],
                  ),
                );
  }
}
