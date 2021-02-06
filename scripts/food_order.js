'use strict';

const SIZE_SMALL = {'size': 'small', 'price': 50, 'calories': 20};
const SIZE_LARGE = {'size': 'large', 'price': 100, 'calories': 40};
const STUFFING_CHEESE = {'name': 'cheese', 'price': 10, 'calories': 20};
const STUFFING_SALAD = {'name': 'salad', 'price': 20, 'calories': 5};
const STUFFING_POTATO = {'name': 'potato', 'price': 15, 'calories': 10};
const TOPPING_MAYO = {'name': 'mayo', 'price': 20, 'calories': 5};
const TOPPING_SPICE = {'name': 'spice', 'price': 15, 'calories': 0};

class Burger{
	constructor(size, stuffing) {
		this.price = size.price + stuffing.price;
		this.calories = size.calories + stuffing.calories;
		this.size = size;
		this.stuffing = stuffing;
		this.topping = [];
	}
	calculatePrice(){
		return this.price;
	}
	calculateCalories(){
		return this.calories;
	}
	addTopping(topping){
		if(this.topping.includes(topping)){
			console.log(`Burger already have ${topping.name} topping`);
		} else{
			this.price += topping.price;
			this.calories += topping.calories;
			this.topping.push(topping);
			console.log(`Topping ${topping.name} was added`);
		}
	}
	removeTopping(topping){
		if(this.toping.includes(topping)){
			const position = this.topping.indexOf(topping);
			this.topping.splice(position, 1);
			console.log(`Topping ${topping.name} deleted`);
		} else{
			console.log(`Burger haven't ${topping.name} topping`);
		}
	}
	returnToppings(){
		const toppings = [];
		for(const topping of this.topping){
			toppings.push(topping.name)
		}
		if(toppings.length === 0){
			return `Burger haven't any topping`;
		}
		return `Burger's toppings: ${toppings.join(', ')}`;
	}
}

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

burger.addTopping(TOPPING_SPICE);
