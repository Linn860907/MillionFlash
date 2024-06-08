import 'package:flutter/material.dart';
import 'package:millionflashapp/models/category.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: <Widget>[
          Container(
            // decoration: BoxDecoration(
            //   color: white,
            //   boxShadow: [
            //     BoxShadow(color: grey, offset: Offset(4,6), blurRadius: 20)
            //   ],
            // ),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Stack(
                children: [
                  // 使用 Image.network 的 loadingBuilder 来处理加载状态
                  Image.network(
                    category.image,
                    width: 50,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Loading(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          CustomText(
            text: category.name,
            size: 14,
            color: black,
            weight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
