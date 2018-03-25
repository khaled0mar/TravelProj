//
//  AddPostViewController.swift
//  TravelProj
//
//  Created by khaled omar on 2/21/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import MapKit

class AddPostViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    @IBOutlet weak var totalScrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    lazy var menuBtn: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "menu-button-of-three-horizontal-lines")
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.clipsToBounds = true
        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for:.touchUpInside)
        
        return button
    }()
    
    var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Your Title.."
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textColor = UIColor.darkGray
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textAlignment = .left
//        textField.alignmentRectInsets =
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   luxury of asdasd"
        textField.isUserInteractionEnabled = true
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textColor = UIColor.darkGray
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textAlignment = .left
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let descriptionTF: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = true
        textField.placeholder = "   experience stories."
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textColor = UIColor.darkGray
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textAlignment = .left
        //        textField.alignmentRectInsets =
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let addLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Location"
//        label.font = UIFont.systemFont(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mapTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   type your location here."
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textColor = UIColor.darkGray
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textAlignment = .left
        //        textField.alignmentRectInsets =
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let mapLocation: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.layer.cornerRadius = 25
        return map
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.totalScrollView.contentSize = CGSize(width: 0, height: self.containerView.bounds.size.height)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.collectionView.register(AddExperienceCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        var centerLocation = CLLocationCoordinate2DMake(31.249735 , 29.970508)
        var mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.mapLocation.setRegion(mapRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = centerLocation
        annotation.title = "Ntam Tech"
        self.mapLocation.addAnnotation(annotation)
        
        self.navigationItem.title = "home"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuBtn)
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.titleTextField.frame.height))
        
        titleTextField.leftView = paddingView
        titleTextField.leftViewMode = UITextFieldViewMode.always
        
        view.addSubview(menuBtn)
        totalScrollView.addSubview(postImage)
        totalScrollView.addSubview(titleTextField)
        totalScrollView.addSubview(locationTextField)
        totalScrollView.addSubview(descriptionTF)
        totalScrollView.addSubview(addLocationLabel)
        totalScrollView.addSubview(mapTextField)
        totalScrollView.addSubview(mapLocation)

        handleMenuBtn()
        handlePostImage()
        handleTitleTextField()
        handleLocationTextField()
        handleDescriptionTF()
        handleAddLocationLabel()
        handleMapTextField()
        handleMap()
        
    }
    
    func handleMap()  {
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        mapLocation.topAnchor.constraint(equalTo: mapTextField.bottomAnchor, constant: 30).isActive = true
        mapLocation.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        mapLocation.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        mapLocation.heightAnchor.constraint(equalToConstant: 225).isActive = true
    }
    
    func handleMenuBtn() {
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        menuBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        menuBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        menuBtn.widthAnchor.constraint(equalToConstant: 32).isActive = true
        menuBtn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }
    
    func handleTotalScrollView()   {
        // need x,y,width,height anchors
        totalScrollView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 5).isActive = true
        totalScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        totalScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        totalScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func handleContainerView()  {
        // need x,y,width,height anchors
        containerView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: totalScrollView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: totalScrollView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: totalScrollView.bottomAnchor).isActive = true
    }
    
    func handlePostImage() {
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        postImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        postImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
    }
    
    func handleTitleTextField()  {
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        titleTextField.topAnchor.constraint(equalTo: totalScrollView.topAnchor, constant: 10).isActive = true
        titleTextField.leftAnchor.constraint(equalTo: postImage.rightAnchor, constant: 10).isActive = true
        titleTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
    }
    
    func handleLocationTextField()  {
        
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        locationTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 12).isActive = true
        locationTextField.leftAnchor.constraint(equalTo: postImage.rightAnchor, constant: 10).isActive = true
        locationTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
    }
    
    func handleDescriptionTF()  {
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        descriptionTF.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 12).isActive = true
        descriptionTF.leftAnchor.constraint(equalTo: postImage.rightAnchor, constant: 10).isActive = true
        descriptionTF.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        descriptionTF.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func handleAddLocationLabel()  {
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        addLocationLabel.topAnchor.constraint(equalTo: descriptionTF.bottomAnchor, constant: 10).isActive = true
        addLocationLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        addLocationLabel.widthAnchor.constraint(equalTo: (self.addLocationLabel.widthAnchor)).isActive = true
        addLocationLabel.heightAnchor.constraint(equalTo: (self.addLocationLabel.heightAnchor)).isActive = true
        
    }
    func handleMapTextField()   {
        // ios 9 constraint anchors
        // need x,y,width,height anchors
        mapTextField.topAnchor.constraint(equalTo: addLocationLabel.bottomAnchor, constant: 18).isActive = true
        mapTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        mapTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        mapTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for:indexPath) as! AddExperienceCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let cellWidth = self.view.frame.size.width-10
        let obj = CGSize(width: 90, height: 70.0)

        return obj
    }


    
    
    
}

