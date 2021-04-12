import React from 'react'
import { Route, Router, Switch } from 'react-router-dom'

import Airlines from './Airlines/Airlines'
import Airline from './Airline/Airline'

const App = () => (
  // <h1>HOLA AMIGO !</h1>
  <Switch>
    <Route exact path="/" component={Airlines} />
    <Route exact path="/airlines/:slug" component={Airline} />
  </Switch>
)

export default App