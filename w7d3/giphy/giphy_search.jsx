import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';
import { RECEIVE_SEARCH_GIPHYS, receiveSearchGiphys } from './actions/giphy_actions';

document.addEventListener("DOMContentLoaded", ()=> {
  const store = configureStore();
  window.receiveSearchGiphys = receiveSearchGiphys;
  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
});
