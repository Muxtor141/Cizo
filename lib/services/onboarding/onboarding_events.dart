class OnboardingPagingEvent {}

class OnboardingUpdateText extends OnboardingPagingEvent {}

class OnboardingUpdateIndex extends OnboardingPagingEvent {
   int index;
  OnboardingUpdateIndex({required this.index});
}
