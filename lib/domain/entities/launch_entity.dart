// This entity is immutable and clean, containing only business data.
// It is used by the Use Cases and Notifiers.
class LaunchEntity {
  final String id;
  final String missionName;
  final bool? launchSuccess;

  // Date and Tentative Status
  final DateTime? launchDateUtc;
  final String launchYear;
  final bool isTentative;

  // Related Names
  final String launchSiteName;
  final String rocketName;

  // Links
  final String? missionPatchUrl;
  final String? articleLink;
  final String? videoLink;

  // Derived Data (extracted from the ships list in the Model)
  final int shipCount;

  const LaunchEntity({
    required this.id,
    required this.missionName,
    this.launchSuccess,
    this.launchDateUtc,
    required this.launchYear,
    required this.isTentative,
    required this.launchSiteName,
    required this.rocketName,
    this.missionPatchUrl,
    this.articleLink,
    this.videoLink,
    required this.shipCount,
  });
}
