
import { Reducer } from 'redux';
import { LoadMenuState, KnownAction,LoadMenuActions } from '../actions/action-types/load-menu-action-types';


export const reducer:Reducer<LoadMenuState> = (state: LoadMenuState | undefined, incomingAction: KnownAction): LoadMenuState => {
    if (state === undefined) {
        return {
            LoadMenuresponse: [],
            loading: false,
            error: null
        };
    }
    const action = incomingAction as KnownAction;
    switch (action.type) {
        case LoadMenuActions.LoadMenu_REQUEST:
            return {
                loading: true,
                LoadMenuresponse: [],
                error: null 
            };

        case LoadMenuActions.LoadMenu_SUCCESS:
            return {
                loading: false,
                LoadMenuresponse: action.payload,
                error: null 
            };
        case LoadMenuActions.LoadMenu_ERROR:
            return {
                loading: false,
                LoadMenuresponse:[],
                error: action.payload
            };

        default:
            return state;
    }
}