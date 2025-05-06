import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import ComponentA from './pages/FirstComponent.jsx'
import { BrowserRouter, Routes,Route } from 'react-router-dom'
import ComponentB from './pages/SecondComponent.jsx'

/*createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)*/

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);

const rct_my = ReactDOM.createRoot(document.getElementById('navigate'));
rct_my.render(
  <BrowserRouter>
    <ComponentA />
    <Routes>
              <Route path="componentB" element = {<ComponentB/>}/>
    </Routes>
    </BrowserRouter>
);
