<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Selection;
use App\Models\Competence;

class SelectionController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api', ['except' => []]);
    }

    public function get(Request $request) {
        $subject_fk = $request->input('subject_fk');
        $profile_fk = $request->input('profile_fk');
        $competence_fk = $request->input('competence_fk');
        $selection = Selection::where('subject_fk', '=', $subject_fk)->where('profile_fk' ,'=', $profile_fk)->where('competence_fk' ,'=', $competence_fk)->get();
        return response()->json($selection);
    }

    public function getPage(Request $request) {
        $subject_fk = $request->input('subject_fk');
        $profile_fk = $request->input('profile_fk');
        $page = $request->input('page');

        $res = DB::table('selection')
            ->leftJoin('competence', 'competence.id', '=', 'selection.competence_fk')
            ->where('subject_fk', '=', $subject_fk)
            ->where('profile_fk', '=', $profile_fk)
            ->where('page', '=', $page)
            ->get();

        return response()->json($res);
    }
    
    public function createOrUpdate(Request $request) {
        $subject_fk = $request->input('subject_fk');
        $profile_fk = $request->input('profile_fk');
        $competence_fk = $request->input('competence_fk');
        $value = $request->input('value');

        $exists = Selection::where('subject_fk', '=', $subject_fk)->where('profile_fk' ,'=', $profile_fk)->where('competence_fk' ,'=', $competence_fk)->get();

        if (count($exists) == 0) {
            Selection::create(['subject_fk'=>$subject_fk, 'profile_fk'=>$profile_fk, 'competence_fk'=>$competence_fk,  'value'=>$value ]);
        }
        else {
            Selection::where('subject_fk' ,'=', $subject_fk)->where('profile_fk' ,'=', $profile_fk)->where('competence_fk' ,'=', $competence_fk)->update(['value' => $value]);
        }

        $new = Selection::where('subject_fk', '=', $subject_fk)->where('profile_fk' ,'=', $profile_fk)->where('competence_fk' ,'=', $competence_fk)->get();

        return response()->json(['selection' => $new]);
    }

}