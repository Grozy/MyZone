//
//  ViewController.swift
//  CoreLocationBySwift
//
//  Created by SunGuozhi on 14-6-18.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

/*
1、启动位置管理器
locationManager!.startUpdatingLocation()
2、位置管理器十分消耗电量，需要合理使用，适当的时间记得告知位置管理器去调用stopUpdatingLocation
locationManger!.stopUpdatingLocation()
3、位置管理器的委托必须遵循CLLocationManagerDelegate协议，该协议定义一些方法，方法都是可选的
如，位置管理器确定了当前位置，或者检测到位置更改时调用某方法，当位置管理器遇到错误时候调用另一个方法
4、获取更新的位置，位置管理器通将当前位置通知给委托，它将调用locationManager:didUpdateLocations方法
第一个参数是调用该方法的位置管理器
第二个参数是一个CLLocation对象的数组，用于描述设备当前位置，可能还有之前的几个位置。如果在一段比较短的时间
内发生了多次位置更新,这几次位置更新可能会被一次性全部上报。无论如何，左后一个标识当前的位置。
CLLocationManager这个对象有一个location属性，这个location属性是CLLocation类型的

CLLocation 常用的五个属性
1、coordinate 这个属性，负责存储精度和纬度
coordinate.latitude 经度
coordinate.longitude 纬度
2、horizontalAccuracy在地图应用中表示当时检测到你的位置时，Maps中显示的圆将horizontalAccuracy作为半径。位置管理器默认你位于该圆的中心;如果不是这样，但几乎可以肯定你位于圆之内的某个位置。horizontalAccuracy为负值时，犹豫默写愿意，你不能依赖coordinate的值。
3、CLLocation对象还有一个名为altitude的属性，该属性用于描述你在海平面以上或者以下多少米:
CLLocationDistance altitude = theLocation.altitude;
4、CLLocation对象有一个时间戳来描述位置的时间
5、CLLocation对象中有一个非常实用的实例方法，该方法允许你确定两个CCLocation对象之间的距离。方法是distanceFromLocation:
CCLocationDistance distance = [fromLocation distanceFromLocation:toLocation];
*/

import UIKit
import CoreLocation
class ViewController: UIViewController ,CLLocationManagerDelegate{
    var locationManager:CLLocationManager?
    var _latitudeLabel:UILabel?
    var altitudeLabel:UILabel?
    var _longtudeLabel:UILabel?
    var stopButton:UIButton?
    var startButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.locationManager = CLLocationManager()
        
        
        self.locationManager!.delegate = self
        self.locationManager!.desiredAccuracy = kCLLocationAccuracyBest

        
        self._latitudeLabel = UILabel(frame:CGRectMake(10,10,320,40))
        self._latitudeLabel!.numberOfLines = 0
        
        self._longtudeLabel = UILabel(frame:CGRectMake(10,50,320,40))
        self._longtudeLabel!.numberOfLines = 0
        
        self.stopButton = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.stopButton!.frame = CGRectMake(10,90,300,40)
        self.stopButton!.backgroundColor = UIColor.redColor()
        self.stopButton!.addTarget(self, action: "btnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.startButton = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.startButton!.frame = CGRectMake(10,130,300,40)
        self.startButton!.backgroundColor = UIColor.blueColor()
        self.startButton!.addTarget(self, action: "startBtnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.altitudeLabel = UILabel(frame:CGRectMake(10, 170, 300, 40))
        self.altitudeLabel!.numberOfLines = 0
        
        self.view?.addSubview(self.stopButton)
        self.view!.addSubview(self.startButton)
        self.view?.addSubview(self._longtudeLabel)
        self.view?.addSubview(self._latitudeLabel)
        self.view?.addSubview(self.altitudeLabel)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func btnClicked(){
        self.locationManager!.stopUpdatingLocation()
        self._latitudeLabel!.text = ""
        self._longtudeLabel!.text = ""
        self.altitudeLabel!.text = ""
    }
    func startBtnClicked(sender:AnyObject!){
        self.locationManager!.startUpdatingLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //CLLocationMangerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: AnyObject[]!)
    {
        var newLocation = locations[locations!.count - 1] as CLLocation
        var latitudeString = String(format:"%g\u00b0", newLocation.coordinate.latitude)
        self._latitudeLabel!.text = latitudeString
        var longtudeString = String(format:"%g\u00b0", newLocation.coordinate.longitude)
        self._longtudeLabel!.text = longtudeString
        self.altitudeLabel!.text = String(format:"%g\u00b0", newLocation.altitude)
        var dateFormatter:NSDateFormatter?
        dateFormatter = NSDateFormatter()

        NSLog("\(dateFormatter!.stringFromDate(newLocation.timestamp))");
        
    }
}

