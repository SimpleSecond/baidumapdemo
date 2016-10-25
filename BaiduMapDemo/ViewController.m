//
//  ViewController.m
//  BaiduMapDemo
//
//  Created by WangDongya on 16/10/13.
//  Copyright © 2016年 example. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface ViewController () <BMKMapViewDelegate>
{
    // 地图视图
    BMKMapView *_mapView;
    
    //
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    [self.navigationController.navigationBar setHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
    
    // 地图类型(标准类型、卫星图类型)
    _mapView.mapType = BMKMapTypeNone;
    // [_mapView setMapType:BMKMapTypeSatellite];
    [_mapView setMapType:BMKMapTypeStandard];
    // 实时交通状况
    [_mapView setTrafficEnabled:NO];
    // 百度城市热力图图层
    [_mapView setBaiduHeatMapEnabled:NO];
    
    
    
    // 设置百度地图logo的位置
    [_mapView setLogoPosition:BMKLogoPositionRightBottom];
    // 指南针
    // [_mapView s];
    // 比例尺
    [_mapView setMaxZoomLevel:21.0];
    [_mapView setMinZoomLevel:5.0];
    [_mapView setZoomLevel:12.0];
    
    
    // [_mapView setShowMapScaleBar:YES];
    // [_mapView setShowsUserLocation:YES];
    
    
    // BMKAnnotationView *annotationView = nil;
    // BMKPointAnnotation (点标注)
    // BMKPinAnnotationView （大头针标注）
    
    // 设置隐藏地图标注
    [_mapView setShowMapPoi:YES];
    
    
    
    [self.view addSubview:_mapView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    // 添加一个PointAnnotation
    BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [_mapView addAnnotation:annotation];
    
    /**
    // 添加折线覆盖物
    CLLocationCoordinate2D coors1[2] = {0};
    coors1[0].latitude = 39.315;
    coors1[0].longitude = 116.304;
    coors1[1].latitude = 39.515;
    coors1[1].longitude = 116.504;
    BMKPolyline *polyline = [BMKPolyline polylineWithCoordinates:coors1 count:2];
    [_mapView addOverlay:polyline];
     */
    
    /**
    //构建顶点数组
    CLLocationCoordinate2D coords[5] = {0};
    coords[0].latitude = 39.965;
    coords[0].longitude = 116.404;
    coords[1].latitude = 39.925;
    coords[1].longitude = 116.454;
    coords[2].latitude = 39.955;
    coords[2].longitude = 116.494;
    coords[3].latitude = 39.905;
    coords[3].longitude = 116.654;
    coords[4].latitude = 39.965;
    coords[4].longitude = 116.704;
    //构建分段纹理索引数组
    NSArray *textureIndex = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:0],
                             [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:2],
                             [NSNumber numberWithInt:1], nil];
    
    //构建BMKPolyline,使用分段纹理
    BMKPolyline* polyLine = [BMKPolyline polylineWithCoordinates:coords count:5 textureIndex:textureIndex];
    // BMKPolyline *polyLine = [BMKPolyline polylineWithCoordinates:coords count:5];
    //添加分段纹理绘制折线覆盖物
    [_mapView addOverlay:polyLine];
     */
    
    
    
    // 添加折线分段颜色绘制覆盖物
    CLLocationCoordinate2D coords[5] = {0};
    coords[0].latitude = 39.965;
    coords[0].longitude = 116.404;
    coords[1].latitude = 39.925;
    coords[1].longitude = 116.454;
    coords[2].latitude = 39.955;
    coords[2].longitude = 116.494;
    coords[3].latitude = 39.905;
    coords[3].longitude = 116.554;
    coords[4].latitude = 39.965;
    coords[4].longitude = 116.604;
    // 构建分段颜色索引数组
    NSArray *colorIndexs = [NSArray arrayWithObjects:
                            [NSNumber numberWithInt:2],
                            [NSNumber numberWithInt:0],
                            [NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:2], nil];
    // 构建BMKPolyline，使用分段颜色索引，其对应的BMKPolylineView必须设置colors属性
    BMKPolyline *colorfulPolyline = [BMKPolyline polylineWithCoordinates:coords count:5 textureIndex:colorIndexs];
    [_mapView addOverlay:colorfulPolyline];
    
    
    // 添加弧线覆盖物
    // 传入的坐标顺序为起点、途径点、终点
    CLLocationCoordinate2D arcCoords[3] = {0};
    arcCoords[0].latitude = 39.9374;
    arcCoords[0].longitude = 116.350;
    arcCoords[1].latitude = 39.9170;
    arcCoords[1].longitude = 116.360;
    arcCoords[2].latitude = 39.9479;
    arcCoords[2].longitude = 116.373;
    
    BMKArcline *arcline = [BMKArcline arclineWithCoordinates:arcCoords];
    [_mapView addOverlay:arcline];
    
    
    
    // 添加多边形覆盖物
    CLLocationCoordinate2D polygonCoords[3] = {0};
    polygonCoords[0].latitude = 39;
    polygonCoords[0].longitude = 116;
    polygonCoords[1].latitude = 38;
    polygonCoords[1].longitude = 115;
    polygonCoords[2].latitude = 38;
    polygonCoords[2].longitude = 117;
    BMKPolygon *polygon = [BMKPolygon polygonWithCoordinates:polygonCoords count:3];
    [_mapView addOverlay:polygon];
    
    
    // 添加圆形覆盖物
    CLLocationCoordinate2D circleCoor;
    circleCoor.latitude = 39.915;
    circleCoor.longitude = 116.404;
    BMKCircle *circle = [BMKCircle circleWithCenterCoordinate:circleCoor radius:5000];
    [_mapView addOverlay:circle];
    
    
    // 添加图片图层覆盖物（第一种：根据指定经纬度坐标生成）
    CLLocationCoordinate2D ground1Coors;
    ground1Coors.latitude = 39.800;
    ground1Coors.longitude = 116.404;
    BMKGroundOverlay *ground1 = [BMKGroundOverlay groundOverlayWithPosition:ground1Coors zoomLevel:11 anchor:CGPointMake(0, 0) icon:[UIImage imageNamed:@"test.jpg"]];
    [_mapView addOverlay:ground1];
    
    // 添加图片图层覆盖物（第二种：根据指定区域生成）
    CLLocationCoordinate2D ground2Coords[2] = {0};
    ground2Coords[0].latitude = 39.815;
    ground2Coords[0].longitude = 116.404;
    ground2Coords[1].latitude = 39.915;
    ground2Coords[1].longitude = 116.504;
    BMKCoordinateBounds bound;
    bound.southWest = ground2Coords[0];
    bound.northEast = ground2Coords[1];
    BMKGroundOverlay *ground2 = [BMKGroundOverlay groundOverlayWithBounds:bound icon:[UIImage imageNamed:@"test.jpg"]];
    [_mapView addOverlay:ground2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;   // 设置标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay
{
    if ([overlay isKindOfClass:[BMKPolyline class]]) {
        BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
        polylineView.lineWidth = 5.0;
        
        
        /**
        polylineView.strokeColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
        */
        
        
        
        /**
        // 是否分段纹理绘制（突出显示），默认为YES
        polylineView.isFocus = YES;
        // 加载分段纹理图片，必须；否则不能进行分段纹理绘制
        [polylineView loadStrokeTextureImages:[NSArray arrayWithObjects:
                                               [UIImage imageNamed:@"road_blue_arrow.png"],
                                               [UIImage imageNamed:@"road_green_arrow.png"],
                                               [UIImage imageNamed:@"road_red_arrow.png"], nil]];
         */
        
        
        // 使用分段颜色绘制时，必须设置（内容必须为UIColor）
        polylineView.colors = [NSArray arrayWithObjects:[UIColor greenColor], [UIColor redColor], [UIColor yellowColor], nil];
        
        return polylineView;
    }
    
    if ([overlay isKindOfClass:[BMKArcline class]]) {
        BMKArclineView *arclineView = [[BMKArclineView alloc] initWithArcline:overlay];
        arclineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        arclineView.lineWidth = 5.0;
        return arclineView;
    }
    
    if ([overlay isKindOfClass:[BMKPolygon class]]) {
        BMKPolygonView *polygonView = [[BMKPolygonView alloc] initWithPolygon:overlay];
        polygonView.strokeColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
        polygonView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        polygonView.lineWidth = 5.0;
        return polygonView;
    }
    
    if ([overlay isKindOfClass:[BMKCircle class]]) {
        BMKCircleView *circleView = [[BMKCircleView alloc] initWithCircle:overlay];
        circleView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.5];
        circleView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        circleView.lineWidth = 10.0;
        return circleView;
    }
    
    if ([overlay isKindOfClass:[BMKGroundOverlay class]]) {
        BMKGroundOverlayView *groundView = [[BMKGroundOverlayView alloc] initWithGroundOverlay:overlay];
        return groundView;
    }
    
    return nil;
}







@end
