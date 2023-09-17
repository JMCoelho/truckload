<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('caminhao', function (Blueprint $table) {
            $table->id();
            //$table->bigIncrements('id');
            $table->string("placa", 100);
            $table->string("transportadora", 100);
            $table->string("tipo", 100);
            $table->foreignId("user_id");
            $table->dateTime("updated_at",$precision = 0);
			$table->dateTime("created_at",$precision = 0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('caminhao');
    }
};
