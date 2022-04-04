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

        if (!$name) {
            return response()->json(['error' => 'Missing profile name']);
        }

        $exists = DB::table('profile')->where('name', '=', $name)->first();

        if ($exists) {
            return response()->json(['error' => 'That profile name already exists']);
        }

        Profile::create(['name'=>$name]);
        return response()->json(['message' => 'Successfully created profile']);
    }

    public function delete(Request $request) {
        $name = $request->input('name');
        $deleted = DB::table('profile')->where('name', '=', $name)->delete();
        return response()->json(['message' => "Successfully deleted profile"]);
    }

}