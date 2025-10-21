import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/presentation/widgets/capsule_card.dart';

import '../../core/utils/colors.dart';

class CapsuleGridView extends StatelessWidget {
  final List<CapsuleModel> capsules;
  final ScrollController scrollController;
  final bool isFetchingMore;
  final bool hasMoreData;

  const CapsuleGridView({
    super.key,
    required this.capsules,
    required this.scrollController,
    required this.isFetchingMore,
    required this.hasMoreData,
  });

  // Helper method to build the full-width footer content
  Widget _buildFooter() {
    if (isFetchingMore) {
      // Loading Indicator (takes up full width)
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    } else if (!hasMoreData) {
      // End of results message (takes up full width)
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
        child: Center(
          child: Text(
            'End of the Capsule History.',
            textAlign: TextAlign.center, // Ensure text is centered
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.lightGrey,
              fontSize: 14.0,
            ),
          ),
        ),
      );
    }
    // Default empty space (takes up full width)
    return const SizedBox(height: 24);
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: CustomScrollView(
        controller: scrollController,
        // The CustomScrollView's children are called "slivers"
        slivers: [
          // 1. SliverGrid for the main card content
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 3 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                          miniBadge: true,
                        ),
                      ),
                    ),
                  );
                },
                // The childCount is exactly the number of cards
                childCount: capsules.length,
              ),
            ),
          ),

          // 2. SliverToBoxAdapter for the full-width footer
          SliverToBoxAdapter(
            child: _buildFooter(),
          ),
        ],
      ),
    );
  }
}
