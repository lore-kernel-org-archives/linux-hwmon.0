Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
CC: Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>, Jean Delvare
	<jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] hwmon: (adt7475) fan stall prevention
Date: Sun, 14 May 2017 21:01:51 +0000
Message-ID: <413db86f681c4eabad331d312ae585e4@svr-chch-ex1.atlnz.lc>
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
 <20170511034524.22698-3-chris.packham@alliedtelesis.co.nz>
 <763e147a-5d5c-c746-ecf5-189fed25e267@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 15/05/17 02:54, Guenter Roeck wrote:=0A=
> On 05/10/2017 08:45 PM, Chris Packham wrote:=0A=
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
>>=0A=
>> Changes in v2:=0A=
>> - use pwmN_stall_dis as the attribute name. I think this describes the p=
urpose=0A=
>>   pretty well. I went with a new attribute instead of overloading=0A=
>=0A=
> Almost agree. Can we use pwmN_stall_disable ?=0A=
>=0A=
=0A=
Sold. I'll send a v4 of this patch with the name changed.=0A=
=0A=
> Thanks,=0A=
> Guenter=0A=
>=0A=
>=0A=
>>   pwmN_auto_point1_pwm so this doesn't affect existing users.=0A=
>> Changes in v3:=0A=
>> - Fix grammar.=0A=
>> - change enh_acou to enh_acoustics=0A=
=0A=
