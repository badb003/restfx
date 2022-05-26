<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Selection;
use App\Models\Language;
use App\Models\Profile;
use PhpParser\Node\Stmt\Throw_;

class SelectionController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api', ['except' => []]);
    }

    public function templatePage(Request $request) {
        $res = DB::table('competence')->get();
        $lparam = $request->input('language');

        if (isset($lparam)) {
            foreach ($res as $rv) {
                $rv->name = Language::where('id', '=', $rv->id)->where('lang', '=', $lparam)->first()->name;
            }
        }

        return response()->json($res);
    }

    public function get(Request $request) {
        $subject_fk = $request->input('subject_fk');
        $profile_fk = $request->input('profile_fk');
        $competence_fk = $request->input('competence_fk');

        if (!$subject_fk) {
            return response()->json(['error' => 'missing subject_fk']);
        }

        if (!$profile_fk) {
            return response()->json(['error' => 'missing profile_fk']);
        }

        if (!$competence_fk) {
            return response()->json(['error' => 'missing competence_fk']);
        }

        $selection = Selection::where('subject_fk', '=', $subject_fk)
                                ->where('profile_fk' ,'=', $profile_fk)
                                ->where('competence_fk' ,'=', $competence_fk)
                                ->get();

        return response()->json($selection);
    }

    public function getPage(Request $request) {
        $subject_fk = $request->input('subject_fk');
        $profile_fk = $request->input('profile_fk');
        $page = $request->input('page');

        if (!$subject_fk) {
            return response()->json(['error' => 'missing subject_fk']);
        }

        if (!$profile_fk) {
            return response()->json(['error' => 'missing profile_fk']);
        }

        if (!$page) {
            return response()->json(['error' => 'missing page']);
        }

        $res = DB::table('selection')
            ->leftJoin('competence', 'competence.id', '=', 'selection.competence_fk')
            ->where('subject_fk', '=', $subject_fk)
            ->where('profile_fk', '=', $profile_fk)
            ->where('page', '=', $page)
            ->get();

        return response()->json($res);
    }

    public function getAllPages(Request $request) {
        $subject_fk = $request->input('subject_fk');

        if (!$subject_fk) {
            return response()->json(['error' => 'missing subject_fk']);
        }

        $profiles = Profile::all();

        $res = [];

        foreach ($profiles as $profile) {
            $res[$profile->name] = DB::table('selection')
            ->leftJoin('competence', 'competence.id', '=', 'selection.competence_fk')
            ->where('subject_fk', '=', $subject_fk)
            ->where('profile_fk', '=', $profile->id)
            ->get();
        }

        return response()->json($res);
    }
    
    public function createOrUpdate(Request $request) {
        $subject_fk = $request->input('subject_fk');
        $profile_fk = $request->input('profile_fk');
        $competence_fk = $request->input('competence_fk');
        $value = $request->input('value');

        if (!$subject_fk) {
            return response()->json(['error' => 'missing subject_fk']);
        }

        if (!$profile_fk) {
            return response()->json(['error' => 'missing profile_fk']);
        }

        if (!$competence_fk) {
            return response()->json(['error' => 'missing competence_fk']);
        }

        if (!is_numeric($value)) {
            return response()->json(['error' => 'missing value']);
        }

        $exists = Selection::where('subject_fk', '=', $subject_fk)
                            ->where('profile_fk' ,'=', $profile_fk)
                            ->where('competence_fk' ,'=', $competence_fk)
                            ->get();

        if (count($exists) == 0) {
            Selection::create(['subject_fk'=>$subject_fk, 'profile_fk'=>$profile_fk, 'competence_fk'=>$competence_fk,  'value'=>$value ]);
        }
        else {
            Selection::where('subject_fk' ,'=', $subject_fk)
                    ->where('profile_fk' ,'=', $profile_fk)
                    ->where('competence_fk' ,'=', $competence_fk)
                    ->update(['value' => $value]);
        }

        $new = Selection::where('subject_fk', '=', $subject_fk)
                        ->where('profile_fk' ,'=', $profile_fk)
                        ->where('competence_fk' ,'=', $competence_fk)
                        ->get();

        return response()->json(['selection' => $new]);
    }



    public function createOrUpdateLang(Request $request) {
        $language = $request->input('language');
        $name = $request->input('name');
        $id = $request->input('id');

        if (!$language) {
            return response()->json(['error' => 'missing language']);
        }

        if (!$name) {
            return response()->json(['error' => 'missing name']);
        }

        if (!$id) {
            return response()->json(['error' => 'missing id']);
        }

        if (!is_numeric($id)) {
            return response()->json(['error' => 'missing id / value']);
        }

        $exists = Language::where('lang', '=', $language)
                            ->where('id' ,'=', $id)
                            ->get();

        if (count($exists) == 0) {
            Language::create(['lang'=>$language, 'name'=>$name, 'id'=>$id ]);
        }
        else {
            Language::where('lang' ,'=', $language)
                    ->where('id' ,'=', $id)
                    ->update(['name' => $name]);
        }

        $new = Language::where('lang', '=', $language)
                        ->where('id' ,'=', $id)
                        ->get();

        return response()->json(['selection' => $new]);
    }

    public function filter(Request $request) {
        $page = $request->input('filter');

        try {
            $filters = json_decode(json_decode($page, false));
            if (!$filters) {
                return response()->json(['format' => 'invalid json format']);
            }
        } catch (\Throwable $th) {
            return response()->json(['format' => 'invalid json format']);
        }


        $counter = 0;
        foreach ($filters as $filter) {
            if (!isset($filter->min) && !isset($filter->ids)) {  return response()->json(['filter' => 'filter missing ids or min']); }

            // query for ids
            if (isset($filter->ids) && count($filter->ids) > 0) {
                $sql = 'competence_fk =';

                // foreach($filter->ids as $key) {
                //     $sql .= " OR competence_fk =".$key;
                // }

                $sql .= implode(" OR competence_fk = ", $filter->ids);

                // dd($sql);
                $select = DB::select(
                    "SELECT `subject_fk`, `profile_fk`
                     FROM `selection`
                     LEFT JOIN `competence` ON `competence`.`id` = `selection`.`competence_fk`
                     WHERE `selection`.`value` = 1 AND ({$sql})
                     GROUP BY `subject_fk`, `profile_fk`
                     ORDER BY `subject_fk`, `profile_fk`, `page`
                     "
                );
            }
            // query for min
            else {
                $select = DB::select(
                    "SELECT `subject_fk`, `profile_fk`, sum(`selection`.`value`) as `totalSelected`
                    FROM `selection`
                    LEFT JOIN `competence` ON `competence`.`id` = `selection`.`competence_fk`
                    WHERE `page` = ?
                    GROUP BY `subject_fk`, `profile_fk`, `page`
                    HAVING  sum(`selection`.`value`) >= ?
                    ORDER BY `subject_fk`, `profile_fk`, `page`
                    ",
                    [ $filter->page, $filter->min ]
                );
            }

            $xxx = [];

            // add ids list
            foreach ($select as $xs) {
                array_push($xxx, $xs->subject_fk.'!'.$xs->profile_fk);
            }

            if ($counter == 0) {
                $data = $xxx;
            }

            if ($counter > 0) {
                $data = array_intersect_assoc($data, $xxx);
            }

            $counter++;
        }

        $rdata = [];

        foreach($data as $x) {
            $id =  explode('!', $x)[0];
            $profile =  explode('!', $x)[1];

            $listIds = DB::select(
                "SELECT `id`
                 FROM `competence`
                 LEFT JOIN selection ON selection.competence_fk = competence.id
                 WHERE `value` = 1 AND `subject_fk` = ? AND `profile_fk` = ?
                 ORDER BY `page`",
                 [ $id, $profile ]
             );
             $idlist = [];
             foreach ($listIds as $idl) {
                 array_push($idlist, $idl->id);
             }

            array_push($rdata, ['subject_fk'=>$id, 'profile_fk'=>$profile, 'ids' => $idlist]);
        }

        return response()->json($rdata);
    }
}