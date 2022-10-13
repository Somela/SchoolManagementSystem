import * as React from 'react';
import { AppBar, Box, Typography, Divider, Drawer, IconButton, List, ListItem, ListItemIcon, ListItemText, makeStyles, styled, Theme, Toolbar, useTheme, Tooltip, Menu, Icon, ListItemAvatar, Avatar } from '@mui/material';
import { createStyles } from '@material-ui/core/styles';
import { loadMenuActionCreators } from '../actions/action-creator/load-menu-action-creator';
import { IMenusList } from '../usuable/useable';
import { Link } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { RootState } from '../reducer/root-reducer';
import image from "../Images/MySchool.jpg";
import {
    AnnouncementTwoTone, EmojiEventsTwoTone, CalendarTodayTwoTone, LibraryBooksTwoTone, AssignmentTwoTone, EditTwoTone,
    PermMediaTwoTone, PaymentTwoTone, PollTwoTone, PagesTwoTone, EmojiTransportationTwoTone, FiberManualRecord
} from "@mui/icons-material";
import * as Icons from '@material-ui/icons'
import LoadPages from './load-pages';

const drawerWidth = 300;

const Main = styled('main', { shouldForwardProp: (prop) => prop !== 'open' })<{
    open?: boolean;
}>(({ theme, open }) => ({
    flexGrow: 1,
    padding: theme.spacing(3),
    transition: theme.transitions.create('margin', {
        easing: theme.transitions.easing.sharp,
        duration: theme.transitions.duration.leavingScreen,
    }),
    marginLeft: `-${drawerWidth}px`,
    ...(open && {
        transition: theme.transitions.create('margin', {
            easing: theme.transitions.easing.easeOut,
            duration: theme.transitions.duration.enteringScreen,
        }),
        marginLeft: 0,
    }),
}));

const AdminHome = (props: any) => {
    const dispatch = useDispatch();
    const LoadMenuresponse = useSelector((state: RootState) => state.loadMenu.LoadMenuresponse);
    const [loading, setLoading] = React.useState(false);
    React.useEffect(() => {
        dispatch(loadMenuActionCreators.loadMenuActionCreator());
    }, [])
    React.useEffect(() => {
    }, [LoadMenuresponse])

    const [anchorElNav, setAnchorElNav] = React.useState<null | HTMLElement>(null);
    const [anchorElUser, setAnchorElUser] = React.useState<null | HTMLElement>(null);

    const handleOpenNavMenu = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorElNav(event.currentTarget);
    };
    const handleOpenUserMenu = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorElUser(event.currentTarget);
    };

    const handleCloseNavMenu = () => {
        setAnchorElNav(null);
    };

    const handleCloseUserMenu = () => {
        setAnchorElUser(null);
    };

    const loadIcon = (Icon:string) =>{
        return <Icon/>;
    }

    const settings = ["Profile", "Dashboard", "Logout"];
    const [type, setType] = React.useState("");
    return (
        <Box sx={{ display: 'flex' }}>
            <AppBar
                position="fixed"
                sx={{ width: `calc(100% - ${drawerWidth}px)`, ml: `${drawerWidth}px` }}
            ></AppBar>
            <Drawer
                sx={{
                    width: drawerWidth,
                    flexShrink: 0,
                    '& .MuiDrawer-paper': {
                        width: drawerWidth,
                        boxSizing: 'border-box',
                    },
                }}
                variant="permanent"
                anchor="left"
            >
                <Toolbar>
                    <Typography
                        variant="h6"
                        noWrap
                        component={"div"}
                        sx={{ mr: 2, display: { md: 'flex' } }}>
                        <Link to="/admin-home">School Management System</Link>
                    </Typography>
                </Toolbar>

                <Toolbar style={{ height: '20%' }}>
                    <Box sx={{ flexGrow: 0 }}>
                        <Tooltip title="User Settings">
                            <IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
                                <input type="image" className='userimage' style={{ width: 80, height: 70 }} name="profile" alt="image" src={image} />
                                <Typography>
                                    <FiberManualRecord color="success" /> Somela Sanjeevareddy
                                </Typography>
                            </IconButton>
                        </Tooltip>

                        <Menu
                            sx={{ mt: '45px' }}
                            id="menu-appbar"
                            anchorEl={anchorElUser}
                            anchorOrigin={{
                                vertical: 'top',
                                horizontal: 'left',
                            }}
                            keepMounted
                            transformOrigin={{
                                vertical: 'top',
                                horizontal: 'left',
                            }}
                            open={Boolean(anchorElUser)}
                            onClose={handleCloseUserMenu}
                        >
                            <List>
                                {settings.map((setting) => (
                                    <ListItem button key={setting} id={setting} >
                                        <ListItemText primary={setting} />
                                    </ListItem>
                                ))}
                            </List>
                        </Menu>
                    </Box>
                </Toolbar>
                <List>
                    {LoadMenuresponse.map((modules) => (
                        <ListItem button key={modules.id} onClick={(e) => {
                            setType("");
                            setType(modules.moduleName);
                        }} id={modules.moduleName}>
                            {/* <ListItemIcon>{loadIcon(modules.icon)}</ListItemIcon> */}
                            <ListItemText key={modules.id} primary={modules.moduleName} />
                        </ListItem>
                    ))}
                </List>
            </Drawer>
            <Main sx={{marginLeft:"0 !important"}}>
                {loading ? (
                    <div className="spinner-grow" role="status">
                        <span className="visually-hidden">Loading...</span>
                    </div>
                ) : (
                    <div>
                        {type.length > 0 ? (
                            <LoadPages Name={type} />
                        ) : (null)}
                    </div>
                )}
            </Main>
        </Box >
    )
}

export default AdminHome;