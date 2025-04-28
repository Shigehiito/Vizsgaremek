<?php

namespace App\Http\Controllers;

use App\Models\Categories;
use App\Http\Requests\StoreCategoriesRequest;
use App\Http\Requests\UpdateCategoriesRequest;
use Illuminate\Support\Facades\Repsonse;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return \Response::json(
            [
                "data"=> [
                    ["categories"=> Categories::all()],
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
    public function store(StoreCategoriesRequest $request)
    {
        $categories = Categories::create($request->all());
        return response()->json($categories, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Categories $categories)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Categories $categories)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCategoriesRequest $request, Categories $id)
    {
        $id->update($request->all());
        return response()->json($id, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Categories $id)
    {
        $id->delete();
        return response()->json($id);
    }
}
