import * as React from 'react'
import { AddCircleOutlineTwoTone ,Clear,Search } from "@mui/icons-material";
import { Box, Button, IconButton, TextField } from "@mui/material";

interface QuickSearchToolbarProps2 {
    clearSearch: () => void;
    onChange: () => void;
    value: string;
    openModalPopup:()=>void;
}

export const QuickSearchToolbar2 = (props: QuickSearchToolbarProps2)=> {
    return (
        <Box
            sx={{
                p: 0.5,
                pb: 0,
            }}
        >
            <Button
                variant="contained"
                color="primary"
                style={{ float: 'right' }}
                startIcon={<AddCircleOutlineTwoTone />}
                onClick={props.openModalPopup}
            >
                Add
            </Button>
            <TextField
                style={{ float: "left" }}
                variant="standard"
                value={props.value}
                onChange={props.onChange}
                placeholder="Search…"
                InputProps={{
                    endAdornment: <Search fontSize="small" />,
                    startAdornment: (
                        <IconButton
                            title="Clear"
                            aria-label="Clear"
                            size="small"
                            style={{ visibility: props.value ? 'visible' : 'hidden' }}
                            onClick={props.clearSearch}
                        >
                            <Clear fontSize="small" />
                        </IconButton>
                    ),
                }}
                sx={{
                    width: {
                        xs: 1,
                        sm: 'auto',
                    },
                    m: (theme) => theme.spacing(1, 0.5, 1.5),
                    '& .MuiSvgIcon-root': {
                        mr: 0.5,
                    },
                    '& .MuiInput-underline:before': {
                        borderBottom: 1,
                        borderColor: 'divider',
                    },
                }}
            />
        </Box>
    );
}