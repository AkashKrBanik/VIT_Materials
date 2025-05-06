import React, { Component } from "react"; 

class CounterClass extends React.Component { 
	constructor() { 
		super(); 
		this.state = { 
			count: 0 
		}; 
		this.increase = this.increase.bind(this,6); //this- refers to the information embedded inside Counterclass
	} 

	increase(newCount) { 
		this.setState({ count: (this.state.count + 1)* newCount}); 
	} 

	render() { 
		return ( 
			<div style={{ margin: '50px' }}> 
				<h1>Click Add Button</h1> 
				<h2> {this.state.count}</h2> 
				<button onClick={this.increase}> BUTTON++</button> 

			</div> 
		) 
	} 
} 

export default CounterClass; 
