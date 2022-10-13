import { combineReducers } from "redux";
import * as loginReducer from "./login-reducer";
import * as loadMenu from "./load-menu-reducer";
import * as addDormitoriesresponse from "./dormitory/add-dormitories";
import * as deleteDormitoriesresponse from "./dormitory/delete-dormitories";
import * as getDormitoriesresponse from "./dormitory/get-dormitories";
import * as updateDormitoriesresponse from "./dormitory/update-dormitories";


export const rootReducer = combineReducers({
    loginresponse:loginReducer.reducer,
    loadMenu:loadMenu.reducer,
    addDormitoriesresponse:addDormitoriesresponse.reducer,
    deleteDormitoriesresponse:deleteDormitoriesresponse.reducer,
    getDormitoriesresponse:getDormitoriesresponse.reducer,
    updateDormitoriesresponse:updateDormitoriesresponse.reducer
});
export type RootState = ReturnType<typeof rootReducer>;