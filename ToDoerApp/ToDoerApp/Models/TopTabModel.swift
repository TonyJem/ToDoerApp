import Foundation

class TopTabModel {
    
    var activeTabIndex = 0
    
    private var tabsDB: [Tab] = [
        Tab(title: "Day", defaultColor: .tabDayBackround),
        Tab(title: "Week", defaultColor: .tabWeekBackround),
        Tab(title: "Month", defaultColor: .tabMonthBackround),
        Tab(title: "Tasks", defaultColor: .tabTasksBackround),
        Tab(title: "Notes", defaultColor: .tabNotesBackround)
    ]
    
    init() {
        tabsDB[activeTabIndex].isActive = true
    }
    
    func tabs() -> [Tab] {
        tabsDB
    }
    
    func activateTab(by index: Int) {
        tabsDB[activeTabIndex].isActive = false
        tabsDB[index].isActive = true
        activeTabIndex = index
    }
}
