import SwiftUI

struct TransactionListView: View {
    @EnvironmentObject var appState: AppState
    @State private var transactions: [BlockchainTransaction] = []
    @State private var message: String = ""

    var body: some View {
        VStack {
            if transactions.isEmpty {
                Text(message)
                    .foregroundColor(.red)
                    .padding()
            } else {
                List(transactions) { transaction in
                    VStack(alignment: .leading) {
                        Text("Sender: \(transaction.sender)")
                        Text("Receiver: \(transaction.receiver)")
                        Text("Amount: \(transaction.amount)")
                        Text("Timestamp: \(transaction.timestamp)")
                    }
                }
            }
        }
        .navigationTitle("Transaction List")
        .onAppear {
            fetchTransactions()
        }
    }

    func fetchTransactions() {
        guard let url = URL(string: "\(serverURL)/transactions") else { return }
        var request = URLRequest(url: url)
        request.setValue(appState.token, forHTTPHeaderField: "x-access-token")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    self.message = "Failed to fetch transactions."
                }
                return
            }
            if let transactions = try? JSONDecoder().decode([BlockchainTransaction].self, from: data) {
                DispatchQueue.main.async {
                    self.transactions = transactions
                }
            } else {
                DispatchQueue.main.async {
                    self.message = "Failed to fetch transactions."
                }
            }
        }.resume()
    }
}
