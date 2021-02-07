'use strict';

// Burgers
const SIZE_SMALL = {
	'size': 'small', 
	'price': 50, 
	'calories': 20};
const SIZE_LARGE = {
	'size': 'large', 
	'price': 100, 
	'calories': 40};
const STUFFING_CHEESE = {
	'name': 'cheese', 
	'price': 10, 
	'calories': 20};
const STUFFING_SALAD = {
	'name': 'salad', 
	'price': 20, 
	'calories': 5};
const STUFFING_POTATO = {
	'name': 'potato', 
	'price': 15, 
	'calories': 10};
const TOPPING_MAYO = {
	'name': 'mayo', 
	'price': 20, 
	'calories': 5};
const TOPPING_SPICE = {
	'name': 'spice', 
	'price': 15, 
	'calories': 0};

// Pizzas
const MARGARITA = {
	'name': 'Margarita',
	'SMALL': {
		'size': 'small',
		'diameter': 40,
		'calories': 200,
		'price': 120
	},
	'LARGE': {
		'size': 'large',
		'diameter': 60,
		'calories': 500,
		'price': 170
	},
	'stuffings': ['tomatoes, cheese, souce']
}
const HAWAIS = {
	'name': 'Hawais',
	'SMALL': {
		'size': 'small',
		'diameter': 40,
		'calories': 250,
		'price': 150
	},
	'LARGE': {
		'size': 'large',
		'diameter': 60,
		'calories': 700,
		'price': 210
	},
	'stuffings': ['tomatoes', 'chicken', 'pineapple', 'cheese']
}

// Pizza's toppings
const TOPPING_DOUBLE_CHEESE = {
	'name': 'double cheese',
	'price': 20,
	'calories': 30
}
const TOPPING_MUSHROOMS = {
	'name': 'mushrooms',
	'price': 15,
	'calories': 20
}
const TOPPING_CORN = {
	'name': 'corn',
	'price': 20,
	'calories': 15
}

class Pizza{
	constructor(pizza, size){
		this.name = pizza.name;
		this.price = pizza[size].price;
		this.calories = pizza[size].calories;
		this.diameter = pizza[size].diameter;
		this.stuffings = pizza.stuffings;
		this.toppings = [];
	}
	calculatePrice(){
		return this.price;
	}
	calculateCalories(){
		return this.calories;
	}
	addTopping(topping){
		if(this.toppings.includes(topping)){
			console.log(`Your pizza already have ${topping.name} topping`);
		} else{
			this.price += topping.price;
			this.calories += topping.calories;
			this.toppings.push(topping);
			console.log(`Topping ${topping.name} was added`);
		}
	}
	removeTopping(topping){
		if(this.toppings.includes(topping)){
			const position = this.toppings.indexOf(topping);
			this.toppings.splice(position, 1);
			this.price -= topping.price;
			this.calories -= topping.calories;
			console.log(`Topping ${topping.name} deleted`);
		} else{
			console.log(`Your pizza haven't ${topping.name} topping`);
		}
	}
	returnName(){
		return this.name;
	}
	returnDiameter(){
		return this.diameter;
	}
	returnStuffings(){
		return this.stuffings.join(', ');
	}
	returnToppings(){
		const toppings = [];
		for(const topping of this.toppings){
			toppings.push(topping.name)
		}
		if(toppings.length === 0){
			return `Your pizza haven't any topping`;
		}
		return `Pizza's toppings: ${toppings.join(', ')}`;
	}
}

class Burger{
	constructor(size, stuffing) {
		this.price = size.price + stuffing.price;
		this.calories = size.calories + stuffing.calories;
		this.size = size;
		this.stuffing = stuffing;
		this.toppings = [];
	}
	calculatePrice(){
		return this.price;
	}
	calculateCalories(){
		return this.calories;
	}
	addTopping(topping){
		if(this.toppings.includes(topping)){
			console.log(`Burger already have ${topping.name} topping`);
		} else{
			this.price += topping.price;
			this.calories += topping.calories;
			this.toppings.push(topping);
			console.log(`Topping ${topping.name} was added`);
		}
	}
	removeTopping(topping){
		if(this.toppings.includes(topping)){
			const position = this.toppings.indexOf(topping);
			this.toppings.splice(position, 1);
			this.price -= topping.price;
			this.calories -= topping.calories;
			console.log(`Topping ${topping.name} deleted`);
		} else{
			console.log(`Burger haven't ${topping.name} topping`);
		}
	}
	returnToppings(){
		const toppings = [];
		for(const topping of this.toppings){
			toppings.push(topping.name)
		}
		if(toppings.length === 0){
			return `Burger haven't any topping`;
		}
		return `Burger's toppings: ${toppings.join(', ')}`;
	}
}

// TEST BURGER CLASS
const burger = new Burger(SIZE_SMALL, STUFFING_SALAD);
console.log('Before topping:');
console.log(`Burger price: ${burger.calculatePrice()}`);
console.log(`Burger calories: ${burger.calculateCalories()}`);
console.log();

burger.addTopping(TOPPING_SPICE);
console.log('After topping:');
console.log(`Burger price: ${burger.calculatePrice()}`);
console.log(`Burger calories: ${burger.calculateCalories()}`);
console.log();

console.log(burger.returnToppings());
console.log();

burger.removeTopping(TOPPING_SPICE);
console.log(burger.returnToppings());
console.log()

console.log(`Burger price: ${burger.calculatePrice()}`);
console.log(`Burger calories: ${burger.calculateCalories()}`);
console.log();

burger.addTopping(TOPPING_SPICE);
console.log(burger.returnToppings());
console.log();

burger.addTopping(TOPPING_SPICE);
console.log();
console.log('Test burger class is ended');
console.log('----------------------------');
console.log();


// TEST PIZZA CLASS
const pizza = new Pizza(HAWAIS, 'LARGE');
console.log(`Your pizza: ${pizza.returnName()}`);
console.log(`Stuffings: ${pizza.returnStuffings()}`);
console.log(pizza.returnToppings());
console.log();

pizza.addTopping(TOPPING_DOUBLE_CHEESE);

/*

Plans:

--> pizza_name
--> changeSize
--> removeStuffing
--> array for all order
--> remove any food order from array (change pizza)
--> object for archove orders

*/
