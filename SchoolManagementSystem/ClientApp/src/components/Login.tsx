import React, { useState, useEffect } from 'react';
import { makeStyles, Theme, createStyles } from '@material-ui/core/styles';
import { useDispatch, useSelector } from 'react-redux';
import { loginActionCreators } from '../actions/action-creator/login-action-creator';
import { RootState } from "../reducer/root-reducer";
import { useHistory } from 'react-router';
import NavMenu from './NavMenu';

const Login = (props: any) => {
    const [email,setEmail] = useState("");
    const [password,setPassword] = useState("");
    const dispatch = useDispatch();
    const history = useHistory();
    const loginresponse = useSelector((state: RootState) => state.loginresponse.loginresponse);
    useEffect(() => {
        if (loginresponse["role"]) {
            console.log(loginresponse);
            if (loginresponse["role"] === "Admin") {
                history.push(
                    {
                        pathname: "/admin-home",
                        state: loginresponse
                    }
                )
            }
        }
    },[loginresponse])
    return (
        <div className='fluid-container'>
            <NavMenu/>
            <div className='card signupCard'>
                <div className='card-header login'>
                    <span><b>Login</b></span>
                </div>
                <div className='card-body'>
                    <div className="row space">
                        <div className="input-group mb-3">
                            <span className="input-group-text" id="basic-addon1"><i className="fa fa-envelope icon"></i></span>
                            <input type="text" className="form-control" onChange={(e:React.ChangeEvent<HTMLInputElement>)=>{
                                // setEmail(e.target.value);
                                setEmail("somela.s@gmail.com")
                            }} placeholder="Username"  aria-label="Username" aria-describedby="basic-addon1" />
                        </div>
                    </div>
                    <div className="row space">
                    <div className="input-group mb-3">
                            <span className="input-group-text" id="basic-addon1"><i className="fa fa-key icon"></i></span>
                            <input type="password" className="form-control" placeholder="Password" aria-label="Password" onChange={(e:React.ChangeEvent<HTMLInputElement>)=>{
                                // setPassword(e.target.value);
                                setPassword("Sanjay@147");
                            }} aria-describedby="basic-addon1" />
                        </div>
                    </div>
                </div>
                <div className='card-footer '>
                    <button type="button" className="btn btn-sm btn-primary floatRight" onClick={()=>{
                        dispatch(loginActionCreators.loginActionCreator(email,password));
                    }}>Login</button>
                </div>
            </div>
        </div>
    )
}
export default Login;