import { AppThunkAction } from "../../applicaton-state";
import { KnownAction, DeleteDormitoriesActions } from "../../action-types/dormitory/delete-dormitories";
import configData from "../../../configuration.json";
import { DormitoryRequest } from '../../action-types/dormitory/delete-dormitories';

export const DeleteDormitoriesActionCreators = {
    DeleteDormitoriesActionCreator: (request:DormitoryRequest): AppThunkAction<KnownAction> => (dispatch, getState) => {
        dispatch({ type: DeleteDormitoriesActions.DeleteDormitories_REQUEST });
        try {
            const appState = getState();
            if (appState && appState.loginresponse) {
                fetch(configData.SERVER_URL + "/api/Dormitory/delete-domitory", {
                    method: "Delete",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": 'application/json'
                    },
                    body:JSON.stringify({
                        id:request.id
                    })
                }).then(res => res.json()).then(data => {
                    dispatch({
                        type: DeleteDormitoriesActions.DeleteDormitories_SUCCESS,
                        payload: data
                    })
                }).catch((Error)=>{
                    dispatch({
                        type: DeleteDormitoriesActions.DeleteDormitories_ERROR,
                        payload: Error
                    });
                })
            }
        }
        catch (error: any) {
            dispatch({
                type: DeleteDormitoriesActions.DeleteDormitories_ERROR,
                payload: error
            });
        }
    }
}