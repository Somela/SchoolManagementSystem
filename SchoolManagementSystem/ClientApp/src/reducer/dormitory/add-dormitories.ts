
import { Reducer } from 'redux';
import { AddDormitoriesState, KnownAction,AddDormitoriesActions } from '../../actions/action-types/dormitory/add-dormitories';


export const reducer:Reducer<AddDormitoriesState> = (state: AddDormitoriesState | undefined, incomingAction: KnownAction): AddDormitoriesState => {
    if (state === undefined) {
        return {
            addDormitoriesresponse: [],
            loading: false,
            error: null
        };
    }
    const action = incomingAction as KnownAction;
    switch (action.type) {
        case AddDormitoriesActions.AddDormitories_REQUEST:
            return {
                loading: true,
                addDormitoriesresponse: [],
                error: null 
            };

        case AddDormitoriesActions.AddDormitories_SUCCESS:
            return {
                loading: false,
                addDormitoriesresponse: action.payload,
                error: null 
            };
        case AddDormitoriesActions.AddDormitories_ERROR:
            return {
                loading: false,
                addDormitoriesresponse:[],
                error: action.payload
            };

        default:
            return state;
    }
}