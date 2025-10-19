/// GraphQL query to fetch a list of all SpaceX missions.
/// This includes the name, description, and related launch data.
const String getAllMissions = r'''
  query GetAllMissions($find: MissionsFind, $limit: Int, $offset: Int) {
    missions(find: $find, limit: $limit, offset: $offset) {
      id
      name
      description
      website
      twitter
      manufacturers
      payloads {
        id
        payload_type
      }
      wikipedia
    }
  }
''';

// payload:
// {
//   "find": {
//     "id": null,
//     "manufacturer": null,
//     "name": null,
//     "payload_id": null
//   },
//   "limit": null,
//   "offset": null
// }

/// GraphQL query to fetch detailed information for a specific mission by its ID.
const String getMissionDetails = r'''
  query GetMissionDetails($id: ID!) {
    mission(id: $id) {
      id
      name
      description
      website
      twitter
      manufacturers
      payloads {
        id
        nationality
        manufacturer
        payload_type
      }
      wikipedia
    }
  }
''';
