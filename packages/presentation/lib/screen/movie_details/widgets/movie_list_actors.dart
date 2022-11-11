import 'package:domain/model/people_and_images_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class MovieListActors extends StatelessWidget {
  const MovieListActors({
    required this.cast,
    required this.listLength,
    required this.isScrollable,
    required this.additionalIndex,
    super.key,
  });

  final List<PeopleAndImagesModel>? cast;
  final int listLength;
  final bool isScrollable;
  final int additionalIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: Dimens.size23),
      physics: isScrollable
          ? const ScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: listLength,
      itemBuilder: (BuildContext context, int index) {
        final currentCast = cast?[index + additionalIndex];
        return Padding(
          padding: EdgeInsets.only(bottom: Dimens.size8.h),
          child: Row(
            children: [
              (currentCast?.image == null)
                  ? SvgPicture.asset(
                      ImagesPath.noPeopleImage,
                      fit: BoxFit.fill,
                      width: Dimens.size40.w,
                      height: Dimens.size40.h,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage('${currentCast?.image}'),
                      radius: Dimens.size24.r,
                    ),
              SizedBox(width: Dimens.size12.w),
              Expanded(
                flex: 2,
                child: Text(
                  '${currentCast?.person}',
                  textAlign: TextAlign.left,
                  style: AppTextStyles.sfProMedium14px,
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO made logic
                },
                icon: SvgPicture.asset(
                  ImagesPath.treeDotsImage,
                  color: AppColorsDark.unselectedColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '${currentCast?.characters?.toUpperCase()}',
                  style: AppTextStyles.sfProMediumUnselected12px,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
