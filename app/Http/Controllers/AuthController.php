<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\hotel;
use App\Models\room;
use Carbon\Carbon;
use App\Models\Country;
use App\Models\City;
use App\Models\Rooms;
use App\Models\Address;
use App\Models\ContactNumbers;
use App\Models\StateCountyProv;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\JsonResponse;



class AuthController extends Controller
{


private static $hotel,$countries, $name,$product,$image,$imageName,$directory,$imageUrl,$otherImage,$imageExtension;

public function storehotel(){
    $countries = Country::all();
    $cities = City::all();
    $rooms = room::all();

    return view('admin.product.add-product', [
        'countries' => $countries,
        'cities' => $cities,
        'rooms' => $rooms,
    ]);
    
}  

// public function manageProduct()
// {
//     $countries = Country::with(['cities.hotels', 'hotels.rooms'])->get();

//     return response()->json($countries);
// 

            public function manageProduct()
            {
            $countries = Country::with(['cities.hotels.rooms'])->get();
            $countries->makeHidden(['created_at', 'updated_at']);
            return response()->json($countries);
            }


            public static function getImageUrl($request)
            {
                $image = $request->file('Single_image');

                if ($image) {
                    $directory = 'upload/product-images/';
                    $imageName = time() . '_' . $image->getClientOriginalName();
                    $image->move($directory, $imageName);
                    $imageUrl = $directory . $imageName;
                    return $imageUrl;
                }

                return null; 
            }       
            public static function getMultiImageUrl($request)
            {
                if ($request->hasFile('multiple_image')) {
                    $images = $request->file('multiple_image');
                    $imageUrls = [];

                    foreach ($images as $image) {
                        if ($image->isValid()) {
                            $imageExtension = $image->getClientOriginalExtension();
                            $imageName = rand(1, 500000) . '.' . $imageExtension;
                            $directory = 'upload/product-other-images/';
                            $image->move($directory, $imageName);

                            $imageUrl = $directory . $imageName;
                            $imageUrls[] = $imageUrl;
                        } else {

                        }
                    }
                    return $imageUrls;
                } else {
                    return [];
                }
            }

            public function savehotel(Request $request)
            {
            $country = Country::create([
            'country' => $request->country,
            ]);

            $city = City::create([
            'city' => $request->city,
            'country_id' => $country->id,
            ]);

            $extraBedValue = $request->input('extra_bed');
            if ($extraBedValue === null || $extraBedValue === '') {
            $extraBedValue = 'No';
            }

            $singleImageUrl = self::getImageUrl($request);
            $multipleImageUrls = self::getMultiImageUrl($request);

            hotel::create([
            'hotel' => $request->hotel,
            'city_id' => $city->id,
            'country_id' => $country->id,
            'embed_code' => $request->embed_code,
            'landmark' => $request->landmark,
            'rating' => $request->rating,
            'address' => $request->address,
            'highlights' => $request->highlights,
            'long_decription' => $request->long_decription,
            'currency' => $request->currency,
            'term_condition' => $request->term_condition,
            'longitude' => $request->longitude,
            'litetitude' => $request->litetitude,
            'Single_image' => $singleImageUrl,
            'multiple_image' => $multipleImageUrls !== null && is_array($multipleImageUrls) ? serialize($multipleImageUrls) : null,
            'facilities' => is_array($request->facilities) ? implode(',', $request->facilities) : $request->facilities,
            ]);

            return response()->json(['message' => 'Hotel Data successfully inserted'], 201);
}
            

        public function search(Request $request)
        {
            $query = $request->input('query');

            $cities = City::where('city', 'like', "%$query%")->get();
            $countries = Country::where('country', 'like', "%$query%")->get();
            $hotels = hotel::where('hotel', 'like', "%$query%")->get();
            $rooms = room::where('room_num', 'like', "%$query%")->get();

            $results = [
                'cities' => $cities,
                'countries' => $countries,
                'hotels' => $hotels,
                'rooms' => $rooms,
            ];

       
            $foundResults = $cities->isNotEmpty() || $countries->isNotEmpty() || $hotels->isNotEmpty() || $rooms->isNotEmpty();

            if (!$foundResults) {
                return response()->json(['error' => 'No results found'], 404);
            }

            return response()->json($results);
            }

            public function show($id)
            {
                $country = Country::with('cities.hotels.rooms')->find($id);

                if ($country) {
                    return response()->json([
                        'status' => 200,
                        'country' => $country
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 404,
                        'message' => "No such room found"
                    ], 404);
                }
            }

            public function showroom($id)
            {
                $country = room::with('rooms')->find($id);

                if ($country) {
                    return response()->json([
                        'status' => 200,
                        'country' => $country
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 404,
                        'message' => "No such country found"
                    ], 404);
                }
            }
            // public function show($id)
            // {
            //     $student = Country::find($id);
            //     if ($student) {
            //         return response()->json([
            //             'status' => 200,
            //             'student' => $student
            //         ], 200);
            //     } else {
            //         return response()->json([
            //             'status' => 404,
            //             'message' => "no such hotelinfo found"
            //         ], 404);
            //     }
            // }
            

public function productDelete(Request $request){
    Hotel::deleteProduct($request->id);
    return back()->with('message', 'Info deleted');

}
  public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);
        $credentials = $request->only('email', 'password');
        $token = Auth::attempt($credentials);
        
        if (!$token) {
            return response()->json([
                'message' => 'Unauthorized',
            ], 401);
        }

        $user = Auth::user();
        return response()->json([
            'user' => $user,
            'authorization' => [
                'token' => $token,
                'type' => 'bearer',
                'expires_in' => auth()->factory()->getTTL() * 60, // Default value, you can keep this line
                 'expires_in' => 180 * 60, // Set to 3 hours in minutes


                // 'expires_in' => auth()->factory()->getTTL() * 60, // Default value, you can keep this line
                // 'expires_in' => 1440, // Set to 24 hours in minutes

                
                
            ]
        ]);
    }

    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'message' => 'User created successfully',
            'user' => $user
        ]);
    }

    public function logout()
    {
        Auth::logout();
        return response()->json([
            'message' => 'Successfully logged out',
        ]);
    }

    public function refresh()
    {
        return response()->json([
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }


    public function userProfile() {
        return response()->json(auth()->user());
    }

    public function delete(Request $request){
        Hotel::delete($request->id);
        return back()->with('message', 'Info deleted');
}


public function handle(Request $request, Closure $next)
    {
        return $next($request);

        $restrictedIps = ['127.0.0.1', '102.129.158.0'];
if(in_array($request->ip(), $restrictedIps)){
  App::abort(403, 'Request forbidden');
}
return $next($request);
    }

   // Room Info


    public function storeroom(){
     
        $countries = Country::all();
        $cities = City::all();
        //$cities = City::with('country')->get();
        $rooms = room::with('city.country')->get();
        return view('admin.country.add-product', compact('countries', 'cities', 'rooms'));
    }

    public function getSubCategoryByCategory()
    {

        return response()->json(City::where('country_id', $_GET['id'])->get());
    }

    public function hotel()
    {

        return response()->json(hotel::where('city_id', $_GET['id'])->get());
    }

    public function manageroom(){
        
       //$products=itenary::with('city')->get();
         $products=room::all();
         $products->makeHidden(['created_at', 'updated_at']);
       return response()->json($products);
        //exit();
        return view('admin.country.manage-product',[
            'products'=>room::all()
        ]);
        // return view('admin.product.manage', ['products' => Product::all()]);
        //dd($products);
    }

   public function saveroom(Request $request){
 // dd($request);


 $validator = Validator::make($request->all(), [

    
    'city_id' => 'required',
    'room_num' => 'required',
    'available_capacity' => 'required',
    'max_capacity' => 'required',
    'refundable' => 'required',
    'non_refundable' => 'required',
    'refundable_break' => 'required',
    'refundable_nonbreak' => 'required',
    'room_size' => 'required',
    'cancellation_policy' => 'required',
    'room_available' => 'required',
    'extra_bed' => 'required',
    'room_facilities' => 'required',
    'bed_type' => 'required',
]);


if ($validator->fails()) {
    return back()->withErrors($validator)->withInput();
}
    $extraBedValue = $request->input('extra_bed');
    if ($extraBedValue === null || $extraBedValue === '') {
        $extraBedValue = 'No';
    }

    $product = (object)[
        'id' => $request->room_id,      
    ];


    $roomDetails = [];

    $roomNumArray = is_array($request->room_num) ? $request->room_num : [$request->room_num];
    $products = count($roomNumArray);

    for ($i = 0; $i < $products; $i++) {
        $roomDetails[] = [
            // 'room_id' => $product->id,
            // 'country_id' => $request->country_id,
            //'hotel_id' => $hotel->hotel_id,
            'hotel_id' => $request->hotel_id,            
            'city_id' => $request->city_id,            
            'room_num' => isset($roomNumArray[$i]) ? $roomNumArray[$i] : null,
            'available_capacity' => $request->available_capacity[$i],
            'max_capacity' => $request->max_capacity[$i],
            'refundable' => $request->refundable[$i],
            'non_refundable' => $request->non_refundable[$i],
            'refundable_break' => $request->refundable_break[$i],
            'refundable_nonbreak' => $request->refundable_nonbreak[$i],
            'room_size' => $request->room_size[$i],
            'cancellation_policy' => $request->cancellation_policy[$i],
            'room_available' => $request->room_available[$i],
            'extra_bed' => $request->extra_bed[$i],
            'room_facilities' => is_array($request->room_facilities) ? implode(',', $request->room_facilities) : $request->room_facilities[$i],
            'bed_type' => is_array($request->bed_type) ? implode(',', $request->bed_type) : ($request->bed_type[$i] ?? null),
       
            // 'room_facilities' => is_array($request->room_facilities[$i]) ? implode(',', $request->room_facilities[$i]) : $request->room_facilities[$i],
            // 'bed_type' => is_array($request->bed_type[$i]) ? implode(',', $request->bed_type[$i]) : $request->bed_type[$i],
        ];
    }

    room::insert($roomDetails);

    return response()->json(['message' => 'Room Data successfully inserted'], 201);
}
public function  roomEdit($id){
    self::$product=room::find($id);
    return view('admin.country.product-edit',[
        'product'=>self::$product
    ]);
}

      public static function roomUpdate(Request $request)
        {
            $product = room::find($request->id);

            if (!$product) {
                // Handle the case where the product is not found
                return response()->json(['error' => 'Product not found'], 404);
            }
            $product->room_num = $request->room_num;
            $product->available_capacity = $request->available_capacity;
            $product->max_capacity = $request->max_capacity;
            $product->refundable = $request->refundable;
            $product->non_refundable = $request->non_refundable;
            $product->refundable_break = $request->refundable_break;
            $product->refundable_nonbreak = $request->refundable_nonbreak;
            $product->room_size = $request->room_size;
            $product->cancellation_policy = $request->cancellation_policy;
            $product->room_available = $request->room_available;
            //$product->long_decription = $request->long_decription;
            $product->extra_bed = $request->extra_bed;
            $product->bed_type = $request->bed_type;
            $product->room_facilities = $request->room_facilities;
          
            $product->save();
            return response()->json(['message' => 'Room updated successfully'], 200);
        }
            
        public function destroy(Request $request)
        {
            room::destroy($request->id);
            return back()->with('message', 'Info deleted');
        }

public function detail($id)
{
    $hotel = room::with('rooms')->find($id);

    return view('admin.product.detail', ['hotel' => $hotel]);
}

//passenger Info

public function createPassenger(Request $request)
{
    
    $address = Address::create([
        
        //'agency_info_id' => $request->agency_info_id,
        'AddressLine' => $request->AddressLine,
        'CityName' => $request->CityName,
        'CountryCode' => $request->CountryCode,
        'PostalCode' => $request->PostalCode,
        'StreetNmbr' => $request->StreetNmbr,
        ]);
        
     //'country_id' => $country->id,
     $country = StateCountyProv::create([
        'agency_info_id' => $address->id,
        'StateCode' => $request->StateCode,
        ]);

    
        //'country_id' => $country->id,
    $country = ContactNumbers::create([
        'customer_info_id' => $request->customer_info_id,
        'NameNumber' => $request->NameNumber,
        'Phone' => $request->Phone,
        'CountryCode' => $request->CountryCode,
        'PhoneUseType' => $request->PhoneUseType,
        ]);
    return response()->json(['status' => 'success', 'message' => 'Passenger record created successfully']);
}


public function managepassenger()
{
    $addresses = Address::with(['stateCountyProv'])->get();
    
    // Hide the created_at and updated_at fields
    $addresses->makeHidden(['created_at', 'updated_at']);

    return response()->json($addresses);
}

        
    public function index()
    {
        try {
            $host = 'https://hotel.aotrek.net/api/auth/manage-product';
            $token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2hvdGVsLmFvdHJlay5uZXQvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MDY5NDg1MzQsImV4cCI6MTcwNjk1MjEzNCwibmJmIjoxNzA2OTQ4NTM0LCJqdGkiOiI3MnNUdFhtNGl5amN2MkhjIiwic3ViIjoiNyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.HlK-1M4ssX9iW2wm5zndyeVIWgni0IpBPDwWtAZnVQ0';
    
            $collection = Http::withHeaders([
                'x-api-host' => $host,
                'x-api-key' => $token
            ])->get('https://hotel.aotrek.net/api/auth/manage-product');
    
            $stats = Http::withHeaders([
                'x-api-host' => $host,
                'x-api-key' => $token,
            ])->get('https://api.sharetrip.net/api/v1/flight/search/airport?name=d');

            $statsa = Http::withHeaders([
                'x-api-host' => $host,
                'x-api-key' => $token,
            ])->get('https://jsonplaceholder.typicode.com/albums');
    
            return response()->json([
                'collection' => $collection->json(),
                'stats' => $stats->json(),
                'statsa' => $statsa->json(),
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
      
}