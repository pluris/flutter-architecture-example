import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/config/constants/constants.dart';
import 'package:flutter_architecture_example/features/presentation/widgets/loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: false,
      child: ListView.separated(
        itemCount: 60,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(DEFAULT_BORDER_RADIUS),
        separatorBuilder: (context, index) => const SizedBox(
          height: DEFAULT_BORDER_RADIUS,
        ),
        itemBuilder: (context, index) => const _LoadingItemWidget(),
      ),
    );
  }
}

class _LoadingItemWidget extends StatelessWidget {
  const _LoadingItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DEFAULT_BORDER_RADIUS),
      height: DEFAULT_ITEM_HEIGHT,
      child: const Row(
        children: [
          LoadingWidget(
            width: DEFAULT_ITEM_HEIGHT,
            height: DEFAULT_ITEM_HEIGHT,
          ),
          SizedBox(
            width: DEFAULT_BORDER_RADIUS,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoadingWidget(
                  height: 16.0,
                  width: 100.0,
                ),
                LoadingWidget(
                  height: 16.0,
                  width: 200.0,
                ),
                LoadingWidget(
                  height: 16.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
