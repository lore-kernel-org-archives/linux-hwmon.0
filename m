Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 00/10] drivers/hwmon: Add On-Chip Controller (OCC)
 hwmon driver
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/html; charset=utf-8
From: Eddie James <eajames@linux.vnet.ibm.com>
In-Reply-To: <20170905201831.GA16996@roeck-us.net>
Date: Tue, 5 Sep 2017 16:39:53 -0500
Cc: linux-hwmon@vger.kernel.org, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>,
        Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Matt Spinler <mspinler@linux.vnet.ibm.com>, msbarth@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
References: <1501165829-12395-1-git-send-email-eajames@linux.vnet.ibm.com>
 <2AE5F533-8701-42BC-B542-0875DECC1B92@linux.vnet.ibm.com>
 <20170905201831.GA16996@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Message-Id: <99D2FB2D-9C20-4B99-A119-DDAEF20B60E4@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><blockquote type=3D"cite">On Sep 5, =
2017, at 3:18 PM, Guenter Roeck &lt;linux@roeck-us.net&gt; =
wrote:<br><br>On Tue, Sep 05, 2017 at 03:07:10PM -0500, Eddie James =
wrote:<br><blockquote type=3D"cite">Hi Guenter,<br><br>I have some =
additional features to add to this driver to handle some special =
temperature sensor values. Wanted to run it by you before submitting a =
new version to the list, since I=E2=80=99m not sure if there is a =
standard way of addressing this or not.<br><br>Temp sensor may return 0 =
for =E2=80=9Cdata unavailable; may be available later=E2=80=9D and 0xFF =
for error. It makes sense to map 0xFF to a tempX_fault attribute. =
However, for the =E2=80=9Cunavailable=E2=80=9D case, should I use =
tempX_alarm for this? I think with =E2=80=9Calarm=E2=80=9D the sensor =
data is usually available in a normal hwmon device? We would either have =
to return a cached value for the tempX_input or return an error, since =
the data is not there.<br><br></blockquote>mapping 0xff to fault makes =
sense. Mapping 0x00 to alarm, however, doesn't<br>really make sense, =
since there is not really an alarm =
condition<br>(over/undertemperature/voltage). I can see two options: =
Either return a cached<br>value, or return something like -EAGAIN. =
Question though is if the condition<br>is or can be permanent. If yes, =
-EAGAIN would not be a good idea since it<br>most likely results in an =
immediate retry by userspace. If the condition is<br>or can be =
permanent, all you can probably do would be to report a cached<br>value =
for some period of time and then switch to reporting a fault =
condition.<br></blockquote><br>I don=E2=80=99t believe it can be =
permanent. The OCC itself should switch it to 0xFF after a bit. We=E2=80=99=
ll use EAGAIN, thanks for the suggestion.<br><br><blockquote =
type=3D"cite"><br>[ sorry for not being more proactive with the review =
]<br></blockquote><br>No problem, it=E2=80=99s obviously still in =
development! Thanks for the quick =
response.<br><br>Thanks,<br>Eddie<br><br><blockquote =
type=3D"cite"><br>Guenter<br><br><br><blockquote =
type=3D"cite">Thanks,<br>Eddie<br><br><blockquote type=3D"cite">On Jul =
27, 2017, at 9:30 AM, Eddie James &lt;eajames@linux.vnet.ibm.com&gt; =
wrote:<br><br>From: "Edward A. James" =
&lt;eajames@us.ibm.com&gt;<br><br>This series adds a hwmon driver to =
support the OCC on POWER8 and POWER9<br>processors. The OCC is an =
embedded processor that provides realtime power and<br>thermal =
monitoring and management.<br><br>This driver has two different platform =
drivers as a "base" for the<br>hwmon interface, as the means of =
communicating with the OCC on P8 and P9 is<br>completely different. For =
P8, the driver is an I2C client driver. For P9 the<br>driver is an =
FSI-based OCC client driver, and uses the OCC driver in-kernel<br>API. =
The OCC driver is on the LKML (latest =
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lkml.org_lkml_2017_=
7_5_633&amp;d=3DDwIDaQ&amp;c=3Djf_iaSHvJObTbx-siA1ZOg&amp;r=3DVKQig_uj8mzE=
bP7l8f3q1ueghVg1ZAtCOXs0CFMvZww&amp;m=3DFg8M9rUttIJtUeu2lnGfv9Yh2q10HqtwYJ=
lenbZ-UUM&amp;s=3D0UqHnEA8iTyCEs2WXnbqis9wWq1Jw8sOMJb6UO5L14k&amp;e=3D =
).<br><br>Changes since v1:<br>* Remove wait loop in P9 code, as that is =
now handled by FSI OCC driver.<br>* Removed dt binding documentation for =
P9, FSI OCC driver will probe OCC hwmon<br> driver automatically.<br>* =
Moved OCC response code definitions to the OCC include file.<br>* Fixed =
includes.<br>* Changed some structure fields to __beXX as that is what =
they are.<br>* Changed some errnos.<br>* Removed some dev_err().<br>* =
Refactored P8 code a bit to use #defined addresses and magic values, =
and<br> changed "goto retry" to a loop.<br>* Refactored error handling a =
bit.<br><br>Edward A. James (10):<br>drivers/hwmon: Add On-Chip =
Controller (OCC) hwmon driver<br>drivers/hwmon/occ: Add command =
transport method for P8 and P9<br>drivers/hwmon/occ: Parse OCC poll =
response<br>drivers/hwmon/occ: Add sensor types and =
versions<br>drivers/hwmon/occ: Add sensor attributes and register hwmon =
device<br>drivers/hwmon/occ: Add non-hwmon =
attributes<br>drivers/hwmon/occ: Add error handling<br>Documentation: =
hwmon: Add OCC documentation<br>Documentation: ABI: Add occ-hwmon driver =
sysfs documentation<br>dt-bindings: i2c: Add P8 OCC hwmon driver =
documentation<br><br>Documentation/ABI/testing/sysfs-driver-occ-hwmon =
&nbsp;&nbsp;| &nbsp;&nbsp;77 =
++<br>.../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt &nbsp;&nbsp;| =
&nbsp;&nbsp;25 +<br>Documentation/hwmon/occ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;| &nbsp;&nbsp;74 ++<br>drivers/hwmon/Kconfig =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;2 =
+<br>drivers/hwmon/Makefile =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;1 +<br>drivers/hwmon/occ/Kconfig =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;| &nbsp;&nbsp;28 +<br>drivers/hwmon/occ/Makefile =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;11 +<br>drivers/hwmon/occ/common.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
1289 ++++++++++++++++++++<br>drivers/hwmon/occ/common.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;119 ++<br>drivers/hwmon/occ/p8_i2c.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;261 ++++<br>drivers/hwmon/occ/p9_sbe.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;124 ++<br>11 files changed, 2011 insertions(+)<br>create mode =
100644 Documentation/ABI/testing/sysfs-driver-occ-hwmon<br>create mode =
100644 =
Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt<br>create =
mode 100644 Documentation/hwmon/occ<br>create mode 100644 =
drivers/hwmon/occ/Kconfig<br>create mode 100644 =
drivers/hwmon/occ/Makefile<br>create mode 100644 =
drivers/hwmon/occ/common.c<br>create mode 100644 =
drivers/hwmon/occ/common.h<br>create mode 100644 =
drivers/hwmon/occ/p8_i2c.c<br>create mode 100644 =
drivers/hwmon/occ/p9_sbe.c<br><br>-- =
<br>1.8.3.1<br><br></blockquote><br></blockquote><br></blockquote><br></di=
v></body></html>=
