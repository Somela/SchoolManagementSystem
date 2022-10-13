import * as React from 'react';
// import { Route } from 'react-router';
import Layout from './components/Layout';
// import Home from './components/Home';

import './custom.css'

import { Route, BrowserRouter } from "react-router-dom";
import "./App.css"
import Login from './components/Login';
import AdminHome from './components/admin-home';

const App = () => {
  return (
    <BrowserRouter>
      <Layout>
      <Route exact path='/' component={Login} />
      <Route path="/admin-home" component={AdminHome} />
      {/* <Route path='/book-tickets' component={BookTickets} />
      <Route path="/standard-room" component={StandardRoom} />
      <Route path="/executive-room" component={ExecutiveRoom} />
      <Route path="/deluxe-room" component={DeluxeTypeRoom} />
      <Route path="/honeymoon-room" component={HoneyMoonRoom} />
      <Route path="/summary-page" component={UserSummaryPage} />
      <Route path="/sign-up" component={SignUp} />
      <Route path="/login" component={Login} />
      <Route path="/payments" component={Payments} />
      <Route path="/payment-receipt" component={PaymentReceipt} />
      <Route path="/adminHome" component={AdminHome} /> */}
      {/* <Route path='/fetch-data/:startDateIndex?' component={FetchData} /> */}
      </Layout>
      </BrowserRouter>
  );
}
export default App;