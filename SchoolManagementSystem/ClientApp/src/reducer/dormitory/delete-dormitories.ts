
import { Reducer } from 'redux';
import { DeleteDormitoriesState, KnownAction,DeleteDormitoriesActions } from '../../actions/action-types/dormitory/delete-dormitories';


export const reducer:Reducer<DeleteDormitoriesState> = (state: DeleteDormitoriesState | undefined, incomingAction: KnownAction): DeleteDormitoriesState => {
    if (state === undefined) {
        return {
            deleteDormitoriesresponse: [],
            loading: false,
            error: null
        };
    }
    const action = incomingAction as KnownAction;
    switch (action.type) {
        case DeleteDormitoriesActions.DeleteDormitories_REQUEST:
            return {
                loading: true,
                deleteDormitoriesresponse: [],
                error: null 
            };

        case DeleteDormitoriesActions.DeleteDormitories_SUCCESS:
            return {
                loading: false,
                deleteDormitoriesresponse: action.payload,
                error: null 
            };
        case DeleteDormitoriesActions.DeleteDormitories_ERROR:
            return {
                loading: false,
                deleteDormitoriesresponse:[],
                error: action.payload
            };

        default:
            return state;
    }
}