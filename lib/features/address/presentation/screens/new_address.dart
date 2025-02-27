import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/core/widets/custom_btn.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key});

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west:  5.9559113,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Address",style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,fontFamily: GoogleFonts.plusJakartaSans().fontFamily
        ),),
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.midgrey,
                      width: 1.w)),
              child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(Icons.search)),
            ),
          ),
          SizedBox(width: 10.w,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r)
                ),
                child: OSMFlutter(
                  
                controller:mapController,
                osmOption: OSMOption(
                  userTrackingOption: UserTrackingOption(
                    enableTracking: true,
                    unFollowUser: false,
                  ),
                  zoomOption: ZoomOption(
                    initZoom: 8,
                    minZoomLevel: 3,
                    maxZoomLevel: 19,
                    stepZoom: 1.0,
                  ),
                  userLocationMarker: UserLocationMaker(
                    personMarker: MarkerIcon(
                      icon: Icon(
                        Icons.location_history_rounded,
                        color: Colors.red,
                        size: 48,
                      ),
                    ),
                    directionArrowMarker: MarkerIcon(
                      icon: Icon(
                        Icons.double_arrow,
                        size: 48,
                      ),
                    ),
                  ),
                  roadConfiguration: RoadOption(
                    roadColor: Colors.yellowAccent,
                  ),
                  markerOption: MarkerOption(
                      defaultMarker: MarkerIcon(
                        icon: Icon(
                          Icons.person_pin_circle,
                          color: Colors.blue,
                          size: 56,
                        ),
                      )
                  ),
                )
                      ),
              ),
            ),
              SizedBox(height: 16.h,),
              Text("Select your location from the map",style: Styles.style18,),
              SizedBox(height: 10.h,),
              Text("Move the pin on the map to find your location\n and select the delivery address",style: Styles.style14grey,),
              SizedBox(height: 16.h,),
              Text("Address Detail",style: Styles.style12,),
              Container(
                padding:EdgeInsets.all(16) ,
                decoration:BoxDecoration(
                  border: Border.all(
                    width: 1.w,color: AppColors.midgrey
                  ),
                  borderRadius: BorderRadius.circular(16.r)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jl. Seturan indah No.9, Kledokan",
                      style: Styles.style16,),
                    Icon(Icons.location_on_outlined)
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              CustomBtn(onPressed: (){}, txt: "Confirm Address")

            ]
        ),
      ),
    );
  }
}
