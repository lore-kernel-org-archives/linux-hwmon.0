Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <20160907131651.GA18441@Red>
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com> <20160907131651.GA18441@Red>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Wed, 7 Sep 2016 16:38:38 +0200
Message-ID: <CAN8YU5NQM_+ZoEY_ebQeO0aOn2OBhXWMcG9-e7xkTdU6Dcde9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: new driver for ST stts751 thermal sensor
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Content-Type: multipart/alternative; boundary=94eb2c05f97ea275d5053bebdf59
List-ID: <linux-hwmon@vger.kernel.org>

--94eb2c05f97ea275d5053bebdf59
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 7, 2016 at 3:16 PM, LABBE Corentin <clabbe.montjoie@gmail.com>
wrote:

> Hello
>
> I have some coments below
>
> On Wed, Sep 07, 2016 at 02:33:36PM +0200, Andrea Merello wrote:
> > This patch adds a HWMON driver for ST Microelectronics STTS751
> > temperature sensors.
> >
> > It does support manual-triggered conversions as well as automatic
> > conversions. The latter is used when the "event" or "therm" function
> > is present (declaring the physical wire is attached in the DT).
> >
> > Thanks-to: LABBE Corentin [for suggestions]
> > Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> > Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Jean Delvare <jdelvare@suse.com>
> > ---
> >  drivers/hwmon/Kconfig   |  12 +-
> >  drivers/hwmon/Makefile  |   2 +-
> >  drivers/hwmon/stts751.c | 948 ++++++++++++++++++++++++++++++
> ++++++++++++++++++
> >  3 files changed, 960 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/hwmon/stts751.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index eaf2f91..8fdd241 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1448,6 +1448,16 @@ config SENSORS_SCH5636
> >         This driver can also be built as a module.  If so, the module
> >         will be called sch5636.
> >
> > +config SENSORS_STTS751
> > +     tristate "ST Microelectronics STTS751"
> > +     depends on I2C
> > +     help
> > +       If you say yes here you get support for STTS751
> > +       temperature sensor chips.
> > +
> > +       This driver can also be built as a module.  If so, the module
>
> Two space instead of one
>

OK


>
> > +       will be called stts751.
> > +
> >  config SENSORS_SMM665
> >       tristate "Summit Microelectronics SMM665"
> >       depends on I2C
> > @@ -1506,7 +1516,7 @@ config SENSORS_ADS7871
> >
> >  config SENSORS_AMC6821
> >       tristate "Texas Instruments AMC6821"
> > -     depends on I2C
> > +     depends on I2C
>
> This change need to be in another set of patch
>

OK


>
> >       help
> >         If you say yes here you get support for the Texas Instruments
> >         AMC6821 hardware monitoring chips.
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index fe87d28..1114130 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_SMM665)      += smm665.o
> >  obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
> >  obj-$(CONFIG_SENSORS_SMSC47M1)       += smsc47m1.o
> >  obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
> > +obj-$(CONFIG_SENSORS_STTS751)        += stts751.o
> >  obj-$(CONFIG_SENSORS_AMC6821)        += amc6821.o
> >  obj-$(CONFIG_SENSORS_TC74)   += tc74.o
> >  obj-$(CONFIG_SENSORS_THMC50) += thmc50.o
> > @@ -169,4 +170,3 @@ obj-$(CONFIG_SENSORS_WM8350)      += wm8350-hwmon.o
> >  obj-$(CONFIG_PMBUS)          += pmbus/
> >
> >  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> > -
> > diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
> > new file mode 100644
> > index 0000000..94b7e2b
> > --- /dev/null
> > +++ b/drivers/hwmon/stts751.c
> > @@ -0,0 +1,948 @@
> > +/*
> > + * STTS751 sensor driver
> > + *
> > + * Copyright (C) 2016 Istituto Italiano di Tecnologia - RBCS - EDL
> > + * Robotics, Brain and Cognitive Sciences department
> > + * Electronic Design Laboratory
> > + *
> > + * Written by Andrea Merello <andrea.merello@gmail.com>
> > + *
> > + * Based on the following drivers:
> > + * - LM95241 driver, which is:
> > + *   Copyright (C) 2008, 2010 Davide Rizzo <elpa.rizzo@gmail.com>
> > + * - LM90 driver, which is:
> > + *   Copyright (C) 2003-2010  Jean Delvare <jdelvare@suse.de>
>
> No need to recopy copyright, we can find them in their driver.
>

OK


>
> > +
> > +/* HW index vs ASCII and int times in mS */
> > +static const struct stts751_intervals_t stts751_intervals[] = {
> > +     {.str = "16000", .val = 16000},
> > +     {.str = "8000", .val = 8000},
> > +     {.str = "4000", .val = 4000},
> > +     {.str = "2000", .val = 2000},
> > +     {.str = "1000", .val = 1000},
> > +     {.str = "500", .val = 500},
> > +     {.str = "250", .val = 250},
> > +     {.str = "125", .val = 125},
> > +     {.str = "62.5", .val = 62},
> > +     {.str = "31.25", .val = 31}
> > +};
>
> So you are lying about 62.5 and 31.25 :) ?
>

No, this is not my intention :)
The .val data is used only to find out reasonable (rounded) values for
things like timeout and cache time, as well as finding the closest walue
the HW can do. The user will see the (correct) string and the HW will use
the right value..


>
> > +
> > +/* special value to indicate to the SW to use manual mode */
> > +#define STTS751_INTERVAL_MANUAL 0xFF
> > +
> > +struct stts751_priv {
> > +     struct device *dev;
> > +     struct i2c_client *client;
> > +     struct mutex access_lock;
> > +     unsigned long interval;
> > +     int res;
> > +     bool gen_therm, gen_event;
> > +     int event_max, event_min;
> > +     int therm;
> > +     int hyst;
> > +     bool smbus_timeout;
> > +     int temp;
> > +     unsigned long last_update;
> > +     u8 config;
> > +     bool min_alert, max_alert;
> > +     bool data_valid;
> > +
> > +     /* Temperature is always present
> > +      * Depending by DT/platdata, therm, event, interval are
> > +      * dynamically added.
> > +      * There are max 4 entries plus the guard
> > +      */
>
> This type of comment is wrong, you need /* only at the first line
>

OK


>
> > +     const struct attribute_group *groups[5];
> > +};
> > +
> > +static int stts751_manual_conversion(struct stts751_priv *priv)
> > +{
> > +     s32 ret;
> > +     unsigned long timeout;
> > +
> > +     /* Any value written to this reg will trigger manual conversion */
> > +     ret = i2c_smbus_write_byte_data(priv->client,
> > +                             STTS751_REG_ONESHOT, 0xFF);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     timeout = jiffies;
> > +
> > +     while (1) {
> > +             ret = i2c_smbus_read_byte_data(priv->client,
> > +                                     STTS751_REG_STATUS);
> > +             if (ret < 0)
> > +                     return ret;
> > +             if (!(ret & STTS751_STATUS_BUSY))
> > +                     return 0;
> > +             if (time_after(jiffies,
> > +                             timeout + STTS751_CONV_TIMEOUT * HZ /
> 1000)) {
> > +                     dev_warn(&priv->client->dev, "conversion timed
> out\n");
> > +                     break;
> > +             }
> > +     }
>
> Perhaps you could rewrite it as:
> do {
> ...
> } while (!time_after(xxx))
> dev_warn()
>

OK


>
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +/* Converts temperature in C split in integer and fractional parts, as
> supplied
> > + * by the HW, to an integer number in mC
> > + */
>
> Same problem for comment (and all comentw below)
>

OK


>
> > +static int stts751_update_temp(struct stts751_priv *priv)
> > +{
> > +     s32 integer1, integer2, frac;
> > +     unsigned long sample1, sample2, timeout;
> > +     int i;
> > +     int ret = 0;
> > +
> > +     mutex_lock(&priv->access_lock);
> > +
> > +     if (priv->interval == STTS751_INTERVAL_MANUAL) {
> > +             /* perform a one-shot on-demand conversion */
> > +             ret = stts751_manual_conversion(priv);
> > +             if (ret) {
> > +                     dev_warn(&priv->client->dev,
> > +                             "failed to shot conversion %x\n", ret);
> > +                     goto exit;
> > +             }
> > +     }
> > +
> > +     for (i = 0; i < STTS751_RACE_RETRY; i++) {
> > +             sample1 = jiffies;
> > +             integer1 = i2c_smbus_read_byte_data(priv->client,
> > +                                             STTS751_REG_TEMP_H);
> > +
> > +             if (integer1 < 0) {
> > +                     ret = integer1;
> > +                     dev_warn(&priv->client->dev,
> > +                             "failed to read H reg %x\n", ret);
> > +                     goto exit;
> > +             }
> > +
> > +             frac = i2c_smbus_read_byte_data(priv->client,
> > +                                             STTS751_REG_TEMP_L);
> > +
> > +             if (frac < 0) {
> > +                     ret = frac;
> > +                     dev_warn(&priv->client->dev,
> > +                             "failed to read L reg %x\n", ret);
> > +                     goto exit;
> > +             }
> > +
> > +             if (priv->interval == STTS751_INTERVAL_MANUAL) {
> > +                     /* we'll look at integer2 later.. */
> > +                     integer2 = integer1;
> > +                     break;
> > +             }
> > +
> > +             integer2 = i2c_smbus_read_byte_data(priv->client,
> > +                                             STTS751_REG_TEMP_H);
> > +             sample2 = jiffies;
> > +
> > +             if (integer2 < 0) {
> > +                     dev_warn(&priv->client->dev,
> > +                             "failed to read H reg (2nd time) %x\n",
> ret);
>
> Hard to find why you print ret and what exactly it is when you print it.
>
> OK, I will change this someway


> > +                     ret = integer2;
> > +                     goto exit;
> > +             }
> > +
> > +             timeout = stts751_intervals[priv->interval].val * HZ /
> 1000;
> > +             timeout -= ((timeout < 10) && (timeout > 1)) ? 1 : timeout
> / 10;
>
> What it is the purpose of this decrease ?
>

Now that I'm looking at it again, I admit I'm not completely convinced of
it me too. BTW it was meant for being conservative, checking for a time
interval slightly less than the real conversion rate.

Anyway I will add a comment and eventually rewrite/fix it.

>
> > +             if ((integer1 == integer2) &&
> > +                     time_after(sample1 + timeout, sample2))
> > +                     break;
> > +
> > +             /* if we are going on with a racy read, don't pretend to be
> > +              * super-precise, just use the MSBs ..
> > +              */
> > +             frac = 0;
> > +     }
> > +
> > +exit:
> > +     mutex_unlock(&priv->access_lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* use integer2, because when we fallback to the "MSB-only"
> compromise
> > +      * this is the more recent one
> > +      */
> > +     priv->temp = stts751_to_deg(integer2, frac);
> > +     return ret;
> > +}
> > +
> > +static int stts751_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id)
> > +{
> > +     struct stts751_priv *priv;
> > +     int ret;
> > +     int groups_idx = 0;
> > +     struct device_node *of_node = client->dev.of_node;
> > +
> > +     priv = devm_kzalloc(&client->dev,
> > +                     sizeof(struct stts751_priv), GFP_KERNEL);
>
> Could be rewrite to sizeof(*priv)
>

OK


>
> Regards
>
> Labbe Corentin
>
>

--94eb2c05f97ea275d5053bebdf59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Sep 7, 2016 at 3:16 PM, LABBE Corentin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:clabbe.montjoie@gmail.com" target=3D"_blank">clabbe.montjoie@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello<br>
<br>
I have some coments below<br>
<div><div><br>
On Wed, Sep 07, 2016 at 02:33:36PM +0200, Andrea Merello wrote:<br>
&gt; This patch adds a HWMON driver for ST Microelectronics STTS751<br>
&gt; temperature sensors.<br>
&gt;<br>
&gt; It does support manual-triggered conversions as well as automatic<br>
&gt; conversions. The latter is used when the &quot;event&quot; or &quot;th=
erm&quot; function<br>
&gt; is present (declaring the physical wire is attached in the DT).<br>
&gt;<br>
&gt; Thanks-to: LABBE Corentin [for suggestions]<br>
&gt; Signed-off-by: Andrea Merello &lt;<a href=3D"mailto:andrea.merello@gma=
il.com" target=3D"_blank">andrea.merello@gmail.com</a>&gt;<br>
&gt; Cc: LABBE Corentin &lt;<a href=3D"mailto:clabbe.montjoie@gmail.com" ta=
rget=3D"_blank">clabbe.montjoie@gmail.com</a>&gt;<br>
&gt; Cc: Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net" target=3D"=
_blank">linux@roeck-us.net</a>&gt;<br>
&gt; Cc: Jean Delvare &lt;<a href=3D"mailto:jdelvare@suse.com" target=3D"_b=
lank">jdelvare@suse.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/hwmon/Kconfig=C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 drivers/hwmon/Makefile=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 drivers/hwmon/stts751.c | 948 ++++++++++++++++++++++++++++++<wbr=
>++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 960 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 drivers/hwmon/stts751.c<br>
&gt;<br>
&gt; diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig<br>
&gt; index eaf2f91..8fdd241 100644<br>
&gt; --- a/drivers/hwmon/Kconfig<br>
&gt; +++ b/drivers/hwmon/Kconfig<br>
&gt; @@ -1448,6 +1448,16 @@ config SENSORS_SCH5636<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a mo=
dule.=C2=A0 If so, the module<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called sch5636.<br>
&gt;<br>
&gt; +config SENSORS_STTS751<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;ST Microelectronics STTS751&quot;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support for ST=
TS751<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0temperature sensor chips.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a module.=
=C2=A0 If so, the module<br>
<br>
</div></div>Two space instead of one<br></blockquote><div><br></div><div>OK=
<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0will be called stts751.<br>
&gt; +<br>
&gt;=C2=A0 config SENSORS_SMM665<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Summit Microelectronics SMM66=
5&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on I2C<br>
&gt; @@ -1506,7 +1516,7 @@ config SENSORS_ADS7871<br>
&gt;<br>
&gt;=C2=A0 config SENSORS_AMC6821<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Texas Instruments AMC6821&quo=
t;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
<br>
</span>This change need to be in another set of patch<br></blockquote><div>=
<br></div><div>OK<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support f=
or the Texas Instruments<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMC6821 hardware monitoring chips.<br=
>
&gt; diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile<br>
&gt; index fe87d28..1114130 100644<br>
&gt; --- a/drivers/hwmon/Makefile<br>
&gt; +++ b/drivers/hwmon/Makefile<br>
&gt; @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_SMM665)=C2=A0 =C2=A0 =C2=A0 +=
=3D smm665.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_SMSC47B39<wbr>7)+=3D smsc47b397.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_SMSC47M1)<wbr>=C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D smsc47m1.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_SMSC47M19<wbr>2)+=3D smsc47m192.o<br>
&gt; +obj-$(CONFIG_SENSORS_STTS751)<wbr>=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D st=
ts751.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_AMC6821)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D am=
c6821.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_TC74)=C2=A0 =C2=A0+=3D tc74.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_THMC50) +=3D thmc50.o<br>
&gt; @@ -169,4 +170,3 @@ obj-$(CONFIG_SENSORS_WM8350)=C2=A0 =C2=A0 =C2=A0 +=
=3D wm8350-hwmon.o<br>
&gt;=C2=A0 obj-$(CONFIG_PMBUS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D pmbus=
/<br>
&gt;<br>
&gt;=C2=A0 ccflags-$(CONFIG_HWMON_DEBUG_C<wbr>HIP) :=3D -DDEBUG<br>
&gt; -<br>
&gt; diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..94b7e2b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/hwmon/stts751.c<br>
&gt; @@ -0,0 +1,948 @@<br>
&gt; +/*<br>
&gt; + * STTS751 sensor driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2016 Istituto Italiano di Tecnologia - RBCS - EDL<br=
>
&gt; + * Robotics, Brain and Cognitive Sciences department<br>
&gt; + * Electronic Design Laboratory<br>
&gt; + *<br>
&gt; + * Written by Andrea Merello &lt;<a href=3D"mailto:andrea.merello@gma=
il.com" target=3D"_blank">andrea.merello@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Based on the following drivers:<br>
&gt; + * - LM95241 driver, which is:<br>
&gt; + *=C2=A0 =C2=A0Copyright (C) 2008, 2010 Davide Rizzo &lt;<a href=3D"m=
ailto:elpa.rizzo@gmail.com" target=3D"_blank">elpa.rizzo@gmail.com</a>&gt;<=
br>
&gt; + * - LM90 driver, which is:<br>
&gt; + *=C2=A0 =C2=A0Copyright (C) 2003-2010=C2=A0 Jean Delvare &lt;<a href=
=3D"mailto:jdelvare@suse.de" target=3D"_blank">jdelvare@suse.de</a>&gt;<br>
<br>
</div></div>No need to recopy copyright, we can find them in their driver.<=
br></blockquote><div><br></div><div>OK<br>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<span><br>
&gt; +<br>
&gt; +/* HW index vs ASCII and int times in mS */<br>
&gt; +static const struct stts751_intervals_t stts751_intervals[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;16000&quot;, .val =3D 16000},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;8000&quot;, .val =3D 8000},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;4000&quot;, .val =3D 4000},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;2000&quot;, .val =3D 2000},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;1000&quot;, .val =3D 1000},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;500&quot;, .val =3D 500},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;250&quot;, .val =3D 250},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;125&quot;, .val =3D 125},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;62.5&quot;, .val =3D 62},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{.str =3D &quot;31.25&quot;, .val =3D 31}<br>
&gt; +};<br>
<br>
</span>So you are lying about 62.5 and 31.25 :) ?<br></blockquote><div><br>=
</div><div>No, this is not my intention :)<br></div><div>The .val data is u=
sed only to find out reasonable (rounded) values for things like timeout an=
d cache time, as well as finding the closest walue the HW can do. The user =
will see the (correct) string and the HW will use the right value..<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div><br>
&gt; +<br>
&gt; +/* special value to indicate to the SW to use manual mode */<br>
&gt; +#define STTS751_INTERVAL_MANUAL 0xFF<br>
&gt; +<br>
&gt; +struct stts751_priv {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex access_lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long interval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool gen_therm, gen_event;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int event_max, event_min;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int therm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int hyst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool smbus_timeout;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int temp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long last_update;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 config;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool min_alert, max_alert;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool data_valid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Temperature is always present<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Depending by DT/platdata, therm, event, interv=
al are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * dynamically added.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * There are max 4 entries plus the guard<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
</div></div>This type of comment is wrong, you need /* only at the first li=
ne<br></blockquote><div><br></div><div>OK<br>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<div><div><br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct attribute_group *groups[5];<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int stts751_manual_conversion(stru<wbr>ct stts751_priv *priv)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s32 ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long timeout;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Any value written to this reg will trigger man=
ual conversion */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_write_byte_data(priv<wbr>-&gt;c=
lient,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STTS751_REG_ONESHOT, 0xFF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0timeout =3D jiffies;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_byte_data(priv-<wbr>&gt;client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STTS751_REG_=
STATUS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(ret &amp; STTS7=
51_STATUS_BUSY))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (time_after(jiffie=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout + STTS751_CONV_TIMEOUT * HZ / 10=
00)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;priv-&gt;client-&gt;dev, &quot;conversion timed out\n&=
quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
</div></div>Perhaps you could rewrite it as:<br>
do {<br>
...<br>
} while (!time_after(xxx))<br>
dev_warn()<br></blockquote><div><br></div><div>OK<br>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Converts temperature in C split in integer and fractional parts, a=
s supplied<br>
&gt; + * by the HW, to an integer number in mC<br>
&gt; + */<br>
<br>
</span>Same problem for comment (and all comentw below)<br></blockquote><di=
v><br></div><div>OK<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div><br>
&gt; +static int stts751_update_temp(struct stts751_priv *priv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s32 integer1, integer2, frac;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long sample1, sample2, timeout;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;priv-&gt;access_<wbr>lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (priv-&gt;interval =3D=3D STTS751_INTERVAL_MAN=
UAL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* perform a one-shot=
 on-demand conversion */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D stts751_manua=
l_conversion(priv<wbr>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to shot conversion %x\n&quo=
t;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; STTS751_RACE_RETRY; i++) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sample1 =3D jiffies;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0integer1 =3D i2c_smbu=
s_read_byte_data(priv-<wbr>&gt;client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0STTS751_REG_TEMP_H);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (integer1 &lt; 0) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D integer1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to read H reg %x\n&quot;, r=
et);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frac =3D i2c_smbus_re=
ad_byte_data(priv-<wbr>&gt;client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0STTS751_REG_TEMP_L);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (frac &lt; 0) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D frac;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to read L reg %x\n&quot;, r=
et);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;interval=
 =3D=3D STTS751_INTERVAL_MANUAL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* we&#39;ll look at integer2 later.. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0integer2 =3D integer1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0integer2 =3D i2c_smbu=
s_read_byte_data(priv-<wbr>&gt;client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0STTS751_REG_TEMP_H);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sample2 =3D jiffies;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (integer2 &lt; 0) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to read H reg (2nd time) %x=
\n&quot;, ret);<br>
<br>
</div></div>Hard to find why you print ret and what exactly it is when you =
print it.<br>
<span><br></span></blockquote><div>OK, I will change this someway<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D integer2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout =3D stts751_i=
ntervals[priv-&gt;interv<wbr>al].val * HZ / 1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout -=3D ((timeou=
t &lt; 10) &amp;&amp; (timeout &gt; 1)) ? 1 : timeout / 10;<br>
<br>
</span>What it is the purpose of this decrease ?<br></blockquote><div><br><=
/div><div>Now that I&#39;m looking at it again, I admit I&#39;m not complet=
ely convinced of it me too. BTW it was meant for being conservative, checki=
ng for a time interval slightly less than the real conversion rate.<br><br>=
</div><div>Anyway I will add a comment and eventually rewrite/fix it. <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((integer1 =3D=3D =
integer2) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0time_after(sample1 + timeout, sample2))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if we are going on=
 with a racy read, don&#39;t pretend to be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * super-precise, jus=
t use the MSBs ..<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frac =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +exit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;priv-&gt;access_lo<wbr>ck);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* use integer2, because when we fallback to the =
&quot;MSB-only&quot; compromise<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this is the more recent one<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;temp =3D stts751_to_deg(integer2, frac);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
</span><span>&gt; +static int stts751_probe(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 const struct i2c_device_id *id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stts751_priv *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int groups_idx =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *of_node =3D client-&gt;dev.of=
_node;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof(struct stts751_priv), GFP_KERNEL);<br>
<br>
</span>Could be rewrite to sizeof(*priv)<br></blockquote><div><br></div><di=
v>OK<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards<br>
<span><font color=3D"#888888"><br>
Labbe Corentin<br>
<br>
</font></span></blockquote></div><br></div></div>

--94eb2c05f97ea275d5053bebdf59--
