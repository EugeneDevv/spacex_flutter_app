/// GraphQL query to fetch a list of all available rockets.
/// This is based on the sample you provided.
const String getAllRockets = r'''
  query GetAllRockets($limit: Int, $offset: Int) {
    rockets(limit: $limit, offset: $offset) {
      id
      name
      type
      active
      cost_per_launch
      success_rate_pct
      first_flight
      country
      company
      height {
        meters
        feet
      }
      diameter {
        meters
        feet
      }
      mass {
        kg
        lb
      }
      description
      engines {
        number
        layout
        propellant_1
        propellant_2
        thrust_to_weight
        thrust_sea_level {
          kN
          lbf
        }
        engine_loss_max
        thrust_vacuum {
          kN
          lbf
        }
      }
    }
  }
''';

/// GraphQL query to fetch detailed information for a specific rocket by its ID.
const String getRocketDetails = r'''
  query GetRocketDetails($id: ID!) {
    rocket(id: $id) {
      id
      name
      type
      active
      boosters
      stages
      cost_per_launch
      success_rate_pct
      first_flight
      country
      company
      description
      wikipedia
      engines {
        number
        type
        version
        propellant_1
        propellant_2
      }
      landing_legs {
        number
        material
      }
      diameter {
        feet
        meters
      }
      mass {
        kg
        lb
      }
      payload_weights {
        id
        kg
        lb
        name
      }
      height {
        feet
        meters
      }
      second_stage {
        burn_time_sec
        engines
        fuel_amount_tons
        payloads {
          composite_fairing {
            height {
              feet
              meters
            }
            diameter {
              feet
              meters
            }
          }
        }
      }
      first_stage {
        burn_time_sec
        engines
        fuel_amount_tons
        reusable
        thrust_sea_level {
          kN
          lbf
        }
        thrust_vacuum {
          kN
          lbf
        }
      }
    }
  }
''';
