import React from 'react';  

class UnControlledFormComp extends React.Component {
    constructor(props) {  
        super(props);  
        this.updateSubmit = this.updateSubmit.bind(this);           
        this.emailRef = React.createRef();
        this.passRef = React.createRef(); 
    }  
    updateSubmit() {
        //this.input.email  
        //alert('You have entered' +{this.emailRef.current.value}+'and CompanyName successfully.');  
        alert(this.emailRef.current.value);
        //event.preventDefault();  
    }  
    render() {  
        return (  
            <form onSubmit={this.updateSubmit}>
                <h2>Sign up</h2>               
                <label htmlFor='email'>Email address</label>
                <input type='email'  name='email' ref={this.emailRef}/>
                <label htmlFor='password'>Password</label>
                <input type='password' name='password' ref={this.passRef} />
                <button type='submit'>Sign up</button>
            </form> 
             
          );  
     }  
}
export default UnControlledFormComp;