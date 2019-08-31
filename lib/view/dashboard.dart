import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
                      StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) => new Container(
                            color: Colors.green,
                            child: new Center(
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                child: new Text('$index'),
                              ),
                            )),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 2 : 1),
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 3,
                      )
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
    var iconsMenu = [
      Icons.flight_land,
      Icons.train,
      Icons.directions_boat,
      Icons.directions_bus
    ];

    var colorIconsMenu = [
      Color(0xff4FDCCF),
      Color(0xff737CCE),
      Color(0xffFF724C),
      Color(0xffF4C406),
    ];

    var titleIconsMenu = ["Flight", "Train", "Cruise", "Bus"];

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
            children: List.generate(4, (index) {
              return gridMenuWidget(titleIconsMenu[index], iconsMenu[index],
                  colorIconsMenu[index]);
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

      ],
    );
  }
}
