//
//  ContentView.swift
//  SPEAR: Orbit Zone
//
//  Engineering and Robotics Organization
//  De La Salle University – Dasmariñas High School
//  Season 2026
//
//  Created by ERO Dev Team · 2026
//  MIT License — see LICENSE for details
//

import SwiftUI

// MARK: - Models

struct RobotPart: Identifiable, Codable {
    var id = UUID()
    var name: String
    var category: String
    var quantity: Int
    var minStock: Int
    var location: String
    var status: PartStatus
    var notes: String

    enum PartStatus: String, Codable, CaseIterable {
        case available = "Available"
        case lowStock  = "Low Stock"
        case outOfStock = "Out of Stock"
        case ordered   = "Ordered"
    }
}

struct TeamMember: Identifiable, Codable {
    var id = UUID()
    var name: String
    var role: MemberRole
    var subteam: String
    var email: String
    var isActive: Bool

    enum MemberRole: String, Codable, CaseIterable {
        case commander       = "Commander"
        case flightDirector  = "Flight Director"
        case missionSpec     = "Mission Specialist"
        case payloadSpec     = "Payload Specialist"
        case systemsEngineer = "Systems Engineer"
        case navigations     = "Navigation Officer"
        case groundControl   = "Ground Control"
        case pilot           = "Pilot"
    }
}

struct OrgTask: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var assignee: String
    var dueDate: Date
    var priority: TaskPriority
    var status: TaskStatus
    var category: String

    enum TaskPriority: String, Codable, CaseIterable {
        case critical = "Critical"
        case high     = "High"
        case medium   = "Medium"
        case low      = "Low"
    }

    enum TaskStatus: String, Codable, CaseIterable {
        case todo       = "To Do"
        case inProgress = "In Progress"
        case review     = "Review"
        case done       = "Done"
    }
}

struct Competition: Identifiable, Codable {
    var id = UUID()
    var name: String
    var location: String
    var date: Date
    var ranking: Int?
    var score: Int?
    var notes: String
    var status: CompStatus

    enum CompStatus: String, Codable, CaseIterable {
        case upcoming  = "Upcoming"
        case ongoing   = "Ongoing"
        case completed = "Completed"
    }
}

struct BudgetItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var amount: Double
    var category: String
    var type: BudgetType
    var date: Date
    var notes: String

    enum BudgetType: String, Codable, CaseIterable {
        case income  = "Income"
        case expense = "Expense"
    }
}

// MARK: - App Store

class AppStore: ObservableObject {
    @Published var parts: [RobotPart] = [
        RobotPart(name: "DC Motor 12V", category: "Motors", quantity: 8, minStock: 4, location: "Shelf A1", status: .available, notes: "High torque variant"),
        RobotPart(name: "Servo SG90", category: "Actuators", quantity: 2, minStock: 5, location: "Shelf A2", status: .lowStock, notes: "Need reorder"),
        RobotPart(name: "Arduino Mega", category: "Controllers", quantity: 5, minStock: 2, location: "Cabinet B", status: .available, notes: ""),
        RobotPart(name: "LiPo Battery 5000mAh", category: "Power", quantity: 0, minStock: 3, location: "Shelf C1", status: .outOfStock, notes: "On order"),
        RobotPart(name: "Ultrasonic Sensor", category: "Sensors", quantity: 12, minStock: 4, location: "Drawer D", status: .available, notes: "HC-SR04"),
        RobotPart(name: "Aluminium Extrusion 20x20", category: "Structure", quantity: 15, minStock: 5, location: "Rack E", status: .available, notes: "1m lengths"),
    ]

    @Published var members: [TeamMember] = [
        TeamMember(name: "Amir Zabihi",      role: .commander,      subteam: "President",                      email: "", isActive: true),
        TeamMember(name: "Lana Fajayo",      role: .flightDirector, subteam: "Vice President & PRO",           email: "", isActive: true),
        TeamMember(name: "Andrea Escamilla", role: .missionSpec,    subteam: "VP of Creatives & Marketing",    email: "", isActive: true),
        TeamMember(name: "Mikoh Filoteo",    role: .payloadSpec,    subteam: "VP of Finance & Business",       email: "", isActive: true),
        TeamMember(name: "Denielle Medina",  role: .navigations,    subteam: "Secretary",                      email: "", isActive: true),
        TeamMember(name: "Daphne Acena",     role: .pilot,          subteam: "Robotics Captain & Research Head", email: "", isActive: true),
        TeamMember(name: "Matt Pacifico",    role: .systemsEngineer,subteam: "Software Head",                  email: "", isActive: true),
        TeamMember(name: "Aldus Plaus",      role: .groundControl,  subteam: "Projects Head",                  email: "", isActive: true),
        TeamMember(name: "Jaiden Olasiman",  role: .missionSpec,    subteam: "Hardware Head",                  email: "", isActive: true),
        TeamMember(name: "Prince Sadia",     role: .navigations,    subteam: "Trainings Head",                 email: "", isActive: true),
    ]

    @Published var tasks: [OrgTask] = [
        OrgTask(title: "Finalize chassis design", description: "Complete CAD model for competition robot", assignee: "Morgan Kim", dueDate: Date().addingTimeInterval(86400*3), priority: .critical, status: .inProgress, category: "Engineering"),
        OrgTask(title: "Write autonomous code", description: "Implement sensor-based navigation", assignee: "Jordan Lee", dueDate: Date().addingTimeInterval(86400*7), priority: .high, status: .todo, category: "Software"),
        OrgTask(title: "Order servo motors", description: "Restock SG90 servos — minimum 10 units", assignee: "Alex Rivera", dueDate: Date().addingTimeInterval(86400*2), priority: .high, status: .todo, category: "Inventory"),
        OrgTask(title: "Sponsor presentation", description: "Prepare slide deck for TechCorp pitch", assignee: "Sam Chen", dueDate: Date().addingTimeInterval(86400*5), priority: .medium, status: .review, category: "Admin"),
    ]

    @Published var competitions: [Competition] = [
        Competition(name: "Regional Qualifier 2026", location: "Manila, PH", date: Date().addingTimeInterval(86400*20), ranking: nil, score: nil, notes: "First major comp of the season", status: .upcoming),
        Competition(name: "City Championship", location: "Quezon City, PH", date: Date().addingTimeInterval(-86400*30), ranking: 2, score: 87, notes: "Great performance on autonomous", status: .completed),
    ]

    @Published var budgetItems: [BudgetItem] = [
        BudgetItem(title: "School Grant", amount: 15000, category: "Grant", type: .income, date: Date().addingTimeInterval(-86400*60), notes: "Annual school subsidy"),
        BudgetItem(title: "Sponsor - TechCorp", amount: 8000, category: "Sponsorship", type: .income, date: Date().addingTimeInterval(-86400*20), notes: "Logo placement on robot"),
        BudgetItem(title: "Motors & Actuators", amount: 4200, category: "Parts", type: .expense, date: Date().addingTimeInterval(-86400*10), notes: "Batch order"),
        BudgetItem(title: "Competition Registration", amount: 1500, category: "Competition", type: .expense, date: Date().addingTimeInterval(-86400*5), notes: "Regional Qualifier 2026"),
        BudgetItem(title: "3D Printing Filament", amount: 800, category: "Materials", type: .expense, date: Date(), notes: "PLA + PETG spools"),
    ]

    var totalIncome: Double { budgetItems.filter { $0.type == .income }.map(\.amount).reduce(0, +) }
    var totalExpense: Double { budgetItems.filter { $0.type == .expense }.map(\.amount).reduce(0, +) }
    var balance: Double { totalIncome - totalExpense }

    var criticalAlerts: Int {
        let lowParts = parts.filter { $0.status == .lowStock || $0.status == .outOfStock }.count
        let overdueTasks = tasks.filter { $0.dueDate < Date() && $0.status != .done }.count
        return lowParts + overdueTasks
    }
}

// MARK: - Theme

struct SpaceTheme {
    static let green      = Color(red: 0.10, green: 0.80, blue: 0.40)
    static let greenDark  = Color(red: 0.04, green: 0.50, blue: 0.25)
    static let greenGlow  = Color(red: 0.15, green: 1.00, blue: 0.55)
    static let bg         = Color(red: 0.04, green: 0.06, blue: 0.04)
    static let surface    = Color(red: 0.07, green: 0.11, blue: 0.07)
    static let surface2   = Color(red: 0.10, green: 0.15, blue: 0.10)
    static let text       = Color.white
    static let textMuted  = Color(white: 0.65)
    static let red        = Color(red: 1.0, green: 0.27, blue: 0.27)
    static let yellow     = Color(red: 1.0, green: 0.80, blue: 0.20)
}

// MARK: - Root App

struct ContentView: View {
    @StateObject private var store = AppStore()
    @State private var selected: String = "Dashboard"

    let sections = ["Dashboard", "Inventory", "Members", "Tasks", "Competitions", "Budget"]
    let icons    = ["Dashboard":"star.fill","Inventory":"shippingbox.fill","Members":"person.3.fill","Tasks":"checklist","Competitions":"trophy.fill","Budget":"banknote.fill"]

    var body: some View {
        NavigationSplitView {
            SidebarView(selected: $selected, sections: sections, icons: icons, store: store)
        } detail: {
            ZStack {
                SpaceBackground()
                Group {
                    switch selected {
                    case "Dashboard":     DashboardView(store: store, selected: $selected)
                    case "Inventory":     InventoryView(store: store)
                    case "Members":       MembersView(store: store)
                    case "Tasks":         TasksView(store: store)
                    case "Competitions":  CompetitionsView(store: store)
                    case "Budget":        BudgetView(store: store)
                    default:              DashboardView(store: store, selected: $selected)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Sidebar

struct SidebarView: View {
    @Binding var selected: String
    let sections: [String]
    let icons: [String: String]
    @ObservedObject var store: AppStore

    var body: some View {
        ZStack {
            SpaceTheme.bg.ignoresSafeArea()
            VStack(spacing: 0) {
                // Logo
                VStack(spacing: 6) {
                    ZStack {
                        Circle()
                            .fill(SpaceTheme.green.opacity(0.15))
                            .frame(width: 72, height: 72)
                        Image(systemName: "gyroscope")
                            .font(.system(size: 34, weight: .thin))
                            .foregroundColor(SpaceTheme.green)
                    }
                    Text("SPEAR")
                        .font(.system(size: 22, weight: .black, design: .monospaced))
                        .foregroundColor(SpaceTheme.green)
                    Text("Orbit Zone")
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(SpaceTheme.text)
                    Text("ERO · DLSU-D High School")
                        .font(.system(size: 9, weight: .medium, design: .monospaced))
                        .foregroundColor(SpaceTheme.textMuted)
                        .multilineTextAlignment(.center)
                    Text("2026 SEASON")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(SpaceTheme.greenDark)
                        .padding(.horizontal, 8).padding(.vertical, 2)
                        .background(SpaceTheme.greenDark.opacity(0.2))
                        .clipShape(Capsule())
                }
                .padding(.vertical, 28)

                Divider().background(SpaceTheme.green.opacity(0.2)).padding(.horizontal)

                ScrollView {
                    VStack(spacing: 4) {
                        ForEach(sections, id: \.self) { sec in
                            SidebarItem(title: sec, icon: icons[sec] ?? "circle", isSelected: selected == sec, badge: sec == "Inventory" ? store.parts.filter { $0.status == .lowStock || $0.status == .outOfStock }.count : 0)
                                .onTapGesture { selected = sec }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                }

                Spacer()

                // Footer
                VStack(spacing: 4) {
                    Divider().background(SpaceTheme.green.opacity(0.2)).padding(.horizontal)
                    HStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .foregroundColor(SpaceTheme.green)
                            .font(.system(size: 11))
                        Text("SYSTEM ONLINE")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(SpaceTheme.green)
                    }
                    .padding(.vertical, 12)
                }
            }
        }
        .frame(minWidth: 220)
        .navigationBarHidden(true)
    }
}

struct SidebarItem: View {
    let title: String
    let icon: String
    let isSelected: Bool
    var badge: Int = 0

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(isSelected ? SpaceTheme.bg : SpaceTheme.textMuted)
                .frame(width: 22)
            Text(title)
                .font(.system(size: 14, weight: .semibold, design: .monospaced))
                .foregroundColor(isSelected ? SpaceTheme.bg : SpaceTheme.text)
            Spacer()
            if badge > 0 {
                Text("\(badge)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 6).padding(.vertical, 2)
                    .background(SpaceTheme.red)
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 11)
        .background(isSelected ? SpaceTheme.green : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .animation(.easeInOut(duration: 0.15), value: isSelected)
    }
}

// MARK: - Space Background

struct SpaceBackground: View {
    var body: some View {
        ZStack {
            SpaceTheme.bg.ignoresSafeArea()
            // Stars
            Canvas { ctx, size in
                for i in 0..<120 {
                    let x = Double((i * 137 + 23) % Int(size.width))
                    let y = Double((i * 89  + 41) % Int(size.height))
                    let r = Double(i % 3 == 0 ? 1.5 : 0.8)
                    let opacity = Double(i % 5 == 0 ? 0.8 : 0.3)
                    ctx.fill(Path(ellipseIn: CGRect(x: x, y: y, width: r, height: r)),
                             with: .color(.white.opacity(opacity)))
                }
            }
            .ignoresSafeArea()
            // Subtle green nebula
            RadialGradient(colors: [SpaceTheme.green.opacity(0.06), .clear],
                           center: .topTrailing, startRadius: 0, endRadius: 600)
                .ignoresSafeArea()
        }
    }
}

// MARK: - Dashboard

struct DashboardView: View {
    @ObservedObject var store: AppStore
    @Binding var selected: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("MISSION CONTROL")
                            .font(.system(size: 28, weight: .black, design: .monospaced))
                            .foregroundColor(SpaceTheme.green)
                        Text("ERO · DLSU-Dasmariñas High School · 2026")
                            .font(.system(size: 14, design: .monospaced))
                            .foregroundColor(SpaceTheme.textMuted)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text(Date(), style: .date)
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundColor(SpaceTheme.green)
                        Text("T-\(daysToNextComp()) DAYS TO LAUNCH")
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(SpaceTheme.textMuted)
                    }
                }

                // Stats Row
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                    StatCard(icon: "shippingbox.fill",  label: "PARTS",   value: "\(store.parts.count)",   sub: "\(store.parts.filter{$0.status == .available}.count) available", color: SpaceTheme.green)
                    StatCard(icon: "person.3.fill",     label: "CREW",    value: "\(store.members.filter{$0.isActive}.count)", sub: "active members", color: SpaceTheme.green)
                    StatCard(icon: "checklist",         label: "TASKS",   value: "\(store.tasks.filter{$0.status != .done}.count)", sub: "in progress", color: SpaceTheme.yellow)
                    StatCard(icon: "banknote.fill",     label: "BALANCE", value: "₱\(Int(store.balance).formattedWithSeparator)", sub: store.balance >= 0 ? "on budget" : "over budget", color: store.balance >= 0 ? SpaceTheme.green : SpaceTheme.red)
                }

                // Middle: Alerts + Upcoming
                HStack(alignment: .top, spacing: 20) {
                    // Alerts
                    VStack(alignment: .leading, spacing: 12) {
                        SectionHeader(title: "ALERTS", icon: "exclamationmark.triangle.fill", color: SpaceTheme.yellow)
                        let lowParts = store.parts.filter { $0.status == .lowStock || $0.status == .outOfStock }
                        let overdue  = store.tasks.filter { $0.dueDate < Date() && $0.status != .done }
                        if lowParts.isEmpty && overdue.isEmpty {
                            Text("All systems nominal.")
                                .font(.system(size: 13, design: .monospaced))
                                .foregroundColor(SpaceTheme.green)
                                .padding()
                        } else {
                            ForEach(lowParts.prefix(3)) { p in
                                AlertRow(icon: "shippingbox", text: "\(p.name) — \(p.status.rawValue)", color: p.status == .outOfStock ? SpaceTheme.red : SpaceTheme.yellow)
                            }
                            ForEach(overdue.prefix(3)) { t in
                                AlertRow(icon: "clock.badge.exclamationmark", text: "\(t.title) overdue", color: SpaceTheme.red)
                            }
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(SpaceTheme.surface)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(SpaceTheme.yellow.opacity(0.25), lineWidth: 1))

                    // Next competition
                    VStack(alignment: .leading, spacing: 12) {
                        SectionHeader(title: "NEXT MISSION", icon: "trophy.fill", color: SpaceTheme.green)
                        if let next = store.competitions.filter({ $0.status == .upcoming }).sorted(by: { $0.date < $1.date }).first {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(next.name)
                                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                                    .foregroundColor(SpaceTheme.text)
                                HStack {
                                    Image(systemName: "location.fill").font(.system(size: 11))
                                    Text(next.location)
                                }
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(SpaceTheme.textMuted)
                                HStack {
                                    Image(systemName: "calendar").font(.system(size: 11))
                                    Text(next.date, style: .date)
                                }
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(SpaceTheme.green)
                                Text(next.notes)
                                    .font(.system(size: 11, design: .monospaced))
                                    .foregroundColor(SpaceTheme.textMuted)
                                    .padding(.top, 4)
                            }
                        } else {
                            Text("No upcoming competitions.")
                                .font(.system(size: 13, design: .monospaced))
                                .foregroundColor(SpaceTheme.textMuted)
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(SpaceTheme.surface)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(SpaceTheme.green.opacity(0.25), lineWidth: 1))
                }

                // Recent Tasks
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "ACTIVE TASKS", icon: "checklist", color: SpaceTheme.green)
                    ForEach(store.tasks.filter { $0.status != .done }.prefix(4)) { task in
                        TaskRow(task: task)
                    }
                }
                .padding(20)
                .background(SpaceTheme.surface)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(SpaceTheme.green.opacity(0.2), lineWidth: 1))
            }
            .padding(28)
        }
    }

    func daysToNextComp() -> Int {
        guard let next = store.competitions.filter({ $0.status == .upcoming }).sorted(by: { $0.date < $1.date }).first else { return 0 }
        return Calendar.current.dateComponents([.day], from: Date(), to: next.date).day ?? 0
    }
}

struct StatCard: View {
    let icon: String
    let label: String
    let value: String
    let sub: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon).foregroundColor(color).font(.system(size: 16))
                Text(label).font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(SpaceTheme.textMuted)
            }
            Text(value)
                .font(.system(size: 30, weight: .black, design: .monospaced))
                .foregroundColor(color)
            Text(sub)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(SpaceTheme.textMuted)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(SpaceTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.25), lineWidth: 1))
    }
}

struct AlertRow: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon).foregroundColor(color).font(.system(size: 13))
            Text(text).font(.system(size: 12, design: .monospaced)).foregroundColor(SpaceTheme.text)
        }
        .padding(.vertical, 4)
    }
}

struct SectionHeader: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon).foregroundColor(color).font(.system(size: 14))
            Text(title).font(.system(size: 13, weight: .black, design: .monospaced)).foregroundColor(color)
        }
    }
}

// MARK: - Inventory

struct InventoryView: View {
    @ObservedObject var store: AppStore
    @State private var search = ""
    @State private var filterStatus: RobotPart.PartStatus? = nil
    @State private var showAdd = false

    var filtered: [RobotPart] {
        store.parts.filter {
            (search.isEmpty || $0.name.localizedCaseInsensitiveContains(search) || $0.category.localizedCaseInsensitiveContains(search)) &&
            (filterStatus == nil || $0.status == filterStatus)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                VStack(alignment: .leading) {
                    Text("PARTS INVENTORY")
                        .font(.system(size: 24, weight: .black, design: .monospaced))
                        .foregroundColor(SpaceTheme.green)
                    Text("\(store.parts.count) components tracked")
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(SpaceTheme.textMuted)
                }
                Spacer()
                Button { showAdd = true } label: {
                    Label("Add Part", systemImage: "plus")
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(SpaceTheme.bg)
                        .padding(.horizontal, 16).padding(.vertical, 9)
                        .background(SpaceTheme.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.horizontal, 28).padding(.top, 28).padding(.bottom, 16)

            // Filter bar
            HStack(spacing: 10) {
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(SpaceTheme.textMuted)
                    TextField("Search parts…", text: $search)
                        .font(.system(size: 13, design: .monospaced))
                        .foregroundColor(SpaceTheme.text)
                }
                .padding(.horizontal, 14).padding(.vertical, 9)
                .background(SpaceTheme.surface)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(SpaceTheme.green.opacity(0.2)))

                ForEach([nil] + RobotPart.PartStatus.allCases.map { Optional($0) }, id: \.self) { s in
                    let label = s?.rawValue ?? "All"
                    Text(label)
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(filterStatus == s ? SpaceTheme.bg : SpaceTheme.textMuted)
                        .padding(.horizontal, 12).padding(.vertical, 7)
                        .background(filterStatus == s ? SpaceTheme.green : SpaceTheme.surface)
                        .clipShape(Capsule())
                        .onTapGesture { filterStatus = s }
                }
            }
            .padding(.horizontal, 28).padding(.bottom, 12)

            // Table Header
            HStack {
                Text("PART NAME").frame(maxWidth: .infinity, alignment: .leading)
                Text("CATEGORY").frame(width: 120, alignment: .leading)
                Text("QTY").frame(width: 60, alignment: .center)
                Text("LOCATION").frame(width: 110, alignment: .leading)
                Text("STATUS").frame(width: 110, alignment: .leading)
            }
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .foregroundColor(SpaceTheme.textMuted)
            .padding(.horizontal, 28).padding(.vertical, 8)
            .background(SpaceTheme.surface)

            Divider().background(SpaceTheme.green.opacity(0.15))

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filtered) { part in
                        PartRow(part: part)
                        Divider().background(SpaceTheme.green.opacity(0.08))
                    }
                }
            }
        }
        .sheet(isPresented: $showAdd) { AddPartSheet(store: store) }
    }
}

struct PartRow: View {
    let part: RobotPart
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(part.name).font(.system(size: 13, weight: .semibold, design: .monospaced)).foregroundColor(SpaceTheme.text)
                if !part.notes.isEmpty { Text(part.notes).font(.system(size: 10, design: .monospaced)).foregroundColor(SpaceTheme.textMuted) }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(part.category).font(.system(size: 12, design: .monospaced)).foregroundColor(SpaceTheme.textMuted).frame(width: 120, alignment: .leading)
            Text("\(part.quantity)").font(.system(size: 14, weight: .bold, design: .monospaced)).foregroundColor(part.quantity == 0 ? SpaceTheme.red : SpaceTheme.text).frame(width: 60, alignment: .center)
            Text(part.location).font(.system(size: 12, design: .monospaced)).foregroundColor(SpaceTheme.textMuted).frame(width: 110, alignment: .leading)
            StatusBadge(text: part.status.rawValue, color: statusColor(part.status)).frame(width: 110, alignment: .leading)
        }
        .padding(.horizontal, 28).padding(.vertical, 12)
        .background(SpaceTheme.bg)
    }

    func statusColor(_ s: RobotPart.PartStatus) -> Color {
        switch s {
        case .available: return SpaceTheme.green
        case .lowStock:  return SpaceTheme.yellow
        case .outOfStock:return SpaceTheme.red
        case .ordered:   return .blue
        }
    }
}

struct StatusBadge: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .foregroundColor(color)
            .padding(.horizontal, 8).padding(.vertical, 3)
            .background(color.opacity(0.15))
            .clipShape(Capsule())
            .overlay(Capsule().stroke(color.opacity(0.4), lineWidth: 1))
    }
}

struct AddPartSheet: View {
    @ObservedObject var store: AppStore
    @Environment(\.dismiss) var dismiss
    @State var name = ""; @State var category = ""; @State var quantity = 1
    @State var minStock = 2; @State var location = ""; @State var notes = ""
    @State var status = RobotPart.PartStatus.available

    var body: some View {
        NavigationStack {
            ZStack {
                SpaceTheme.bg.ignoresSafeArea()
                Form {
                    Section("PART DETAILS") {
                        darkField("Name", text: $name)
                        darkField("Category", text: $category)
                        darkField("Location", text: $location)
                        darkField("Notes", text: $notes)
                    }
                    Section("QUANTITIES") {
                        Stepper("Quantity: \(quantity)", value: $quantity, in: 0...9999)
                        Stepper("Min Stock: \(minStock)", value: $minStock, in: 0...9999)
                    }
                    Section("STATUS") {
                        Picker("Status", selection: $status) {
                            ForEach(RobotPart.PartStatus.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Add Part")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() }.foregroundColor(SpaceTheme.textMuted) }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        store.parts.append(RobotPart(name: name, category: category, quantity: quantity, minStock: minStock, location: location, status: status, notes: notes))
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                    .foregroundColor(SpaceTheme.green)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Members

struct MembersView: View {
    @ObservedObject var store: AppStore
    @State private var showAdd = false

    var grouped: [String: [TeamMember]] {
        Dictionary(grouping: store.members.filter { $0.isActive }) { $0.subteam }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("CREW MANIFEST")
                            .font(.system(size: 24, weight: .black, design: .monospaced))
                            .foregroundColor(SpaceTheme.green)
                        Text("\(store.members.filter{$0.isActive}.count) active crew members")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(SpaceTheme.textMuted)
                    }
                    Spacer()
                    Button { showAdd = true } label: {
                        Label("Add Member", systemImage: "plus")
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundColor(SpaceTheme.bg)
                            .padding(.horizontal, 16).padding(.vertical, 9)
                            .background(SpaceTheme.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                    ForEach(store.members.filter { $0.isActive }) { m in
                        MemberCard(member: m)
                    }
                }
            }
            .padding(28)
        }
        .sheet(isPresented: $showAdd) { AddMemberSheet(store: store) }
    }
}

struct MemberCard: View {
    let member: TeamMember
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle().fill(SpaceTheme.green.opacity(0.15)).frame(width: 48, height: 48)
                Text(member.name.prefix(1))
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(SpaceTheme.green)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(member.name)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(SpaceTheme.text)
                Text(member.subteam)
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .foregroundColor(SpaceTheme.text)
                StatusBadge(text: member.role.rawValue, color: SpaceTheme.green)
            }
            Spacer()
        }
        .padding(16)
        .background(SpaceTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(SpaceTheme.green.opacity(0.2), lineWidth: 1))
    }
}

struct AddMemberSheet: View {
    @ObservedObject var store: AppStore
    @Environment(\.dismiss) var dismiss
    @State var name = ""; @State var email = ""; @State var subteam = ""
    @State var role = TeamMember.MemberRole.groundControl

    var body: some View {
        NavigationStack {
            ZStack {
                SpaceTheme.bg.ignoresSafeArea()
                Form {
                    Section("CREW MEMBER") {
                        darkField("Full Name", text: $name)
                        darkField("Email", text: $email)
                        darkField("Subteam", text: $subteam)
                    }
                    Section("ROLE") {
                        Picker("Role", selection: $role) {
                            ForEach(TeamMember.MemberRole.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Add Crew Member")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() }.foregroundColor(SpaceTheme.textMuted) }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        store.members.append(TeamMember(name: name, role: role, subteam: subteam, email: email, isActive: true))
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                    .foregroundColor(SpaceTheme.green)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Tasks

struct TasksView: View {
    @ObservedObject var store: AppStore
    @State private var showAdd = false
    @State private var filterStatus: OrgTask.TaskStatus? = nil

    var columns: [OrgTask.TaskStatus] { OrgTask.TaskStatus.allCases }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("MISSION TASKS")
                        .font(.system(size: 24, weight: .black, design: .monospaced))
                        .foregroundColor(SpaceTheme.green)
                    Text("Kanban board")
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(SpaceTheme.textMuted)
                }
                Spacer()
                Button { showAdd = true } label: {
                    Label("Add Task", systemImage: "plus")
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(SpaceTheme.bg)
                        .padding(.horizontal, 16).padding(.vertical, 9)
                        .background(SpaceTheme.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.horizontal, 28).padding(.top, 28).padding(.bottom, 20)

            // Kanban
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(columns, id: \.self) { col in
                        KanbanColumn(status: col, tasks: store.tasks.filter { $0.status == col })
                    }
                }
                .padding(.horizontal, 28).padding(.bottom, 28)
            }
        }
        .sheet(isPresented: $showAdd) { AddTaskSheet(store: store) }
    }
}

struct KanbanColumn: View {
    let status: OrgTask.TaskStatus
    let tasks: [OrgTask]

    var colColor: Color {
        switch status {
        case .todo: return SpaceTheme.textMuted
        case .inProgress: return SpaceTheme.yellow
        case .review: return .blue
        case .done: return SpaceTheme.green
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(status.rawValue.uppercased())
                    .font(.system(size: 11, weight: .black, design: .monospaced))
                    .foregroundColor(colColor)
                Spacer()
                Text("\(tasks.count)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(SpaceTheme.bg)
                    .padding(.horizontal, 7).padding(.vertical, 2)
                    .background(colColor)
                    .clipShape(Capsule())
            }

            ForEach(tasks) { t in TaskCard(task: t) }
            if tasks.isEmpty {
                Text("No tasks here")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(SpaceTheme.textMuted.opacity(0.5))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
            }
        }
        .padding(16)
        .frame(width: 260)
        .background(SpaceTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(colColor.opacity(0.25), lineWidth: 1))
    }
}

struct TaskCard: View {
    let task: OrgTask
    var priorityColor: Color {
        switch task.priority {
        case .critical: return SpaceTheme.red
        case .high:     return SpaceTheme.yellow
        case .medium:   return SpaceTheme.green
        case .low:      return SpaceTheme.textMuted
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                StatusBadge(text: task.priority.rawValue, color: priorityColor)
                Spacer()
                Text(task.category)
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(SpaceTheme.textMuted)
            }
            Text(task.title)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundColor(SpaceTheme.text)
            Text(task.description)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(SpaceTheme.textMuted)
                .lineLimit(2)
            HStack {
                Image(systemName: "person.fill").font(.system(size: 10))
                Text(task.assignee).font(.system(size: 10, design: .monospaced))
                Spacer()
                Image(systemName: "calendar").font(.system(size: 10))
                Text(task.dueDate, style: .date).font(.system(size: 10, design: .monospaced))
            }
            .foregroundColor(task.dueDate < Date() && task.status != .done ? SpaceTheme.red : SpaceTheme.textMuted)
        }
        .padding(12)
        .background(SpaceTheme.bg)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct TaskRow: View {
    let task: OrgTask
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(task.status == .done ? SpaceTheme.green : SpaceTheme.surface2)
                .frame(width: 14, height: 14)
            Text(task.title)
                .font(.system(size: 13, design: .monospaced))
                .foregroundColor(SpaceTheme.text)
            Spacer()
            Text(task.assignee)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(SpaceTheme.textMuted)
            Text(task.dueDate, style: .date)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(task.dueDate < Date() ? SpaceTheme.red : SpaceTheme.textMuted)
        }
        .padding(.vertical, 6)
    }
}

struct AddTaskSheet: View {
    @ObservedObject var store: AppStore
    @Environment(\.dismiss) var dismiss
    @State var title = ""; @State var description = ""; @State var assignee = ""; @State var category = ""
    @State var dueDate = Date().addingTimeInterval(86400*7)
    @State var priority = OrgTask.TaskPriority.medium
    @State var status = OrgTask.TaskStatus.todo

    var body: some View {
        NavigationStack {
            ZStack {
                SpaceTheme.bg.ignoresSafeArea()
                Form {
                    Section("TASK INFO") {
                        darkField("Title", text: $title)
                        darkField("Description", text: $description)
                        darkField("Assignee", text: $assignee)
                        darkField("Category", text: $category)
                    }
                    Section("SCHEDULING") {
                        DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    }
                    Section("PRIORITY") {
                        Picker("Priority", selection: $priority) {
                            ForEach(OrgTask.TaskPriority.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }.pickerStyle(.segmented)
                    }
                    Section("STATUS") {
                        Picker("Status", selection: $status) {
                            ForEach(OrgTask.TaskStatus.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }.pickerStyle(.segmented)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() }.foregroundColor(SpaceTheme.textMuted) }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        store.tasks.append(OrgTask(title: title, description: description, assignee: assignee, dueDate: dueDate, priority: priority, status: status, category: category))
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                    .foregroundColor(SpaceTheme.green)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Competitions

struct CompetitionsView: View {
    @ObservedObject var store: AppStore
    @State private var showAdd = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("COMPETITION LOG")
                            .font(.system(size: 24, weight: .black, design: .monospaced))
                            .foregroundColor(SpaceTheme.green)
                        Text("\(store.competitions.count) missions recorded")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(SpaceTheme.textMuted)
                    }
                    Spacer()
                    Button { showAdd = true } label: {
                        Label("Add Competition", systemImage: "plus")
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundColor(SpaceTheme.bg)
                            .padding(.horizontal, 16).padding(.vertical, 9)
                            .background(SpaceTheme.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                    ForEach(store.competitions.sorted { $0.date > $1.date }) { comp in
                        CompCard(comp: comp)
                    }
                }
            }
            .padding(28)
        }
        .sheet(isPresented: $showAdd) { AddCompSheet(store: store) }
    }
}

struct CompCard: View {
    let comp: Competition
    var statusColor: Color {
        switch comp.status {
        case .upcoming: return SpaceTheme.yellow
        case .ongoing:  return SpaceTheme.green
        case .completed: return SpaceTheme.textMuted
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                StatusBadge(text: comp.status.rawValue, color: statusColor)
                Spacer()
                if let rank = comp.ranking {
                    HStack(spacing: 4) {
                        Image(systemName: "trophy.fill").foregroundColor(SpaceTheme.yellow).font(.system(size: 12))
                        Text("#\(rank)").font(.system(size: 13, weight: .bold, design: .monospaced)).foregroundColor(SpaceTheme.yellow)
                    }
                }
            }
            Text(comp.name)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(SpaceTheme.text)
            HStack {
                Image(systemName: "location.fill").font(.system(size: 11))
                Text(comp.location)
            }
            .font(.system(size: 12, design: .monospaced))
            .foregroundColor(SpaceTheme.textMuted)
            HStack {
                Image(systemName: "calendar").font(.system(size: 11))
                Text(comp.date, style: .date)
            }
            .font(.system(size: 12, design: .monospaced))
            .foregroundColor(SpaceTheme.green)
            if let score = comp.score {
                Text("Score: \(score) pts")
                    .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    .foregroundColor(SpaceTheme.text)
            }
            if !comp.notes.isEmpty {
                Text(comp.notes)
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(SpaceTheme.textMuted)
                    .lineLimit(2)
            }
        }
        .padding(20)
        .background(SpaceTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(statusColor.opacity(0.3), lineWidth: 1))
    }
}

struct AddCompSheet: View {
    @ObservedObject var store: AppStore
    @Environment(\.dismiss) var dismiss
    @State var name = ""; @State var location = ""; @State var notes = ""
    @State var date = Date().addingTimeInterval(86400*30)
    @State var status = Competition.CompStatus.upcoming
    @State var ranking = ""; @State var score = ""

    var body: some View {
        NavigationStack {
            ZStack {
                SpaceTheme.bg.ignoresSafeArea()
                Form {
                    Section("EVENT DETAILS") {
                        darkField("Competition Name", text: $name)
                        darkField("Location", text: $location)
                        darkField("Notes", text: $notes)
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                    }
                    Section("RESULTS (optional)") {
                        darkField("Ranking (e.g. 1)", text: $ranking)
                        darkField("Score", text: $score)
                    }
                    Section("STATUS") {
                        Picker("Status", selection: $status) {
                            ForEach(Competition.CompStatus.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }.pickerStyle(.segmented)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Add Competition")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() }.foregroundColor(SpaceTheme.textMuted) }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        store.competitions.append(Competition(name: name, location: location, date: date, ranking: Int(ranking), score: Int(score), notes: notes, status: status))
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                    .foregroundColor(SpaceTheme.green)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Budget

struct BudgetView: View {
    @ObservedObject var store: AppStore
    @State private var showAdd = false
    @State private var filter: BudgetItem.BudgetType? = nil

    var filtered: [BudgetItem] {
        filter == nil ? store.budgetItems : store.budgetItems.filter { $0.type == filter }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("BUDGET CONTROL")
                            .font(.system(size: 24, weight: .black, design: .monospaced))
                            .foregroundColor(SpaceTheme.green)
                        Text("Financial mission overview")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(SpaceTheme.textMuted)
                    }
                    Spacer()
                    Button { showAdd = true } label: {
                        Label("Add Entry", systemImage: "plus")
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundColor(SpaceTheme.bg)
                            .padding(.horizontal, 16).padding(.vertical, 9)
                            .background(SpaceTheme.green)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

                // Summary cards
                HStack(spacing: 16) {
                    BudgetStat(label: "INCOME", value: store.totalIncome, color: SpaceTheme.green, icon: "arrow.down.circle.fill")
                    BudgetStat(label: "EXPENSES", value: store.totalExpense, color: SpaceTheme.red, icon: "arrow.up.circle.fill")
                    BudgetStat(label: "BALANCE", value: store.balance, color: store.balance >= 0 ? SpaceTheme.green : SpaceTheme.red, icon: "equal.circle.fill")
                }
            }
            .padding(.horizontal, 28).padding(.top, 28).padding(.bottom, 20)

            // Filter
            HStack(spacing: 10) {
                filterPill(label: "All", type: nil)
                filterPill(label: "Income", type: .income)
                filterPill(label: "Expenses", type: .expense)
            }
            .padding(.horizontal, 28).padding(.bottom, 12)

            // Table
            HStack {
                Text("DESCRIPTION").frame(maxWidth: .infinity, alignment: .leading)
                Text("CATEGORY").frame(width: 120, alignment: .leading)
                Text("DATE").frame(width: 110, alignment: .leading)
                Text("TYPE").frame(width: 90, alignment: .leading)
                Text("AMOUNT").frame(width: 110, alignment: .trailing)
            }
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .foregroundColor(SpaceTheme.textMuted)
            .padding(.horizontal, 28).padding(.vertical, 8)
            .background(SpaceTheme.surface)

            Divider().background(SpaceTheme.green.opacity(0.15))

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filtered.sorted { $0.date > $1.date }) { item in
                        BudgetRow(item: item)
                        Divider().background(SpaceTheme.green.opacity(0.08))
                    }
                }
            }
        }
        .sheet(isPresented: $showAdd) { AddBudgetSheet(store: store) }
    }

    func filterPill(label: String, type: BudgetItem.BudgetType?) -> some View {
        Text(label)
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(filter == type ? SpaceTheme.bg : SpaceTheme.textMuted)
            .padding(.horizontal, 14).padding(.vertical, 7)
            .background(filter == type ? SpaceTheme.green : SpaceTheme.surface)
            .clipShape(Capsule())
            .onTapGesture { filter = type }
    }
}

struct BudgetStat: View {
    let label: String
    let value: Double
    let color: Color
    let icon: String
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon).foregroundColor(color).font(.system(size: 22))
            VStack(alignment: .leading, spacing: 3) {
                Text(label).font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(SpaceTheme.textMuted)
                Text("₱\(Int(value).formattedWithSeparator)")
                    .font(.system(size: 20, weight: .black, design: .monospaced))
                    .foregroundColor(color)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(SpaceTheme.surface)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.25), lineWidth: 1))
    }
}

struct BudgetRow: View {
    let item: BudgetItem
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title).font(.system(size: 13, weight: .semibold, design: .monospaced)).foregroundColor(SpaceTheme.text)
                if !item.notes.isEmpty { Text(item.notes).font(.system(size: 10, design: .monospaced)).foregroundColor(SpaceTheme.textMuted) }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(item.category).font(.system(size: 12, design: .monospaced)).foregroundColor(SpaceTheme.textMuted).frame(width: 120, alignment: .leading)
            Text(item.date, style: .date).font(.system(size: 12, design: .monospaced)).foregroundColor(SpaceTheme.textMuted).frame(width: 110, alignment: .leading)
            StatusBadge(text: item.type.rawValue, color: item.type == .income ? SpaceTheme.green : SpaceTheme.red).frame(width: 90, alignment: .leading)
            Text("\(item.type == .expense ? "-" : "+")₱\(Int(item.amount).formattedWithSeparator)")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(item.type == .income ? SpaceTheme.green : SpaceTheme.red)
                .frame(width: 110, alignment: .trailing)
        }
        .padding(.horizontal, 28).padding(.vertical, 12)
        .background(SpaceTheme.bg)
    }
}

struct AddBudgetSheet: View {
    @ObservedObject var store: AppStore
    @Environment(\.dismiss) var dismiss
    @State var title = ""; @State var category = ""; @State var notes = ""
    @State var amount = ""; @State var date = Date()
    @State var type = BudgetItem.BudgetType.expense

    var body: some View {
        NavigationStack {
            ZStack {
                SpaceTheme.bg.ignoresSafeArea()
                Form {
                    Section("ENTRY DETAILS") {
                        darkField("Title", text: $title)
                        darkField("Category", text: $category)
                        darkField("Notes", text: $notes)
                        darkField("Amount (₱)", text: $amount)
                            .keyboardType(.decimalPad)
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                    }
                    Section("TYPE") {
                        Picker("Type", selection: $type) {
                            ForEach(BudgetItem.BudgetType.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                        }.pickerStyle(.segmented)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Add Budget Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() }.foregroundColor(SpaceTheme.textMuted) }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        if let amt = Double(amount) {
                            store.budgetItems.append(BudgetItem(title: title, amount: amt, category: category, type: type, date: date, notes: notes))
                        }
                        dismiss()
                    }
                    .disabled(title.isEmpty || amount.isEmpty)
                    .foregroundColor(SpaceTheme.green)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Helpers

func darkField(_ placeholder: String, text: Binding<String>) -> some View {
    TextField(placeholder, text: text)
        .font(.system(size: 13, design: .monospaced))
}

extension Int {
    var formattedWithSeparator: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
