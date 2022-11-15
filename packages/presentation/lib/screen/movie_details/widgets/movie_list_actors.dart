import 'package:domain/model/people_and_images_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class MovieListActors extends StatelessWidget {
  const MovieListActors({
    required this.cast,
    required this.listLength,
    required this.isScrollable,
    super.key,
  });

  final List<PeopleAndImagesModel>? cast;
  final int listLength;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listLength,
      physics:  isScrollable ? ScrollPhysics(): NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isLargerDesktop(context)  ? 2 : 1,
        crossAxisSpacing: Dimens.size2W,
        mainAxisExtent: Dimens.size50,
      ),
      itemBuilder: (BuildContext context, int index) {
        final currentCast = cast?[index ];
        return Row(
          children: [
            (currentCast?.image == null)
                ? SvgPicture.asset(
                    ImagesPath.noPeopleImage,
                    fit: BoxFit.fill,
                    width: Dimens.size40W,
                    height: Dimens.size40H,
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage('${currentCast?.image}'),
                    radius: Dimens.size24R,
                  ),
            SizedBox(width: Dimens.size12W),
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
        );
      },
    );
  }
}
