Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43415 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756660AbcIGPlH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2016 11:41:07 -0400
Subject: Re: [PATCH 1/2] hwmon: new driver for ST stts751 thermal sensor
To: andrea.merello@gmail.com
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
 <20160907131651.GA18441@Red>
 <0b99d601-20a9-acaf-bf21-a2ea92061564@roeck-us.net>
 <CAN8YU5OAR4RyyK-qvVVXV_bSjEkj9bLRSxUF98ZSLdOxkZr=Vw@mail.gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <99597c50-c73e-26ea-1690-6ab323e8c87a@roeck-us.net>
Date: Wed, 7 Sep 2016 08:41:02 -0700
MIME-Version: 1.0
In-Reply-To: <CAN8YU5OAR4RyyK-qvVVXV_bSjEkj9bLRSxUF98ZSLdOxkZr=Vw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/07/2016 08:03 AM, Andrea Merello wrote:
>
>
> On Wed, Sep 7, 2016 at 4:07 PM, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
>
>     On 09/07/2016 06:16 AM, LABBE Corentin wrote:
>
>         Hello
>
>         I have some coments below
>
>     Some more comments below.
>
>         On Wed, Sep 07, 2016 at 02:33:36PM +0200, Andrea Merello wrote:
>
>             This patch adds a HWMON driver for ST Microelectronics STTS751
>             temperature sensors.
>
>             It does support manual-triggered conversions as well as automatic
>             conversions. The latter is used when the "event" or "therm" function
>             is present (declaring the physical wire is attached in the DT).
>
>
>     All others are penaltized and have to wait for manual mode results when
>     reading the temperature ? Why ?
>
>
> The reason was that with this HW reading a precise value when automatic conversion is running is a pain (as explained in the long comment at the file beginning).
>

As I said, other drivers / chips have the same problem of "non-atomic" reads across
multiple registers. Maybe there is something else different with this chip, but from
the explanation there is no indication what it might be.

> BTW if we want to avoid waiting, I could try letting the converter running in auto mode, and disable it just before reading, perform the read, and enable again (but IMHO only when we have no therm/event, for the reasons explained in the comment)..
>
>
>
>             Thanks-to: LABBE Corentin [for suggestions]
>             Signed-off-by: Andrea Merello <andrea.merello@gmail.com <mailto:andrea.merello@gmail.com>>
>             Cc: LABBE Corentin <clabbe.montjoie@gmail.com <mailto:clabbe.montjoie@gmail.com>>
>             Cc: Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>>
>             Cc: Jean Delvare <jdelvare@suse.com <mailto:jdelvare@suse.com>>
>             ---
>              drivers/hwmon/Kconfig   |  12 +-
>              drivers/hwmon/Makefile  |   2 +-
>              drivers/hwmon/stts751.c | 948 ++++++++++++++++++++++++++++++++++++++++++++++++
>              3 files changed, 960 insertions(+), 2 deletions(-)
>              create mode 100644 drivers/hwmon/stts751.c
>
>             diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>             index eaf2f91..8fdd241 100644
>             --- a/drivers/hwmon/Kconfig
>             +++ b/drivers/hwmon/Kconfig
>             @@ -1448,6 +1448,16 @@ config SENSORS_SCH5636
>                       This driver can also be built as a module.  If so, the module
>                       will be called sch5636.
>
>             +config SENSORS_STTS751
>             +       tristate "ST Microelectronics STTS751"
>             +       depends on I2C
>             +       help
>             +         If you say yes here you get support for STTS751
>             +         temperature sensor chips.
>             +
>             +         This driver can also be built as a module.  If so, the module
>
>
>         Two space instead of one
>
>             +         will be called stts751.
>             +
>              config SENSORS_SMM665
>                     tristate "Summit Microelectronics SMM665"
>                     depends on I2C
>             @@ -1506,7 +1516,7 @@ config SENSORS_ADS7871
>
>              config SENSORS_AMC6821
>                     tristate "Texas Instruments AMC6821"
>             -       depends on I2C
>             +       depends on I2C
>
>
>         This change need to be in another set of patch
>
>                     help
>                       If you say yes here you get support for the Texas Instruments
>                       AMC6821 hardware monitoring chips.
>             diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>             index fe87d28..1114130 100644
>             --- a/drivers/hwmon/Makefile
>             +++ b/drivers/hwmon/Makefile
>             @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_SMM665)        += smm665.o
>              obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>              obj-$(CONFIG_SENSORS_SMSC47M1) += smsc47m1.o
>              obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>             +obj-$(CONFIG_SENSORS_STTS751)  += stts751.o
>              obj-$(CONFIG_SENSORS_AMC6821)  += amc6821.o
>              obj-$(CONFIG_SENSORS_TC74)     += tc74.o
>              obj-$(CONFIG_SENSORS_THMC50)   += thmc50.o
>             @@ -169,4 +170,3 @@ obj-$(CONFIG_SENSORS_WM8350)        += wm8350-hwmon.o
>              obj-$(CONFIG_PMBUS)            += pmbus/
>
>              ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>             -
>             diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
>             new file mode 100644
>             index 0000000..94b7e2b
>             --- /dev/null
>             +++ b/drivers/hwmon/stts751.c
>             @@ -0,0 +1,948 @@
>             +/*
>             + * STTS751 sensor driver
>             + *
>             + * Copyright (C) 2016 Istituto Italiano di Tecnologia - RBCS - EDL
>             + * Robotics, Brain and Cognitive Sciences department
>             + * Electronic Design Laboratory
>             + *
>             + * Written by Andrea Merello <andrea.merello@gmail.com <mailto:andrea.merello@gmail.com>>
>             + *
>             + * Based on the following drivers:
>             + * - LM95241 driver, which is:
>             + *   Copyright (C) 2008, 2010 Davide Rizzo <elpa.rizzo@gmail.com <mailto:elpa.rizzo@gmail.com>>
>             + * - LM90 driver, which is:
>             + *   Copyright (C) 2003-2010  Jean Delvare <jdelvare@suse.de <mailto:jdelvare@suse.de>>
>
>
>         No need to recopy copyright, we can find them in their driver.
>
>             +
>             +/* HW index vs ASCII and int times in mS */
>             +static const struct stts751_intervals_t stts751_intervals[] = {
>             +       {.str = "16000", .val = 16000},
>             +       {.str = "8000", .val = 8000},
>             +       {.str = "4000", .val = 4000},
>             +       {.str = "2000", .val = 2000},
>             +       {.str = "1000", .val = 1000},
>             +       {.str = "500", .val = 500},
>             +       {.str = "250", .val = 250},
>             +       {.str = "125", .val = 125},
>             +       {.str = "62.5", .val = 62},
>             +       {.str = "31.25", .val = 31}
>             +};
>
>
>         So you are lying about 62.5 and 31.25 :) ?
>
>
>     I don't see what the table (or rather, the string -> integer conversion) is used for anyway.
>     kstrtol() and sprintf() (or similar) seem to be doing a good job there. Also, there
>     is an API function to find the closest matching index in a value table.
>
>
>
> Well, the table does not only relates strings to integer (that would be really natural doing with kstrtol() and friends), but it also relates the conversion rate with the HW index for that conversion rate (str vs table index). So, given that I would have an array anyway, keeping also the pre-converted values seemed reasonable to me
>
> But I could store just the strings in the table, use kstrtol, and demote the table to be a single-dimensional array, if this is preferred.
>
> I'll look at the API you are suggesting. I wasn't aware of it...
>
>
Try find_nearest().

>
>             +
>             +/* special value to indicate to the SW to use manual mode */
>             +#define STTS751_INTERVAL_MANUAL 0xFF
>             +
>             +struct stts751_priv {
>             +       struct device *dev;
>             +       struct i2c_client *client;
>             +       struct mutex access_lock;
>             +       unsigned long interval;
>             +       int res;
>             +       bool gen_therm, gen_event;
>             +       int event_max, event_min;
>             +       int therm;
>             +       int hyst;
>             +       bool smbus_timeout;
>             +       int temp;
>             +       unsigned long last_update;
>             +       u8 config;
>             +       bool min_alert, max_alert;
>             +       bool data_valid;
>             +
>             +       /* Temperature is always present
>             +        * Depending by DT/platdata, therm, event, interval are
>             +        * dynamically added.
>             +        * There are max 4 entries plus the guard
>             +        */
>
>
>         This type of comment is wrong, you need /* only at the first line
>
>             +       const struct attribute_group *groups[5];
>             +};
>             +
>             +static int stts751_manual_conversion(struct stts751_priv *priv)
>             +{
>             +       s32 ret;
>             +       unsigned long timeout;
>             +
>             +       /* Any value written to this reg will trigger manual conversion */
>             +       ret = i2c_smbus_write_byte_data(priv->client,
>             +                               STTS751_REG_ONESHOT, 0xFF);
>             +       if (ret < 0)
>             +               return ret;
>             +
>             +       timeout = jiffies;
>             +
>             +       while (1) {
>             +               ret = i2c_smbus_read_byte_data(priv->client,
>             +                                       STTS751_REG_STATUS);
>             +               if (ret < 0)
>             +                       return ret;
>             +               if (!(ret & STTS751_STATUS_BUSY))
>             +                       return 0;
>             +               if (time_after(jiffies,
>             +                               timeout + STTS751_CONV_TIMEOUT * HZ / 1000)) {
>             +                       dev_warn(&priv->client->dev, "conversion timed out\n");
>             +                       break;
>             +               }
>             +       }
>
>
>         Perhaps you could rewrite it as:
>         do {
>         ...
>         } while (!time_after(xxx))
>         dev_warn()
>
>
>     It is unacceptable anyway, it being a hot loop, and I am not a friend
>     of noisy warnings. I'd also like to see an explanation why manual mode
>     has to be supported in the first place.
>
>
> I see your point, but It's supposed not to happen unless there is a problem. And if there is, then  I thought you might prefer to have extra noise rather than silence.. Anyway, I can either pull the warn off the loop (or rip it out completely) or try avoiding manual mode (see above for explanation).
>
Just keep in mind that I won't accept a hot loop (ie one that keeps
burning CPU without sleeping).

The only reason for possibly accepting manual mode might be to reduce power consumption.
Since power consumption for continuous mode can be reduced to a max of 35uA, I don't
really see the point. Unless there is more explanation how this chip is different to
other chips in the same situation, I don't really accept the explanation for all the
complexity either.

>
>
>             +       return -ETIMEDOUT;
>             +}
>             +
>             +/* Converts temperature in C split in integer and fractional parts, as supplied
>             + * by the HW, to an integer number in mC
>             + */
>
>
>         Same problem for comment (and all comentw below)
>
>             +static int stts751_update_temp(struct stts751_priv *priv)
>             +{
>             +       s32 integer1, integer2, frac;
>             +       unsigned long sample1, sample2, timeout;
>             +       int i;
>             +       int ret = 0;
>             +
>             +       mutex_lock(&priv->access_lock);
>             +
>             +       if (priv->interval == STTS751_INTERVAL_MANUAL) {
>             +               /* perform a one-shot on-demand conversion */
>             +               ret = stts751_manual_conversion(priv);
>             +               if (ret) {
>             +                       dev_warn(&priv->client->dev,
>             +                               "failed to shot conversion %x\n", ret);
>
>
>     If those are warnings, they are not errors and should not result in an abort.
>     If they are errors, they should be displayed as errors. But, as mentioned
>     before, I am not a friend of noisy drivers.
>
> You're right. It's an error. I might change this is either an error, or given that you don't like it, in a dev_dbg..
>
>
>
>             +                       goto exit;
>             +               }
>             +       }
>             +
>             +       for (i = 0; i < STTS751_RACE_RETRY; i++) {
>             +               sample1 = jiffies;
>             +               integer1 = i2c_smbus_read_byte_data(priv->client,
>             +                                               STTS751_REG_TEMP_H);
>             +
>             +               if (integer1 < 0) {
>             +                       ret = integer1;
>             +                       dev_warn(&priv->client->dev,
>             +                               "failed to read H reg %x\n", ret);
>             +                       goto exit;
>             +               }
>             +
>             +               frac = i2c_smbus_read_byte_data(priv->client,
>             +                                               STTS751_REG_TEMP_L);
>             +
>             +               if (frac < 0) {
>             +                       ret = frac;
>             +                       dev_warn(&priv->client->dev,
>             +                               "failed to read L reg %x\n", ret);
>             +                       goto exit;
>             +               }
>             +
>             +               if (priv->interval == STTS751_INTERVAL_MANUAL) {
>             +                       /* we'll look at integer2 later.. */
>             +                       integer2 = integer1;
>             +                       break;
>             +               }
>             +
>             +               integer2 = i2c_smbus_read_byte_data(priv->client,
>             +                                               STTS751_REG_TEMP_H);
>             +               sample2 = jiffies;
>             +
>             +               if (integer2 < 0) {
>             +                       dev_warn(&priv->client->dev,
>             +                               "failed to read H reg (2nd time) %x\n", ret);
>
>
>         Hard to find why you print ret and what exactly it is when you print it.
>
>     Plus the check should be right after the assignment.
>
>
> Just sample the time ASAP, that is "critical", then check if we have to throw the error.
>
>
>
>
>             +                       ret = integer2;
>             +                       goto exit;
>             +               }
>             +
>             +               timeout = stts751_intervals[priv->interval].val * HZ / 1000;
>             +               timeout -= ((timeout < 10) && (timeout > 1)) ? 1 : timeout / 10;
>
>
>         What it is the purpose of this decrease ?
>
>             +               if ((integer1 == integer2) &&
>             +                       time_after(sample1 + timeout, sample2))
>
>
>     And what is the purpose of this time_after() ? Other drivers have the
>     same problem and a much simpler solution that doesn't require a timeout
>     like this. If it is in fact needed, I would want to see a comment explaining it.
>
>
>
> Will look if I can find another driver with similar issue to snoop at..
>
Try lm90.c:lm90_read16().

>
>
>             +                       break;
>             +
>             +               /* if we are going on with a racy read, don't pretend to be
>             +                * super-precise, just use the MSBs ..
>             +                */
>             +               frac = 0;
>             +       }
>             +
>             +exit:
>             +       mutex_unlock(&priv->access_lock);
>             +       if (ret)
>             +               return ret;
>             +
>             +       /* use integer2, because when we fallback to the "MSB-only" compromise
>             +        * this is the more recent one
>             +        */
>             +       priv->temp = stts751_to_deg(integer2, frac);
>
>
>     All other drivers I am aware of manage to handle conversions from 16 bit chip
>     values to temperatures and from temperatures to chip values with a single parameter.
>
>
> I'll check this.. BTW This chip wants two separated reads from two registers, one for the integer and one for the fractional part. The purpose of this function is interpreting these two raw HW values to convert in a number. Is this so bad ?
>
Again, have a look at lm90.c:lm90_read16() and the conversion functions
in drivers which have to read two registers to read the temperature.

Is it bad ? It makes the code more complicated than it has to be and
increases code size, so, yes, I consider it bad.

To some degree I understand your concerns, but complex problems don't
always mean that there has to be a complex solution. Unless you have a good
reason for the complexity, please keep the driver as simple as possible.
That not only reduces code size, it also reduces the probability to
introduce bugs, and it reduces amount of time we have to spend reviewing
the code.

Thanks,
Guenter

>
>
>             +       return ret;
>             +}
>             +
>             +static int stts751_probe(struct i2c_client *client,
>             +                        const struct i2c_device_id *id)
>             +{
>             +       struct stts751_priv *priv;
>             +       int ret;
>             +       int groups_idx = 0;
>             +       struct device_node *of_node = client->dev.of_node;
>             +
>
>
>     np is the commonly accepted variable name.
>
>
> Will follow the convention..
>
>
>
>
>             +       priv = devm_kzalloc(&client->dev,
>             +                       sizeof(struct stts751_priv), GFP_KERNEL);
>
>
>         Could be rewrite to sizeof(*priv)
>
>         Regards
>
>         Labbe Corentin
>
>
>
>

