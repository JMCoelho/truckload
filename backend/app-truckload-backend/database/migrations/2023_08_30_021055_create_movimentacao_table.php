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
        Schema::create('movimentacao', function (Blueprint $table) {
            $table->id();
			//$table->bigIncrements('id');
            $table->dateTime('entrada', $precision = 0)->nullable();
            $table->dateTime('entrada_fabrica', $precision = 0)->nullable();
            $table->dateTime('entrada_carregamento', $precision = 0)->nullable();
            $table->dateTime('saida_carregamento', $precision = 0)->nullable();
            $table->dateTime('saida_fabrica', $precision = 0)->nullable();
            $table->dateTime('saida', $precision = 0)->nullable();
            $table->foreignId("agendamento_id");
            $table->foreignId("caminhao_id");
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
        Schema::dropIfExists('movimentacao');
    }
};
