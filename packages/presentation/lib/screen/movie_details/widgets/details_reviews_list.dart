import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/movie_details/model/comments_model.dart';
import 'package:presentation/utils/image_path.dart';

class DetailsReviewsList extends StatelessWidget {
  const DetailsReviewsList({
    required this.rowLength,
    required this.comments,
    required this.commentsListIndex,
    super.key,
  });

  final int rowLength;
  final List<CommentsModel> comments;
  final int commentsListIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Column(
      children: List.generate(rowLength, (index) {
        final currentComment = comments[index + commentsListIndex];
        return Column(
          children: [
            SizedBox(height: Dimens.size20.h),
            Row(
              children: [
                SizedBox(
                  width: Dimens.size40.w,
                  height: Dimens.size40.h,
                  child: ClipOval(
                    child: Image.network(
                      currentComment.userImage,
                      fit: BoxFit.fill,
                      errorBuilder: (context, exception, stackTrace) =>
                          SvgPicture.asset(
                        ImagesPath.noUserImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimens.size12.w),
                SizedBox(
                  height: Dimens.size40.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentComment.userName,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.sfProMedium14px,
                      ),
                      Text(
                        currentComment.dateComment,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.sfProMediumUnselected12px,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimens.size25),
            Container(
              width: Responsive.isMobile(context) ? width : width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.size4.r),
                color: AppColorsDark.secondaryColor,
              ),
              padding: EdgeInsets.only(
                top: Dimens.size16.h,
                left: Dimens.size16.w,
                right: Dimens.size16.w,
                bottom: Dimens.size19.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieRating(
                    rating: currentComment.rating,
                    starsSize: Dimens.size20.r,
                  ),
                  SizedBox(height: Dimens.size9.h),
                  Text(currentComment.comment),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
