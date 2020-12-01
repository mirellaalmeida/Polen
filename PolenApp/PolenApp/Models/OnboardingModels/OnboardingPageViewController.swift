//
//  OnboardingPageViewController.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingPageViewController: UIViewControllerRepresentable {
    
    var controller: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let onboardingPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        onboardingPageViewController.dataSource = context.coordinator
        
        
        return onboardingPageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        
        uiViewController.setViewControllers([controller[0]], direction: .forward, animated: true)
    }
    
    typealias UIViewControllerType = UIPageViewController
    
    func makeCoordinator() -> CordinatorPageControl {
        CordinatorPageControl(self)
    }
    
    class CordinatorPageControl: NSObject, UIPageViewControllerDataSource {
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = self.parent.controller.firstIndex(of: viewController) else { return nil}
            if index == 0 {
                return nil
            }
            return self.parent.controller[index-1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = self.parent.controller.firstIndex(of: viewController) else { return nil}
            
            if index == self.parent.controller.count - 1 {
                return nil
            }
            return self.parent.controller[index+1]
        }
        
        let parent: OnboardingPageViewController
        
        init(_ parent: OnboardingPageViewController) {
            self.parent = parent
        }
    }
}
