import React from 'react';

class MultiGrocery extends React.Component {
      constructor(props) {
         super(props);
         this.state = {  
            //data: props.itemName
            //;props.itemPrice;props.itemDate;props.itemGST
            data1: props.itemName,
            data2: props.itemPrice,
            data3: props.itemDate.toString(),
            data4: props.itemGST
         }  
      } 
      
    render() {
      return <span>Items: {this.state.data1} : {this.state.data2} : {this.state.data3} : {this.state.data4}</span>;      
    }
 }
 
 export default MultiGrocery;