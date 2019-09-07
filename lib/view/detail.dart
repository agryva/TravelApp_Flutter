import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';
import 'package:travelapp/data/topDestinationModel.dart';

class DetailWidget extends StatefulWidget {
  TopDestinationModel destinationModel;

  DetailWidget({this.destinationModel});

  @override
  State<StatefulWidget> createState() {
    return _DetailState(destinationModel: destinationModel);
  }
}

class _DetailState extends State<DetailWidget> {
  TopDestinationModel destinationModel;

  _DetailState({this.destinationModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1),
                bottomRight: Radius.circular(1)),
            child: PinchZoomImage(
              zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
              hideStatusBarWhileZooming: true,
              image: CachedNetworkImage(
                height: 400,
                imageUrl: destinationModel.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.darken)),
                  ),
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        destinationModel.destinationName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "font-bold",
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          destinationModel.rating.toString(),
                          style: TextStyle(
                              fontFamily: "font-regular",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      LineIcons.map_marker,
                      color: Colors.black,
                      size: 14,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        destinationModel.destinationAddress,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11.7,
                            fontFamily: "font-heavy",
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        destinationModel.destinationDetail,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontFamily: "font-heavy",
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  itemCount: destinationModel.imageDetail.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: new Container(
                      child: CachedNetworkImage(
                        height: index.isEven ? 220 : 160,
                        imageUrl: destinationModel.imageDetail[index],
                        imageBuilder: (context, imageProvider) => Container(
                          height: index.isEven ? 220 : 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.grey, BlendMode.darken)),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              ],
            ),
          )
        ],
      ))),
    );
  }

  Widget headerDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            CupertinoIcons.back,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Material(
            elevation: 4.0,
            shape: CircleBorder(),
            color: Colors.transparent,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                          "https://tinyfac.es/data/avatars/26CFEFB3-21C8-49FC-8C19-8E6A62B6D2E0-200w.jpeg"))),
            ))
      ],
    );
  }
}
