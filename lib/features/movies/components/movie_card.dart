import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:movies_app/common/widgets/confirmation_dialog.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:movies_app/features/movies/controller/movies_controller.dart';
import 'package:movies_app/features/movies/models/movie.dart';

class MovieCard extends GetView<MoviesController> {
  final Movie movie;
  final int index;

  const MovieCard({
    super.key,
    required this.movie,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            const SizedBox(width: 8),
            SlidableAction(
              flex: 2,
              onPressed: (cont) {
                ConfirmationDialog.showConfirmationDialog(
                    'Delete', 'Are you sure you want to delete the Movie?', () {
                  Get.back();
                  controller.deleteMovie(index);
                });
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete_rounded,
              borderRadius: BorderRadius.circular(16),
              label: 'Delete',
            ),
          ],
        ),
        child: _buildCard(context),
      ),
    );
  }

  Container _buildCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
            spreadRadius: -5,
          )
        ],
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  movie.description,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                controller.addRemoveFavourite(
                  movie: movie,
                  index: index,
                  isFavourite: !movie.isFavourite,
                );
              },
              icon: Icon(
                movie.isFavourite
                    ? CupertinoIcons.heart_solid
                    : CupertinoIcons.suit_heart,
                color: movie.isFavourite ? AppColors.red : AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
