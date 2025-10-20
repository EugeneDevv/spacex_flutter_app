/// GraphQL query to fetch a list of all SpaceX launchpads.
/// This is useful for displaying launch sites on a map or list.
const String getAllCapsulesQuery = r'''
query Capsules($find: CapsulesFind, $limit: Int, $offset: Int, $order: String, $sort: String) {
  capsules(find: $find, limit: $limit, offset: $offset, order: $order, sort: $sort) {
    id
    landings
    missions {
      name
      flight
    }
    original_launch
    reuse_count
    status
    type
    dragon {
      description
      diameter {
        feet
        meters
      }
      active
      crew_capacity
      dry_mass_kg
      dry_mass_lb
      first_flight
      heat_shield {
        dev_partner
        material
        size_meters
        temp_degrees
      }
    }
  }
}
''';

/// GraphQL query to fetch detailed information for a single launchpad by its ID.
const String getCapsuleDetailsQuery = r'''
query Capsule($capsuleId: ID!) {
  capsule(id: $capsuleId) {
    dragon {
      active
      crew_capacity
      description
      diameter {
        meters
        feet
      }
    }
    id
    landings
    missions {
      flight
      name
    }
    original_launch
    reuse_count
    status
    type
  }
}
''';
