import React from 'react';  

class ControlledFormComp extends React.Component {
    constructor(props) {  
        super(props);  
        this.state={
            username : ''
        };
        this.handleUsernameChange = this.handleUsernameChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this); 
    }  
    
    handleSubmit(e) {
        e.preventDefault();
		/*const cred = { this.state.username, "test123" };
		const response = await fetch("/members", {
						method: "POST",
						headers: {
							"Content-Type": "application/json"
						},
					body: JSON.stringify(cred)
				});*/
        alert(this.state.username);
		//alert(cred);
     }
    handleUsernameChange(e) {
        this.setState({
           username : e.target.value
        });
     } 
    render() {  
        return (  
            <div>
            <form onSubmit={this.handleSubmit}>
                <h2>Sign up-CONTROLLED</h2>               
                <label htmlFor='Username'>Username</label>
                <input type="text" name="username" onChange={this.handleUsernameChange} value={this.state.username} />
                <button type='submit'>VIEW</button>
				
            </form>{this.state.username} 
            </div>
          );  
     }  
}
export default ControlledFormComp;