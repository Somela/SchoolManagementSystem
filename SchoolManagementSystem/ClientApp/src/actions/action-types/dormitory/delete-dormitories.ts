import { SuccessMessageResponse } from "../../../usuable/useable";

export enum DeleteDormitoriesActions{
    DeleteDormitories_REQUEST="DeleteDormitories_REQUEST",
    DeleteDormitories_SUCCESS = "DeleteDormitories_SUCCESS",
    DeleteDormitories_ERROR = "DeleteDormitories_ERROR"
}

export interface DormitoryRequest{
    id:number
}

export interface DeleteDormitoriesState {
    deleteDormitoriesresponse: SuccessMessageResponse[];
    loading: boolean;
    error: string | null;
}

export interface DeleteDormitoriesTypePending {
    type: DeleteDormitoriesActions.DeleteDormitories_REQUEST;
}

export interface DeleteDormitoriesTypeSuccess {
    type: DeleteDormitoriesActions.DeleteDormitories_SUCCESS;
    payload: SuccessMessageResponse[];
}

export interface DeleteDormitoriesTypeFail {
    type: DeleteDormitoriesActions.DeleteDormitories_ERROR;
    payload: string;
}

export type KnownAction = DeleteDormitoriesTypePending | DeleteDormitoriesTypeSuccess | DeleteDormitoriesTypeFail;