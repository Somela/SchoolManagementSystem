import React, { useState } from 'react';
import image from '../Images/Hotel.jpg';
import DateFnsUtils from '@date-io/date-fns';
import { KeyboardDatePicker, MuiPickersUtilsProvider } from '@material-ui/pickers';
import { useHistory } from 'react-router-dom'
import NavMenu from './NavMenu';
import moment from 'moment';

const Home = (props: any) => {
  let history = useHistory();
  const [selectedCheckInDate, setSelectedCheckInDate] = React.useState<Date | null>(
    new Date(),
  );
  const [roomType, setRoomType] = useState<string>("");
  const [adultCount, setAdultCount] = useState<string | number>(0);
  const [childCount, setChildCount] = useState<string | number>(0);
  const [selectedCheckOutDate, setSelectedCheckOutDate] = React.useState<Date | null>(
    new Date(),
  );
  const handleCheckInDateChange = (date: Date | null) => {
    setSelectedCheckInDate(date);
  };
  const handleCheckOutDateChange = (date: Date | null) => {
    setSelectedCheckOutDate(date);
  };

  const handleRoomType = (event: any) => {
    setRoomType(event.target.value);
  }

  const handleAdultCount = (event: any) => {
    setAdultCount(event.target.value);
  }
  const handleChildCount = (event: any) => {
    setChildCount(event.target.value);
  }

  const handleSearch = () => {
    var selectedCheckIn = moment(selectedCheckInDate);
    var selectedCheckOut = moment(selectedCheckOutDate);
    var nights = selectedCheckOut.diff(selectedCheckIn,"days");
    history.push({
      pathname: "/book-tickets",
      state: {
        "RoomType": roomType,
        "SelectedCheckInDate": selectedCheckInDate,
        "SelectedCheckOutDate": selectedCheckOutDate,
        "AdultCount": adultCount,
        "ChildCount": childCount,
        "Nights":nights,
        state: props.location.state,
      }
    })
  }

  return (
    <div className='homeDiv'>
      <NavMenu/>
      <div className='wrapper'>
        <img src={image} className="img-responsive homeImage" alt="Responsive image" />
      </div>
      <div className='card'>
        <div className='card-header'>
          <h2 className='registerHeader'>Make Registration</h2>
        </div>
        <div className='card-body'>
          <div className='input-group mb-3'>
            <div className='input-group-prepend'>
              <span className='input-group-text' id="basic-addon1"><i className='fa-solid fa-bed'></i></span>
            </div>
            <select value={roomType} className='form-select' onChange={handleRoomType} aria-label="Default select example">
              <option key="0">Please Select Any</option>
              <option key="1">Room</option>
              <option key="2">Hall</option>
            </select>
          </div>
          <div className='input-group mb-3'>
            <div className='input-group-prepend'>
              <span className='input-group-text' id="basic-addon1"><i className='fa-solid fa-calendar'></i></span>
            </div>
            <MuiPickersUtilsProvider utils={DateFnsUtils}>
              <KeyboardDatePicker
                margin="normal"
                id="date-picker-dialog"
                label="CheckIn"
                format="MM/dd/yyyy"
                value={selectedCheckInDate}
                onChange={handleCheckInDateChange}
                KeyboardButtonProps={{
                  'aria-label': 'change date',
                }}
              />
            </MuiPickersUtilsProvider>
          </div>
          <div className='input-group mb-3'>
            <div className='input-group-prepend'>
              <span className='input-group-text' id="basic-addon1"><i className='fa-solid fa-calendar'></i></span>
            </div>
            <MuiPickersUtilsProvider utils={DateFnsUtils}>
              <KeyboardDatePicker
                margin="normal"
                id="date-picker-dialog"
                label="CheckOut"
                format="MM/dd/yyyy"
                value={selectedCheckOutDate}
                onChange={handleCheckOutDateChange}
                KeyboardButtonProps={{
                  'aria-label': 'change date',
                }}
              />
            </MuiPickersUtilsProvider>
          </div>
          <div className='input-group mb-3'>
            <div className='input-group-prepend'>
              <span className='input-group-text options' id="basic-addon1"><i className='fa-solid fa-user'></i></span>
            </div>
            <select value={adultCount} className='form-select' onChange={handleAdultCount} aria-label="Default select example">
              <option key="0">Please Select Any</option>
              <option key="1">1</option>
              <option key="2">2</option>
              <option key="3">3</option>
              <option key="4">4</option>
              <option key="5">5</option>
              <option key="6">6</option>
              <option key="7">7</option>
              <option key="8">8</option>
            </select>

            <div className='input-group-prepend'>
              <span className='input-group-text options' id="basic-addon1"><i className='fa-solid fa-child'></i></span>
            </div>
            <select value={childCount} className='form-select' onChange={handleChildCount} aria-label="Default select example">
              <option key="0">Please Select</option>
              <option key="1">1</option>
              <option key="2">2</option>
              <option key="3">3</option>
              <option key="4">4</option>
              <option key="5">5</option>
              <option key="6">6</option>
              <option key="7">7</option>
              <option key="8">8</option>
            </select>
          </div>
        </div>
        <div className='card-footer'>
          <button type='button' className='btn btn-sm btn-primary btnSearch' onClick={handleSearch}>Search</button>
        </div>
      </div>
    </div>
  )
}
export default Home;	