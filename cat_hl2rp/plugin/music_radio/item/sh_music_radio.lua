--[[
< CATHERINE > - A free role-playing framework for Garry's Mod.
Development and design by L7D.

Catherine is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Catherine.  If not, see <http://www.gnu.org/licenses/>.
]]--

local ITEM = catherine.item.New( "music_radio" )
ITEM.name = "^Item_Name_MusicRadio"
ITEM.desc = "^Item_Desc_MusicRadio"
ITEM.cost = 500
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.weight = 1
ITEM.func = { }
ITEM.func.dropItem = {
	text = "^Item_FuncStr01_MusicRadio",
	icon = "icon16/basket_remove.png",
	canShowIsMenu = true,
	func = function( pl, itemTable )
		local ent = ents.Create( "cat_hl2rp_music_radio" )
		ent:SetPos( catherine.util.GetItemDropPos( pl ) )
		ent:SetAngles( Angle( ) )
		ent:Spawn( )
		ent:PhysicsInit( SOLID_VPHYSICS )
		
		local physObject = ent:GetPhysicsObject( )
		
		if ( IsValid( physObject ) ) then
			physObject:EnableMotion( true )
			physObject:Wake( )
			physObject:SetMass( 80 )
		end

		catherine.inventory.Work( pl, CAT_INV_ACTION_REMOVE, {
			uniqueID = itemTable.uniqueID
		} )
	end
}

catherine.item.Register( ITEM )