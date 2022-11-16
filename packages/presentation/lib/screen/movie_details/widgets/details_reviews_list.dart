import 'package:flutter/material.dart';
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
    required this.listLength,
    required this.comments,
    super.key,
  });

  final int listLength;
  final List<CommentsModel> comments;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: listLength,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
          crossAxisSpacing: Dimens.size2W,
        ),
        itemBuilder: (BuildContext context, int index) {
          final currentComment = comments[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimens.size20),
              Row(
                children: [
                  const SizedBox(width: Dimens.size12),
                  SizedBox(
                    width: Dimens.size40,
                    height: Dimens.size40,
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
                  SizedBox(width: Dimens.size12W),
                  SizedBox(
                    height: Dimens.size40,
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
               // width: Responsive.isMobile(context) ? width : width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.size4R),
                  color: AppColorsDark.secondaryColor,
                ),
                padding: const EdgeInsets.only(
                  top: Dimens.size16,
                  left: Dimens.size16,
                  right: Dimens.size16,
                  bottom: Dimens.size19,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieRating(
                      rating: currentComment.rating,
                      starsSize: Dimens.size20R,
                    ),
                    SizedBox(height: Dimens.size9H),
                    Text(currentComment.comment),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
