Return-path: <peterhuewe@gmx.de>
Date: Tue, 07 Mar 2017 10:14:21 +0100
In-Reply-To: <20170307100846.0487135b@endymion>
References: <201703030133.01363.PeterHuewe@gmx.de> <201703062148.36101.PeterHuewe@gmx.de> <20170306234755.GA16512@roeck-us.net> <20170307100846.0487135b@endymion>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Question about hwmon_attr_show_string
To: Jean Delvare <jdelvare@suse.de>,Guenter Roeck <linux@roeck-us.net>
CC: linux-hwmon@vger.kernel.org,linux-kernel@vger.kernel.org
From: Peter Huewe <peterhuewe@gmx.de>
Message-ID: <14C0030C-C764-45AE-BA2D-881051004490@gmx.de>
List-ID: <linux-hwmon@vger.kernel.org>



Am 7=2E M=C3=A4rz 2017 10:08:46 MEZ schrieb Jean Delvare <jdelvare@suse=2E=
de>:
>Hi Guenter,
>
>On Mon, 6 Mar 2017 15:47:55 -0800, Guenter Roeck wrote:
>> On Mon, Mar 06, 2017 at 09:48:35PM +0100, Peter H=C3=BCwe wrote:
>> > Hi Guenter,
>> >=20
>> > I was wondering whether there was a particular reason why=20
>> > hwmon_attr_show_string passes only an "empty" pointer(pointer) to
>the ops-
>> > >read_string function rather than the buffer itself?
>> >=20
>> > Wouldn't this mean that in ops->read_string I'd have to reserve
>some space for=20
>> > the value on the heap (and taking care to free it somewhere, since
>returning=20
>> > an address on the stack is bad idea), instead of calling
>sprintf(buf, "%s\n",=20
>> > s) directly?
>> >=20
>> > With the current implementation I have to sprintf it into my local
>buffer and=20
>> > you sprintf it again into the final buffer=2E
>>
>> The idea was that the called code would return a pointer to a
>constant string,
>> ie one that isn't changing from call to call=2E
>
>In that case, what about the following change?
>
>Subject: hwmon: Constify str parameter of hwmon_ops->read_string
>
>The read_string callback is supposed to retrieve a pointer to a
>constant string=2E

I would think that clarifies the situation and also gets rid warnings abou=
t dropping const qualifier at the point of assignment=2E


Reviewed-by: Peter Huewe <peterhuewe@gmx=2Ede>


>
>Signed-off-by: Jean Delvare <jdelvare@suse=2Ede>
>---
> drivers/hwmon/hwmon=2Ec |    2 +-
> include/linux/hwmon=2Eh |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>--- linux-4=2E10=2Eorig/drivers/hwmon/hwmon=2Ec	2017-02-19 23:34:00=2E000=
000000
>+0100
>+++ linux-4=2E10/drivers/hwmon/hwmon=2Ec	2017-03-07 08:22:27=2E784527968
>+0100
>@@ -186,7 +186,7 @@ static ssize_t hwmon_attr_show_string(st
> 				      char *buf)
> {
> 	struct hwmon_device_attribute *hattr =3D to_hwmon_attr(devattr);
>-	char *s;
>+	const char *s;
> 	int ret;
>=20
> 	ret =3D hattr->ops->read_string(dev, hattr->type, hattr->attr,
>--- linux-4=2E10=2Eorig/include/linux/hwmon=2Eh	2017-02-19 23:34:00=2E000=
000000
>+0100
>+++ linux-4=2E10/include/linux/hwmon=2Eh	2017-03-07 08:21:28=2E247998585
>+0100
>@@ -336,7 +336,7 @@ struct hwmon_ops {
> 	int (*read)(struct device *dev, enum hwmon_sensor_types type,
> 		    u32 attr, int channel, long *val);
> 	int (*read_string)(struct device *dev, enum hwmon_sensor_types type,
>-		    u32 attr, int channel, char **str);
>+		    u32 attr, int channel, const char **str);
> 	int (*write)(struct device *dev, enum hwmon_sensor_types type,
> 		     u32 attr, int channel, long val);
> };

--=20
Sent from my mobile
