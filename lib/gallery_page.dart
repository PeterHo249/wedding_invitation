import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wedding_invitation/utils.dart';

import 'constant.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        border: Border.all(
          width: getScale(context, 20),
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildTitle(context),
          buildImageGallery(context),
        ],
      ),
    );
  }

  Widget buildImageGallery(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGrid.count(
        crossAxisCount: isVerticalScreen(context) ? 2 : 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: buildImageTiles(),
      ),
    );
  }

  List<Widget> buildImageTiles() {
    List<Widget> tiles = [];

    for (var imageFile in imageFiles) {
      tiles.add(
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: Image.asset(imageFile),
        ),
      );
    }

    return tiles;
  }

  Container buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getScale(context, 10),
        horizontal: getScale(context, 100),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: Text(
        'Hình Ảnh',
        style: TextStyle(
          fontFamily: 'DancingScript',
          color: Theme.of(context).colorScheme.primary,
          fontSize: getScale(context, 60),
        ),
      ),
    );
  }
}
