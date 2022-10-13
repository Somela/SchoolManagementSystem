import { AppThunkAction } from "../../applicaton-state";
import { KnownAction, GetDormitoriesActions } from "../../action-types/dormitory/get-dormitories";
import configData from "../../../configuration.json";

export const getDormitoriesActionCreators = {
    getDormitoriesActionCreator: (): AppThunkAction<KnownAction> => (dispatch, getState) => {
        dispatch({ type: GetDormitoriesActions.GetDormitories_REQUEST });
        try {
            const appState = getState();
            if (appState && appState.loginresponse) {
                fetch(configData.SERVER_URL + "/api/Dormitory/Get-domitory", {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": 'application/json'
                    }
                }).then(res => res.json()).then(data => {
                    dispatch({
                        type: GetDormitoriesActions.GetDormitories_SUCCESS,
                        payload: data
                    })
                }).catch((Error)=>{
                    dispatch({
                        type: GetDormitoriesActions.GetDormitories_ERROR,
                        payload: Error
                    });
                })
            }
        }
        catch (error: any) {
            dispatch({
                type: GetDormitoriesActions.GetDormitories_ERROR,
                payload: error
            });
        }
    }
}