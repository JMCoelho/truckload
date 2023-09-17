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
		Schema::create('user', function (Blueprint $table) {
			$table->id();
			//$table->bigIncrements('id');
			$table->string("name", 100);
			$table->string("login", 20);
			$table->string("email", 100);
			$table->string("password", 100);
			$table->dateTime("updated_at",$precision = 0);
			$table->dateTime("created_at",$precision = 0);
		});
	}

	/**
	 * Reverse the migrations.
	 */
	public function down(): void
	{
		Schema::dropIfExists('user');
	}
};
