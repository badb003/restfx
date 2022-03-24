<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Profile;
use Illuminate\Support\Facades\DB;

class ProfileController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api', ['except' => []]);
    }

    public function getProfiles(Request $request) {
        $profiles = Profile::all();
        return response()->json($profiles);
    }
    
    public function create(Request $request) {
        $name = $request->input('name');
        Profile::create(['name'=>$name]);
        return response()->json(['message' => 'Successfully created profile']);
    }

    public function delete(Request $request) {
        $name = $request->input('name');
        $deleted = DB::table('profile')->where('name', '=', $name)->delete();
        return response()->json(['message' => "Successfully deleted profileid:${deleted}"]);
    }

}