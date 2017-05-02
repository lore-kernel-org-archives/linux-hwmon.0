Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare
	<jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 3/3] hwmon: (adt7475) temperature smoothing
Date: Tue, 2 May 2017 20:37:18 +0000
Message-ID: <901bdec40a0344f3adb077756263a1d4@svr-chch-ex1.atlnz.lc>
References: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
 <20170502054536.21147-4-chris.packham@alliedtelesis.co.nz>
 <20170502191354.GB11901@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 03/05/17 07:14, Guenter Roeck wrote:=0A=
> On Tue, May 02, 2017 at 05:45:36PM +1200, Chris Packham wrote:=0A=
>> When enabled temperature smoothing allows ramping the fan speed over a=
=0A=
>> configurable period of time instead of jumping to the new speed=0A=
>> instantaneously.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>  Documentation/hwmon/adt7475 |   5 ++=0A=
>>  drivers/hwmon/adt7475.c     | 121 +++++++++++++++++++++++++++++++++++++=
+++++++=0A=
>>  2 files changed, 126 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475=
=0A=
>> index 85dc9e17bdee..31b15cb910ea 100644=0A=
>> --- a/Documentation/hwmon/adt7475=0A=
>> +++ b/Documentation/hwmon/adt7475=0A=
>> @@ -114,6 +114,11 @@ at the minimum (i.e. auto_point1_pwm). This can be =
configured using the=0A=
>>  pwm[1-*]_min sysfs attribute. A value of 0 means the fans will shut off=
. A=0A=
>>  value of 1 means the fans will run at auto_point1_pwm.=0A=
>>=0A=
>> +The responsiveness of the ADT747x to temperature changes can be configu=
red.=0A=
>> +This allows smoothing of the fan speed transition. To enable temperatur=
e=0A=
>> +smoothing used the temp[1-*]_smoothing_enable sysfs attribute. To set t=
he=0A=
>> +transition time set the value in ms in the temp[1-*]_smoothing sysfs at=
tribute.=0A=
>> +=0A=
> Does this require two attributes, or can setting '0' for temp[1-*]_smooth=
ing=0A=
> be used to disable it ?=0A=
>=0A=
=0A=
One attribute could be made to work. I was following asc7621.c but from =0A=
a usability perspective having to set the two attributes is not =0A=
particularly convenient. The only argument for separating them is to =0A=
allow smoothing at whatever the hardware default is.=0A=
=0A=
