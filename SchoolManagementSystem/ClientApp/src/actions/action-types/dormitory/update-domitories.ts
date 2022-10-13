import { SuccessMessageResponse } from "../../../usuable/useable";

export enum UpdateDormitoriesActions{
    UpdateDormitories_REQUEST="UpdateDormitories_REQUEST",
    UpdateDormitories_SUCCESS = "UpdateDormitories_SUCCESS",
    UpdateDormitories_ERROR = "UpdateDormitories_ERROR"
}

export interface DormitoryRequest{
    id:number,
    dormitoryName:string,
    dormitoryDescription:string
}

export interface UpdateDormitoriesState {
    updateDormitoriesresponse: SuccessMessageResponse[];
    loading: boolean;
    error: string | null;
}

export interface UpdateDormitoriesTypePending {
    type: UpdateDormitoriesActions.UpdateDormitories_REQUEST;
}

export interface UpdateDormitoriesTypeSuccess {
    type: UpdateDormitoriesActions.UpdateDormitories_SUCCESS;
    payload: SuccessMessageResponse[];
}

export interface UpdateDormitoriesTypeFail {
    type: UpdateDormitoriesActions.UpdateDormitories_ERROR;
    payload: string;
}

export type KnownAction = UpdateDormitoriesTypePending | UpdateDormitoriesTypeSuccess | UpdateDormitoriesTypeFail;