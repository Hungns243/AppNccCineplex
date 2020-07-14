//
//  HomeViewController.swift
//  NccCineplex
//
//  Created by User on 6/30/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit
import Segmentio

class HomeViewController: UIViewController {
    
    let viewArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .yellow
        
        return view
    }()
    
    let viewNCC: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .black
        
        return view
    }()
    
    let imageNcc: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.backgroundColor = .black
        imageView.image  = UIImage(named: "rap1")
        
        
        return imageView
    }()
    
    let buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    let imageButton: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "account")
        
        return imageView
    }()
    
    let labelButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Đăng nhập"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .red
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    let  contentView: UIView = {
        let contentview = UIView()
        contentview.translatesAutoresizingMaskIntoConstraints = false
        
        return contentview
    }()
    
    let pagecontrolView: UIPageControl = {
        let pagecontrol = UIPageControl()
        pagecontrol.translatesAutoresizingMaskIntoConstraints = false
        
        //        pagecontrol.backgroundColor = .white
        
        return pagecontrol
    }()
    
    let viewSegment: Segmentio = {
        let viewSegment = Segmentio()
        viewSegment.selectedSegmentioIndex = 0
        
        viewSegment.translatesAutoresizingMaskIntoConstraints = false
        //        viewSegment.backgroundColor = .white
        
        return viewSegment
    }()
    
    let collectionViewMovie: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let viewButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    let bookingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setTitle("Đặt vé", for: .normal)
        
        
        
        return button
    }()
    
    let nameMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let timeMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var dataImages = [UIImage]()
    var timer: Timer!
    let movieTodays = createData()
    let movieComingSoons = createDataComingSun()
    
    var datas = [DataMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datas = movieTodays
        collectionViewMovie.delegate = self
        collectionViewMovie.dataSource = self
        
        collectionViewMovie.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionViewMovie.isPagingEnabled = true
        
        data()
        
        setupAddSubview()
        setupLayout()
        
        configPageControl()
        
        scrollView.delegate = self
        
        contentView.backgroundColor = .white
        
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { [weak self] (_) in
            guard let strongSelf = self else { return }
            if strongSelf.pagecontrolView.currentPage < strongSelf.dataImages.count-1 {
                strongSelf.pagecontrolView.currentPage += 1
            } else {
                strongSelf.pagecontrolView.currentPage = 0
            }
            
            strongSelf.scrollView.contentOffset = CGPoint(x: strongSelf.screenWidth * CGFloat(strongSelf.pagecontrolView.currentPage),
                                                          y: 0)
        })
        
        setupSegment()
        // khoá thanh cuộn dọc
        if let flowLayout = collectionViewMovie.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        actionOfSegment()
        
        setupNameMovie(0)
        
        
    }
    //khoi tao viewdidappear 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupImageSlide(dataImages)
        
    }
    
    func data(){
        
        dataImages = [
            UIImage(named: "bloodshot2")!,
            UIImage(named: "imagelogo")!,
            UIImage(named: "imagelogo2")!,
            UIImage(named: "imagelogo3")!,
        ]
    }
    
    func setupAddSubview(){
        view.addSubview(viewArea)
        view.addSubview(viewNCC)
        view.addSubview(imageNcc)
        view.addSubview(buttonLogin)
        view.addSubview(imageButton)
        view.addSubview(labelButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(pagecontrolView)
        view.addSubview(viewSegment)
        view.addSubview(collectionViewMovie)
        view.addSubview(viewButton)
        view.addSubview(bookingButton)
        view.addSubview(nameMovieLabel)
        view.addSubview(timeMovieLabel)
    }
    
    func setupImageSlide(_ images: [UIImage]) {
        print(contentView.bounds)
        for (index, item) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * screenWidth, y: 0, width: screenWidth , height: contentView.frame.height))
            imageView.image = item
            contentView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * (screenWidth), height: contentView.bounds.height)
        scrollView.isPagingEnabled = true // khoảng cách ảnh full màn
        
    }
    
    func setupImage( image : [CustomView]) {
        
        for (index,item) in image.enumerated(){
            
            item.frame = CGRect(x: CGFloat(index) * screenWidth, y: 0, width: screenWidth , height: contentView.frame.height )
            contentView.addSubview(item)
        }
    }
    
    func setupLayout(){
        // layout view safe area
        viewArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        viewArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
        
        // layout view chứa image rạp phim và button đăng nhập
        viewNCC.topAnchor.constraint(equalTo: viewArea.topAnchor).isActive = true
        viewNCC.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewNCC.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewNCC.heightAnchor.constraint(equalTo: viewArea.heightAnchor, multiplier: 0.1).isActive = true
        
        
        
        
        // layout image rạp phim
        imageNcc.heightAnchor.constraint(equalTo: viewNCC.heightAnchor, multiplier: 0.7).isActive = true
        imageNcc.widthAnchor.constraint(equalTo: viewNCC.widthAnchor, multiplier: 0.2).isActive = true
        imageNcc.leadingAnchor.constraint(equalTo: viewNCC.leadingAnchor, constant: 24).isActive = true
        imageNcc.centerYAnchor.constraint(equalTo: viewNCC.centerYAnchor).isActive = true
        
        
        
        
        // layout button đăng nhập
        buttonLogin.heightAnchor.constraint(equalTo: viewNCC.heightAnchor, multiplier: 0.6).isActive = true
        buttonLogin.widthAnchor.constraint(equalTo: viewNCC.widthAnchor, multiplier: 0.3).isActive = true
        buttonLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        buttonLogin.centerYAnchor.constraint(equalTo: viewNCC.centerYAnchor).isActive = true
        
        
        //layout icon trong button
        imageButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageButton.leadingAnchor.constraint(equalTo: buttonLogin.leadingAnchor, constant: 8).isActive = true
        imageButton.centerYAnchor.constraint(equalTo: buttonLogin.centerYAnchor).isActive = true
        
        
        
        // layout label đăng nhập trong button
        labelButton.heightAnchor.constraint(equalTo: buttonLogin.heightAnchor, multiplier: 0.3).isActive = true
        labelButton.widthAnchor.constraint(equalTo: buttonLogin.widthAnchor, multiplier: 0.6).isActive = true
        labelButton.trailingAnchor.constraint(equalTo: buttonLogin.trailingAnchor, constant: -8).isActive = true
        labelButton.centerYAnchor.constraint(equalTo: buttonLogin.centerYAnchor).isActive = true
        
        // layout scrollview1
        scrollView.topAnchor.constraint(equalTo: viewNCC.bottomAnchor, constant: 0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: viewArea.heightAnchor, multiplier: 0.18).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.backgroundColor = .red
        
        //         layout contentview scrollview1
        //        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        //        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        //        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        //        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        //        contentView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        //        contentView.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: viewArea.heightAnchor, multiplier: 0.18, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        
        
        
        //         layout pagecontroll scrollView1
        pagecontrolView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        pagecontrolView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        pagecontrolView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        pagecontrolView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8).isActive = true
        
        // layout view segmentcontrol
        
        viewSegment.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        viewSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        viewSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        viewSegment.heightAnchor.constraint(equalTo: viewArea.heightAnchor, multiplier: 0.07).isActive = true
        
        // layout scrollviewMovie
        collectionViewMovie.topAnchor.constraint(equalTo: viewSegment.bottomAnchor, constant: 0).isActive = true
        collectionViewMovie.heightAnchor.constraint(equalTo: viewArea.heightAnchor, multiplier: 0.53).isActive = true
        collectionViewMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionViewMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionViewMovie.backgroundColor = .green
        
        //layout viewButton
        viewButton.topAnchor.constraint(equalTo: collectionViewMovie.bottomAnchor).isActive = true
        viewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(tabBarController?.tabBar.frame.size.height ?? 49.0) - 34).isActive = true
        
        //layout bôkingButton
        bookingButton.centerYAnchor.constraint(equalTo: viewButton.centerYAnchor).isActive = true
        bookingButton.heightAnchor.constraint(equalTo: viewButton.heightAnchor, multiplier: 0.5).isActive = true
        bookingButton.widthAnchor.constraint(equalTo: viewButton.widthAnchor, multiplier: 0.18).isActive = true
        bookingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        bookingButton.backgroundColor = .red
        
        //layout nameMovieLabel
        nameMovieLabel.heightAnchor.constraint(equalTo: viewButton.heightAnchor, multiplier: 0.3).isActive = true
        nameMovieLabel.widthAnchor.constraint(equalTo: viewButton.widthAnchor, multiplier: 0.6).isActive = true
        nameMovieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nameMovieLabel.topAnchor.constraint(equalTo: viewButton.topAnchor, constant: 10).isActive = true
        nameMovieLabel.backgroundColor = .red
        
        //layout timeMovieLabel
        timeMovieLabel.heightAnchor.constraint(equalTo: viewButton.heightAnchor, multiplier: 0.3).isActive = true
        timeMovieLabel.widthAnchor.constraint(equalTo: viewButton.widthAnchor, multiplier: 0.6).isActive = true
        timeMovieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        timeMovieLabel.bottomAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: -10).isActive = true
        timeMovieLabel.backgroundColor = .red
        
    }
    
    func configPageControl(){
        pagecontrolView.currentPage = 0
        pagecontrolView.numberOfPages = dataImages.count
        pagecontrolView.pageIndicatorTintColor = .white
        pagecontrolView.currentPageIndicatorTintColor = .red
        scrollView.delegate = self
    }
    
    func setupSegment(){
        var content = [SegmentioItem]()
        let sunItem = SegmentioItem(
            title: "PHIM ĐANG CHIẾU",
            image: UIImage(named: "")
            
        )
        
        let moonItem = SegmentioItem(
            title: "PHIM HAY SẮP CHIẾU",
            image: UIImage(systemName: "moon.circle.fill")
        )
        
        content.append(contentsOf: [sunItem, moonItem])
        
        // thanh indicator khi được chọn
        let indicator = SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 0.6, // tỉ lệ so với chiều rộng 1 item
            height: 2,
            color: .red
        )
        
        // thanh viền ngang
        let horizontal = SegmentioHorizontalSeparatorOptions(
            type: SegmentioHorizontalSeparatorType.bottom, // Top, Bottom, TopAndBottom
            height: 0.5, // để chiều cao bằng 0 thì không xuất hiện
            color: .red
        )
        
        // thanh dọc đứng, ngăn cách giữa các item
        let vertical = SegmentioVerticalSeparatorOptions(
            ratio: 0, // from 0.1 to 1, để tỉ lệ bằng 0 thì không xuất hiện
            color: .gray
        )
        
        // cấu hình trạng thái tương tác với segment; 1. mặc định, 2. khi được chọn, 3. chế độ hightlight
        let segmentState = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
                titleTextColor: .black
            ),
            selectedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
                titleTextColor: .red
            ),
            highlightedState: SegmentioState(
                backgroundColor: UIColor.white,
                titleFont: UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize),
                titleTextColor: .black
            )
        )
        viewSegment.setup(content: content, // content cho biết trên thanh segment có bao nhiêu phần tử
            style: .onlyLabel, // kiểu hiển thị, chỉ text, có cả text và ảnh, thứ tự hiển thị text và ảnh
            options: SegmentioOptions.init(
                backgroundColor: .white, // màu nền segment
                segmentPosition: .dynamic, // nên để dynamic, nếu để fix thì có thể cấu hình tối đa bao nhiêu item
                indicatorOptions: indicator, // thanh xuất hiện khi segment được chọn
                horizontalSeparatorOptions: horizontal,// thanh ngang
                verticalSeparatorOptions: vertical, // thanh dọc ngăn giữa các segment
                segmentStates: segmentState) // trạng thái của segment
        )
    }
    
    func setupNameMovie(_ index: Int){
        nameMovieLabel.text = datas[index].nameLabel
        timeMovieLabel.text = datas[index].timeLabel
    }
    
    func actionOfSegment(){
        viewSegment.valueDidChange = { segmentio, segmentIndex in
            if segmentIndex == 0 {
                self.datas =  self.movieTodays
            } else {
                self.datas = self.movieComingSoons
            }
            self.collectionViewMovie.reloadData()
        }
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/screenWidth)
        pagecontrolView.currentPage = Int(pageIndex)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.imageView.image = UIImage(named: datas[indexPath.row].imageMovie)
        setupNameMovie(indexPath.row)
        print(indexPath.row)
        print(datas[indexPath.row].nameLabel)
        
        
        return cell
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
