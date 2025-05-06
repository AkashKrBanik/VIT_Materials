
import reactLogo from './assets/react.svg'

function App() {
  return (
    <div>
      <b>First REACT App!!!</b>
    </div>
  )
}

function MyFunction() {
  var cTime = new Date().toTimeString();
  return (
    <div><p>From App.js:The current time is {cTime}</p></div>
  );
};

export default App
export {MyFunction};