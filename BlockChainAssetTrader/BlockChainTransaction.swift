import Foundation

struct BlockchainTransaction: Identifiable, Codable, Hashable {
    var id: UUID
    let sender: String
    let receiver: String
    let amount: Double
    let timestamp: String
    let txn_hash: String

    static func == (lhs: BlockchainTransaction, rhs: BlockchainTransaction) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
