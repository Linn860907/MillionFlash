import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';

class LikeWidget extends StatefulWidget {
  final bool initialLiked;
  final Function(bool) onLikedChanged;

  LikeWidget({required this.initialLiked, required this.onLikedChanged});

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  late bool liked;

  @override
  void initState() {
    super.initState();
    liked = widget.initialLiked;
  }

  void _toggleLike() {
    setState(() {
      liked = !liked;
    });
    widget.onLikedChanged(liked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: IconButton(
        icon: Icon(
          liked ? Icons.favorite : Icons.favorite_border,
          color: liked ? red : Colors.grey,
          size: 22,
        ),
        onPressed: _toggleLike,
      ),
    );
  }
}
