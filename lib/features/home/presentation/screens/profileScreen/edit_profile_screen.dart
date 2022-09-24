import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/component/custom_button.dart';
import '../../../../../core/utilis/constants/colors.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.text = 'Mohamed Reda';
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          backgroundColor: AppColors.darkGrey,
          appBar: AppBar(
            backgroundColor: AppColors.darkGrey,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '  Edit Profile',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: AppColors.darkGrey),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: AppColors.white.withOpacity(.1),
                              offset: const Offset(0, 10),
                            ),
                          ],
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=1024&h=683&fm=webp'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.teal,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 3),
                          labelText: 'Username',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Mohamed Reda',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.darkGrey),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.grey,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 3),
                          labelText: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'email@gmail.com',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.darkGrey),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.grey,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.white,
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: CustomButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.teal,
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

      },


    );

  }
}
