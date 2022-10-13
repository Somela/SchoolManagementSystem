
import { Reducer } from 'redux';
import { UpdateDormitoriesState, KnownAction,UpdateDormitoriesActions } from '../../actions/action-types/dormitory/update-domitories';


export const reducer:Reducer<UpdateDormitoriesState> = (state: UpdateDormitoriesState | undefined, incomingAction: KnownAction): UpdateDormitoriesState => {
    if (state === undefined) {
        return {
            updateDormitoriesresponse: [],
            loading: false,
            error: null
        };
    }
    const action = incomingAction as KnownAction;
    switch (action.type) {
        case UpdateDormitoriesActions.UpdateDormitories_REQUEST:
            return {
                loading: true,
                updateDormitoriesresponse: [],
                error: null 
            };

        case UpdateDormitoriesActions.UpdateDormitories_SUCCESS:
            return {
                loading: false,
                updateDormitoriesresponse: action.payload,
                error: null 
            };
        case UpdateDormitoriesActions.UpdateDormitories_ERROR:
            return {
                loading: false,
                updateDormitoriesresponse:[],
                error: action.payload
            };

        default:
            return state;
    }
}