import { Box } from '@material-ui/core';
import React, { useState } from 'react';
import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { QuickSearchToolbar2 } from '../usuable/additional';
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Snackbar, TextareaAutosize } from '@mui/material';
import { Close, CloseTwoTone, DeleteTwoTone, EditTwoTone, SaveAltTwoTone, ViewDayTwoTone } from '@mui/icons-material';
import { escapeRegExp, IMenusList } from '../usuable/useable';
import { RootState } from '../reducer/root-reducer';
import { useSelector, useDispatch } from 'react-redux';
import { DormitoryResponse, GetDormitoriesActions } from "../actions/action-types/dormitory/get-dormitories"
import { getDormitoriesActionCreators } from '../actions/action-creator/dormitory/get-dormitories';
import { addDormitoriesActionCreators } from '../actions/action-creator/dormitory/add-dormitories';
import { UpdateDormitoriesActionCreators } from '../actions/action-creator/dormitory/update-dormitories';
import { DeleteDormitoriesActionCreators } from '../actions/action-creator/dormitory/delete-dormitories';
import { SnackbarOrigin } from '@mui/material/Snackbar';

interface ILoadPagesProps {
    Name: string
}
export interface State extends SnackbarOrigin {
    open: boolean;
}
const DormitoryComponent = (props: ILoadPagesProps) => {
    const [searchText, setSearchText] = useState("");
    const [dormitoryName, setDormitoryName] = useState("");
    const [dormitoryDescription, setDormitoryDescription] = useState("");
    const [openAddModal, setOpenAddModal] = useState(false);
    const dispatch = useDispatch();
    const getDormitoriesresponse = useSelector((state: RootState) => state.getDormitoriesresponse.getDormitoriesresponse);
    const addDormitoriesresponse = useSelector((state: RootState) => state.addDormitoriesresponse.addDormitoriesresponse);
    const deleteDormitoriesresponse = useSelector((state: RootState) => state.deleteDormitoriesresponse.deleteDormitoriesresponse);
    const updateDormitoriesresponse = useSelector((state: RootState) => state.updateDormitoriesresponse.updateDormitoriesresponse);
    const [dormitoryText, setDormitoryText] = useState("");
    const [response, setResponse] = React.useState<DormitoryResponse>({ id: 0, dormitoryName: "", dormitoryDescription: "" });
    const [rows, setRows] = useState<DormitoryResponse[]>([]);
    const [openEditModal, setOpenEditModal] = React.useState(false);
    const [state, setState] = React.useState<State>({
        open: false,
        vertical: 'top',
        horizontal: 'center',
    });
    const { vertical, horizontal, open } = state;

    const requestSearch = (searchValue: string) => {
        setSearchText(searchValue);
        const searchRegex = new RegExp(escapeRegExp(searchValue), 'i');
        const filteredRows = getDormitoriesresponse.filter((row: any) => {
            return Object.keys(row).some((field: any) => {
                return searchRegex.test(row[field].toString());
            });
        });

        setRows(filteredRows)
    }

    const HandleDelete = (params: any) => {
        setResponse(params.row);
        dispatch(DeleteDormitoriesActionCreators.DeleteDormitoriesActionCreator({
            id:response.id
        }));
    }

    React.useEffect(() => {
        dispatch(getDormitoriesActionCreators.getDormitoriesActionCreator());
    }, [dispatch]);

    React.useEffect(() => {
        if (getDormitoriesresponse.length > 0 && getDormitoriesresponse) {
            setRows(getDormitoriesresponse);
        }
        if (addDormitoriesresponse.length > 0 && addDormitoriesresponse) {
            setState({ ...state, open: true });
            handleClick({ vertical: 'top', horizontal: 'right' })
        }
    }, [getDormitoriesresponse, addDormitoriesresponse]);
    const handleClick = (newState: SnackbarOrigin) => () => {
        setState({ open: true, ...newState });
    };
    const HandleView = (values: any, ViewButton: string) => {
        // handleOpen();
        setOpenEditModal(true)
        setResponse(values.row);
        switch (ViewButton) {
            case "ViewButton":
                {
                    return setDormitoryText("View");
                }
            case "EditButton":
                return setDormitoryText("Edit");
            default:
                return setDormitoryText("View")
        }
    }

    const handleClose = () => {
        setState({ ...state, open: false });
    };

    const columns: GridColDef[] =
        [
            { field: 'id', headerName: '#', width: 50, hide: false },
            { field: 'dormitoryName', headerName: 'Dormitory Name', width: 300, hide: false },
            { field: 'dormitoryDescription', headerName: 'Dormitory Description', width: 150, hide: false },
            {
                field: 'action',
                width: 130,
                sortable: false,

                renderCell: (params) => {
                    return (
                        <>
                            <IconButton color="secondary" onClick={() => HandleView(params, "ViewButton")}>
                                <ViewDayTwoTone />
                            </IconButton>
                            <IconButton color="primary" onClick={() => HandleView(params, "EditButton")}>
                                <EditTwoTone />
                            </IconButton>
                            <IconButton color="error" onClick={() => HandleDelete(params)}>
                                <DeleteTwoTone />
                            </IconButton>
                        </>
                    );
                },
            },
        ]
    return (
        <Box sx={{ height: 400, width: 1 }}>
            <DataGrid
                components={{ Toolbar: QuickSearchToolbar2 }}
                rows={rows}
                columns={columns}
                componentsProps={{
                    toolbar: {
                        value: searchText,
                        onChange: (event: React.ChangeEvent<HTMLInputElement>) => {
                            requestSearch(event.target.value);
                        },
                        clearSearch: () => requestSearch(''),
                        openModalPopup: () => setOpenAddModal(true)
                    },
                }}
            />

            <Dialog open={openAddModal} maxWidth="sm" fullWidth style={{ height: "auto", width: '100%' }}>
                <DialogTitle>Add Dormitory</DialogTitle>
                <Box position="absolute" top={0} right={0}>
                    <IconButton onClick={() => setOpenAddModal(false)}>
                        <Close />
                    </IconButton>
                </Box>
                <DialogContent>
                    <div className="row spacing">
                        <div className="col-sm-3">
                            <label>Dormitory Name</label>
                        </div>
                        <div className="col-sm-9">
                            <input type="text" className="form-control form-control-sm" onChange={(e: React.ChangeEvent<HTMLInputElement>) => {
                                setDormitoryName(e.target.value)
                            }} />
                        </div>
                    </div>
                    <div className="row spacing">
                        <div className="col-sm-3">
                            <label>Dormitory Description</label>
                        </div>
                        <div className="col-sm-9">
                            <TextareaAutosize
                                maxRows={10}
                                aria-label="maximum height"
                                placeholder="Dormitory Description"
                                className='textAreaAutoSize'
                                onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) => {
                                    setDormitoryDescription(e.target.value)
                                }}
                            />
                        </div>
                    </div>
                    <DialogActions>
                        <Button
                            variant="contained"
                            color="secondary"
                            startIcon={<SaveAltTwoTone />}
                            onClick={() => {
                                dispatch(addDormitoriesActionCreators.addDormitoriesActionCreator({
                                    dormitoryName: dormitoryName,
                                    dormitoryDescription: dormitoryDescription
                                }));
                                setOpenAddModal(false);
                                setTimeout(() => {
                                    dispatch(getDormitoriesActionCreators.getDormitoriesActionCreator());
                                }, 1000);
                            }}
                        >
                            Save
                        </Button>
                        <Button
                            variant="contained"
                            color="secondary"
                            startIcon={<CloseTwoTone />}
                            onClick={() => setOpenAddModal(false)}
                        >
                            Close
                        </Button>
                    </DialogActions>
                </DialogContent>
            </Dialog>

            <Dialog open={openEditModal} maxWidth="sm" fullWidth style={{ height: "auto", width: '100%' }}>
                <DialogTitle>Edit Dormitory</DialogTitle>
                <Box position="absolute" top={0} right={0}>
                    <IconButton onClick={() => setOpenEditModal(false)}>
                        <Close />
                    </IconButton>
                </Box>
                <DialogContent>
                    <div className="row spacing">
                        <div className="col-sm-3">
                            <label>Dormitory Name</label>
                        </div>
                        <div className="col-sm-9">
                            <input type="text" className="form-control form-control-sm"
                                onChange={(e: React.ChangeEvent<HTMLInputElement>) => {
                                    setDormitoryName(e.target.value);
                                }}
                                disabled={(dormitoryText !== "Edit")}
                                value={(dormitoryText !== "Edit") ? (dormitoryName) : (response.dormitoryName)} />
                        </div>
                    </div>
                    <div className="row spacing">
                        <div className="col-sm-3">
                            <label>Dormitory Description</label>
                        </div>
                        <div className="col-sm-9">
                            <TextareaAutosize
                                maxRows={10}
                                aria-label="maximum height"
                                placeholder="Dormitory Description"
                                className='textAreaAutoSize'
                                disabled={(dormitoryText !== "Edit")}
                                value={(dormitoryText !== "Edit") ? (dormitoryDescription) : (response.dormitoryDescription)}
                                onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) => {
                                    setDormitoryDescription(e.target.value);
                                }}
                            />
                        </div>
                    </div>
                    <DialogActions>
                        {
                            (dormitoryText === "Edit") ? (<Button
                                variant="contained"
                                color="secondary"
                                startIcon={<SaveAltTwoTone />}
                                onClick={() => {
                                    dispatch(UpdateDormitoriesActionCreators.UpdateDormitoriesActionCreator({
                                        id:response.id,
                                        dormitoryName: dormitoryName,
                                        dormitoryDescription: dormitoryDescription
                                    }));
                                    setOpenAddModal(false);
                                    setTimeout(() => {
                                        dispatch(getDormitoriesActionCreators.getDormitoriesActionCreator());
                                    }, 1000);
                                }}
                            >
                                Save
                            </Button>) : (<></>)
                        }
                        <Button
                            variant="contained"
                            color="secondary"
                            startIcon={<CloseTwoTone />}
                            onClick={() => setOpenEditModal(false)}
                        >
                            Close
                        </Button>
                    </DialogActions>
                </DialogContent>
            </Dialog>
            <Box>
                <Snackbar
                    anchorOrigin={{ vertical, horizontal }}
                    open={open}
                    onClose={handleClose}
                    message="hELLO sOMELA"
                    key={vertical + horizontal}
                />
            </Box>
            {
                open && addDormitoriesresponse.length > 0 ? (
                    <Box>
                        <Snackbar
                            anchorOrigin={{ vertical, horizontal }}
                            open={open}
                            onClose={handleClose}
                            message={addDormitoriesresponse[0].statusCode + "-" + addDormitoriesresponse[0].message}
                            key={vertical + horizontal}
                        />
                    </Box>
                ) : (<></>)
            }
        </Box>
    )
}

export default DormitoryComponent;