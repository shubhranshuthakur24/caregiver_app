import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_page_universal_services/resource_bundle_page_universal_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_detail/resource_detail_screen.dart';

import '../../../constants.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    required this.info,
    required this.mediaUrl,
    required this.title,
    required this.format,
    required this.tiletype,
    required this.duration,
    this.resourceid,
    this.isSaved,
  });

  final String format;
  final String title;
  final String info;
  final String mediaUrl;
  final String tiletype;
  final String duration;
  final int? resourceid;
  final bool? isSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      // padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ShadowColor),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => const ResourceDetailScreen(), arguments: [resourceid.toString()]);
        },
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28.sp,
                      child: Icon(
                          tiletype == "Video"
                              ? Icons.tv
                              : tiletype == "Article"
                                  ? Icons.article_outlined
                                  : CupertinoIcons.link,
                          color: kConstantPurple),
                      // backgroundImage: NetworkImage(mediaUrl),
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 185.w,
                          child: Text(
                            title,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: kConstantGrey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'TTCommons-DemiBold'),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Text(tiletype, style: const TextStyle(color: kConstantPurple, fontFamily: 'TTCommons-DemiBold')),
                            const Text(" I ", style: TextStyle(color: Colors.black, fontFamily: 'TTCommons-DemiBold')),
                            Text(duration, style: const TextStyle(color: Colors.black54, fontFamily: 'TTCommons-DemiBold'))
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(width: 20.w,),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          ResourceBundlePageUniversalServices.resourceSaveUnSaveFunction(resourceid!, isSaved!);
                          // ToolKitPageUniversalServices.toolKitSaveUnSaveFunction(toolkit_typeid!, isSaved ?? false);
                        },
                        icon: isSaved == true
                            ? Icon(
                                Icons.bookmark,
                                color: Colors.black45,
                                size: 18.sp,
                              )
                            : Icon(
                                Icons.bookmark_border,
                                color: Colors.black45,
                                size: 18.sp,
                              )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
