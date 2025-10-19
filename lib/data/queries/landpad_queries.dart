/// GraphQL query to fetch a list of all SpaceX landpads.
/// LandPads are where Falcon 9 boosters and Dragon capsules land.
const String getAllLandPads = r'''
  query GetAllLandPads($limit: Int, $offset: Int) {
    landpads(limit: $limit, offset: $offset) {
      id
      full_name
      status
      landing_type
      attempted_landings
      successful_landings
      wikipedia
      location {
        name
        region
        latitude
        longitude
      }
      details
    }
  }
''';

/// GraphQL query to fetch detailed information for a single landpad by its ID.
const String getLandPadDetails = r'''
  query GetLandPadDetails($id: ID!) {
    landpad(id: $id) {
      id
      full_name
      status
      details
      wikipedia
      attempted_landings
      landing_type
      successful_landings
      location {
        name
        region
        longitude
        latitude
      }
    }
  }
''';
