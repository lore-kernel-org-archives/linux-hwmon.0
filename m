Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: Enabling enhanced acoustics on adt7475
Date: Tue, 2 May 2017 03:45:11 +0000
Message-ID: <007150d629ad4ace84b81466ed08ec63@svr-chch-ex1.atlnz.lc>
References: <5b96df9d2ea649daa5f5b8a3896280c4@svr-chch-ex1.atlnz.lc>
 <20170501191605.GA17410@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 02/05/17 07:16, Guenter Roeck wrote:=0A=
> On Mon, May 01, 2017 at 08:45:14AM +0000, Chris Packham wrote:=0A=
>> Hi,=0A=
>>=0A=
>> I'm looking at adding code to configure the enhanced acoustics on the=0A=
>> ADT7475 and compatible devices.=0A=
>>=0A=
>> I'm wondering if I should be adding these as device-tree properties or=
=0A=
>> as sysfs attributes. And in either case how these properties/attributes=
=0A=
>> should behave. The main impact of this would be to provide a mechanism=
=0A=
>> for configuring how fast the pwm output will change.=0A=
>>=0A=
>> The fact that I wrote "configuring" above makes me lean towards sysfs=0A=
>> attributes. Nothing in Documentation/hwmon/sysfs-interface really covers=
=0A=
>=0A=
> Definitely. This does not describe hardware.=0A=
>=0A=
>> this. dme1737.c has a pwmN_ramp_rate which would seem close to what I=0A=
>> want. Is there any other precedent I should follow?=0A=
>>=0A=
> There is pwmX_step but that does not describe a ramp rate in time.=0A=
> dme1737.c indeed seems to be the closest match. Nothing else I can think =
of.=0A=
>=0A=
=0A=
I also found tempN_smoothing_enable and tempN_smoothing_time in =0A=
asc7621.c which lines up quite closely with the adt7475.=0A=
=0A=
