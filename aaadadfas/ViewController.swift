//
//  ViewController.swift
//  aaadadfas
//
//  Created by Trần Tiến Anh on 10/6/18.
//  Copyright © 2018 iAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    let imaPickerControler = UIImagePickerController()
    @IBAction func btnadd(_ sender: Any) {
        imaPickerControler.delegate = self
        let actionsheet = UIAlertController(title: "Photo Source", message: "Chose a source", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { (action : UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imaPickerControler.sourceType = .camera
                self.present(self.imaPickerControler,animated: true)
            }
            else {
                print("del mở đc cam")
            }
        }
        let photo = UIAlertAction(title: "Photo library", style: .default) { (action : UIAlertAction) in
            self.imaPickerControler.sourceType = .photoLibrary
            self.present(self.imaPickerControler,animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action : UIAlertAction) in
        }
        actionsheet.addAction(cancel)
        actionsheet.addAction(camera)
        actionsheet.addAction(photo)
        present(actionsheet, animated: true)
        
    }

    @IBOutlet weak var pageControl: UIPageControl!
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)

//        pageControl.numberOfPages = slides.count
//        pageControl.currentPage = 0
//        view.bringSubviewToFront(pageControl)
    }
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.bounds.height)
        scrollView.isPagingEnabled = true
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
        print(scrollView)
    }
    func createSlides() -> [Slide] {
        var result = [Slide]()
        for i in 0..<10 {
             let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide.img.image = UIImage(named: "trang")
            result.append(slide)
        }
        return result
    }

}
