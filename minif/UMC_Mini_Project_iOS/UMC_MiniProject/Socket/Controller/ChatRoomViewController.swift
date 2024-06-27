//
//  ChatRromViewController.swift
//  UMC_MiniProject
//
//  Created by Jinyoung Leem on 6/18/24.
//

import UIKit
import MessageKit
import InputBarAccessoryView

class ChatRoomViewController : MessagesViewController {
    let channel: Channel
    var sender = Sender(senderId: "self", displayName: "Leem")
    var messages = [Message]()
    
    
    init(channel: Channel) {
      self.channel = channel
      super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.channel = Channel(name: "택시 카풀 그룹 채팅방")  // 기본 채널 설정
        super.init(coder: coder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmDelegates()
        configure()
        setupMessageInputBar()
        removeOutgoingMessageAvatars()
        addSampleMessages()
        setupNavigationBar()
    }
    
    private func confirmDelegates() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
 
        messageInputBar.delegate = self
    }
    
    private func configure() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupMessageInputBar() {
        messageInputBar.inputTextView.tintColor = .primary
        messageInputBar.sendButton.setTitleColor(.primary, for: .normal)
        messageInputBar.inputTextView.placeholder = "Aa"
    }
    
    private func removeOutgoingMessageAvatars() {
        guard let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout else { return }
        layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
        layout.setMessageOutgoingAvatarSize(.zero)
        let outgoingLabelAlignment = LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
        layout.setMessageOutgoingMessageTopLabelAlignment(outgoingLabelAlignment)
    }
    
    private func insertNewMessage(_ message: Message) {
        messages.append(message)
        messages.sort()
        messagesCollectionView.reloadData()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = channel.name
        
        let backButtonImage = UIImage(named: "backIcon")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        
        let reportButtonImage = UIImage(named: "reportImage")?.withRenderingMode(.alwaysOriginal)
        let reportButton = UIBarButtonItem(image: reportButtonImage, style: .plain, target: self, action: #selector(reportButtonPressed))
        
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = reportButton
    }
    
    // backButton 누를 시 HomeView로 돌아감
    @objc private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    // 신고버튼
    @objc private func reportButtonPressed() {
        let alertController = UIAlertController(title: nil, message: "112 연결중...", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
    }
    
    private func addSampleMessages() {
        let sampleSenders = [
            Sender(senderId: "user1", displayName: "Alice"),
            Sender(senderId: "user2", displayName: "Bob"),
            Sender(senderId: "user3", displayName: "Charlie"),
            sender  // Self
        ]
        
        let sampleMessages = [
            Message(content: "Hello everyone!", sender: sampleSenders[0]),
            Message(content: "Hi Alice!", sender: sampleSenders[1]),
            Message(content: "Hey Bob and Alice!", sender: sampleSenders[2]),
            Message(content: "Hello Bob, Alice, and Charlie!", sender: sampleSenders[3])
        ]
        
        messages.append(contentsOf: sampleMessages)
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToLastItem()
    }
}

extension ChatRoomViewController: MessagesDataSource {
    var currentSender: any MessageKit.SenderType {
        return sender
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1),
                                                             .foregroundColor: UIColor(white: 0.3, alpha: 1)])
    }
    
}

extension ChatRoomViewController: MessagesLayoutDelegate {
    // 아래 여백
    func footerViewSize(for section: Int, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }
    
    // 말풍선 위 이름 나오는 곳의 height
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 20
    }
}

extension ChatRoomViewController: MessagesDisplayDelegate {
    // 말풍선의 배경 색상
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .primary : .incomingMessageBackground
    }
    
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .black : .black
    }
    
    // 말풍선의 꼬리 모양 방향
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let cornerDirection: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(cornerDirection, .curved)
    }
}

extension ChatRoomViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let message = Message(content: text, sender: sender)

        insertNewMessage(message)
        inputBar.inputTextView.text.removeAll()
    }
}

extension UIColor {
    static let primary = UIColor(red: 171/255.0, green: 215/255.0, blue: 255/255.0, alpha: 1.0)
    static let incomingMessageBackground = UIColor(red: 210/255.0, green: 210/255.0, blue: 210/255.0, alpha: 1.0)
}
