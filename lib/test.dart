import 'package:booking_app/core/utilis/constants/assets_manager.dart';
import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark),
                  expandedHeight: 350,
                  collapsedHeight: 180,
                  actionsIconTheme: const IconThemeData(opacity: AppSize.s0),
                  flexibleSpace: Stack(
                    children: <Widget>[
                      TestSlider(),
                      // Positioned.fill(
                      //     child: Image.asset(
                      //   ImageAssets.splash,
                      //   fit: BoxFit.cover,
                      // )),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            width: 145,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppPadding.p100),
                              color: Colors.teal,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'more details',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.zero,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 30,
                      (context, index) => ListTile(
                        leading: Text(index.toString()),
                        title: const Text("text"),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: const Center(
              child: Text("Sample text"),
            ),
          ),
        ));
  }
}

class TestSlider extends StatelessWidget {
  TestSlider({Key? key}) : super(key: key);
  final List<String> list = [
    'assets/images/splash.jpg',
    'assets/images/google.jpg',
    'assets/images/splash.jpg',
  ];
final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: list.length,
      carouselController: carouselController,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Image(
          image: AssetImage(
            list[index],
          ),
          filterQuality: FilterQuality.high,
          width: MediaQuery.of(context).size.width,
          height: 400,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
