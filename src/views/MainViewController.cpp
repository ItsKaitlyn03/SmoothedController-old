#include "views/MainViewController.hpp"
#include "SmoothedControllerConfig.hpp"

DEFINE_TYPE(SmoothedController::Views, MainViewController);

void SmoothedController::Views::MainViewController::DidActivate(
    bool firstActivation,
    bool addedToHierarchy,
    bool screenSystemEnabling
) {
    using namespace UnityEngine;

    if (firstActivation) {
        GameObject* container = QuestUI::BeatSaberUI::CreateScrollableSettingsContainer(get_transform());
        
        AddConfigValueToggle(container->get_transform(), getSmoothedControllerConfig().Enabled);
        AddConfigValueIncrementFloat(container->get_transform(), getSmoothedControllerConfig().PositionSmoothing, 2, .5f, 0, 20);
        AddConfigValueIncrementFloat(container->get_transform(), getSmoothedControllerConfig().RotationSmoothing, 2, .5f, 0, 20);
        AddConfigValueIncrementFloat(container->get_transform(), getSmoothedControllerConfig().SmallMovementThresholdAngle, 2, .5f, 0.f, 15);
    }
}