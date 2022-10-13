import { AppThunkAction } from "../../applicaton-state";
import { KnownAction, UpdateDormitoriesActions,DormitoryRequest } from "../../action-types/dormitory/update-domitories";
import configData from "../../../configuration.json";

export const UpdateDormitoriesActionCreators = {
    UpdateDormitoriesActionCreator: (request:DormitoryRequest): AppThunkAction<KnownAction> => (dispatch, getState) => {
        dispatch({ type: UpdateDormitoriesActions.UpdateDormitories_REQUEST });
        try {
            const appState = getState();
            if (appState && appState.loginresponse) {
                fetch(configData.SERVER_URL + "/api/Dormitory/update-domitory", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": 'application/json'
                    },
                    body:JSON.stringify({
                        
                    })
                }).then(res => res.json()).then(data => {
                    dispatch({
                        type: UpdateDormitoriesActions.UpdateDormitories_SUCCESS,
                        payload: data
                    })
                }).catch((Error)=>{
                    dispatch({
                        type: UpdateDormitoriesActions.UpdateDormitories_ERROR,
                        payload: Error
                    });
                })
            }
        }
        catch (error: any) {
            dispatch({
                type: UpdateDormitoriesActions.UpdateDormitories_ERROR,
                payload: error
            });
        }
    }
}