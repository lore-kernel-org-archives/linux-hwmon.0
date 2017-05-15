Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] hwmon: (adt7475) add high frequency support
Date: Mon, 15 May 2017 21:02:36 +0000
Message-ID: <24c6296e7e074cdc8148b4535be315bf@svr-chch-ex1.atlnz.lc>
References: <20170515013029.31397-1-chris.packham@alliedtelesis.co.nz>
 <20170515013029.31397-4-chris.packham@alliedtelesis.co.nz>
 <606da904-b6ab-f9fd-45e5-e60632eafc72@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 16/05/17 01:26, Guenter Roeck wrote:=0A=
> On 05/14/2017 06:30 PM, Chris Packham wrote:=0A=
>> Systems using 4-wire fans usually require high frequency (22.5kHz)=0A=
>> output on the pwm. Add 22500 as a valid option in the pwmfreq_table. In=
=0A=
>> high frequency mode the low-order bit are ignored so they can safely be=
=0A=
>> set to 0.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>=0A=
> Applied to hwmon-next.=0A=
>=0A=
> Thanks,=0A=
> Guenter=0A=
>=0A=
=0A=
Thank you for your feedback (and patience).=0A=
=0A=
=0A=
