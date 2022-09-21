import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_btn.dart';
import '../../domain/entities/tiktok_video.dart';
import '../../domain/entities/video_data.dart';
import '../controller/downloader_bloc/downloader_bloc.dart';
import 'bottom_sheet_header.dart';
import 'count_view.dart';

Future<dynamic> buildDownloadBottomSheet(
    BuildContext context, TikTokVideo tikTokVideo) {
  final VideoData videoData = tikTokVideo.videoData!;
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(AppSize.s10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetHeader(videoData: videoData),
            const SizedBox(height: AppSize.s10),
            BottomSheetCountItems(videoData: videoData),
            const SizedBox(height: AppSize.s10),
            CustomElevatedBtn(
              width: double.infinity,
              label: AppStrings.download,
              onPressed: () {
                context
                    .read<DownloaderBloc>()
                    .add(DownloaderSaveVideo(tikTokVideo: tikTokVideo));
              },
            ),
          ],
        ),
      );
    },
  );
}
