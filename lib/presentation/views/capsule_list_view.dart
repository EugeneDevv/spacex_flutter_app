import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/presentation/widgets/capsule_card.dart';

import '../../core/utils/colors.dart';

class CapsuleListView extends StatelessWidget {
  final List<CapsuleModel> capsules;
  final ScrollController scrollController;
  final bool isFetchingMore;
  final bool hasMoreData;
  const CapsuleListView(
      {super.key,
      required this.capsules,
      required this.scrollController,
      required this.isFetchingMore,
      required this.hasMoreData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AnimationLimiter(
        child: ListView.builder(
          controller: scrollController,
          // Added 1 to the item count to reserve space for the pagination footer/indicator
          itemCount: capsules.length + 1,
          itemBuilder: (context, index) {
            if (index == capsules.length) {
              // This is the pagination footer/load more indicator
              if (isFetchingMore) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              } else if (!hasMoreData) {
                // End of results message
                return const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      'End of the Capsule History.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.lightGrey),
                    ),
                  ),
                );
              }
              // Default empty space if we still have more data but haven't triggered a fetch yet
              return const SizedBox(height: 24);
            }
        
            final capsule = capsules[index];
            final status = capsule.status ?? 'retired';
            
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 50,
                child: FadeInAnimation(
                  child: CapsuleCard(
                    capsule: capsule,
                    status: status,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
