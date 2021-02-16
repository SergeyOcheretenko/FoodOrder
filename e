[33mcommit 869f90032b450b66f9236670ccb86eaa2596ec04[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m, [m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: Sergey Ocheretenko <ocheretenko.s@gmail.com>
Date:   Sun Feb 7 22:27:30 2021 +0200

    Add Pizza class, update consts

[1mdiff --git a/scripts/food_order.js b/scripts/food_order.js[m
[1mindex 63c6933..0c1db25 100644[m
[1m--- a/scripts/food_order.js[m
[1m+++ b/scripts/food_order.js[m
[36m@@ -1,12 +1,142 @@[m
 'use strict';[m
 [m
[31m-const SIZE_SMALL = {'size': 'small', 'price': 50, 'calories': 20};[m
[31m-const SIZE_LARGE = {'size': 'large', 'price': 100, 'calories': 40};[m
[31m-const STUFFING_CHEESE = {'name': 'cheese', 'price': 10, 'calories': 20};[m
[31m-const STUFFING_SALAD = {'name': 'salad', 'price': 20, 'calories': 5};[m
[31m-const STUFFING_POTATO = {'name': 'potato', 'price': 15, 'calories': 10};[m
[31m-const TOPPING_MAYO = {'name': 'mayo', 'price': 20, 'calories': 5};[m
[31m-const TOPPING_SPICE = {'name': 'spice', 'price': 15, 'calories': 0};[m
[32m+[m[32m// Burgers[m
[32m+[m[32mconst SIZE_SMALL = {[m
[32m+[m	[32m'size': 'small',[m[41m [m
[32m+[m	[32m'price': 50,[m[41m [m
[32m+[m	[32m'calories': 20};[m
[32m+[m[32mconst SIZE_LARGE = {[m
[32m+[m	[32m'size': 'large',[m[41m [m
[32m+[m	[32m'price': 100,[m[41m [m
[32m+[m	[32m'calories': 40};[m
[32m+[m[32mconst STUFFING_CHEESE = {[m
[32m+[m	[32m'name': 'cheese',[m[41m [m
[32m+[m	[32m'price': 10,[m[41m [m
[32m+[m	[32m'calories': 20};[m
[32m+[m[32mconst STUFFING_SALAD = {[m
[32m+[m	[32m'name': 'salad',[m[41m [m
[32m+[m	[32m'price': 20,[m[41m [m
[32m+[m	[32m'calories': 5};[m
[32m+[m[32mconst STUFFING_POTATO = {[m
[32m+[m	[32m'name': 'potato',[m[41m [m
[32m+[m	[32m'price': 15,[m[41m [m
[32m+[m	[32m'calories': 10};[m
[32m+[m[32mconst TOPPING_MAYO = {[m
[32m+[m	[32m'name': 'mayo',[m[41m [m
[32m+[m	[32m'price': 20,[m[41m [m
[32m+[m	[32m'calories': 5};[m
[32m+[m[32mconst TOPPING_SPICE = {[m
[32m+[m	[32m'name': 'spice',[m[41m [m
[32m+[m	[32m'price': 15,[m[41m [m
[32m+[m	[32m'calories': 0};[m
[32m+[m
[32m+[m[32m// Pizzas[m
[32m+[m[32mconst MARGARITA = {[m
[32m+[m	[32m'name': 'Margarita',[m
[32m+[m	[32m'SMALL': {[m
[32m+[m		[32m'size': 'small',[m
[32m+[m		[32m'diameter': 40,[m
[32m+[m		[32m'calories': 200,[m
[32m+[m		[32m'price': 120[m
[32m+[m	[32m},[m
[32m+[m	[32m'LARGE': {[m
[32m+[m		[32m'size': 'large',[m
[32m+[m		[32m'diameter': 60,[m
[32m+[m		[32m'calories': 500,[m
[32m+[m		[32m'price': 170[m
[32m+[m	[32m},[m
[32m+[m	[32m'stuffings': ['tomatoes, cheese, souce'][m
[32m+[m[32m}[m
[32m+[m[32mconst HAWAIS = {[m
[32m+[m	[32m'name': 'Hawais',[m
[32m+[m	[32m'SMALL': {[m
[32m+[m		[32m'size': 'small',[m
[32m+[m		[32m'diameter': 40,[m
[32m+[m		[32m'calories': 250,[m
[32m+[m		[32m'price': 150[m
[32m+[m	[32m},[m
[32m+[m	[32m'LARGE': {[m
[32m+[m		[32m'size': 'large',[m
[32m+[m		[32m'diameter': 60,[m
[32m+[m		[32m'calories': 700,[m
[32m+[m		[32m'price': 210[m
[32m+[m	[32m},[m
[32m+[m	[32m'stuffings': ['tomatoes', 'chicken', 'pineapple', 'cheese'][m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m// Pizza's toppings[m
[32m+[m[32mconst TOPPING_DOUBLE_CHEESE = {[m
[32m+[m	[32m'name': 'double cheese',[m
[32m+[m	[32m'price': 20,[m
[32m+[m	[32m'calories': 30[m
[32m+[m[32m}[m
[32m+[m[32mconst TOPPING_MUSHROOMS = {[m
[32m+[m	[32m'name': 'mushrooms',[m
[32m+[m	[32m'price': 15,[m
[32m+[m	[32m'calories': 20[m
[32m+[m[32m}[m
[32m+[m[32mconst TOPPING_CORN = {[m
[32m+[m	[32m'name': 'corn',[m
[32m+[m	[32m'price': 20,[m
[32m+[m	[32m'calories': 15[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mclass Pizza{[m
[32m+[m	[32mconstructor(pizza, size){[m
[32m+[m		[32mthis.name = pizza.name;[m
[32m+[m		[32mthis.price = pizza[size].price;[m
[32m+[m		[32mthis.calories = pizza[size].calories;[m
[32m+[m		[32mthis.diameter = pizza[size].diameter;[m
[32m+[m		[32mthis.stuffings = pizza.stuffings;[m
[32m+[m		[32mthis.toppings = [];[m
[32m+[m	[32m}[m
[32m+[m	[32mcalculatePrice(){[m
[32m+[m		[32mreturn this.price;[m
[32m+[m	[32m}[m
[32m+[m	[32mcalculateCalories(){[m
[32m+[m		[32mreturn this.calories;[m
[32m+[m	[32m}[m
[32m+[m	[32maddTopping(topping){[m
[32m+[m		[32mif(this.toppings.includes(topping)){[m
[32m+[m			[32mconsole.log(`Your pizza already have ${topping.name} topping`);[m
[32m+[m		[32m} else{[m
[32m+[m			[32mthis.price += topping.price;[m
[32m+[m			[32mthis.calories += topping.calories;[m
[32m+[m			[32mthis.toppings.push(topping);[m
[32m+[m			[32mconsole.log(`Topping ${topping.name} was added`);[m
[32m+[m		[32m}[m
[32m+[m	[32m}[m
[32m+[m	[32mremoveTopping(topping){[m
[32m+[m		[32mif(this.toppings.includes(topping)){[m
[32m+[m			[32mconst position = this.toppings.indexOf(topping);[m
[32m+[m			[32mthis.toppings.splice(position, 1);[m
[32m+[m			[32mthis.price -= topping.price;[m
[32m+[m			[32mthis.calories -= topping.calories;[m
[32m+[m			[32mconsole.log(`Topping ${topping.name} deleted`);[m
[32m+[m		[32m} else{[m
[32m+[m			[32mconsole.log(`Your pizza haven't ${topping.name} topping`);[m
[32m+[m		[32m}[m
[32m+[m	[32m}[m
[32m+[m	[32mreturnName(){[m
[32m+[m		[32mreturn this.name;[m
[32m+[m	[32m}[m
[32m+[m	[32mreturnDiameter(){[m
[32m+[m		[32mreturn this.diameter;[m
[32m+[m	[32m}[m
[32m+[m	[32mreturnStuffings(){[m
[32m+[m		[32mreturn this.stuffings.join(', ');[m
[32m+[m	[32m}[m
[32m+[m	[32mreturnToppings(){[m
[32m+[m		[32mconst toppings = [];[m
[32m+[m		[32mfor(const topping of this.toppings){[m
[32m+[m			[32mtoppings.push(topping.name)[m
[32m+[m		[32m}[m
[32m+[m		[32mif(toppings.length === 0){[m
[32m+[m			[32mreturn `Your pizza haven't any topping`;[m
[32m+[m		[32m}[m
[32m+[m		[32mreturn `Pizza's toppings: ${toppings.join(', ')}`;[m
[32m+[m	[32m}[m
[32m+[m[32m}[m
 [m
 class Burger{[m
 	constructor(size, stuffing) {[m
[36m@@ -14,7 +144,7 @@[m [mclass Burger{[m
 		this.calories = size.calories + stuffing.calories;[m
 		this.size = size;[m
 		this.stuffing = stuffing;[m
[31m-		this.topping = [];[m
[32m+[m		[32mthis.toppings = [];[m
 	}[m
 	calculatePrice(){[m
 		return this.price;[m
[36m@@ -23,19 +153,21 @@[m [mclass Burger{[m
 		return this.calories;[m
 	}[m
 	addTopping(topping){[m
[31m-		if(this.topping.includes(topping)){[m
[32m+[m		[32mif(this.toppings.includes(topping)){[m
 			console.log(`Burger already have ${topping.name} topping`);[m
 		} else{[m
 			this.price += topping.price;[m
 			this.calories += topping.calories;[m
[31m-			this.topping.push(topping);[m
[32m+[m			[32mthis.toppings.push(topping);[m
 			console.log(`Topping ${topping.name} was added`);[m
 		}[m
 	}[m
 	removeTopping(topping){[m
[31m-		if(this.toping.includes(topping)){[m
[31m-			const position = this.topping.indexOf(topping);[m
[31m-			this.topping.splice(position, 1);[m
[32m+[m		[32mif(this.toppings.includes(topping)){[m
[32m+[m			[32mconst position = this.toppings.indexOf(topping);[m
[32m+[m			[32mthis.toppings.splice(position, 1);[m
[32m+[m			[32mthis.price -= topping.price;[m
[32m+[m			[32mthis.calories -= topping.calories;[m
 			console.log(`Topping ${topping.name} deleted`);[m
 		} else{[m
 			console.log(`Burger haven't ${topping.name} topping`);[m
[36m@@ -43,7 +175,7 @@[m [mclass Burger{[m
 	}[m
 	returnToppings(){[m
 		const toppings = [];[m
[31m-		for(const topping of this.topping){[m
[32m+[m		[32mfor(const topping of this.toppings){[m
 			toppings.push(topping.name)[m
 		}[m
 		if(toppings.length === 0){[m
[36m@@ -53,6 +185,7 @@[m [mclass Burger{[m
 	}[m
 }[m
 [m
[32m+[m[32m// TEST BURGER CLASS[m
 const burger = new Burger(SIZE_SMALL, STUFFING_SALAD);[m
 console.log('Before topping:');[m
 console.log(`Burger p