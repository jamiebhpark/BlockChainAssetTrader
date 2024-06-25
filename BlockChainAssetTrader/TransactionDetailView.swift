import SwiftUI

struct TransactionDetailView: View {
    var transaction: BlockchainTransaction

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Transaction Details")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Text("Sender: \(transaction.sender)")
            Text("Receiver: \(transaction.receiver)")
            Text("Amount: \(transaction.amount)")
            Text("Timestamp: \(transaction.timestamp)")
            Text("Transaction Hash: \(transaction.txn_hash)")
                .padding(.top, 20)

            Spacer()
        }
        .padding()
        .navigationTitle("Transaction Detail")
    }
}
