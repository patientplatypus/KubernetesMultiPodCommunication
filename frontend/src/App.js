import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import axios from 'axios';

class App extends Component {

  componentDidMount(){
    var url = "http://"+window.location.hostname+":8080/test"
    console.log("the value of url : ", url);
    axios.get(url)
    .then(response=>{
      console.log('return from backend and response: ', response);
    })
    .catch(error=>{
      console.log('return from backend and error: ', error);
    })
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
}

export default App;
