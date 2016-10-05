Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Michael Wang
	<Michael.Wang@alliedtelesis.co.nz>
Subject: adm9240 error handling (was Re: [PATCHv1] hwmon: adm9240: handle
 temperature readings below 0)
Date: Wed, 5 Oct 2016 05:00:52 +0000
Message-ID: <56fa4053f8a448a38b9f1e0dd45a0092@svr-chch-ex1.atlnz.lc>
References: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
 <20161004205359.GA29531@roeck-us.net>
 <3c7c751bd9d24856ace5866ffb94060a@svr-chch-ex1.atlnz.lc>
 <20161004220938.GA4566@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,=0A=
=0A=
On 10/05/2016 11:10 AM, Guenter Roeck wrote:=0A=
> On Tue, Oct 04, 2016 at 09:09:10PM +0000, Chris Packham wrote:=0A=
>>=0A=
>>>=0A=
>>> Of course, all that doesn't solve the real problem in this driver, whic=
h is=0A=
>>> that it ignores error codes from the smbus functions, but that is a dif=
ferent=0A=
>>> problem.=0A=
>>=0A=
>> Yeah I'd noted that too. This patch is actually a port of changes we've=
=0A=
>> made to a custom LM81 driver based on the original adm9240 driver which=
=0A=
>> included some error handling. I'll look at bringing more of that code in=
=0A=
>> for a future patch.=0A=
>>=0A=
> Sounds good...=0A=
>=0A=
=0A=
So on this. The as-yet unpublished changes we have basically consist of =0A=
changing adm9240_update_device() to do something like this=0A=
=0A=
=0A=
                         || !data->valid) {=0A=
=0A=
                 for (i =3D 0; i < 6; i++) { /* read voltages */=0A=
-                       data->in[i] =3D i2c_smbus_read_byte_data(client,=0A=
+                       ret =3D i2c_smbus_read_byte_data(client,=0A=
                                         ADM9240_REG_IN(i));=0A=
+                       if (ret >=3D 0)=0A=
+                               data->in[i] =3D ret;=0A=
=0A=
The user is still none the wiser that there was an error but at least we =
=0A=
haven't just attempted to write a error code to the data. Is this the =0A=
direction you want to head? Are there other hwmon drivers that do =0A=
something saner?=0A=
=0A=
Another attempt we've made is to try to read something innocuous like =0A=
the CONFIG register to check that the i2c bus is in a good state before =0A=
reading the rest of the values.=0A=
=0A=
As you can guess these "fixes" have piled up over time and because =0A=
they're hard to test we haven't been brave enough to remove them.=0A=
=0A=
Any thoughts?=0A=
=0A=
