import { AppThunkAction } from "../applicaton-state";
import { KnownAction, LoadMenuActions } from "../action-types/load-menu-action-types";
import configData from "../../configuration.json";

export const loadMenuActionCreators = {
    loadMenuActionCreator: (): AppThunkAction<KnownAction> => (dispatch, getState) => {
        dispatch({ type: LoadMenuActions.LoadMenu_REQUEST });
        try {
            const appState = getState();
            if (appState && appState.loginresponse) {
                fetch(configData.SERVER_URL + "/api/ActivatedModules/Get-activatedModules", {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": 'application/json'
                    }
                }).then(res => res.json()).then(data => {
                    dispatch({
                        type: LoadMenuActions.LoadMenu_SUCCESS,
                        payload: data
                    })
                }).catch((Error)=>{
                    dispatch({
                        type: LoadMenuActions.LoadMenu_ERROR,
                        payload: Error
                    });
                })
            }
        }
        catch (error: any) {
            dispatch({
                type: LoadMenuActions.LoadMenu_ERROR,
                payload: error
            });
        }
    }
}