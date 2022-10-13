import { IMenusList } from "../../usuable/useable";

export enum LoadMenuActions{
    LoadMenu_REQUEST = "LoadMenu_REQUEST",
    LoadMenu_SUCCESS = "LoadMenu_SUCCESS",
    LoadMenu_ERROR = "LoadMenu_ERROR"
}

export interface LoadMenuState {
    LoadMenuresponse: IMenusList[];
    loading: boolean;
    error: string | null;
}

export interface LoadMenuTypePending {
    type: LoadMenuActions.LoadMenu_REQUEST;
}

export interface LoadMenuTypeSuccess {
    type: LoadMenuActions.LoadMenu_SUCCESS;
    payload: IMenusList[];
}

export interface LoadMenuTypeFail {
    type: LoadMenuActions.LoadMenu_ERROR;
    payload: string;
}

export type KnownAction = LoadMenuTypePending | LoadMenuTypeSuccess | LoadMenuTypeFail;