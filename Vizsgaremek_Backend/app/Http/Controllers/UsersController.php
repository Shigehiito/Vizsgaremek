<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Requests\StoreUsersRequest;
use App\Http\Requests\UpdateUsersRequest;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return \Response::json(
            [
                "data"=> [
                    ["users"=> User::all()],
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
    public function store(StoreUsersRequest $request)
    {
        $users = User::create($request->all());
        return response()->json($users, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Users $users)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Users $users)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateUsersRequest $request, Users $id)
    {
        $id->update($request->all());
        return response()->json($id, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Users $id)
    {
        $id->delete();
        return response()->json($id);
    }
}
