import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/component/my_button.dart';
import '../../../../../core/component/my_text.dart';
import '../../../../../core/utilis/constants/assets_manager.dart';
import '../../../../../core/utilis/constants/colors.dart';
import '../../../../../core/utilis/constants/values_manger.dart';

class HotelView extends StatefulWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  late ScrollController _scrollController;
  bool _appBarCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 480) {
        setState(() {
          _appBarCollapsed = false;
        });
      } else {
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          body: DefaultTabController(
            length: 1,
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    leadingWidth: 50,
                    pinned: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:  const CircleAvatar(


                        backgroundColor: AppColors.grey,
                        child: Icon(
                        Icons.arrow_back,
                        size: AppSize.s20,
                        color: AppColors.black,
                      ),

                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: const CircleAvatar(
                          backgroundColor: AppColors.black,
                          child: Icon(
                            Icons.favorite_border,
                            size: AppSize.s20,
                            color: AppColors.teal,
                          ),
                        ),
                        onPressed: () {

                        },
                      ),
                    ],
                    systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: AppColors.transparent,
                        statusBarIconBrightness: Brightness.dark),
                    expandedHeight: AppSize.s711,
                    collapsedHeight: AppSize.s70,
                    actionsIconTheme: const IconThemeData(opacity: AppSize.s0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Image.asset(
                          ImageAssets.hotel,
                          fit: BoxFit.cover,
                        )),
                        if (_appBarCollapsed == false)
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Align(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: AppSize.s176,
                                    width: double.infinity,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: AppColors.cardColors,
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            AppPadding.p20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const MyText(
                                              text: "Grand Royal Hotel",
                                              fontSize: AppSize.s20,
                                            ),
                                            const SizedBox(
                                              height: AppSize.s5,
                                            ),
                                            Row(
                                              children: const [
                                                MyText(
                                                  text: "Wembly,London",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  colors: AppColors.white74,
                                                ),
                                                Icon(
                                                  Icons.location_on,
                                                  color: AppColors.teal,
                                                  size: 11,
                                                ),
                                                MyText(
                                                    text: "2.0 Km to City",
                                                    fontSize: 14,
                                                    colors: AppColors.white74),
                                                Spacer(),
                                                MyText(
                                                  text: "\$180",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 18,
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: AppColors.teal,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: AppSize.s5,
                                                ),
                                                const MyText(
                                                  text: "80 Reviews",
                                                  fontSize: 16,
                                                  colors: AppColors.white74,
                                                ),
                                                const Spacer(),
                                                const MyText(
                                                  text: "/per night",
                                                  fontSize: 16,
                                                  colors: AppColors.white74,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: AppSize.s10,),
                                            Center(
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: AppSize.s50,

                                                child: MyButton(
                                                  onPressed: () {},
                                                  label: AppStrings.bookNow,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: AppSize.s18,
                                                  radius: AppPadding.p10,

                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: AppSize.s145,
                                    height: AppSize.s40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppPadding.p100),
                                      color: AppColors.cardColors,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        jumpTo();
                                        },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            AppStrings.moreDetails,
                                            style: TextStyle(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: AppColors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (_appBarCollapsed == true) Container(),
                      ],
                    ),
                  ),

                ];
              },
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Row(
                        children: const [
                          MyText(
                            text: "Grand Royal Hotel",
                            fontSize: AppSize.s20,
                          ),
                          Spacer(),
                          MyText(
                            text: "\$180",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Row(
                        children:  const [
                          MyText(
                            text: "Wembly,London",
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            colors: AppColors.white74,
                          ),
                          Icon(
                            Icons.location_on,
                            color: AppColors.teal,
                            size: 11,
                          ),
                          MyText(
                              text: "2.0 Km to City",
                              fontSize: 14,
                              colors: AppColors.white74),
                          Spacer(),
                          MyText(
                            text: "/per night",
                            colors: AppColors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void jumpTo()
  {
    final _maxExtent =_scrollController.position.maxScrollExtent ;
    _scrollController.animateTo(
      _maxExtent * 0.85,   // scrolls to 65% of maxScrollExtent
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
