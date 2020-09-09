

import UIKit
import Kingfisher

protocol SocialFeedViewProtocol {
    func setApiResponseData(feedData: SocialFeedModel?)
}

class SocialFeedView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var socialFeedPresenter: SocialFeedPresenterProtocol?
    var socialFeedArray:SocialFeedModel? = SocialFeedModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.setupTableView()
        self.socialFeedPresenter = SocialFeedPresenter(view: self)
        self.getData()
    }
    
    private func setupTableView() {
             self.tableView?.delegate = self
             self.tableView?.dataSource = self
             self.tableView?.estimatedRowHeight = UITableView.automaticDimension
             self.tableView?.rowHeight = UITableView.automaticDimension
             self.tableView?.allowsSelection = false
             self.tableView?.tableFooterView = UIView()
             self.tableView?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
             let nib = UINib(nibName: "SocialFeedTableViewCell", bundle: nil)
             self.tableView?.register(nib, forCellReuseIdentifier: "SocialFeedTableViewCell")

    }
    
    private func getData() {
        self.socialFeedPresenter?.getData()
    }
    

}

extension SocialFeedView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.socialFeedArray?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SocialFeedTableViewCell", for: indexPath) as! SocialFeedTableViewCell
        
        cell.imageViewData?.kf.setImage(with: URL(string: self.socialFeedArray?.data[indexPath.row].image ?? ""))
        cell.profileImage?.kf.setImage(with: URL(string: self.socialFeedArray?.data[indexPath.row].profilePic ?? ""))
        cell.title.text = self.socialFeedArray?.data[indexPath.row].name
        cell.time.text = self.socialFeedArray?.data[indexPath.row].timeStamp
        cell.descriptionData.text = self.socialFeedArray?.data[indexPath.row].status
        cell.mainView.layer.cornerRadius = 20.0
        
        return cell
    }
    
    
}

extension SocialFeedView: SocialFeedViewProtocol {
    func setApiResponseData(feedData: SocialFeedModel?) {
        self.socialFeedArray = feedData
        self.tableView.reloadData()
    }
    
    
}
