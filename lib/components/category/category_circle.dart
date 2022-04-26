import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';
import 'package:flutter_folder/models/category.dart';

class CardCategoryCircle extends StatelessWidget {
  const CardCategoryCircle({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Image(
            image: NetworkImage(category.media?.url ??
                "https://cdn.popsww.com/blog/sites/2/2022/01/kaito-kid.jpg"),
            height: 50,
            width: 50,
          ),
        ),
       const SizedBox(height: 8),
        Text(
          category.name,
          style:const TextStyle(color: AppColors.kTextGrey, fontSize: 12),
        )
      ]),
    );
  }
}
