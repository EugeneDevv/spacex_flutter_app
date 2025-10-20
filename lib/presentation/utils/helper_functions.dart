import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/core/utils/colors.dart';

String formatNumberConcise(num n) {
  // Return the number as is if it's less than 1000
  if (n < 1000) return n.toString();

  // Define the units and their divisors in descending order
  final units = <num, String>{
    1000000000000: 'T', // Trillion
    1000000000: 'B', // Billion
    1000000: 'M', // Million
    1000: 'k', // Thousand
  };

  for (final unit in units.keys) {
    if (n >= unit) {
      final value = n / unit;
      // Check if the value is essentially an integer (e.g., 6.0)
      // by checking if the remainder after division is close to zero.
      if ((value - value.truncate()).abs() < 0.05) {
        // Return as an integer (e.g., "6k")
        return '${value.toInt()}${units[unit]}';
      } else {
        // Otherwise, return with one decimal place (e.g., "6.5k")
        return '${value.toStringAsFixed(1)}${units[unit]}';
      }
    }
  }

  // Fallback for very large numbers beyond T (or just return original)
  return n.toString();
}

String formatWeightInTonnes(num n) {
  // 1. If the weight is less than 1000 kg, display it in kilograms.
  if (n < 1000) {
    // Ensure no unnecessary decimals for whole numbers
    return '${n.toStringAsFixed(n == n.toInt() ? 0 : 1)} kg';
  }

  // 2. If the weight is 1000 kg or more, display it in tonnes.
  const num tonne = 1000;
  final value = n / tonne; // Convert kilograms to tonnes
  
  // Check if the value is essentially an integer (e.g., 6.0 t)
  // We use 0.05 as a tolerance for rounding.
  if ((value - value.truncate()).abs() < 0.05) {
    // Return as an integer (e.g., "6 t")
    return '${value.toInt()} t';
  } else {
    // Otherwise, return with one decimal place (e.g., "6.5 t")
    return '${value.toStringAsFixed(1)} t';
  }
}

String formatDistanceConcise(num n) {
  // If the distance is less than 1000 meters, display it in meters (m).
  if (n < 1000) {
    // Return with one decimal place only if it's not a whole number.
    return '${n.toStringAsFixed(n == n.toInt() ? 0 : 1)} m';
  }

  // If the distance is 1000 m or more, display it in kilometers (km).
  const num kilometer = 1000;
  final value = n / kilometer; // Convert meters to kilometers
  
  // Check if the value is essentially an integer (e.g., 6.0 km)
  // We use 0.05 as a tolerance for rounding to avoid unnecessary decimals.
  if ((value - value.truncate()).abs() < 0.05) {
    // Return as an integer (e.g., "6 km")
    return '${value.toInt()} km';
  } else {
    // Otherwise, return with one decimal place (e.g., "6.5 km")
    return '${value.toStringAsFixed(1)} km';
  }
}


Color getStatusColor(String? status, BuildContext context) {
  switch (status?.toLowerCase()) {
    case 'active':
      return Colors.green;
    case 'destroyed':
      return Colors.red;
    case 'unknown':
      return Theme.of(context).colorScheme.onSurface;
    default:
      return Theme.of(context).colorScheme.onSurface;
  }
}

Color getStatusTextColor(String? status, BuildContext context) {
  switch (status?.toLowerCase()) {
    case 'active':
      return AppColors.success;
    case 'destroyed':
      return AppColors.error;
    case 'unknown':
      return Theme.of(context).colorScheme.onSurface;
    default:
      return Theme.of(context).colorScheme.onSurface;
  }
}
