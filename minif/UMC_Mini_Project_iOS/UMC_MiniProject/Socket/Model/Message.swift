import Foundation
import MessageKit
import UIKit

struct Message: MessageType {
    var messageId: String
    let content: String
    let sentDate: Date
    let sender: SenderType
    var kind: MessageKind {return .text(content)}
    
    
    init(content: String, sender: Sender) {
        self.sender = sender
        self.content = content
        sentDate = Date()
        messageId = "채팅방 1"
    }
}

extension Message: Comparable {
  static func == (lhs: Message, rhs: Message) -> Bool {
    return lhs.messageId == rhs.messageId
  }

  static func < (lhs: Message, rhs: Message) -> Bool {
    return lhs.sentDate < rhs.sentDate
  }
}
