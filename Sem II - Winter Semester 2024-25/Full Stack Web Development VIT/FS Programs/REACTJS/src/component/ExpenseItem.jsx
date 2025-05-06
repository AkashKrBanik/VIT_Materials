import React from 'react';
import './ExpenseItem.css';
class ExpenseItem extends React.Component {   
   render() {  
    var cTime = new Date().toString();
      return (  
         <div className="itemStyle"> 
             <div><b>Item:</b> <em>Mango Juice</em></div>
             <div><b>Amount:</b> <em>30.00</em></div>
             <div><b>Spend Date:</b> <em>{cTime}</em></div>
            <div><b>Category:</b> <em>Food</em></div> 
         </div>  
      );  
   }  
}
export default ExpenseItem;  