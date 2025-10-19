import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';

class LaunchCard extends StatelessWidget {
  final LaunchEntity launch;

  const LaunchCard({required this.launch, super.key});

  @override
  Widget build(BuildContext context) {
    // Determine status text and color
    final bool? success = launch.launchSuccess;
    Color statusColor = success == true ? Colors.greenAccent : Colors.redAccent;
    String statusText = 'N/A';

    if (success == true) {
      statusText = 'Successful';
    } else if (success == false) {
      statusText = 'Failed';
    } else {
      statusColor = Colors.blueGrey;
      statusText = 'Unknown';
    }

    // Format the UTC date nicely
    final formattedDate = DateFormat('MMM dd, yyyy @ hh:mm a')
        .format(launch.launchDateUtc ?? DateTime.now());

    // Fallback URL for mission patch
    final String patchUrl = (launch.missionPatchUrl?.isNotEmpty ?? false)
        ? launch.missionPatchUrl!
        : 'https://via.placeholder.com/55?text=SPX';

    return GestureDetector(
      onTap: () {
        // TODO: Implement navigation to Launch Details Screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on ${launch.missionName}')),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12.0),
          // Highlight the card based on launch success status
          border: Border.all(color: statusColor.withOpacity(0.4), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mission Patch Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                patchUrl,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: SizedBox(
                      width: 55,
                      height: 55,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 55,
                  height: 55,
                  color: Colors.blueGrey.shade800,
                  child: const Icon(Icons.broken_image,
                      color: Colors.grey, size: 30),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mission Name
                  Text(
                    launch.missionName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Rocket Name
                  Text(
                    'Rocket: ${launch.rocketName}',
                    style: TextStyle(
                        color: Colors.blueAccent.shade200, fontSize: 14),
                  ),
                  // Launch Site
                  Text(
                    'Site: ${launch.launchSiteName}',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  // Launch Date
                  Text(
                    'Date: $formattedDate (UTC)',
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                  ),
                  // Success Status
                  Row(
                    children: [
                      Icon(
                        success == true
                            ? Icons.check_circle
                            : success == false
                                ? Icons.cancel
                                : Icons.help_outline,
                        color: statusColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Status: $statusText',
                        style: TextStyle(
                            color: statusColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
