import { AppThunkAction } from "../applicaton-state";
import { KnownAction, LoginActions } from "../action-types/login-type-actions";
import configData from "../../configuration.json";

export const loginActionCreators = {
    loginActionCreator: (email:string,password:string): AppThunkAction<KnownAction> => (dispatch, getState) => {
        dispatch({ type: LoginActions.LOGIN_REQUEST });
        try {
            const appState = getState();
            if (appState && appState.loginresponse) {
                fetch(configData.SERVER_URL + "/api/Login/authenticate", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": 'application/json'
                    },
                    body:JSON.stringify({
                        Email:email,
                        Password:password
                    })
                }).then(res => res.json()).then(data => {
                    dispatch({
                        type: LoginActions.LOGIN_SUCCESS,
                        payload: data
                    })
                }).catch((Error)=>{
                    dispatch({
                        type: LoginActions.LOGIN_ERROR,
                        payload: Error
                    });
                })
            }
        }
        catch (error: any) {
            dispatch({
                type: LoginActions.LOGIN_ERROR,
                payload: error
            });
        }
    }
}