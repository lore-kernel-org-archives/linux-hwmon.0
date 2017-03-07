Return-path: <jdelvare@suse.de>
Date: Tue, 7 Mar 2017 10:08:46 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter =?UTF-8?B?SMO8d2U=?= <PeterHuewe@gmx.de>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Question about hwmon_attr_show_string
Message-ID: <20170307100846.0487135b@endymion>
In-Reply-To: <20170306234755.GA16512@roeck-us.net>
References: <201703030133.01363.PeterHuewe@gmx.de>
	<201703062148.36101.PeterHuewe@gmx.de>
	<20170306234755.GA16512@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Mon, 6 Mar 2017 15:47:55 -0800, Guenter Roeck wrote:
> On Mon, Mar 06, 2017 at 09:48:35PM +0100, Peter H=C3=BCwe wrote:
> > Hi Guenter,
> >=20
> > I was wondering whether there was a particular reason why=20
> > hwmon_attr_show_string passes only an "empty" pointer(pointer) to the o=
ps-
> > >read_string function rather than the buffer itself?
> >=20
> > Wouldn't this mean that in ops->read_string I'd have to reserve some sp=
ace for=20
> > the value on the heap (and taking care to free it somewhere, since retu=
rning=20
> > an address on the stack is bad idea), instead of calling sprintf(buf, "=
%s\n",=20
> > s) directly?
> >=20
> > With the current implementation I have to sprintf it into my local buff=
er and=20
> > you sprintf it again into the final buffer.
>
> The idea was that the called code would return a pointer to a constant st=
ring,
> ie one that isn't changing from call to call.

In that case, what about the following change?

Subject: hwmon: Constify str parameter of hwmon_ops->read_string

The read_string callback is supposed to retrieve a pointer to a
constant string.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/hwmon/hwmon.c |    2 +-
 include/linux/hwmon.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-4.10.orig/drivers/hwmon/hwmon.c	2017-02-19 23:34:00.000000000 +01=
00
+++ linux-4.10/drivers/hwmon/hwmon.c	2017-03-07 08:22:27.784527968 +0100
@@ -186,7 +186,7 @@ static ssize_t hwmon_attr_show_string(st
 				      char *buf)
 {
 	struct hwmon_device_attribute *hattr =3D to_hwmon_attr(devattr);
-	char *s;
+	const char *s;
 	int ret;
=20
 	ret =3D hattr->ops->read_string(dev, hattr->type, hattr->attr,
--- linux-4.10.orig/include/linux/hwmon.h	2017-02-19 23:34:00.000000000 +01=
00
+++ linux-4.10/include/linux/hwmon.h	2017-03-07 08:21:28.247998585 +0100
@@ -336,7 +336,7 @@ struct hwmon_ops {
 	int (*read)(struct device *dev, enum hwmon_sensor_types type,
 		    u32 attr, int channel, long *val);
 	int (*read_string)(struct device *dev, enum hwmon_sensor_types type,
-		    u32 attr, int channel, char **str);
+		    u32 attr, int channel, const char **str);
 	int (*write)(struct device *dev, enum hwmon_sensor_types type,
 		     u32 attr, int channel, long val);
 };


--=20
Jean Delvare
SUSE L3 Support
