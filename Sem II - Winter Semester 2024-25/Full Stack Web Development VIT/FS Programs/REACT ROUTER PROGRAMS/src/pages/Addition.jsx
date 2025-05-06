import { useParams } from "react-router-dom";

export default function Summation () {
  const { vara, varb } = useParams();
  var varc= Number(vara)+ Number(varb);

  return (
    <div>
      <h1>Variable a= {vara}</h1>
      <h1>Variable b= {varb}</h1>
      <h2>Sum c= {varc}</h2>
    </div>
  );
};