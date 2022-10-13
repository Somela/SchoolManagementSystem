import { SuccessMessageResponse } from "../../../usuable/useable";

export enum AddDormitoriesActions{
    AddDormitories_REQUEST="AddDormitories_REQUEST",
    AddDormitories_SUCCESS = "AddDormitories_SUCCESS",
    AddDormitories_ERROR = "AddDormitories_ERROR"
}

export interface DormitoryRequest{
    dormitoryName:string,
    dormitoryDescription:string
}

export interface AddDormitoriesState {
    addDormitoriesresponse: SuccessMessageResponse[];
    loading: boolean;
    error: string | null;
}

export interface AddDormitoriesTypePending {
    type: AddDormitoriesActions.AddDormitories_REQUEST;
}

export interface AddDormitoriesTypeSuccess {
    type: AddDormitoriesActions.AddDormitories_SUCCESS;
    payload: SuccessMessageResponse[];
}

export interface AddDormitoriesTypeFail {
    type: AddDormitoriesActions.AddDormitories_ERROR;
    payload: string;
}

export type KnownAction = AddDormitoriesTypePending | AddDormitoriesTypeSuccess | AddDormitoriesTypeFail;