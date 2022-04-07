class TopTabModel: TabModel {
    
    private var topTabsDB: [Tab] = [
        Tab(title: "Day", defaultColor: .tabDayBackround),
        Tab(title: "Week", defaultColor: .tabWeekBackround),
        Tab(title: "Month", defaultColor: .tabMonthBackround),
        Tab(title: "Tasks", defaultColor: .tabTasksBackround),
        Tab(title: "Notes", defaultColor: .tabNotesBackround)
    ]
    
    override init() {
        super.init()
        
        topTabsDB[activeTabIndex].isActive = true
        self.tabsDB = topTabsDB
    }
}
