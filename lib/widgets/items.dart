import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/items.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/models/items.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/screens/detail.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/likewidget.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:millionflashapp/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemsWidget extends StatelessWidget {
  final ItemModel items;
  const ItemsWidget({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);
    final itemServices = ItemServices();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          changeScreen(context, Details(items: items));
        },
        child: Stack(
          children: [
            Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: Loading(),
            )),
            Container(
              child: Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            items.image,
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.cover,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: LikeWidget(
                            initialLiked: items.liked,
                            onLikedChanged: (bool isLiked) {
                              items.liked = isLiked;
                              // Update Firestore with the new liked status
                              itemServices.likeOrDislikeProduct(
                                id: items.id.toString(),
                                userLikes: isLiked
                                    ? [
                                        ...items.userLikes,
                                        'currentUserId'
                                      ] // Add current user ID to likes
                                    : items.userLikes
                                  ..remove(
                                      'currentUserId'), // Remove current user ID from likes
                              );
                            },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.shopping_cart,
                              color: black,
                            )),
                      ],
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: items.name + "\n",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: items.sname,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: grey,
                                              fontWeight: FontWeight.normal)),
                                    ]))),
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "NT " +
                                              items.oldprice.toString() +
                                              "\n",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: grey,
                                              fontWeight: FontWeight.normal,
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                      TextSpan(
                                          text: "\NT " + items.price.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: red,
                                              fontWeight: FontWeight.bold)),
                                    ])))
                              ],
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // }));
  }
}
