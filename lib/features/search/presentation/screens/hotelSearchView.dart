import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/component/my_button.dart';
import '../../../../../core/component/my_text.dart';
import '../../../../../core/component/toast.dart';
import '../../../../../core/services/maps.dart';
import '../../../../../core/utilis/constants/assets_manager.dart';
import '../../../../../core/utilis/constants/colors.dart';
import '../../../../../core/utilis/constants/values_manger.dart';

class HotelSearchView extends StatefulWidget {
  final String hotelName;
  final String locationName;
  final String rate;
  final String price;
  final String image;
  final String facilities;
  final String lat;
  final String long;
  final int id;
  final int index;
  final String desc;

  const HotelSearchView(
      {Key? key,
        required this.hotelName,
        required this.locationName,
        required this.rate,
        required this.price,
        required this.desc,
        required this.image,
        required this.id,
        required this.lat,
        required this.long, required this.index, required this.facilities, })
      : super(key: key);

  @override
  State<HotelSearchView> createState() => _HotelSearchViewState();
}

class _HotelSearchViewState extends State<HotelSearchView> {
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
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);

        return Scaffold(
            body: NestedScrollView(
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
                        HomeCubit.get(context).getHomeData();
                      },
                      icon: const CircleAvatar(
                        backgroundColor: AppColors.cardColors,
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
                        onPressed: () {},
                      ),
                    ],
                    systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: AppColors.transparent,
                        statusBarIconBrightness: Brightness.dark),
                    expandedHeight: AppSize.s715,
                    collapsedHeight: AppSize.s70,
                    actionsIconTheme:
                    const IconThemeData(opacity: AppSize.s0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 3,
                            height: double.infinity,
                          ),
                        ),
                        if (_appBarCollapsed == false)
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Align(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Card(
                                    elevation: 10,
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
                                          MyText(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            text: widget.hotelName,
                                            fontSize: AppSize.s20,
                                            colors: AppColors.white74,

                                          ),
                                          const SizedBox(
                                            height: AppSize.s5,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: MyText(
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  text: widget.locationName,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  colors: AppColors.white74,
                                                ),
                                              ),

                                              MyText(
                                                text: "\$${widget.price}",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                colors: AppColors.white74,

                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RatingBar.builder(
                                                itemSize: 18,
                                                initialRating: double.parse(
                                                    widget.rate) /
                                                    2,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context, _) =>
                                                const Icon(
                                                  Icons.star,
                                                  color: AppColors.teal,
                                                ),
                                                onRatingUpdate: (rating) {},
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
                                              MyText(
                                                text:
                                                "/per night".tr(context),
                                                fontSize: 16,
                                                colors: AppColors.white74,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: AppSize.s10,
                                          ),

                                          Center(
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: AppSize.s50,
                                              child: BlocConsumer<HomeCubit,
                                                  HomeState>(
                                                listener: (context, state) {
                                                  if (state
                                                  is BookingHotelSuccessState) {
                                                    showToast(
                                                        text: state.message,
                                                        state: ToastStates
                                                            .success);
                                                  }
                                                },
                                                builder: (context, state) {
                                                  var cubit =
                                                  HomeCubit.get(context);

                                                  return MyButton(
                                                    width: double.infinity,

                                                    onPressed: () {
                                                      cubit.bookAHotel(
                                                          hotelId: widget.id
                                                              .toString());
                                                      HomeCubit.get(context)
                                                          .getHomeData();

                                                    },
                                                    label: AppStrings.bookNow
                                                        .tr(context),
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    fontSize: AppSize.s18,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
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
                                        _jumpTo();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppStrings.moreDetails
                                                .tr(context),
                                            style: const TextStyle(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          const Icon(
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
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: widget.hotelName,
                              fontSize: AppSize.s20,
                            ),
                          ),
                          const Spacer(),
                          MyText(
                            text: "\$${widget.price}",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            text: " /per night".tr(context),
                            colors: AppColors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      MyText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: widget.locationName,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        colors: AppColors.grey,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      const Divider(
                        height: 0.5,
                        color: AppColors.grey,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      MyText(text: 'Summary'.tr(context), fontSize: 20),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: MyText(
                          text: widget.desc,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          colors: AppColors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index)=>Image.network(imageBaseUrl+
                                cubit.searchModel!.data.data[widget.index].facilities[index].image,
                              color: AppColors.teal,

                            ),
                            separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                            itemCount:cubit.searchModel!.data.data[widget.index].facilities.length ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.light ?  AppColors.white:AppColors.darkGrey,

                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),

                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 177,
                        width: double.infinity,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    MyText(
                                      text: widget.rate,
                                      fontSize: 30,
                                      colors: AppColors.teal,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyText(
                                      text: 'Overall rating'.tr(context),
                                      fontSize: 13,
                                      colors: AppColors.grey,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: 'Room'.tr(context),
                                      fontSize: 15,
                                      colors: AppColors.grey,
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 200,
                                      color: AppColors.teal,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: 'services'.tr(context),
                                      fontSize: 15,
                                      colors: AppColors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 170,
                                      color: AppColors.teal,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: 'Location'.tr(context),
                                      fontSize: 15,
                                      colors: AppColors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 100,
                                      color: AppColors.teal,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyText(
                                      text: 'Price'.tr(context),
                                      fontSize: 15,
                                      colors: AppColors.grey,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 180,
                                      color: AppColors.teal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Row(
                        children: [
                          MyText(
                            text: "Photo".tr(context),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            colors: AppColors.white,
                          ),
                          const Spacer(),
                          MyText(
                            text: AppStrings.viewAll.tr(context),
                            colors: AppColors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s140,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p5),
                          child: ListView.separated(
                            itemCount: cubit.searchModel!.data.data[widget.index].images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                width: 100,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    if(cubit.searchModel!.data.data[widget.index].images.isNotEmpty)
                                    Image.network(imageBaseUrl+
                                        cubit.searchModel!.data.data[widget.index].images[index].image,
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    if(cubit.searchModel!.data.data[widget.index].images.isEmpty)
                                      const Center(child: CircularProgressIndicator(),),

                                  ],
                                ),
                              );
                            }),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                            const SizedBox(
                              width: AppSize.s15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Row(
                        children: [
                          MyText(
                            text: "Reviews".tr(context),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            colors: AppColors.white,
                          ),
                          const Spacer(),
                          MyText(
                            text: AppStrings.viewAll.tr(context),
                            colors: AppColors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    height: 60,
                                    width: 60,
                                    child: const Image(
                                        image:
                                        AssetImage(ImageAssets.profile))),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      MyText(
                                        text: 'Alexia Jane',
                                        fontSize: 15,
                                      ),
                                      MyText(
                                        text: 'last Update 27 Sep 2022',
                                        fontSize: 10,
                                        colors: AppColors.grey,
                                      ),
                                      MyText(
                                        text: '(8.0)',
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                "This is located in a great Spot close to the shops and bars, very quiet locations.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    height: 60,
                                    width: 60,
                                    child: const Image(
                                        image:
                                        AssetImage(ImageAssets.profile))),
                                const SizedBox(width: 20.0,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      MyText(
                                        text: 'Jacky Dep',
                                        fontSize: 15,
                                      ),
                                      MyText(
                                        text: 'last Update 29 Sep 2022',
                                        fontSize: 10,
                                        colors: AppColors.grey,
                                      ),
                                      MyText(
                                        text: '(10.0)',
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                "Good staff, very comfortable bed, very quiet location, place could do with an update.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0
                        ,),
                      SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Maps(
                            lat: widget.lat,
                            long: widget.long,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: AppSize.s50,
                          child: BlocConsumer<HomeCubit, HomeState>(
                            listener: (context, state) {
                              if (state is BookingHotelSuccessState) {
                                showToast(
                                    text: state.message,
                                    state: ToastStates.success);
                              }
                            },
                            builder: (context, state) {
                              var cubit = HomeCubit.get(context);

                              return MyButton(
                                width: double.infinity,

                                onPressed: () {
                                     cubit.bookAHotel(
                                      hotelId: widget.id.toString());
                                  HomeCubit.get(context).getHomeData();
                                },
                                label: AppStrings.bookNow.tr(context),
                                fontWeight: FontWeight.normal,
                                fontSize: AppSize.s18,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  void _jumpTo() {
    final _maxExtent = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      _maxExtent * 0.85, // scrolls to 85% of maxScrollExtent
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
