Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare
	<jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] hwmon: (adt7475) fan stall prevention
Date: Wed, 3 May 2017 00:07:50 +0000
Message-ID: <7cbe65b4a829422998ab4cec41588831@svr-chch-ex1.atlnz.lc>
References: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
 <20170502054536.21147-3-chris.packham@alliedtelesis.co.nz>
 <20170502180731.GA12773@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 03/05/17 06:07, Guenter Roeck wrote:=0A=
> On Tue, May 02, 2017 at 05:45:35PM +1200, Chris Packham wrote:=0A=
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
>> pwmN_min is a horrible name but I really can't think of anything better.=
=0A=
>> I'm biased a little because that is essentially the name of the bits in=
=0A=
>> the datasheet. I'm open to suggestions.=0A=
>=0A=
> pwmX_min is also traditionally the mimimum permitted pwm value,=0A=
> not a boolean. This would be more appropriate to reflect the PWMmin=0A=
> register values (0x64 to 0x66). Similar for pwmX_max if you want to=0A=
> add support for it.=0A=
=0A=
For the adt7476 driver these are used as pwmN_auto_point[12]_pwm.=0A=
=0A=
> It might make sense to combine pwmX_min=3D=3D0 with clearing the=0A=
> respective bit in the REG_ENHANCE_ACOUSTICS[12] register. This way=0A=
> we would only need one attribute to support both.=0A=
=0A=
I could add code such that if pwmN_auto_point1_pwm > 0. The bit in =0A=
REG_ENHANCE_ACOUSTICS is set but that would be a change in existing =0A=
behaviour.=0A=
=0A=
