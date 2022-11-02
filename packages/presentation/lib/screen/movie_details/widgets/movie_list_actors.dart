import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/utils/image_path.dart';

class MovieListActors extends StatelessWidget {
  const MovieListActors({
    required this.blocData,
    super.key,
  });

  final DetailsData blocData;
  static const int _listLength = 4;

  @override
  Widget build(BuildContext context) {
    final cast = blocData.detailsAboutPeople;
    return ListView.builder(
      padding: const EdgeInsets.only(top: Dimens.size23),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _listLength,
      itemBuilder: (BuildContext context, int index) {
        final currentCast = cast?[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: Dimens.size8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('${currentCast?.image}'),
                radius: Dimens.size24,
              ),
              const SizedBox(
                width: Dimens.size12,
              ),
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
