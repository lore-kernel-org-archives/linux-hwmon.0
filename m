Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <99597c50-c73e-26ea-1690-6ab323e8c87a@roeck-us.net>
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
 <20160907131651.GA18441@Red> <0b99d601-20a9-acaf-bf21-a2ea92061564@roeck-us.net>
 <CAN8YU5OAR4RyyK-qvVVXV_bSjEkj9bLRSxUF98ZSLdOxkZr=Vw@mail.gmail.com> <99597c50-c73e-26ea-1690-6ab323e8c87a@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Thu, 8 Sep 2016 09:42:06 +0200
Message-ID: <CAN8YU5O+mn53PnfbjKUderXXzPiVBAtiFRe8-wTzQypDkjwwmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>
Content-Type: multipart/alternative; boundary=94eb2c0b08b8d54bb4053bfa2be7
List-ID: <linux-hwmon@vger.kernel.org>

--94eb2c0b08b8d54bb4053bfa2be7
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 7, 2016 at 5:41 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> On 09/07/2016 08:03 AM, Andrea Merello wrote:
>
>>
>>
>> On Wed, Sep 7, 2016 at 4:07 PM, Guenter Roeck <linux@roeck-us.net
>> <mailto:linux@roeck-us.net>> wrote:
>>
>>     On 09/07/2016 06:16 AM, LABBE Corentin wrote:
>>
>>         Hello
>>
>>         I have some coments below
>>
>>     Some more comments below.
>>
>>         On Wed, Sep 07, 2016 at 02:33:36PM +0200, Andrea Merello wrote:
>>
>>             This patch adds a HWMON driver for ST Microelectronics STTS751
>>             temperature sensors.
>>
>>             It does support manual-triggered conversions as well as
>> automatic
>>             conversions. The latter is used when the "event" or "therm"
>> function
>>             is present (declaring the physical wire is attached in the
>> DT).
>>
>>
>>     All others are penaltized and have to wait for manual mode results
>> when
>>     reading the temperature ? Why ?
>>
>>
>> The reason was that with this HW reading a precise value when automatic
>> conversion is running is a pain (as explained in the long comment at the
>> file beginning).
>>
>>
> As I said, other drivers / chips have the same problem of "non-atomic"
> reads across
> multiple registers. Maybe there is something else different with this
> chip, but from
> the explanation there is no indication what it might be.
>
> BTW if we want to avoid waiting, I could try letting the converter running
>> in auto mode, and disable it just before reading, perform the read, and
>> enable again (but IMHO only when we have no therm/event, for the reasons
>> explained in the comment)..
>>
>>
>>
>>             Thanks-to: LABBE Corentin [for suggestions]
>>             Signed-off-by: Andrea Merello <andrea.merello@gmail.com
>> <mailto:andrea.merello@gmail.com>>
>>             Cc: LABBE Corentin <clabbe.montjoie@gmail.com <mailto:
>> clabbe.montjoie@gmail.com>>
>>             Cc: Guenter Roeck <linux@roeck-us.net <mailto:
>> linux@roeck-us.net>>
>>             Cc: Jean Delvare <jdelvare@suse.com <mailto:jdelvare@suse.com
>> >>
>>
>>             ---
>>              drivers/hwmon/Kconfig   |  12 +-
>>              drivers/hwmon/Makefile  |   2 +-
>>              drivers/hwmon/stts751.c | 948 ++++++++++++++++++++++++++++++
>> ++++++++++++++++++
>>              3 files changed, 960 insertions(+), 2 deletions(-)
>>              create mode 100644 drivers/hwmon/stts751.c
>>
>>             diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>             index eaf2f91..8fdd241 100644
>>             --- a/drivers/hwmon/Kconfig
>>             +++ b/drivers/hwmon/Kconfig
>>             @@ -1448,6 +1448,16 @@ config SENSORS_SCH5636
>>                       This driver can also be built as a module.  If so,
>> the module
>>                       will be called sch5636.
>>
>>             +config SENSORS_STTS751
>>             +       tristate "ST Microelectronics STTS751"
>>             +       depends on I2C
>>             +       help
>>             +         If you say yes here you get support for STTS751
>>             +         temperature sensor chips.
>>             +
>>             +         This driver can also be built as a module.  If so,
>> the module
>>
>>
>>         Two space instead of one
>>
>>             +         will be called stts751.
>>             +
>>              config SENSORS_SMM665
>>                     tristate "Summit Microelectronics SMM665"
>>                     depends on I2C
>>             @@ -1506,7 +1516,7 @@ config SENSORS_ADS7871
>>
>>              config SENSORS_AMC6821
>>                     tristate "Texas Instruments AMC6821"
>>             -       depends on I2C
>>             +       depends on I2C
>>
>>
>>         This change need to be in another set of patch
>>
>>                     help
>>                       If you say yes here you get support for the Texas
>> Instruments
>>                       AMC6821 hardware monitoring chips.
>>             diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>             index fe87d28..1114130 100644
>>             --- a/drivers/hwmon/Makefile
>>             +++ b/drivers/hwmon/Makefile
>>             @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_SMM665)        +=
>> smm665.o
>>              obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>>              obj-$(CONFIG_SENSORS_SMSC47M1) += smsc47m1.o
>>              obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>>             +obj-$(CONFIG_SENSORS_STTS751)  += stts751.o
>>              obj-$(CONFIG_SENSORS_AMC6821)  += amc6821.o
>>              obj-$(CONFIG_SENSORS_TC74)     += tc74.o
>>              obj-$(CONFIG_SENSORS_THMC50)   += thmc50.o
>>             @@ -169,4 +170,3 @@ obj-$(CONFIG_SENSORS_WM8350)        +=
>> wm8350-hwmon.o
>>              obj-$(CONFIG_PMBUS)            += pmbus/
>>
>>              ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>>             -
>>             diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
>>             new file mode 100644
>>             index 0000000..94b7e2b
>>             --- /dev/null
>>             +++ b/drivers/hwmon/stts751.c
>>             @@ -0,0 +1,948 @@
>>             +/*
>>             + * STTS751 sensor driver
>>             + *
>>             + * Copyright (C) 2016 Istituto Italiano di Tecnologia - RBCS
>> - EDL
>>             + * Robotics, Brain and Cognitive Sciences department
>>             + * Electronic Design Laboratory
>>             + *
>>             + * Written by Andrea Merello <andrea.merello@gmail.com
>> <mailto:andrea.merello@gmail.com>>
>>             + *
>>             + * Based on the following drivers:
>>             + * - LM95241 driver, which is:
>>             + *   Copyright (C) 2008, 2010 Davide Rizzo <
>> elpa.rizzo@gmail.com <mailto:elpa.rizzo@gmail.com>>
>>             + * - LM90 driver, which is:
>>             + *   Copyright (C) 2003-2010  Jean Delvare <jdelvare@suse.de
>> <mailto:jdelvare@suse.de>>
>>
>>
>>         No need to recopy copyright, we can find them in their driver.
>>
>>             +
>>             +/* HW index vs ASCII and int times in mS */
>>             +static const struct stts751_intervals_t stts751_intervals[]
>> = {
>>             +       {.str = "16000", .val = 16000},
>>             +       {.str = "8000", .val = 8000},
>>             +       {.str = "4000", .val = 4000},
>>             +       {.str = "2000", .val = 2000},
>>             +       {.str = "1000", .val = 1000},
>>             +       {.str = "500", .val = 500},
>>             +       {.str = "250", .val = 250},
>>             +       {.str = "125", .val = 125},
>>             +       {.str = "62.5", .val = 62},
>>             +       {.str = "31.25", .val = 31}
>>             +};
>>
>>
>>         So you are lying about 62.5 and 31.25 :) ?
>>
>>
>>     I don't see what the table (or rather, the string -> integer
>> conversion) is used for anyway.
>>     kstrtol() and sprintf() (or similar) seem to be doing a good job
>> there. Also, there
>>     is an API function to find the closest matching index in a value
>> table.
>>
>>
>>
>> Well, the table does not only relates strings to integer (that would be
>> really natural doing with kstrtol() and friends), but it also relates the
>> conversion rate with the HW index for that conversion rate (str vs table
>> index). So, given that I would have an array anyway, keeping also the
>> pre-converted values seemed reasonable to me
>>
>> But I could store just the strings in the table, use kstrtol, and demote
>> the table to be a single-dimensional array, if this is preferred.
>>
>> I'll look at the API you are suggesting. I wasn't aware of it...
>>
>>
>> Try find_nearest().
>
>
Ok


>
>
>>             +
>>             +/* special value to indicate to the SW to use manual mode */
>>             +#define STTS751_INTERVAL_MANUAL 0xFF
>>             +
>>             +struct stts751_priv {
>>             +       struct device *dev;
>>             +       struct i2c_client *client;
>>             +       struct mutex access_lock;
>>             +       unsigned long interval;
>>             +       int res;
>>             +       bool gen_therm, gen_event;
>>             +       int event_max, event_min;
>>             +       int therm;
>>             +       int hyst;
>>             +       bool smbus_timeout;
>>             +       int temp;
>>             +       unsigned long last_update;
>>             +       u8 config;
>>             +       bool min_alert, max_alert;
>>             +       bool data_valid;
>>             +
>>             +       /* Temperature is always present
>>             +        * Depending by DT/platdata, therm, event, interval
>> are
>>             +        * dynamically added.
>>             +        * There are max 4 entries plus the guard
>>             +        */
>>
>>
>>         This type of comment is wrong, you need /* only at the first line
>>
>>             +       const struct attribute_group *groups[5];
>>             +};
>>             +
>>             +static int stts751_manual_conversion(struct stts751_priv
>> *priv)
>>             +{
>>             +       s32 ret;
>>             +       unsigned long timeout;
>>             +
>>             +       /* Any value written to this reg will trigger manual
>> conversion */
>>             +       ret = i2c_smbus_write_byte_data(priv->client,
>>             +                               STTS751_REG_ONESHOT, 0xFF);
>>             +       if (ret < 0)
>>             +               return ret;
>>             +
>>             +       timeout = jiffies;
>>             +
>>             +       while (1) {
>>             +               ret = i2c_smbus_read_byte_data(priv->client,
>>             +                                       STTS751_REG_STATUS);
>>             +               if (ret < 0)
>>             +                       return ret;
>>             +               if (!(ret & STTS751_STATUS_BUSY))
>>             +                       return 0;
>>             +               if (time_after(jiffies,
>>             +                               timeout +
>> STTS751_CONV_TIMEOUT * HZ / 1000)) {
>>             +                       dev_warn(&priv->client->dev,
>> "conversion timed out\n");
>>             +                       break;
>>             +               }
>>             +       }
>>
>>
>>         Perhaps you could rewrite it as:
>>         do {
>>         ...
>>         } while (!time_after(xxx))
>>         dev_warn()
>>
>>
>>     It is unacceptable anyway, it being a hot loop, and I am not a friend
>>     of noisy warnings. I'd also like to see an explanation why manual mode
>>     has to be supported in the first place.
>>
>>
>> I see your point, but It's supposed not to happen unless there is a
>> problem. And if there is, then  I thought you might prefer to have extra
>> noise rather than silence.. Anyway, I can either pull the warn off the loop
>> (or rip it out completely) or try avoiding manual mode (see above for
>> explanation).
>>
>> Just keep in mind that I won't accept a hot loop (ie one that keeps
> burning CPU without sleeping).
>
>
OK


> The only reason for possibly accepting manual mode might be to reduce
> power consumption.
> Since power consumption for continuous mode can be reduced to a max of
> 35uA, I don't
> really see the point. Unless there is more explanation how this chip is
> different to
> other chips in the same situation, I don't really accept the explanation
> for all the
> complexity either.
>
>
>
OK, I'll try to make it always working in automatic mode.


>
>>
>>             +       return -ETIMEDOUT;
>>             +}
>>             +
>>             +/* Converts temperature in C split in integer and fractional
>> parts, as supplied
>>             + * by the HW, to an integer number in mC
>>             + */
>>
>>
>>         Same problem for comment (and all comentw below)
>>
>>             +static int stts751_update_temp(struct stts751_priv *priv)
>>             +{
>>             +       s32 integer1, integer2, frac;
>>             +       unsigned long sample1, sample2, timeout;
>>             +       int i;
>>             +       int ret = 0;
>>             +
>>             +       mutex_lock(&priv->access_lock);
>>             +
>>             +       if (priv->interval == STTS751_INTERVAL_MANUAL) {
>>             +               /* perform a one-shot on-demand conversion */
>>             +               ret = stts751_manual_conversion(priv);
>>             +               if (ret) {
>>             +                       dev_warn(&priv->client->dev,
>>             +                               "failed to shot conversion
>> %x\n", ret);
>>
>>
>>     If those are warnings, they are not errors and should not result in
>> an abort.
>>     If they are errors, they should be displayed as errors. But, as
>> mentioned
>>     before, I am not a friend of noisy drivers.
>>
>> You're right. It's an error. I might change this is either an error, or
>> given that you don't like it, in a dev_dbg..
>>
>>
>>
>>             +                       goto exit;
>>             +               }
>>             +       }
>>             +
>>             +       for (i = 0; i < STTS751_RACE_RETRY; i++) {
>>             +               sample1 = jiffies;
>>             +               integer1 = i2c_smbus_read_byte_data(priv-
>> >client,
>>             +
>>  STTS751_REG_TEMP_H);
>>             +
>>             +               if (integer1 < 0) {
>>             +                       ret = integer1;
>>             +                       dev_warn(&priv->client->dev,
>>             +                               "failed to read H reg %x\n",
>> ret);
>>             +                       goto exit;
>>             +               }
>>             +
>>             +               frac = i2c_smbus_read_byte_data(priv->client,
>>             +
>>  STTS751_REG_TEMP_L);
>>             +
>>             +               if (frac < 0) {
>>             +                       ret = frac;
>>             +                       dev_warn(&priv->client->dev,
>>             +                               "failed to read L reg %x\n",
>> ret);
>>             +                       goto exit;
>>             +               }
>>             +
>>             +               if (priv->interval ==
>> STTS751_INTERVAL_MANUAL) {
>>             +                       /* we'll look at integer2 later.. */
>>             +                       integer2 = integer1;
>>             +                       break;
>>             +               }
>>             +
>>             +               integer2 = i2c_smbus_read_byte_data(priv-
>> >client,
>>             +
>>  STTS751_REG_TEMP_H);
>>             +               sample2 = jiffies;
>>             +
>>             +               if (integer2 < 0) {
>>             +                       dev_warn(&priv->client->dev,
>>             +                               "failed to read H reg (2nd
>> time) %x\n", ret);
>>
>>
>>         Hard to find why you print ret and what exactly it is when you
>> print it.
>>
>>     Plus the check should be right after the assignment.
>>
>>
>> Just sample the time ASAP, that is "critical", then check if we have to
>> throw the error.
>>
>>
>>
>>
>>             +                       ret = integer2;
>>             +                       goto exit;
>>             +               }
>>             +
>>             +               timeout = stts751_intervals[priv->interval].val
>> * HZ / 1000;
>>             +               timeout -= ((timeout < 10) && (timeout > 1))
>> ? 1 : timeout / 10;
>>
>>
>>         What it is the purpose of this decrease ?
>>
>>             +               if ((integer1 == integer2) &&
>>             +                       time_after(sample1 + timeout,
>> sample2))
>>
>>
>>     And what is the purpose of this time_after() ? Other drivers have the
>>     same problem and a much simpler solution that doesn't require a
>> timeout
>>     like this. If it is in fact needed, I would want to see a comment
>> explaining it.
>>
>>
>>
>> Will look if I can find another driver with similar issue to snoop at..
>>
>> Try lm90.c:lm90_read16().
>


I see.. This is reasonable, and I will implement this trick in stts751
driver.. This seems to have good chances to read correctly, but it can
still go racy for example if the converter ends a conversion between the
first two reads, and we get preempted in between the last two reads (so
that the HW ends another conversion). IMHO looking _also_  at time, and
eventually retry, makes things even more robust..

I'd say we could add time check and retry (with proper cpu_relax() to avoid
those hot loops) also to lm90 rather than removing it from stts651  :)


>
>
>>
>>             +                       break;
>>             +
>>             +               /* if we are going on with a racy read, don't
>> pretend to be
>>             +                * super-precise, just use the MSBs ..
>>             +                */
>>             +               frac = 0;
>>             +       }
>>             +
>>             +exit:
>>             +       mutex_unlock(&priv->access_lock);
>>             +       if (ret)
>>             +               return ret;
>>             +
>>             +       /* use integer2, because when we fallback to the
>> "MSB-only" compromise
>>             +        * this is the more recent one
>>             +        */
>>             +       priv->temp = stts751_to_deg(integer2, frac);
>>
>>
>>     All other drivers I am aware of manage to handle conversions from 16
>> bit chip
>>     values to temperatures and from temperatures to chip values with a
>> single parameter.
>>
>>
>> I'll check this.. BTW This chip wants two separated reads from two
>> registers, one for the integer and one for the fractional part. The purpose
>> of this function is interpreting these two raw HW values to convert in a
>> number. Is this so bad ?
>>
>> Again, have a look at lm90.c:lm90_read16() and the conversion functions
> in drivers which have to read two registers to read the temperature.
>
> Is it bad ? It makes the code more complicated than it has to be and
> increases code size, so, yes, I consider it bad.
>

It does not look like that the simple register combination that lm90 does
could also work for the integer/fractional format of the stts751.

I'll check again more carefully to see if for some math trick the two
things eventually end up to produce the same result, but right now it seems
to me that we need to do some math over the two read values in stts751. And
the same for the reverse direction conversion.

If the point above turns out to be true, then I honestly can't see how
dividing the two-registers read (with its trick to avoid races) and the
math calculations in two functions, as it is now,  could make things
appearing so complicated. Honestly I would say the opposite :) .. However
if it's better for you, I can merge the two things in one single function..


>
> To some degree I understand your concerns, but complex problems don't
> always mean that there has to be a complex solution. Unless you have a good
> reason for the complexity, please keep the driver as simple as possible.
> That not only reduces code size, it also reduces the probability to
> introduce bugs, and it reduces amount of time we have to spend reviewing
> the code.
>

In general that's absolutely true :) But IMHO here we have neither
complicated or simple solutions; we just have a certain degree of
probability to do a (slightly) wrong read (in lm90 also), and we can put
less or more effort (code) in trying to reduce this probability.

If you feel that what lm90 does is enough, and that is the "standard" way,
I'll do the same.. Although I still would prefer to be more paranoid about
races..


>
> Thanks,
> Guenter


BTW I will come back with a V2 as per your requirements, but unfortunately
it will not happen very soon ;(

Thanks
Andrea

>
>
>
>>
>>             +       return ret;
>>             +}
>>             +
>>             +static int stts751_probe(struct i2c_client *client,
>>             +                        const struct i2c_device_id *id)
>>             +{
>>             +       struct stts751_priv *priv;
>>             +       int ret;
>>             +       int groups_idx = 0;
>>             +       struct device_node *of_node = client->dev.of_node;
>>             +
>>
>>
>>     np is the commonly accepted variable name.
>>
>>
>> Will follow the convention..
>>
>>
>>
>>
>>             +       priv = devm_kzalloc(&client->dev,
>>             +                       sizeof(struct stts751_priv),
>> GFP_KERNEL);
>>
>>
>>         Could be rewrite to sizeof(*priv)
>>
>>         Regards
>>
>>         Labbe Corentin
>>
>>
>>
>>
>>
>

--94eb2c0b08b8d54bb4053bfa2be7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFdlZCwgU2VwIDcsIDIwMTYgYXQgNTo0MSBQTSwgR3VlbnRlciBS
b2VjayA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIHRhcmdldD0iX2JsYW5rIiBocmVmPSJtYWlsdG86
bGludXhAcm9lY2stdXMubmV0Ij5saW51eEByb2Vjay11cy5uZXQ8L2E+Jmd0Ozwvc3Bhbj4gd3Jv
dGU6PGJyPjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCIgY2xhc3M9
ImdtYWlsX3F1b3RlIj5PbiAwOS8wNy8yMDE2IDA4OjAzIEFNLCBBbmRyZWEgTWVyZWxsbyB3cm90
ZTo8c3BhbiBjbGFzcz0iZ21haWwtIj48YnI+DQo8YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiIGNsYXNzPSJnbWFpbF9xdW90ZSI+DQo8YnI+DQo8YnI+DQpPbiBXZWQs
IFNlcCA3LCAyMDE2IGF0IDQ6MDcgUE0sIEd1ZW50ZXIgUm9lY2sgJmx0OzxhIHRhcmdldD0iX2Js
YW5rIiBocmVmPSJtYWlsdG86bGludXhAcm9lY2stdXMubmV0Ij5saW51eEByb2Vjay11cy5uZXQ8
L2E+ICZsdDttYWlsdG86PGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzpsaW51eEByb2Vj
ay11cy5uZXQiPmxpbnV4QHJvZWNrLXVzLm5ldDwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnI+DQo8YnI+
DQrCoCDCoCBPbiAwOS8wNy8yMDE2IDA2OjE2IEFNLCBMQUJCRSBDb3JlbnRpbiB3cm90ZTo8YnI+
DQo8YnI+DQrCoCDCoCDCoCDCoCBIZWxsbzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIEkgaGF2ZSBz
b21lIGNvbWVudHMgYmVsb3c8YnI+DQo8YnI+DQrCoCDCoCBTb21lIG1vcmUgY29tbWVudHMgYmVs
b3cuPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgT24gV2VkLCBTZXAgMDcsIDIwMTYgYXQgMDI6MzM6
MzZQTSArMDIwMCwgQW5kcmVhIE1lcmVsbG8gd3JvdGU6PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgVGhpcyBwYXRjaCBhZGRzIGEgSFdNT04gZHJpdmVyIGZvciBTVCBNaWNyb2VsZWN0cm9u
aWNzIFNUVFM3NTE8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCB0ZW1wZXJhdHVyZSBzZW5zb3JzLjxi
cj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIEl0IGRvZXMgc3VwcG9ydCBtYW51YWwtdHJpZ2dl
cmVkIGNvbnZlcnNpb25zIGFzIHdlbGwgYXMgYXV0b21hdGljPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgY29udmVyc2lvbnMuIFRoZSBsYXR0ZXIgaXMgdXNlZCB3aGVuIHRoZSAmcXVvdDtldmVudCZx
dW90OyBvciAmcXVvdDt0aGVybSZxdW90OyBmdW5jdGlvbjxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IGlzIHByZXNlbnQgKGRlY2xhcmluZyB0aGUgcGh5c2ljYWwgd2lyZSBpcyBhdHRhY2hlZCBpbiB0
aGUgRFQpLjxicj4NCjxicj4NCjxicj4NCsKgIMKgIEFsbCBvdGhlcnMgYXJlIHBlbmFsdGl6ZWQg
YW5kIGhhdmUgdG8gd2FpdCBmb3IgbWFudWFsIG1vZGUgcmVzdWx0cyB3aGVuPGJyPg0KwqAgwqAg
cmVhZGluZyB0aGUgdGVtcGVyYXR1cmUgPyBXaHkgPzxicj4NCjxicj4NCjxicj4NClRoZSByZWFz
b24gd2FzIHRoYXQgd2l0aCB0aGlzIEhXIHJlYWRpbmcgYSBwcmVjaXNlIHZhbHVlIHdoZW4gYXV0
b21hdGljIGNvbnZlcnNpb24gaXMgcnVubmluZyBpcyBhIHBhaW4gKGFzIGV4cGxhaW5lZCBpbiB0
aGUgbG9uZyBjb21tZW50IGF0IHRoZSBmaWxlIGJlZ2lubmluZykuPGJyPg0KPGJyPg0KPC9ibG9j
a3F1b3RlPg0KPGJyPjwvc3Bhbj4NCkFzIEkgc2FpZCwgb3RoZXIgZHJpdmVycyAvIGNoaXBzIGhh
dmUgdGhlIHNhbWUgcHJvYmxlbSBvZiAmcXVvdDtub24tYXRvbWljJnF1b3Q7IHJlYWRzIGFjcm9z
czxicj4NCm11bHRpcGxlIHJlZ2lzdGVycy4gTWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2Ug
ZGlmZmVyZW50IHdpdGggdGhpcyBjaGlwLCBidXQgZnJvbTxicj4NCnRoZSBleHBsYW5hdGlvbiB0
aGVyZSBpcyBubyBpbmRpY2F0aW9uIHdoYXQgaXQgbWlnaHQgYmUuPGJyPg0KPGJyPg0KPGJsb2Nr
cXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFzcz0iZ21haWxfcXVvdGUi
PjxzcGFuIGNsYXNzPSJnbWFpbC0iPg0KQlRXIGlmIHdlIHdhbnQgdG8gYXZvaWQgd2FpdGluZywg
SSBjb3VsZCB0cnkgbGV0dGluZyB0aGUgY29udmVydGVyIHJ1bm5pbmcgaW4gYXV0byBtb2RlLCBh
bmQgZGlzYWJsZSBpdCBqdXN0IGJlZm9yZSByZWFkaW5nLCBwZXJmb3JtIHRoZSByZWFkLCBhbmQg
ZW5hYmxlIGFnYWluIChidXQgSU1ITyBvbmx5IHdoZW4gd2UgaGF2ZSBubyB0aGVybS9ldmVudCwg
Zm9yIHRoZSByZWFzb25zIGV4cGxhaW5lZCBpbiB0aGUgY29tbWVudCkuLjxicj4NCjxicj4NCjxi
cj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIFRoYW5rcy10bzogTEFCQkUgQ29yZW50aW4gW2Zv
ciBzdWdnZXN0aW9uc108YnI+PC9zcGFuPg0KwqAgwqAgwqAgwqAgwqAgwqAgU2lnbmVkLW9mZi1i
eTogQW5kcmVhIE1lcmVsbG8gJmx0OzxhIHRhcmdldD0iX2JsYW5rIiBocmVmPSJtYWlsdG86YW5k
cmVhLm1lcmVsbG9AZ21haWwuY29tIj5hbmRyZWEubWVyZWxsb0BnbWFpbC5jb208L2E+ICZsdDtt
YWlsdG86PGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzphbmRyZWEubWVyZWxsb0BnbWFp
bC5jb20iPmFuZHJlYS5tZXJlbGxvQGdtYWlsLmM8d2JyPm9tPC9hPiZndDsmZ3Q7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgQ2M6IExBQkJFIENvcmVudGluICZsdDs8YSB0YXJnZXQ9Il9ibGFuayIg
aHJlZj0ibWFpbHRvOmNsYWJiZS5tb250am9pZUBnbWFpbC5jb20iPmNsYWJiZS5tb250am9pZUBn
bWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzpj
bGFiYmUubW9udGpvaWVAZ21haWwuY29tIj5jbGFiYmUubW9udGpvaWVAZ21haWwuPHdicj5jb208
L2E+Jmd0OyZndDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBDYzogR3VlbnRlciBSb2VjayAmbHQ7
PGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzpsaW51eEByb2Vjay11cy5uZXQiPmxpbnV4
QHJvZWNrLXVzLm5ldDwvYT4gJmx0O21haWx0bzo8YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0ibWFp
bHRvOmxpbnV4QHJvZWNrLXVzLm5ldCI+bGludXhAcm9lY2stdXMubmV0PC9hPiZndDsmZ3Q7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgQ2M6IEplYW4gRGVsdmFyZSAmbHQ7PGEgdGFyZ2V0PSJfYmxh
bmsiIGhyZWY9Im1haWx0bzpqZGVsdmFyZUBzdXNlLmNvbSI+amRlbHZhcmVAc3VzZS5jb208L2E+
ICZsdDttYWlsdG86PGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzpqZGVsdmFyZUBzdXNl
LmNvbSI+amRlbHZhcmVAc3VzZS5jb208L2E+Jmd0OyZndDs8ZGl2PjxkaXYgY2xhc3M9ImdtYWls
LWg1Ij48YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAtLS08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oGRyaXZlcnMvaHdtb24vS2NvbmZpZ8KgIMKgfMKgIDEyICstPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqBkcml2ZXJzL2h3bW9uL01ha2VmaWxlwqAgfMKgIMKgMiArLTxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgZHJpdmVycy9od21vbi9zdHRzNzUxLmMgfCA5NDggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrPHdicj4rKysrKysrKysrKysrKysrKys8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoDMgZmlsZXMgY2hhbmdlZCwgOTYwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od21vbi9z
dHRzNzUxLmM8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9od21vbi9LY29uZmlnIGIvZHJpdmVycy9od21vbi9LY29uZmlnPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgaW5kZXggZWFmMmY5MS4uOGZkZDI0MSAxMDA2NDQ8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCAtLS0gYS9kcml2ZXJzL2h3bW9uL0tjb25maWc8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArKysg
Yi9kcml2ZXJzL2h3bW9uL0tjb25maWc8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBAQCAtMTQ0OCw2
ICsxNDQ4LDE2IEBAIGNvbmZpZyBTRU5TT1JTX1NDSDU2MzY8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVs
ZS7CoCBJZiBzbywgdGhlIG1vZHVsZTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHdpbGwgYmUgY2FsbGVkIHNjaDU2MzYuPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
K2NvbmZpZyBTRU5TT1JTX1NUVFM3NTE8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAg
wqB0cmlzdGF0ZSAmcXVvdDtTVCBNaWNyb2VsZWN0cm9uaWNzIFNUVFM3NTEmcXVvdDs8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBkZXBlbmRzIG9uIEkyQzxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgICvCoCDCoCDCoCDCoGhlbHA8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAg
wqAgwqAgwqBJZiB5b3Ugc2F5IHllcyBoZXJlIHlvdSBnZXQgc3VwcG9ydCBmb3IgU1RUUzc1MTxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoHRlbXBlcmF0dXJlIHNlbnNvciBj
aGlwcy48YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8Kg
IMKgIMKgIMKgIMKgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1bGUuwqAg
SWYgc28sIHRoZSBtb2R1bGU8YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBUd28gc3BhY2Ug
aW5zdGVhZCBvZiBvbmU8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAg
wqB3aWxsIGJlIGNhbGxlZCBzdHRzNzUxLjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICs8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoGNvbmZpZyBTRU5TT1JTX1NNTTY2NTxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHRyaXN0YXRlICZxdW90O1N1bW1pdCBNaWNyb2VsZWN0cm9uaWNz
IFNNTTY2NSZxdW90Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRlcGVuZHMg
b24gSTJDPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgQEAgLTE1MDYsNyArMTUxNiw3IEBAIGNvbmZp
ZyBTRU5TT1JTX0FEUzc4NzE8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbmZpZyBT
RU5TT1JTX0FNQzY4MjE8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cmlzdGF0
ZSAmcXVvdDtUZXhhcyBJbnN0cnVtZW50cyBBTUM2ODIxJnF1b3Q7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgLcKgIMKgIMKgIMKgZGVwZW5kcyBvbiBJMkM8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAr
wqAgwqAgwqAgwqBkZXBlbmRzIG9uIEkyQzxicj4NCjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIFRo
aXMgY2hhbmdlIG5lZWQgdG8gYmUgaW4gYW5vdGhlciBzZXQgb2YgcGF0Y2g8YnI+DQo8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoZWxwPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IHN1cHBvcnQgZm9yIHRo
ZSBUZXhhcyBJbnN0cnVtZW50czxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IEFNQzY4MjEgaGFyZHdhcmUgbW9uaXRvcmluZyBjaGlwcy48YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9NYWtlZmlsZSBiL2RyaXZlcnMvaHdtb24vTWFr
ZWZpbGU8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBpbmRleCBmZTg3ZDI4Li4xMTE0MTMwIDEwMDY0
NDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIC0tLSBhL2RyaXZlcnMvaHdtb24vTWFrZWZpbGU8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCArKysgYi9kcml2ZXJzL2h3bW9uL01ha2VmaWxlPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgQEAgLTE0Nyw2ICsxNDcsNyBAQCBvYmotJChDT05GSUdfU0VOU09SU19T
TU02NjUpwqAgwqAgwqAgwqAgKz0gc21tNjY1Lm88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoG9i
ai0kKENPTkZJR19TRU5TT1JTX1NNU0M0N0IzPHdicj45NykrPSBzbXNjNDdiMzk3Lm88YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoG9iai0kKENPTkZJR19TRU5TT1JTXzx3YnI+U01TQzQ3TTEpICs9
IHNtc2M0N20xLm88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoG9iai0kKENPTkZJR19TRU5TT1JT
X1NNU0M0N00xPHdicj45MikrPSBzbXNjNDdtMTkyLm88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAr
b2JqLSQoQ09ORklHX1NFTlNPUlNfU1RUUzc1MSk8d2JyPsKgICs9IHN0dHM3NTEubzxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgb2JqLSQoQ09ORklHX1NFTlNPUlNfQU1DNjgyMSk8d2JyPsKgICs9
IGFtYzY4MjEubzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgb2JqLSQoQ09ORklHX1NFTlNPUlNf
VEM3NCnCoCDCoCDCoCs9IHRjNzQubzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgb2JqLSQoQ09O
RklHX1NFTlNPUlNfVEhNQzUwKcKgIMKgKz0gdGhtYzUwLm88YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCBAQCAtMTY5LDQgKzE3MCwzIEBAIG9iai0kKENPTkZJR19TRU5TT1JTX1dNODM1MCnCoCDCoCDC
oCDCoCArPSB3bTgzNTAtaHdtb24ubzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgb2JqLSQoQ09O
RklHX1BNQlVTKcKgIMKgIMKgIMKgIMKgIMKgICs9IHBtYnVzLzxicj4NCjxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgY2NmbGFncy0kKENPTkZJR19IV01PTl9ERUJVR188d2JyPkNISVApIDo9IC1E
REVCVUc8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAtPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vc3R0czc1MS5jIGIvZHJpdmVycy9od21vbi9zdHRzNzUx
LmM8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIGluZGV4IDAwMDAwMDAuLjk0YjdlMmI8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCAtLS0gL2Rldi9udWxsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKysrIGIvZHJpdmVycy9od21v
bi9zdHRzNzUxLmM8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBAQCAtMCwwICsxLDk0OCBAQDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgICsvKjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICsgKiBTVFRTNzUx
IHNlbnNvciBkcml2ZXI8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArICo8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCArICogQ29weXJpZ2h0IChDKSAyMDE2IElzdGl0dXRvIEl0YWxpYW5vIGRpIFRlY25v
bG9naWEgLSBSQkNTIC0gRURMPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKyAqIFJvYm90aWNzLCBC
cmFpbiBhbmQgQ29nbml0aXZlIFNjaWVuY2VzIGRlcGFydG1lbnQ8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCArICogRWxlY3Ryb25pYyBEZXNpZ24gTGFib3JhdG9yeTxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgICsgKjxicj48L2Rpdj48L2Rpdj4NCsKgIMKgIMKgIMKgIMKgIMKgICsgKiBXcml0dGVuIGJ5
IEFuZHJlYSBNZXJlbGxvICZsdDs8YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0ibWFpbHRvOmFuZHJl
YS5tZXJlbGxvQGdtYWlsLmNvbSI+YW5kcmVhLm1lcmVsbG9AZ21haWwuY29tPC9hPiAmbHQ7bWFp
bHRvOjxhIHRhcmdldD0iX2JsYW5rIiBocmVmPSJtYWlsdG86YW5kcmVhLm1lcmVsbG9AZ21haWwu
Y29tIj5hbmRyZWEubWVyZWxsb0BnbWFpbC5jPHdicj5vbTwvYT4mZ3Q7Jmd0OzxzcGFuIGNsYXNz
PSJnbWFpbC0iPjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICsgKjxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgICsgKiBCYXNlZCBvbiB0aGUgZm9sbG93aW5nIGRyaXZlcnM6PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgKyAqIC0gTE05NTI0MSBkcml2ZXIsIHdoaWNoIGlzOjxicj48L3NwYW4+DQrCoCDCoCDC
oCDCoCDCoCDCoCArICrCoCDCoENvcHlyaWdodCAoQykgMjAwOCwgMjAxMCBEYXZpZGUgUml6em8g
Jmx0OzxhIHRhcmdldD0iX2JsYW5rIiBocmVmPSJtYWlsdG86ZWxwYS5yaXp6b0BnbWFpbC5jb20i
PmVscGEucml6em9AZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIHRhcmdldD0iX2JsYW5rIiBo
cmVmPSJtYWlsdG86ZWxwYS5yaXp6b0BnbWFpbC5jb20iPmVscGEucml6em9AZ21haWwuY29tPC9h
PiZndDsmZ3Q7PHNwYW4gY2xhc3M9ImdtYWlsLSI+PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKyAq
IC0gTE05MCBkcml2ZXIsIHdoaWNoIGlzOjxicj48L3NwYW4+DQrCoCDCoCDCoCDCoCDCoCDCoCAr
ICrCoCDCoENvcHlyaWdodCAoQykgMjAwMy0yMDEwwqAgSmVhbiBEZWx2YXJlICZsdDs8YSB0YXJn
ZXQ9Il9ibGFuayIgaHJlZj0ibWFpbHRvOmpkZWx2YXJlQHN1c2UuZGUiPmpkZWx2YXJlQHN1c2Uu
ZGU8L2E+ICZsdDttYWlsdG86PGEgdGFyZ2V0PSJfYmxhbmsiIGhyZWY9Im1haWx0bzpqZGVsdmFy
ZUBzdXNlLmRlIj5qZGVsdmFyZUBzdXNlLmRlPC9hPiZndDsmZ3Q7PHNwYW4gY2xhc3M9ImdtYWls
LSI+PGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgTm8gbmVlZCB0byByZWNvcHkgY29weXJp
Z2h0LCB3ZSBjYW4gZmluZCB0aGVtIGluIHRoZWlyIGRyaXZlci48YnI+DQo8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKy8qIEhXIGluZGV4IHZzIEFTQ0lJ
IGFuZCBpbnQgdGltZXMgaW4gbVMgKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArc3RhdGljIGNv
bnN0IHN0cnVjdCBzdHRzNzUxX2ludGVydmFsc190IHN0dHM3NTFfaW50ZXJ2YWxzW10gPSB7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgey5zdHIgPSAmcXVvdDsxNjAwMCZxdW90
OywgLnZhbCA9IDE2MDAwfSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqB7LnN0
ciA9ICZxdW90OzgwMDAmcXVvdDssIC52YWwgPSA4MDAwfSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCArwqAgwqAgwqAgwqB7LnN0ciA9ICZxdW90OzQwMDAmcXVvdDssIC52YWwgPSA0MDAwfSw8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqB7LnN0ciA9ICZxdW90OzIwMDAmcXVvdDss
IC52YWwgPSAyMDAwfSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqB7LnN0ciA9
ICZxdW90OzEwMDAmcXVvdDssIC52YWwgPSAxMDAwfSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAr
wqAgwqAgwqAgwqB7LnN0ciA9ICZxdW90OzUwMCZxdW90OywgLnZhbCA9IDUwMH0sPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgey5zdHIgPSAmcXVvdDsyNTAmcXVvdDssIC52YWwg
PSAyNTB9LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoHsuc3RyID0gJnF1b3Q7
MTI1JnF1b3Q7LCAudmFsID0gMTI1fSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAg
wqB7LnN0ciA9ICZxdW90OzYyLjUmcXVvdDssIC52YWwgPSA2Mn0sPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgK8KgIMKgIMKgIMKgey5zdHIgPSAmcXVvdDszMS4yNSZxdW90OywgLnZhbCA9IDMxfTxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgICt9Ozxicj4NCjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIFNv
IHlvdSBhcmUgbHlpbmcgYWJvdXQgNjIuNSBhbmQgMzEuMjUgOikgPzxicj4NCjxicj4NCjxicj4N
CsKgIMKgIEkgZG9uJiMzOTt0IHNlZSB3aGF0IHRoZSB0YWJsZSAob3IgcmF0aGVyLCB0aGUgc3Ry
aW5nIC0mZ3Q7IGludGVnZXIgY29udmVyc2lvbikgaXMgdXNlZCBmb3IgYW55d2F5Ljxicj4NCsKg
IMKgIGtzdHJ0b2woKSBhbmQgc3ByaW50ZigpIChvciBzaW1pbGFyKSBzZWVtIHRvIGJlIGRvaW5n
IGEgZ29vZCBqb2IgdGhlcmUuIEFsc28sIHRoZXJlPGJyPg0KwqAgwqAgaXMgYW4gQVBJIGZ1bmN0
aW9uIHRvIGZpbmQgdGhlIGNsb3Nlc3QgbWF0Y2hpbmcgaW5kZXggaW4gYSB2YWx1ZSB0YWJsZS48
YnI+DQo8YnI+DQo8YnI+DQo8YnI+DQpXZWxsLCB0aGUgdGFibGUgZG9lcyBub3Qgb25seSByZWxh
dGVzIHN0cmluZ3MgdG8gaW50ZWdlciAodGhhdCB3b3VsZCBiZSByZWFsbHkgbmF0dXJhbCBkb2lu
ZyB3aXRoIGtzdHJ0b2woKSBhbmQgZnJpZW5kcyksIGJ1dCBpdCBhbHNvIHJlbGF0ZXMgdGhlIGNv
bnZlcnNpb24gcmF0ZSB3aXRoIHRoZSBIVyBpbmRleCBmb3IgdGhhdCBjb252ZXJzaW9uIHJhdGUg
KHN0ciB2cyB0YWJsZSBpbmRleCkuIFNvLCBnaXZlbiB0aGF0IEkgd291bGQgaGF2ZSBhbiBhcnJh
eSBhbnl3YXksIGtlZXBpbmcgYWxzbyB0aGUgcHJlLWNvbnZlcnRlZCB2YWx1ZXMgc2VlbWVkIHJl
YXNvbmFibGUgdG8gbWU8YnI+DQo8YnI+DQpCdXQgSSBjb3VsZCBzdG9yZSBqdXN0IHRoZSBzdHJp
bmdzIGluIHRoZSB0YWJsZSwgdXNlIGtzdHJ0b2wsIGFuZCBkZW1vdGUgdGhlIHRhYmxlIHRvIGJl
IGEgc2luZ2xlLWRpbWVuc2lvbmFsIGFycmF5LCBpZiB0aGlzIGlzIHByZWZlcnJlZC48YnI+DQo8
YnI+DQpJJiMzOTtsbCBsb29rIGF0IHRoZSBBUEkgeW91IGFyZSBzdWdnZXN0aW5nLiBJIHdhc24m
IzM5O3QgYXdhcmUgb2YgaXQuLi48YnI+DQo8YnI+DQo8YnI+DQo8L3NwYW4+PC9ibG9ja3F1b3Rl
Pg0KVHJ5IGZpbmRfbmVhcmVzdCgpLjxkaXY+PGRpdiBjbGFzcz0iZ21haWwtaDUiPjxicj48L2Rp
dj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5Pazxicj48L2Rpdj48ZGl2
PsKgPC9kaXY+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3Jk
ZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFz
cz0iZ21haWxfcXVvdGUiPjxkaXY+PGRpdiBjbGFzcz0iZ21haWwtaDUiPg0KPGJyPg0KPGJsb2Nr
cXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFzcz0iZ21haWxfcXVvdGUi
Pg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICsvKiBz
cGVjaWFsIHZhbHVlIHRvIGluZGljYXRlIHRvIHRoZSBTVyB0byB1c2UgbWFudWFsIG1vZGUgKi88
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArI2RlZmluZSBTVFRTNzUxX0lOVEVSVkFMX01BTlVBTCAw
eEZGPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICtzdHJ1
Y3Qgc3R0czc1MV9wcml2IHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBzdHJ1
Y3QgZGV2aWNlICpkZXY7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBz
dHJ1Y3QgbXV0ZXggYWNjZXNzX2xvY2s7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKg
IMKgdW5zaWduZWQgbG9uZyBpbnRlcnZhbDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAg
wqAgwqBpbnQgcmVzOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoGJvb2wgZ2Vu
X3RoZXJtLCBnZW5fZXZlbnQ7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgaW50
IGV2ZW50X21heCwgZXZlbnRfbWluOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDC
oGludCB0aGVybTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBpbnQgaHlzdDs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBib29sIHNtYnVzX3RpbWVvdXQ7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgaW50IHRlbXA7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgK8KgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBsYXN0X3VwZGF0ZTs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqB1OCBjb25maWc7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgK8KgIMKgIMKgIMKgYm9vbCBtaW5fYWxlcnQsIG1heF9hbGVydDs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCArwqAgwqAgwqAgwqBib29sIGRhdGFfdmFsaWQ7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgKzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoC8qIFRlbXBlcmF0dXJlIGlz
IGFsd2F5cyBwcmVzZW50PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgICogRGVw
ZW5kaW5nIGJ5IERUL3BsYXRkYXRhLCB0aGVybSwgZXZlbnQsIGludGVydmFsIGFyZTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCAqIGR5bmFtaWNhbGx5IGFkZGVkLjxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCAqIFRoZXJlIGFyZSBtYXggNCBlbnRyaWVzIHBs
dXMgdGhlIGd1YXJkPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgICovPGJyPg0K
PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgVGhpcyB0eXBlIG9mIGNvbW1lbnQgaXMgd3JvbmcsIHlv
dSBuZWVkIC8qIG9ubHkgYXQgdGhlIGZpcnN0IGxpbmU8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCArwqAgwqAgwqAgwqBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpncm91cHNbNV07
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK307PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKzxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgICtzdGF0aWMgaW50IHN0dHM3NTFfbWFudWFsX2NvbnZlcnNpb24o
c3RydTx3YnI+Y3Qgc3R0czc1MV9wcml2ICpwcml2KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICt7
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgczMyIHJldDs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIHRpbWVvdXQ7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgKzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoC8qIEFueSB2
YWx1ZSB3cml0dGVuIHRvIHRoaXMgcmVnIHdpbGwgdHJpZ2dlciBtYW51YWwgY29udmVyc2lvbiAq
Lzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoHJldCA9IGkyY19zbWJ1c193cml0
ZV9ieXRlX2RhdGEocHJpdjx3YnI+LSZndDtjbGllbnQsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU1RUUzc1MV9S
RUdfT05FU0hPVCwgMHhGRik7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgaWYg
KHJldCAmbHQ7IDApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuIHJldDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgK8KgIMKgIMKgIMKgdGltZW91dCA9IGppZmZpZXM7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgKzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoHdoaWxlICgxKSB7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gaTJjX3NtYnVz
X3JlYWRfYnl0ZV9kYXRhKHByaXYtPHdicj4mZ3Q7Y2xpZW50LDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFNUVFM3NTFfUkVHX1NUQVRVUyk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCAmbHQ7IDApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIShyZXQgJmFtcDsgU1RU
Uzc1MV9TVEFUVVNfQlVTWSkpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHRpbWVfYWZ0ZXIoamlmZmllcyw8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB0aW1lb3V0ICsgU1RUUzc1MV9DT05WX1RJTUVPVVQgKiBIWiAvIDEwMDApKSB7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X3dh
cm4oJmFtcDtwcml2LSZndDtjbGllbnQtJmd0O2RldiwgJnF1b3Q7Y29udmVyc2lvbiB0aW1lZCBv
dXRcbiZxdW90Oyk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoH08YnI+DQo8
YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBQZXJoYXBzIHlvdSBjb3VsZCByZXdyaXRlIGl0IGFzOjxi
cj4NCsKgIMKgIMKgIMKgIGRvIHs8YnI+DQrCoCDCoCDCoCDCoCAuLi48YnI+DQrCoCDCoCDCoCDC
oCB9IHdoaWxlICghdGltZV9hZnRlcih4eHgpKTxicj4NCsKgIMKgIMKgIMKgIGRldl93YXJuKCk8
YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCBJdCBpcyB1bmFjY2VwdGFibGUgYW55d2F5LCBpdCBiZWlu
ZyBhIGhvdCBsb29wLCBhbmQgSSBhbSBub3QgYSBmcmllbmQ8YnI+DQrCoCDCoCBvZiBub2lzeSB3
YXJuaW5ncy4gSSYjMzk7ZCBhbHNvIGxpa2UgdG8gc2VlIGFuIGV4cGxhbmF0aW9uIHdoeSBtYW51
YWwgbW9kZTxicj4NCsKgIMKgIGhhcyB0byBiZSBzdXBwb3J0ZWQgaW4gdGhlIGZpcnN0IHBsYWNl
Ljxicj4NCjxicj4NCjxicj4NCkkgc2VlIHlvdXIgcG9pbnQsIGJ1dCBJdCYjMzk7cyBzdXBwb3Nl
ZCBub3QgdG8gaGFwcGVuIHVubGVzcyB0aGVyZSBpcyBhIHByb2JsZW0uIEFuZCBpZiB0aGVyZSBp
cywgdGhlbsKgIEkgdGhvdWdodCB5b3UgbWlnaHQgcHJlZmVyIHRvIGhhdmUgZXh0cmEgbm9pc2Ug
cmF0aGVyIHRoYW4gc2lsZW5jZS4uIEFueXdheSwgSSBjYW4gZWl0aGVyIHB1bGwgdGhlIHdhcm4g
b2ZmIHRoZSBsb29wIChvciByaXAgaXQgb3V0IGNvbXBsZXRlbHkpIG9yIHRyeSBhdm9pZGluZyBt
YW51YWwgbW9kZSAoc2VlIGFib3ZlIGZvciBleHBsYW5hdGlvbikuPGJyPg0KPGJyPg0KPC9ibG9j
a3F1b3RlPjwvZGl2PjwvZGl2Pg0KSnVzdCBrZWVwIGluIG1pbmQgdGhhdCBJIHdvbiYjMzk7dCBh
Y2NlcHQgYSBob3QgbG9vcCAoaWUgb25lIHRoYXQga2VlcHM8YnI+DQpidXJuaW5nIENQVSB3aXRo
b3V0IHNsZWVwaW5nKS48YnI+DQo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
T0s8YnI+wqA8YnI+PC9kaXY+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4IiBjbGFzcz0iZ21haWxfcXVvdGUiPg0KVGhlIG9ubHkgcmVhc29uIGZvciBwb3NzaWJseSBh
Y2NlcHRpbmcgbWFudWFsIG1vZGUgbWlnaHQgYmUgdG8gcmVkdWNlIHBvd2VyIGNvbnN1bXB0aW9u
Ljxicj4NClNpbmNlIHBvd2VyIGNvbnN1bXB0aW9uIGZvciBjb250aW51b3VzIG1vZGUgY2FuIGJl
IHJlZHVjZWQgdG8gYSBtYXggb2YgMzV1QSwgSSBkb24mIzM5O3Q8YnI+DQpyZWFsbHkgc2VlIHRo
ZSBwb2ludC4gVW5sZXNzIHRoZXJlIGlzIG1vcmUgZXhwbGFuYXRpb24gaG93IHRoaXMgY2hpcCBp
cyBkaWZmZXJlbnQgdG88YnI+DQpvdGhlciBjaGlwcyBpbiB0aGUgc2FtZSBzaXR1YXRpb24sIEkg
ZG9uJiMzOTt0IHJlYWxseSBhY2NlcHQgdGhlIGV4cGxhbmF0aW9uIGZvciBhbGwgdGhlPGJyPg0K
Y29tcGxleGl0eSBlaXRoZXIuPGRpdj48ZGl2IGNsYXNzPSJnbWFpbC1oNSI+PGJyPg0KPGJyPjwv
ZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pk9LLCBJJiMzOTtsbCB0
cnkgdG8gbWFrZSBpdCBhbHdheXMgd29ya2luZyBpbiBhdXRvbWF0aWMgbW9kZS48YnI+wqA8YnI+
PC9kaXY+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXIt
bGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFzcz0i
Z21haWxfcXVvdGUiPjxkaXY+PGRpdiBjbGFzcz0iZ21haWwtaDUiPg0KPGJsb2NrcXVvdGUgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFzcz0iZ21haWxfcXVvdGUiPg0KPGJyPg0K
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgcmV0dXJuIC1FVElNRURPVVQ7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgK308YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgKy8qIENvbnZlcnRzIHRlbXBlcmF0dXJlIGluIEMgc3BsaXQgaW4gaW50
ZWdlciBhbmQgZnJhY3Rpb25hbCBwYXJ0cywgYXMgc3VwcGxpZWQ8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCArICogYnkgdGhlIEhXLCB0byBhbiBpbnRlZ2VyIG51bWJlciBpbiBtQzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgICsgKi88YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBTYW1lIHByb2Js
ZW0gZm9yIGNvbW1lbnQgKGFuZCBhbGwgY29tZW50dyBiZWxvdyk8YnI+DQo8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArc3RhdGljIGludCBzdHRzNzUxX3VwZGF0ZV90ZW1wKHN0cnVjdCBzdHRzNzUx
X3ByaXYgKnByaXYpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK3s8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCArwqAgwqAgwqAgwqBzMzIgaW50ZWdlcjEsIGludGVnZXIyLCBmcmFjOzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgc2FtcGxlMSwgc2FtcGxlMiwg
dGltZW91dDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBpbnQgaTs8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBpbnQgcmV0ID0gMDs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCArPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgbXV0ZXhfbG9jaygm
YW1wO3ByaXYtJmd0O2FjY2Vzc188d2JyPmxvY2spOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBpZiAocHJpdi0mZ3Q7aW50ZXJ2YWwg
PT0gU1RUUzc1MV9JTlRFUlZBTF9NQU5VQUwpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBwZXJmb3JtIGEgb25lLXNob3Qgb24tZGVtYW5kIGNvbnZl
cnNpb24gKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXQgPSBzdHRzNzUxX21hbnVhbF9jb252ZXJzaW9uKHByaXY8d2JyPik7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCkgezxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl93YXJuKCZh
bXA7cHJpdi0mZ3Q7Y2xpZW50LSZndDtkZXYsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7ZmFpbGVkIHRv
IHNob3QgY29udmVyc2lvbiAleFxuJnF1b3Q7LCByZXQpOzxicj4NCjxicj4NCjxicj4NCsKgIMKg
IElmIHRob3NlIGFyZSB3YXJuaW5ncywgdGhleSBhcmUgbm90IGVycm9ycyBhbmQgc2hvdWxkIG5v
dCByZXN1bHQgaW4gYW4gYWJvcnQuPGJyPg0KwqAgwqAgSWYgdGhleSBhcmUgZXJyb3JzLCB0aGV5
IHNob3VsZCBiZSBkaXNwbGF5ZWQgYXMgZXJyb3JzLiBCdXQsIGFzIG1lbnRpb25lZDxicj4NCsKg
IMKgIGJlZm9yZSwgSSBhbSBub3QgYSBmcmllbmQgb2Ygbm9pc3kgZHJpdmVycy48YnI+DQo8YnI+
DQpZb3UmIzM5O3JlIHJpZ2h0LiBJdCYjMzk7cyBhbiBlcnJvci4gSSBtaWdodCBjaGFuZ2UgdGhp
cyBpcyBlaXRoZXIgYW4gZXJyb3IsIG9yIGdpdmVuIHRoYXQgeW91IGRvbiYjMzk7dCBsaWtlIGl0
LCBpbiBhIGRldl9kYmcuLjxicj4NCjxicj4NCjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXhpdDs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgK8KgIMKgIMKgIMKgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgU1RUUzc1MV9SQUNFX1JF
VFJZOyBpKyspIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzYW1wbGUxID0gamlmZmllczs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnRlZ2VyMSA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShwcml2LTx3YnI+
Jmd0O2NsaWVudCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTVFRTNzUx
X1JFR19URU1QX0gpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoaW50ZWdlcjEgJmx0OyAwKSB7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
ID0gaW50ZWdlcjE7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZGV2X3dhcm4oJmFtcDtwcml2LSZndDtjbGllbnQtJmd0O2Rldiw8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmcXVvdDtmYWlsZWQgdG8gcmVhZCBIIHJlZyAleFxuJnF1b3Q7LCByZXQpOzxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdvdG8gZXhpdDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGZyYWMgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEocHJpdi08
d2JyPiZndDtjbGllbnQsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU1RU
Uzc1MV9SRUdfVEVNUF9MKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGZyYWMgJmx0OyAwKSB7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
ID0gZnJhYzs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBkZXZfd2FybigmYW1wO3ByaXYtJmd0O2NsaWVudC0mZ3Q7ZGV2LDxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZxdW90O2ZhaWxlZCB0byByZWFkIEwgcmVnICV4XG4mcXVvdDssIHJldCk7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290
byBleGl0Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaWYgKHByaXYtJmd0O2ludGVydmFsID09IFNUVFM3NTFfSU5URVJWQUxf
TUFOVUFMKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLyogd2UmIzM5O2xsIGxvb2sgYXQgaW50ZWdlcjIgbGF0ZXIuLiAqLzxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dGVnZXIyID0gaW50ZWdlcjE7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlZ2VyMiA9IGkyY19zbWJ1c19y
ZWFkX2J5dGVfZGF0YShwcml2LTx3YnI+Jmd0O2NsaWVudCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBTVFRTNzUxX1JFR19URU1QX0gpOzxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNhbXBsZTIgPSBqaWZmaWVzOzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgICs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAoaW50ZWdlcjIgJmx0OyAwKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X3dhcm4oJmFtcDtwcml2LSZndDtjbGll
bnQtJmd0O2Rldiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtmYWlsZWQgdG8gcmVhZCBIIHJlZyAoMm5k
IHRpbWUpICV4XG4mcXVvdDssIHJldCk7PGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgSGFy
ZCB0byBmaW5kIHdoeSB5b3UgcHJpbnQgcmV0IGFuZCB3aGF0IGV4YWN0bHkgaXQgaXMgd2hlbiB5
b3UgcHJpbnQgaXQuPGJyPg0KPGJyPg0KwqAgwqAgUGx1cyB0aGUgY2hlY2sgc2hvdWxkIGJlIHJp
Z2h0IGFmdGVyIHRoZSBhc3NpZ25tZW50Ljxicj4NCjxicj4NCjxicj4NCkp1c3Qgc2FtcGxlIHRo
ZSB0aW1lIEFTQVAsIHRoYXQgaXMgJnF1b3Q7Y3JpdGljYWwmcXVvdDssIHRoZW4gY2hlY2sgaWYg
d2UgaGF2ZSB0byB0aHJvdyB0aGUgZXJyb3IuPGJyPg0KPGJyPg0KPGJyPg0KPGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
ID0gaW50ZWdlcjI7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ290byBleGl0Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGltZW91dCA9IHN0dHM3NTFfaW50ZXJ2
YWxzW3ByaXYtJmd0O2ludGVydjx3YnI+YWxdLnZhbCAqIEhaIC8gMTAwMDs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aW1lb3V0IC09ICgodGltZW91dCAm
bHQ7IDEwKSAmYW1wOyZhbXA7ICh0aW1lb3V0ICZndDsgMSkpID8gMSA6IHRpbWVvdXQgLyAxMDs8
YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBXaGF0IGl0IGlzIHRoZSBwdXJwb3NlIG9mIHRo
aXMgZGVjcmVhc2UgPzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmICgoaW50ZWdlcjEgPT0gaW50ZWdlcjIpICZhbXA7JmFtcDs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aW1lX2Fm
dGVyKHNhbXBsZTEgKyB0aW1lb3V0LCBzYW1wbGUyKSk8YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCBB
bmQgd2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGlzIHRpbWVfYWZ0ZXIoKSA/IE90aGVyIGRyaXZl
cnMgaGF2ZSB0aGU8YnI+DQrCoCDCoCBzYW1lIHByb2JsZW0gYW5kIGEgbXVjaCBzaW1wbGVyIHNv
bHV0aW9uIHRoYXQgZG9lc24mIzM5O3QgcmVxdWlyZSBhIHRpbWVvdXQ8YnI+DQrCoCDCoCBsaWtl
IHRoaXMuIElmIGl0IGlzIGluIGZhY3QgbmVlZGVkLCBJIHdvdWxkIHdhbnQgdG8gc2VlIGEgY29t
bWVudCBleHBsYWluaW5nIGl0Ljxicj4NCjxicj4NCjxicj4NCjxicj4NCldpbGwgbG9vayBpZiBJ
IGNhbiBmaW5kIGFub3RoZXIgZHJpdmVyIHdpdGggc2ltaWxhciBpc3N1ZSB0byBzbm9vcCBhdC4u
PGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0KVHJ5IGxtOTAuYzpsbTkwX3Jl
YWQxNigpLjxzcGFuIGNsYXNzPSJnbWFpbC0iPjxicj48L3NwYW4+PC9ibG9ja3F1b3RlPjxkaXY+
PGJyPjxicj48L2Rpdj48ZGl2Pkkgc2VlLi4gVGhpcyBpcyByZWFzb25hYmxlLCBhbmQgSSB3aWxs
IGltcGxlbWVudCB0aGlzIHRyaWNrIGluIHN0dHM3NTEgZHJpdmVyLi4gVGhpcyBzZWVtcyB0byBo
YXZlIGdvb2QgY2hhbmNlcyB0byByZWFkIGNvcnJlY3RseSwgYnV0IGl0IGNhbiBzdGlsbCBnbyBy
YWN5IGZvciBleGFtcGxlIGlmIHRoZSBjb252ZXJ0ZXIgZW5kcyBhIGNvbnZlcnNpb24gYmV0d2Vl
biB0aGUgZmlyc3QgdHdvIHJlYWRzLCBhbmQgd2UgZ2V0IHByZWVtcHRlZCBpbiBiZXR3ZWVuIHRo
ZSBsYXN0IHR3byByZWFkcyAoc28gdGhhdCB0aGUgSFcgZW5kcyBhbm90aGVyIGNvbnZlcnNpb24p
LiBJTUhPIGxvb2tpbmcgX2Fsc29fwqAgYXQgdGltZSwgYW5kIGV2ZW50dWFsbHkgcmV0cnksIG1h
a2VzIHRoaW5ncyBldmVuIG1vcmUgcm9idXN0Li4gPGJyPjxicj5JJiMzOTtkIHNheSB3ZSBjb3Vs
ZCBhZGQgdGltZSBjaGVjayBhbmQgcmV0cnkgKHdpdGggcHJvcGVyIGNwdV9yZWxheCgpIHRvIGF2
b2lkIHRob3NlIGhvdCBsb29wcykgYWxzbyB0byBsbTkwIHJhdGhlciB0aGFuIHJlbW92aW5nIGl0
IGZyb20gc3R0czY1McKgIDopPGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBzdHls
ZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiIGNsYXNzPSJnbWFpbF9xdW90ZSI+PHNwYW4gY2xh
c3M9ImdtYWlsLSI+DQo8YnI+DQo8YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiIGNsYXNzPSJnbWFpbF9xdW90ZSI+DQo8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCArPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLyogaWYgd2UgYXJlIGdvaW5nIG9uIHdpdGggYSByYWN5IHJlYWQsIGRvbiYjMzk7dCBwcmV0
ZW5kIHRvIGJlPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICogc3VwZXItcHJlY2lzZSwganVzdCB1c2UgdGhlIE1TQnMgLi48YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmcmFjID0gMDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAr
wqAgwqAgwqAgwqB9PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgKzxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgICtleGl0Ojxicj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoG11dGV4X3VubG9j
aygmYW1wO3ByaXYtJmd0O2FjY2Vzc19sbzx3YnI+Y2spOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
ICvCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgLyogdXNlIGludGVnZXIyLCBiZWNhdXNlIHdoZW4g
d2UgZmFsbGJhY2sgdG8gdGhlICZxdW90O01TQi1vbmx5JnF1b3Q7IGNvbXByb21pc2U8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgKiB0aGlzIGlzIHRoZSBtb3JlIHJlY2VudCBv
bmU8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgKi88YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCArwqAgwqAgwqAgwqBwcml2LSZndDt0ZW1wID0gc3R0czc1MV90b19kZWcoaW50ZWdl
cjIsIGZyYWMpOzxicj4NCjxicj4NCjxicj4NCsKgIMKgIEFsbCBvdGhlciBkcml2ZXJzIEkgYW0g
YXdhcmUgb2YgbWFuYWdlIHRvIGhhbmRsZSBjb252ZXJzaW9ucyBmcm9tIDE2IGJpdCBjaGlwPGJy
Pg0KwqAgwqAgdmFsdWVzIHRvIHRlbXBlcmF0dXJlcyBhbmQgZnJvbSB0ZW1wZXJhdHVyZXMgdG8g
Y2hpcCB2YWx1ZXMgd2l0aCBhIHNpbmdsZSBwYXJhbWV0ZXIuPGJyPg0KPGJyPg0KPGJyPg0KSSYj
Mzk7bGwgY2hlY2sgdGhpcy4uIEJUVyBUaGlzIGNoaXAgd2FudHMgdHdvIHNlcGFyYXRlZCByZWFk
cyBmcm9tIHR3byByZWdpc3RlcnMsIG9uZSBmb3IgdGhlIGludGVnZXIgYW5kIG9uZSBmb3IgdGhl
IGZyYWN0aW9uYWwgcGFydC4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBmdW5jdGlvbiBpcyBpbnRlcnBy
ZXRpbmcgdGhlc2UgdHdvIHJhdyBIVyB2YWx1ZXMgdG8gY29udmVydCBpbiBhIG51bWJlci4gSXMg
dGhpcyBzbyBiYWQgPzxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L3NwYW4+DQpBZ2FpbiwgaGF2
ZSBhIGxvb2sgYXQgbG05MC5jOmxtOTBfcmVhZDE2KCkgYW5kIHRoZSBjb252ZXJzaW9uIGZ1bmN0
aW9uczxicj4NCmluIGRyaXZlcnMgd2hpY2ggaGF2ZSB0byByZWFkIHR3byByZWdpc3RlcnMgdG8g
cmVhZCB0aGUgdGVtcGVyYXR1cmUuPGJyPg0KPGJyPg0KSXMgaXQgYmFkID8gSXQgbWFrZXMgdGhl
IGNvZGUgbW9yZSBjb21wbGljYXRlZCB0aGFuIGl0IGhhcyB0byBiZSBhbmQ8YnI+DQppbmNyZWFz
ZXMgY29kZSBzaXplLCBzbywgeWVzLCBJIGNvbnNpZGVyIGl0IGJhZC48YnI+PC9ibG9ja3F1b3Rl
PjxkaXY+PGJyPjwvZGl2PjxkaXY+SXQgZG9lcyBub3QgbG9vayBsaWtlIHRoYXQgdGhlIHNpbXBs
ZSByZWdpc3RlciBjb21iaW5hdGlvbiB0aGF0IGxtOTAgZG9lcyBjb3VsZCBhbHNvIHdvcmsgZm9y
IHRoZSBpbnRlZ2VyL2ZyYWN0aW9uYWwgZm9ybWF0IG9mIHRoZSBzdHRzNzUxLiA8YnI+PGJyPkkm
IzM5O2xsIGNoZWNrIGFnYWluIG1vcmUgY2FyZWZ1bGx5IHRvIHNlZSBpZiBmb3Igc29tZSBtYXRo
IHRyaWNrIHRoZSB0d28gdGhpbmdzIGV2ZW50dWFsbHkgZW5kIHVwIHRvIHByb2R1Y2UgdGhlIHNh
bWUgcmVzdWx0LCBidXQgcmlnaHQgbm93IGl0IHNlZW1zIHRvIG1lIHRoYXQgd2UgbmVlZCB0byBk
byBzb21lIG1hdGggb3ZlciB0aGUgdHdvIHJlYWQgdmFsdWVzIGluIHN0dHM3NTEuIEFuZCB0aGUg
c2FtZSBmb3IgdGhlIHJldmVyc2UgZGlyZWN0aW9uIGNvbnZlcnNpb24uPGJyPjxicj5JZiB0aGUg
cG9pbnQgYWJvdmUgdHVybnMgb3V0IHRvIGJlIHRydWUsIHRoZW4gSSBob25lc3RseSBjYW4mIzM5
O3Qgc2VlIGhvdyBkaXZpZGluZyB0aGUgdHdvLXJlZ2lzdGVycyByZWFkICh3aXRoIGl0cyB0cmlj
ayB0byBhdm9pZCByYWNlcykgYW5kIHRoZSBtYXRoIGNhbGN1bGF0aW9ucyBpbiB0d28gZnVuY3Rp
b25zLCBhcyBpdCBpcyBub3cswqAgY291bGQgbWFrZSB0aGluZ3MgYXBwZWFyaW5nIHNvIGNvbXBs
aWNhdGVkLiBIb25lc3RseSBJIHdvdWxkIHNheSB0aGUgb3Bwb3NpdGUgOikgLi4gSG93ZXZlciBp
ZiBpdCYjMzk7cyBiZXR0ZXIgZm9yIHlvdSwgSSBjYW4gbWVyZ2UgdGhlIHR3byB0aGluZ3MgaW4g
b25lIHNpbmdsZSBmdW5jdGlvbi4uPGJyPsKgPGJyPjwvZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCIgY2xhc3M9ImdtYWlsX3F1b3RlIj4NCjxicj4NClRvIHNv
bWUgZGVncmVlIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zLCBidXQgY29tcGxleCBwcm9ibGVt
cyBkb24mIzM5O3Q8YnI+DQphbHdheXMgbWVhbiB0aGF0IHRoZXJlIGhhcyB0byBiZSBhIGNvbXBs
ZXggc29sdXRpb24uIFVubGVzcyB5b3UgaGF2ZSBhIGdvb2Q8YnI+DQpyZWFzb24gZm9yIHRoZSBj
b21wbGV4aXR5LCBwbGVhc2Uga2VlcCB0aGUgZHJpdmVyIGFzIHNpbXBsZSBhcyBwb3NzaWJsZS48
YnI+DQpUaGF0IG5vdCBvbmx5IHJlZHVjZXMgY29kZSBzaXplLCBpdCBhbHNvIHJlZHVjZXMgdGhl
IHByb2JhYmlsaXR5IHRvPGJyPg0KaW50cm9kdWNlIGJ1Z3MsIGFuZCBpdCByZWR1Y2VzIGFtb3Vu
dCBvZiB0aW1lIHdlIGhhdmUgdG8gc3BlbmQgcmV2aWV3aW5nPGJyPg0KdGhlIGNvZGUuPGJyPjwv
YmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkluIGdlbmVyYWwgdGhhdCYjMzk7cyBhYnNv
bHV0ZWx5IHRydWUgOikgQnV0IElNSE8gaGVyZSB3ZSBoYXZlIG5laXRoZXIgY29tcGxpY2F0ZWQg
b3Igc2ltcGxlIHNvbHV0aW9uczsgd2UganVzdCBoYXZlIGEgY2VydGFpbiBkZWdyZWUgb2YgcHJv
YmFiaWxpdHkgdG8gZG8gYSAoc2xpZ2h0bHkpIHdyb25nIHJlYWQgKGluIGxtOTAgYWxzbyksIGFu
ZCB3ZSBjYW4gcHV0IGxlc3Mgb3IgbW9yZSBlZmZvcnQgKGNvZGUpIGluIHRyeWluZyB0byByZWR1
Y2UgdGhpcyBwcm9iYWJpbGl0eS4gPGJyPjxicj48L2Rpdj48ZGl2PklmIHlvdSBmZWVsIHRoYXQg
d2hhdCBsbTkwIGRvZXMgaXMgZW5vdWdoLCBhbmQgdGhhdCBpcyB0aGUgJnF1b3Q7c3RhbmRhcmQm
cXVvdDsgd2F5LCBJJiMzOTtsbCBkbyB0aGUgc2FtZS4uIEFsdGhvdWdoIEkgc3RpbGwgd291bGQg
cHJlZmVyIHRvIGJlIG1vcmUgcGFyYW5vaWQgYWJvdXQgcmFjZXMuLjxicj48L2Rpdj48ZGl2PsKg
PC9kaXY+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXIt
bGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4IiBjbGFzcz0i
Z21haWxfcXVvdGUiPg0KPGJyPg0KVGhhbmtzLDxicj4NCkd1ZW50ZXI8L2Jsb2NrcXVvdGU+PGRp
dj48YnI+PC9kaXY+PGRpdj5CVFcgSSB3aWxsIGNvbWUgYmFjayB3aXRoIGEgVjIgYXMgcGVyIHlv
dXIgcmVxdWlyZW1lbnRzLCBidXQgdW5mb3J0dW5hdGVseSBpdCB3aWxsIG5vdCBoYXBwZW4gdmVy
eSBzb29uIDsoPGJyPsKgPGJyPjwvZGl2PjxkaXY+VGhhbmtzIDxicj48L2Rpdj48ZGl2PkFuZHJl
YTxicj48L2Rpdj48YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2Jv
cmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiIGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBjbGFzcz0iZ21haWwtSE9FblpiIj48ZGl2IGNsYXNzPSJn
bWFpbC1oNSI+PGJyPg0KPGJyPg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4IiBjbGFzcz0iZ21haWxfcXVvdGUiPg0KPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgK8KgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArfTxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgICs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArc3RhdGljIGludCBz
dHRzNzUxX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbnN0IHN0cnVjdCBp
MmNfZGV2aWNlX2lkICppZCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArezxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgICvCoCDCoCDCoCDCoHN0cnVjdCBzdHRzNzUxX3ByaXYgKnByaXY7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgaW50IHJldDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCArwqAgwqAgwqAgwqBpbnQgZ3JvdXBzX2lkeCA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
K8KgIMKgIMKgIMKgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlID0gY2xpZW50LSZndDtkZXYu
b2Zfbm9kZTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArPGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAg
bnAgaXMgdGhlIGNvbW1vbmx5IGFjY2VwdGVkIHZhcmlhYmxlIG5hbWUuPGJyPg0KPGJyPg0KPGJy
Pg0KV2lsbCBmb2xsb3cgdGhlIGNvbnZlbnRpb24uLjxicj4NCjxicj4NCjxicj4NCjxicj4NCjxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoHByaXYgPSBkZXZtX2t6YWxsb2MoJmFt
cDtjbGllbnQtJmd0O2Rldiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzaXplb2Yoc3RydWN0IHN0dHM3NTFfcHJpdiksIEdGUF9LRVJO
RUwpOzxicj4NCjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIENvdWxkIGJlIHJld3JpdGUgdG8gc2l6
ZW9mKCpwcml2KTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIFJlZ2FyZHM8YnI+DQo8YnI+DQrCoCDC
oCDCoCDCoCBMYWJiZSBDb3JlbnRpbjxicj4NCjxicj4NCjxicj4NCjxicj4NCjxicj4NCjwvYmxv
Y2txdW90ZT4NCjxicj4NCjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+
PC9kaXY+DQo=
--94eb2c0b08b8d54bb4053bfa2be7--
