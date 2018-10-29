Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io1-f66.google.com ([209.85.166.66]:47072 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbeJ3FMG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Oct 2018 01:12:06 -0400
Received: by mail-io1-f66.google.com with SMTP id y22-v6so5828179ioj.13
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Oct 2018 13:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181017222639.254434-1-kunyi@google.com> <20181027172833.GA25052@roeck-us.net>
In-Reply-To: <20181027172833.GA25052@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Mon, 29 Oct 2018 13:21:23 -0700
Message-ID: <CAGMNF6Xg28hm05wPXtq9bqssoNmgrzFGQiG4P+vLyXKvzvdJCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hwmon: (adm1275): Allow setting shunt reg value
To: Guenter Roeck <linux@roeck-us.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jdelvare@suse.com,
        corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Oct 27, 2018 at 10:28 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Oct 17, 2018 at 03:26:39PM -0700, Kun Yi wrote:
> > The ADM series of hotswap controllers support extending
> > the current measurement range by using a sensing resistor
> > value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> > sensing resistor doubles the maximal current can be measured.
> >
> > Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> > meaning for other resistor values, hwmon will report scaled
> > current/power measurements. This patch parses device tree parameter
> > "shunt-resistor-micro-ohms", if there is one.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> > Changes in v3:
> > - splitted hwmon and device tree binding patches
> >
> >  Documentation/hwmon/adm1275   |  3 +++
> >  drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
> > index 39033538eb03..5e277b0d91ce 100644
> > --- a/Documentation/hwmon/adm1275
> > +++ b/Documentation/hwmon/adm1275
> > @@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not support internal voltage
> >  or current scaling. Reported voltages, currents, and power are raw measurements,
> >  and will typically have to be scaled.
> >
> > +The shunt value in micro-ohms can be set via device tree at compile-time. Please
> > +refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for bindings
> > +if the device tree is used.
> >
> >  Platform data support
> >  ---------------------
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index 13600fa79e7f..f569372c9204 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
> >       const struct coefficients *coefficients;
> >       int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
> >       int tindex = -1;
> > +     u32 shunt;
> >
> >       if (!i2c_check_functionality(client->adapter,
> >                                    I2C_FUNC_SMBUS_READ_BYTE_DATA
> > @@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
> >       if (!data)
> >               return -ENOMEM;
> >
> > +     if (of_property_read_u32(client->dev.of_node,
> > +                              "shunt-resistor-micro-ohms", &shunt))
> > +             shunt = 1000; /* 1 mOhm if not set via DT */
> > +
> > +     if (shunt == 0)
> > +             return -EINVAL;
> > +
> >       data->id = mid->driver_data;
> >
> >       info = &data->info;
> > @@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
> >               info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
> >       }
> >       if (cindex >= 0) {
> > -             info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
> > +             /* Scale current with sense resistor value */
> > +             info->m[PSC_CURRENT_OUT] =
> > +                     coefficients[cindex].m * shunt / 1000;
> >               info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
> >               info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
> >       }
> >       if (pindex >= 0) {
> > -             info->m[PSC_POWER] = coefficients[pindex].m;
> > +             info->m[PSC_POWER] =
> > +                     coefficients[pindex].m * shunt / 1000;
> >               info->b[PSC_POWER] = coefficients[pindex].b;
> >               info->R[PSC_POWER] = coefficients[pindex].R;
> >       }

Thanks!

-- 
Regards,
Kun
