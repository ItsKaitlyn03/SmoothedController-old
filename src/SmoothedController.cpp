#include "SmoothedController.hpp"
#include "views/MainViewController.hpp"

void SmoothedController::Install() {
    custom_types::Register::AutoRegister();
    
    QuestUI::Init();
    QuestUI::Register::RegisterModSettingsViewController<SmoothedController::Views::MainViewController*>(modInfo);
    
    SmoothedController::Hooks::VRController();
}