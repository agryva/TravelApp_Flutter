import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelapp/data/menuDashboardModel.dart';
import 'package:travelapp/data/topDestinationModel.dart';
import 'package:travelapp/view/detail.dart';

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      headerDashboard(),
                      SizedBox(
                        height: 30,
                      ),
                      heroHeaderDashboard(),
                      topDestinationWidget(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget headerDashboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {},
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

  Widget heroHeaderDashboard() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Hey, Irvan!",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      fontFamily: "font-heavy",
                      color: Colors.black45),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Where would you like to travel today ?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "font-bold",
                  ),
                ),
              )
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: MediaQuery.of(context).size.height / 1100,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: List.generate(listMenuDashboard.length, (index) {
              return gridMenuWidget(
                  listMenuDashboard[index].title,
                  listMenuDashboard[index].icon,
                  listMenuDashboard[index].color);
            }),
          ),
        ],
      ),
    );
  }

  Widget gridMenuWidget(title, icon, color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xffebebeb),
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: "font-heavy", fontSize: 15, color: Colors.black87),
          )
        ],
      ),
    );
  }

  Widget topDestinationWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Top Destination",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font-heavy",
                ),
              ),
            )
          ],
        ),
        StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemCount: listTopDestinations.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              CachedNetworkImage(
                                height: index.isEven ? 220 : 170,
                                imageUrl: listTopDestinations[index].imageUrl,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: index.isEven ? 220 : 170,
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
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              listTopDestinations[index]
                                                  .destinationName,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "font-regular",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            LineIcons.map_marker,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              listTopDestinations[index]
                                                  .destinationAddress,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.7,
                                                  fontFamily: "font-heavy",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 8),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Colors.black54,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(listTopDestinations[index]
                                                    .rating
                                                    .toString())
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                        ),
                                      ),
                                      Icon(
                                        LineIcons.arrow_circle_down,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => DetailWidget(
                                destinationModel: listTopDestinations[index])));
                  },
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        )
      ],
    );
  }
}
