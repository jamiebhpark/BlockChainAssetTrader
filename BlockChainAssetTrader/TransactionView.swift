import SwiftUI

struct TransactionView: View {
    @EnvironmentObject var appState: AppState
    @State private var receiver: String = ""  // 수신자의 ID 또는 Ethereum 주소
    @State private var amount: String = ""
    @State private var message: String = ""
    @State private var transactions: [BlockchainTransaction] = []
    @State private var selectedTransaction: BlockchainTransaction?

    var body: some View {
        VStack(spacing: 20) {
            Text("Send Transaction")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField("Receiver (ID or Ethereum Address)", text: $receiver)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            TextField("Amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            Button(action: sendTransaction) {
                Text("Send Transaction")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 16)

            Text(message)
                .foregroundColor(.red)
                .padding()
            
            List(transactions) { transaction in
                Button(action: {
                    self.selectedTransaction = transaction
                }) {
                    VStack(alignment: .leading) {
                        Text("Sender: \(transaction.sender)")
                        Text("Receiver: \(transaction.receiver)")
                        Text("Amount: \(transaction.amount)")
                        Text("Timestamp: \(transaction.timestamp)")
                    }
                }
            }
        }
        .sheet(item: $selectedTransaction) { transaction in
            TransactionDetailView(transaction: transaction)
        }
        .navigationTitle("Send Transaction")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchTransactions()
        }
    }

    func sendTransaction() {
        guard let url = URL(string: "\(serverURL)/transaction") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(appState.token, forHTTPHeaderField: "x-access-token")
        let body: [String: Any] = ["receiver": receiver, "amount": Double(amount) ?? 0.0]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error:", error)  // 디버깅 메시지
                return
            }
            guard let data = data else {
                print("No data received")  // 디버깅 메시지
                return
            }
            if let response = try? JSONDecoder().decode(ResponseMessage.self, from: data) {
                DispatchQueue.main.async {
                    self.message = response.message
                    self.fetchTransactions()
                }
            } else {
                DispatchQueue.main.async {
                    self.message = "Failed to send transaction."
                }
            }
        }.resume()
    }

    func fetchTransactions() {
        guard let url = URL(string: "\(serverURL)/transactions") else { return }
        var request = URLRequest(url: url)
        request.setValue(appState.token, forHTTPHeaderField: "x-access-token")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
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
