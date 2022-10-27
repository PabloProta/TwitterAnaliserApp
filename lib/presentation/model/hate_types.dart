enum HateTypes { positive, negative, neutral }

extension HateTypesExtension on HateTypes {
  String get name {
    switch (this) {
      case HateTypes.positive:
        return "positive";
      case HateTypes.neutral:
        return "neutral";
      case HateTypes.negative:
        return "negative";
    }
  }
}
