// This entity is immutable and clean, containing only business data.
// It is used by the Use Cases and Notifiers.
class LaunchEntity {
  final String id;
  final String missionName;
  final String? details;
  final bool? launchSuccess;

  // Date and Tentative Status
  final DateTime? launchDateUtc;
  final String launchYear;
  final bool isTentative;

  // Related Names
  final String launchSiteName;
  final String? launchCost;
  final String rocketName;

  // Links
  final String? missionPatchUrl;
  final String? articleLink;
  final String? videoLink;

  const LaunchEntity(
      {required this.id,
      required this.missionName,
      this.details,
      this.launchSuccess,
      this.launchDateUtc,
      required this.launchYear,
      required this.isTentative,
      this.launchCost,
      required this.launchSiteName,
      required this.rocketName,
      this.missionPatchUrl,
      this.articleLink,
      this.videoLink});
}
