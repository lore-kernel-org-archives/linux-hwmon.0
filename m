Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 2/3] hwmon: (adt7475) fan stall prevention
Date: Wed, 3 May 2017 20:44:52 +0000
Message-ID: <c690b3b0c33644528bdb1dd621d5773e@svr-chch-ex1.atlnz.lc>
References: <20170503004009.23769-1-chris.packham@alliedtelesis.co.nz>
 <20170503004009.23769-3-chris.packham@alliedtelesis.co.nz>
 <20170503161044.GA9471@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 04/05/17 04:10, Guenter Roeck wrote:=0A=
> On Wed, May 03, 2017 at 12:40:08PM +1200, Chris Packham wrote:=0A=
>> By default adt7475 will stop the fans (pwm duty cycle 0%) when the=0A=
>> temperature drops past Tmin - hysteresis. Some systems want to keep the=
=0A=
>> fans moving even when the temperature drops so add new sysfs attributes=
=0A=
>> that configure the enhanced acoustics min 1-3 which allows the fans to=
=0A=
>> run at the minimum configure pwm duty cycle.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - use pwmN_stall_dis as the attribute name. I think this describes the p=
urpose=0A=
>>   pretty well. I went with a new attribute instead of overloading=0A=
>>   pwmN_auto_point1_pwm so this doesn't affect existing users.=0A=
>>=0A=
>>  Documentation/hwmon/adt7475 |  5 +++++=0A=
>>  drivers/hwmon/adt7475.c     | 50 ++++++++++++++++++++++++++++++++++++++=
+++++++=0A=
>>  2 files changed, 55 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475=
=0A=
>> index 0502f2b464e1..63507402cd4f 100644=0A=
>> --- a/Documentation/hwmon/adt7475=0A=
>> +++ b/Documentation/hwmon/adt7475=0A=
>> @@ -109,6 +109,11 @@ fan speed) is applied. PWM values range from 0 (off=
) to 255 (full speed).=0A=
>>  Fan speed may be set to maximum when the temperature sensor associated =
with=0A=
>>  the PWM control exceeds temp#_max.=0A=
>>=0A=
>> +At Tmin - hysteresis the PWM output can either be off (0% duty cycle) o=
r at the=0A=
>> +minimum (i.e. auto_point1_pwm). This behaviour be configured using the=
=0A=
>> +pwm[1-*]_stall_dis sysfs attribute. A value of 0 means the fans will sh=
ut off.=0A=
>=0A=
> That is really an awkward attribute name. I'll have to think about this s=
ome=0A=
> more.=0A=
=0A=
I agree. The other thing I considered was "halt" and using inverted =0A=
logic so halt =3D=3D 1 reflected the HW default of allowing fans to stop.=
=0A=
=0A=
