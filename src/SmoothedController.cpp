#include "SmoothedController.hpp"
#include "views/MainViewController.hpp"

void SmoothedController::Install() {
    custom_types::Register::AutoRegister();
    
    QuestUI::Init();
    QuestUI::Register::RegisterMainMenuModSettingsViewController<SmoothedController::Views::MainViewController*>(modInfo);
    QuestUI::Register::RegisterModSettingsViewController<SmoothedController::Views::MainViewController*>(modInfo);
    
    SmoothedController::Hooks::VRController();
}