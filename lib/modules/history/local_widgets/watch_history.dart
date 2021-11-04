import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/data/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:norecommendation/modules/history/controller.dart';

class WatchHistory extends StatelessWidget {
  const WatchHistory({Key? key, required this.history}) : super(key: key);

  final History history;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      margin: const EdgeInsets.all(4),
      child: Row(
        children: [
          SizedBox(
            width: 192,
            height: 108,
            child: CachedNetworkImage(
              imageUrl: history.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Text(
                    history.title,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Material(
                color: Colors.transparent,
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.more_vert,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('삭제하기'),
                      onTap: () {
                        final HistoryController historyController = Get.find();
                        historyController.removeAtHistory(history);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
