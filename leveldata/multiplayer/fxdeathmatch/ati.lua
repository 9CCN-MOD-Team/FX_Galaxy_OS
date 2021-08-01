--
-- ati templates for use with ResourceRace.lua
--

-- Parameter indices
--
local HCPI_PlayerName = 0
local HCPI_PlayerBounty = 1
local HCPI_PlayerColour = 2
local HCPN_Parameters = 3
SCAR_ATITemplates =
{
    playerProgress =
    {
        --name =
        {
            stringParam = HCPI_PlayerName,
            text =
            {
                colour = {1,1,1,1},
    	        dropshadow = 1,
                renderFlags = {"justifyright"},
                LODs =
                {
                    1, "ATISmallFont",
                }
            },
            placement2D =
            {
                factorX = -1,
                factorY = -1,
                minATIArea = 0,
                maxATIArea = 1,
                visibility = {},
            },
        },
        --bounty number =
        {
            stringParam = HCPI_PlayerBounty,
            text =
            {
                colour = {1,1,1,1},
    	        dropshadow = 1,
                renderFlags = {"justifyLeft"},
                LODs =
                {
                    1, "ATISmallFont",
                }
            },
            placement2D =
            {
                factorX = 0,
                factorY = -1,
                minATIArea = 0,
                maxATIArea = 1,
                visibility = {},
            },
        },
    },
    progressTitle =
    {
        {
            stringParam = 0,
            text =
            {
                colour = {1,1,1,1},
    	        dropshadow = 1,
                renderFlags = {"justifyHorizCentre"},
                LODs =
                {
                    1, "ATISmallFont",
                }
            },
            placement2D =
            {
                visibility = {},
            },
        },
    },
}

