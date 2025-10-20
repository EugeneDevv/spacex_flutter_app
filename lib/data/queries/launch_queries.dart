/// GraphQL query to fetch a list of all past launches.
/// It retrieves key summary data points for display in a list.
const String getPastLaunchesQuery = r'''
  query GetPastLaunches($offset: Int, $limit: Int, $find: LaunchFind, $order: String, $sort: String) {
    launchesPast(offset: $offset, limit: $limit, find: $find, order: $order, sort: $sort) {
      id
      mission_name
      details
      launch_date_utc
      launch_date_local
      launch_site {
        site_name_long
      }
      rocket {
        rocket_name
        rocket {
          cost_per_launch
        }
      }
      links {
        mission_patch_small
        article_link
        video_link
      }
      is_tentative
      launch_success
      launch_year
      mission_id
    }
  }
''';

const String getUpComingLaunchesQuery = r'''
query LaunchesUpcoming($limit: Int, $offset: Int, $order: String, $sort: String, $find: LaunchFind) {
  launchesUpcoming(limit: $limit, offset: $offset, order: $order, sort: $sort, find: $find) {
    id
      mission_name
      details
      launch_date_utc
      launch_date_local
      launch_site {
        site_name_long
      }
      rocket {
        rocket_name
        rocket {
          cost_per_launch
        }
      }
      links {
        mission_patch_small
        article_link
        video_link
      }
      is_tentative
      launch_success
      launch_year
      mission_id
    }
}
''';

/// GraphQL query to fetch detailed information for a specific launch by its ID.
const String getLaunchDetailsQuery = r'''
query GetLaunchDetails($id: ID!) {
    launch(id: $id) {
      id
      mission_name
      launch_date_utc
      details
      launch_success
      launch_site {
        site_name_long
      }
      rocket {
        rocket_name
        rocket_type
        rocket {
          description
          id
        }
      }
      links {
        article_link
        video_link
        wikipedia
        mission_patch
        flickr_images
      }
      ships {
        name
        image
        type
      }
      is_tentative
      static_fire_date_unix
      telemetry {
        flight_club
      }
    }
  }
''';
