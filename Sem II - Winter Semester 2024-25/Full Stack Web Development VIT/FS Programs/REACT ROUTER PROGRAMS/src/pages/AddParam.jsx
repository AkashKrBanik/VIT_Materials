import { useParams } from "react-router-dom";

export default function Fact () {
  const {id} = useParams();
  var fact=1;  
  for(var i=1;i<=id;i++){
      fact = fact *i;
  }
  return (
    <div>
      <h1>Factorial of {id} is {fact}</h1>
      </div>
      //http://localhost:5173/firstvar/5/secondvar/6
  );

  /*const { id } = useParams();

  // Check if the ID is a number
  if (!/^\d+$/.test(id)) {
    return <h1>Invalid Blog ID:{id}</h1>;
  }

  return <h1>Blog Post ID: {id}</h1>;*/

};
