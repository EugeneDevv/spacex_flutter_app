/// GraphQL query to fetch a list of all SpaceX launchpads.
/// This is useful for displaying launch sites on a map or list.
const String getAllLaunchpads = r'''
  query GetAllLaunchpads($limit: Int, $offset: Int) {
    launchpads(limit: $limit, offset: $offset) {
      id
      name
      status
      details
      location {
        name
        region
        longitude
        latitude
      }
      attempted_launches
      vehicles_launched {
        active
        company
        country
        cost_per_launch
        diameter {
          feet
          meters
        }
        description
        first_flight
        engines {
          engine_loss_max
          number
          propellant_1
          propellant_2
          thrust_sea_level {
            kN
            lbf
          }
        }
      }
    }
  }
''';

/// GraphQL query to fetch detailed information for a single launchpad by its ID.
const String getLaunchpadDetails = r'''
  query GetLaunchpadDetails($id: ID!) {
    launchpad(id: $id) {
      id
      name
      status
      location {
        name
        region
      }
      details
      wikipedia
      attempted_launches
      vehicles_launched {
        company
        country
        diameter {
          feet
          meters
        }
        engines {
          number
          propellant_1
          thrust_vacuum {
            lbf
            kN
          }
        }
      }
    }
  }
''';
