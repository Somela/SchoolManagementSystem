
import { Reducer } from 'redux';
import { GetDormitoriesState, KnownAction,GetDormitoriesActions } from '../../actions/action-types/dormitory/get-dormitories';


export const reducer:Reducer<GetDormitoriesState> = (state: GetDormitoriesState | undefined, incomingAction: KnownAction): GetDormitoriesState => {
    if (state === undefined) {
        return {
            getDormitoriesresponse: [],
            loading: false,
            error: null
        };
    }
    const action = incomingAction as KnownAction;
    switch (action.type) {
        case GetDormitoriesActions.GetDormitories_REQUEST:
            return {
                loading: true,
                getDormitoriesresponse: [],
                error: null 
            };

        case GetDormitoriesActions.GetDormitories_SUCCESS:
            return {
                loading: false,
                getDormitoriesresponse: action.payload,
                error: null 
            };
        case GetDormitoriesActions.GetDormitories_ERROR:
            return {
                loading: false,
                getDormitoriesresponse:[],
                error: action.payload
            };

        default:
            return state;
    }
}