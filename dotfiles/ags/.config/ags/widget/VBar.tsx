import { Astal, Gtk, Gdk } from "astal/gtk3"
import Battery from "gi://AstalBattery"
import Hyprland from "gi://AstalHyprland"
import { Variable, GLib, bind } from "astal"


// Constants
const gridSize = Variable(8);
const gaps = gridSize;

const MyBox = (props) => {
	return <box className="widget-box" vertical>
		{props.children}
	</box>
}

function Clock() {
	const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format("%H\n%M")!)
	const seconds = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format("%S")!)

	return <MyBox>
		<label className="big-time"
		onDestroy={() => time.drop()}
		label={time()}
		/>
		<label className="small-time inverted"
		onDestroy={() => seconds.drop()}
		label={seconds()}
		/>
	</MyBox>
}
function Date() {
	const date = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format("%a\n%-e\n%b")!)

	return <box className="widget-box padded" vertical>
		<label className="calendar" halign={Gtk.Align.FILL}
		onDestroy={() => date.drop()}
		label={date()}
		/>
	</box>
}


function Workspaces() {
    const hypr = Hyprland.get_default()

    return <box className="workspaces" vertical>
        {bind(hypr, "workspaces").as(wss => wss
            .filter(ws => !(ws.id >= -99 && ws.id <= -2)) // filter out special workspaces
            .sort((a, b) => a.id - b.id)
            .map(ws => (
                <box className={bind(hypr, "focusedWorkspace")
					.as(fw => "workspace " + (ws === fw ? "focused" : ""))}>
					<box hexpand>
					</box>
					<box halign={Gtk.Align.END}>
						{ws.id}
					</box>
                </box>
            ))
        )}
    </box>
}

function BatteryLevel() {
    const bat = Battery.get_default()

    return <box className="widget-box padded"
        visible={bind(bat, "isPresent")}>
        <box className="widget-box" halign={Gtk.Align.FILL}>
			<box hexpand halign={Gtk.Align.CENTER}>
				{bind(bat, "percentage")
					.as(p => `BAT\n${Math.floor(p * 100)}%`)}
			</box>
			<box className={bind(bat, "percentage")
					.as(p => p < 20 ? "batterIndicator" : "")}
				style={bind(bat, "percentage")
					.as(p => "background-color: red")}>

			</box>
		</box>
    </box>
}

export default function Bar(monitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        name="Bar"
        gdkmonitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
		layer={Astal.Layer.BOTTOM}
        anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.BOTTOM}>
        <box vertical
			margin={8}
			marginRight={0}
			className="bar">
            <box vertical valign={Gtk.Align.START}>
                <Clock />
                <Date />
                <Workspaces />
            </box>
            <box vertical vexpand valign={Gtk.Align.FILL} className="filler">
            </box>
            <box vertical valign={Gtk.Align.END}>
			<BatteryLevel />
            </box>
        </box>
    </window>
}
