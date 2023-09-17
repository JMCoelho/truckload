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
        Schema::create('agendamento', function (Blueprint $table)
        {
            $table->id();
			$table->string("carreta", 100);
			$table->string("nota_fiscal", 100);
            $table->dateTime('data_agendada', $precision = 0);
            $table->foreignId("caminhao_id");
            $table->foreignId("user_id");
            $table->integer('status');
            $table->dateTime("updated_at",$precision = 0);
			$table->dateTime("created_at",$precision = 0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('agendamento');
    }
};
