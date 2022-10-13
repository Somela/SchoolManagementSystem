
import { Reducer } from 'redux';
import { LoginActions } from '../actions/action-types/login-type-actions';
import { LoginState, KnownAction } from '../actions/action-types/login-type-actions';


export const reducer:Reducer<LoginState> = (state: LoginState | undefined, incomingAction: KnownAction): LoginState => {
    if (state === undefined) {
        return {
            loginresponse: [],
            loading: false,
            error: null
        };
    }
    const action = incomingAction as KnownAction;
    switch (action.type) {
        case LoginActions.LOGIN_REQUEST:
            return {
                loading: true,
                loginresponse: [],
                error: null 
            };

        case LoginActions.LOGIN_SUCCESS:
            return {
                loading: false,
                loginresponse: action.payload,
                error: null 
            };
        case LoginActions.LOGIN_ERROR:
            return {
                loading: false,
                loginresponse:[],
                error: action.payload
            };

        default:
            return state;
    }
}