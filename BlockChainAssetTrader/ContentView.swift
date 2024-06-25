import SwiftUI
import UserNotifications

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    init() {
        // 알림 권한 요청
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else if let error = error {
                print("Notification permission denied because: \(error.localizedDescription)")
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to Blockchain Asset Trader")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                NavigationLink(value: NavigationDestination.register) {
                    HStack {
                        Image(systemName: "person.crop.circle.badge.plus")
                        Text("Register")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)

                NavigationLink(value: NavigationDestination.login) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                        Text("Login")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)

                NavigationLink(value: NavigationDestination.transaction) {
                    HStack {
                        Image(systemName: "arrow.up.arrow.down.circle")
                        Text("Send Transaction")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)

                NavigationLink(value: NavigationDestination.assets) {
                    HStack {
                        Image(systemName: "creditcard.circle")
                        Text("Check Assets")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                
                NavigationLink(value: NavigationDestination.transactionList) {
                    HStack {
                        Image(systemName: "list.bullet")
                        Text("View Transactions")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .register:
                    RegisterView()
                case .login:
                    LoginView()
                case .transaction:
                    TransactionView()
                case .assets:
                    AssetView()
                case .transactionDetail(let transaction):
                    TransactionDetailView(transaction: transaction)
                case .transactionList:
                    TransactionListView()
                }
            }
        }
    }
}
