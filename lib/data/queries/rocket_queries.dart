/// GraphQL query to fetch a list of all available rockets.
/// This is based on the sample you provided.
const String getAllRocketsQuery = r'''
  query Rockets($limit: Int, $offset: Int) {
  rockets(limit: $limit, offset: $offset) {
    active
    company
    country
    cost_per_launch
    boosters
    description
    diameter {
      feet
      meters
    }
    name
    mass {
      kg
    }
    landing_legs {
      material
      number
    }
    id
    height {
      meters
    }
    engines {
      engine_loss_max
      layout
      number
      propellant_1
      propellant_2
      thrust_sea_level {
        kN
      }
      thrust_to_weight
      thrust_vacuum {
        kN
      }
      version
      type
    }
    stages
    type
    success_rate_pct
    wikipedia
    first_flight
    payload_weights {
      kg
      name
    }
  }
}
''';
