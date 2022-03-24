<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Models\Subject;

class SubjectController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api', ['except' => []]);
    }

    public function getSubjects(Request $request) {
        $subjects = Subject::all();
        return response()->json($subjects);
    }
    
    public function create(Request $request) {
        $id = $request->input('id');
        Subject::create(['id'=>$id]);
        return response()->json(['message' => 'Successfully created subject']);
    }

    public function delete(Request $request) {
        $id = $request->input('id');
        $deleted = DB::table('subject')->where('id', '=', $id)->delete();
        return response()->json(['message' => "Successfully deleted subject: ${deleted}"]);
    }
}