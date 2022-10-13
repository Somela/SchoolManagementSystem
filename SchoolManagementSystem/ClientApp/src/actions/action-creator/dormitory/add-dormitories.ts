import { AppThunkAction } from "../../applicaton-state";
import { KnownAction, AddDormitoriesActions, DormitoryRequest } from '../../action-types/dormitory/add-dormitories';
import configData from "../../../configuration.json";

export const addDormitoriesActionCreators = {
    addDormitoriesActionCreator: (request:DormitoryRequest): AppThunkAction<KnownAction> => (dispatch, getState) => {
        dispatch({ type: AddDormitoriesActions.AddDormitories_REQUEST });
        try {
            const appState = getState();
            if (appState && appState.loginresponse) {
                fetch(configData.SERVER_URL + "/api/Dormitory/add-domitory", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": 'application/json'
                    },
                    body:JSON.stringify({
                        dormitoryName:request.dormitoryName,
                        dormitoryDescription:request.dormitoryDescription
                    })
                }).then(res => res.json()).then(data => {
                    dispatch({
                        type: AddDormitoriesActions.AddDormitories_SUCCESS,
                        payload: data
                    })
                }).catch((Error)=>{
                    dispatch({
                        type: AddDormitoriesActions.AddDormitories_ERROR,
                        payload: Error
                    });
                })
            }
        }
        catch (error: any) {
            dispatch({
                type: AddDormitoriesActions.AddDormitories_ERROR,
                payload: error
            });
        }
    }
}