<?php

namespace App\Http\Controllers;

use App\Models\Roles;
use App\Http\Requests\StoreRolesRequest;
use App\Http\Requests\UpdateRolesRequest;
use Illuminate\Support\Facades\Repsonse;

class RolesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return \Response::json(
            [
                "data"=> [
                    ["roles"=> Roles::all()],
                ],
                "success"=> true,
                "message"=> "",
            ], 200
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRolesRequest $request)
    {
        $roles = Roles::create($request->all());
        return response()->json($roles, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Roles $roles)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Roles $roles)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRolesRequest $request, Roles $id)
    {
        $id->update($request->all());
        return response()->json($id, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Roles $id)
    {
        $id->delete();
        return response()->json($id);
    }
}
