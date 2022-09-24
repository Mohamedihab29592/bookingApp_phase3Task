import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/core/utilis/constants/constats_manager.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utilis/constants/assets_manager.dart';
import '../../../../../core/utilis/constants/colors.dart';
import '../../../../../core/utilis/constants/values_manger.dart';
import '../../../../auth/widgets/my_button.dart';
import '../../../../auth/widgets/my_text.dart';
import '../../../../auth/widgets/my_text_form_field.dart';
import '../../widgets/hotelCardItem.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ScrollController _scrollController;
  bool _appBarCollapsed = true;
  var _carouselController = CarouselController();



  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController .addListener(() {
        if (_scrollController.position.pixels > 200) {
          setState(() {
            _appBarCollapsed = false;
          });
        }
        else {
          setState(() {
            _appBarCollapsed = true;
          });
        }


      });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final _controller = TextEditingController();

  final List<String> _images = [
    ImageAssets.hotel6,
    ImageAssets.hotel2,
    ImageAssets.hotel4,
  ];
  final List<String> _popularDestination = [
    ImageAssets.egypt,
    ImageAssets.paris,
    ImageAssets.london,
    ImageAssets.spain,
  ];
  final List<String> _popularDestinationNames = [
    "Egypt",
    "Paris",
    "London",
    "Spain",
  ];
  int _current = 0;




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener:(context, state){},
      builder:(context, state)=> Scaffold(

        backgroundColor: AppColors.kPrimaryColor,
        body: DefaultTabController(

          length: 1,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  expandedHeight: AppSize.s500,
                  collapsedHeight: AppSize.s172,
                  actionsIconTheme: const IconThemeData(opacity: AppSize.s0),
                  flexibleSpace: Stack(
                    children: <Widget>[
                      CarouselSlider.builder(
                        carouselController: _carouselController,
                        itemCount: _images.length,
                        options: CarouselOptions(
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: MediaQuery.of(context).size.height,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: AppConstants.autoPlayInterval),
                          autoPlayAnimationDuration: const Duration(milliseconds:  AppConstants.sliderAnimationTime),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index,reason){
                            setState(() {
                              _current = index;

                            });
                          },

                        ),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Image(
                            image: AssetImage(_images[index]),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:AppSize.s30,right: AppSize.s20,left: AppSize.s20,bottom: AppSize.s20),
                        child: Column(

                          children: [
                            Container(
                              height: AppSize.s50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s30),
                                color: AppColors.kPrimaryColor,
                              ),
                              child: MyTextForm(
                                onTap: (){},
                                isDense: true,
                                controller: _controller,
                                textInputType: TextInputType.text,
                                validator: (value) {},
                                prefixIcon: Icons.search,
                                hintText: AppStrings.whereAreYouGoing,
                                radius: AppSize.s30,
                              ),

                            ),
                            const Spacer(),
                            if(_appBarCollapsed == true)
                              Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                  text: AppStrings.capTown,
                                  fontSize: AppSize.s35,
                                  fontWeight: FontWeight.w900,
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                const  MyText(
                                    text:AppStrings.extraordinary,
                                    fontSize: AppSize.s20),
                                const   SizedBox(
                                  height: AppSize.s15,
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: MyButton(
                                          label: AppStrings.viewHotel,
                                          radius: AppSize.s100,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          onPressed: () {}),
                                    ),
                                    const Spacer(),
                                    AnimatedSmoothIndicator(
                                      activeIndex: _current,
                                      count: _images.length,
                                      effect: const ExpandingDotsEffect(
                                          activeDotColor: AppColors.teal,
                                          dotWidth: 8,
                                          dotHeight: 8),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if(_appBarCollapsed == false)
                              Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(
                        text: AppStrings.popularDestination,
                        fontSize: AppSize.s25,
                        fontWeight: FontWeight.bold,
                        colors: AppColors.white),
                    const  SizedBox(
                      height: AppSize.s20,
                    ),
                    SizedBox(
                      height: AppSize.s140,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p5),
                        child: ListView.separated(


                          itemCount: _popularDestination.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) => Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppPadding.p30),
                            ),
                            width: AppSize.s300,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppPadding.p100)),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset(
                                   _popularDestination[index],
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p20, top:AppPadding.p10),
                                      child: MyText(
                                        text:
                                        _popularDestinationNames[index],
                                        fontSize: AppSize.s30,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                                width: AppSize.s15,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MyText(
                            text: AppStrings.bestDeals,
                            fontSize: AppSize.s25,
                            fontWeight: FontWeight.bold,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              AppStrings.viewAll,
                              style: TextStyle(
                                  fontSize: AppSize.s20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.teal),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(

                      separatorBuilder: (context, index) => const SizedBox(
                        height:AppSize.s22,
                      ),
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) => const CardOfHotel(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}