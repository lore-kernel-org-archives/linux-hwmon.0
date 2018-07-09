Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:46467 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933475AbeGIPty (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jul 2018 11:49:54 -0400
Received: by mail-io0-f193.google.com with SMTP id i18-v6so1736945ioj.13
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Jul 2018 08:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180703222649.61381-1-kunyi@google.com> <20180708231019.GA25272@roeck-us.net>
In-Reply-To: <20180708231019.GA25272@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Mon, 9 Jul 2018 08:49:27 -0700
Message-ID: <CAGMNF6Wnzh2g0LsuQ1eAd8aB2f_Ngui0AUHBYCONht-GfcvqtQ@mail.gmail.com>
Subject: Re: [v2] hwmon (pmbus/max34440): Add support for MAX34451.
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Thanks!
On Sun, Jul 8, 2018 at 4:10 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jul 03, 2018 at 03:26:49PM -0700, Kun Yi wrote:
> > MAX34451 is a 16-Channel Voltage/Current Monitor and 12-Channel
> > Sequencer.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> > Changes in v2:
> >   -  Dynamically set MAX34451 page 0-15 functions based on channel
> >      config register value.
> >
> >  Documentation/hwmon/max34440   | 16 ++++--
> >  drivers/hwmon/pmbus/Kconfig    |  2 +-
> >  drivers/hwmon/pmbus/max34440.c | 93 ++++++++++++++++++++++++++++++++--
> >  3 files changed, 103 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/hwmon/max34440 b/Documentation/hwmon/max3444=
0
> > index 9ba6587b7657..b2de8fa49273 100644
> > --- a/Documentation/hwmon/max34440
> > +++ b/Documentation/hwmon/max34440
> > @@ -16,6 +16,11 @@ Supported chips:
> >      Prefixes: 'max34446'
> >      Addresses scanned: -
> >      Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX34446.pd=
f
> > +  * Maxim MAX34451
> > +    PMBus 16-Channel V/I Monitor and 12-Channel Sequencer/Marginer
> > +    Prefixes: 'max34451'
> > +    Addresses scanned: -
> > +    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX34451.pd=
f
> >    * Maxim MAX34460
> >      PMBus 12-Channel Voltage Monitor & Sequencer
> >      Prefix: 'max34460'
> > @@ -36,9 +41,10 @@ Description
> >  This driver supports hardware monitoring for Maxim MAX34440 PMBus 6-Ch=
annel
> >  Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply Manager
> >  and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data L=
ogger.
> > -It also supports the MAX34460 and MAX34461 PMBus Voltage Monitor & Seq=
uencers.
> > -The MAX34460 supports 12 voltage channels, and the MAX34461 supports 1=
6 voltage
> > -channels.
> > +It also supports the MAX34451, MAX34460, and MAX34461 PMBus Voltage Mo=
nitor &
> > +Sequencers. The MAX34451 supports monitoring voltage or current of 12 =
channels
> > +based on GIN pins. The MAX34460 supports 12 voltage channels, and the =
MAX34461
> > +supports 16 voltage channels.
> >
> >  The driver is a client driver to the core PMBus driver. Please see
> >  Documentation/hwmon/pmbus for details on PMBus client drivers.
> > @@ -93,7 +99,7 @@ curr[1-6]_max               Maximum current. From IOU=
T_OC_WARN_LIMIT register.
> >  curr[1-6]_crit               Critical maximum current. From IOUT_OC_FA=
ULT_LIMIT register.
> >  curr[1-6]_max_alarm  Current high alarm. From IOUT_OC_WARNING status.
> >  curr[1-6]_crit_alarm Current critical high alarm. From IOUT_OC_FAULT s=
tatus.
> > -curr[1-4]_average    Historical average current (MAX34446 only).
> > +curr[1-4]_average    Historical average current (MAX34446/34451 only).
> >  curr[1-6]_highest    Historical maximum current.
> >  curr[1-6]_reset_history      Write any value to reset history.
> >
> > @@ -123,5 +129,7 @@ temp[1-8]_reset_history   Write any value to reset =
history.
> >                       temp7 and temp8 attributes only exist for MAX3444=
0.
> >                       MAX34446 only supports temp[1-3].
> >
> > +MAX34451 supports attribute groups in[1-16] (or curr[1-16] based on in=
put pins)
> > +and temp[1-5].
> >  MAX34460 supports attribute groups in[1-12] and temp[1-5].
> >  MAX34461 supports attribute groups in[1-16] and temp[1-5].
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index e71aec69e76e..a82018aaf473 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -130,7 +130,7 @@ config SENSORS_MAX34440
> >       default n
> >       help
> >         If you say yes here you get hardware monitoring support for Max=
im
> > -       MAX34440, MAX34441, MAX34446, MAX34460, and MAX34461.
> > +       MAX34440, MAX34441, MAX34446, MAX34451, MAX34460, and MAX34461.
> >
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called max34440.
> > diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34=
440.c
> > index 74a1f6f68fb3..47576c460010 100644
> > --- a/drivers/hwmon/pmbus/max34440.c
> > +++ b/drivers/hwmon/pmbus/max34440.c
> > @@ -27,7 +27,7 @@
> >  #include <linux/i2c.h>
> >  #include "pmbus.h"
> >
> > -enum chips { max34440, max34441, max34446, max34460, max34461 };
> > +enum chips { max34440, max34441, max34446, max34451, max34460, max3446=
1 };
> >
> >  #define MAX34440_MFR_VOUT_PEAK               0xd4
> >  #define MAX34440_MFR_IOUT_PEAK               0xd5
> > @@ -44,6 +44,9 @@ enum chips { max34440, max34441, max34446, max34460, =
max34461 };
> >  #define MAX34440_STATUS_OT_FAULT     BIT(5)
> >  #define MAX34440_STATUS_OT_WARN              BIT(6)
> >
> > +#define MAX34451_MFR_CHANNEL_CONFIG  0xe4
> > +#define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK 0x3f
> > +
> >  struct max34440_data {
> >       int id;
> >       struct pmbus_driver_info info;
> > @@ -67,7 +70,7 @@ static int max34440_read_word_data(struct i2c_client =
*client, int page, int reg)
> >                                          MAX34440_MFR_VOUT_PEAK);
> >               break;
> >       case PMBUS_VIRT_READ_IOUT_AVG:
> > -             if (data->id !=3D max34446)
> > +             if (data->id !=3D max34446 && data->id !=3D max34451)
> >                       return -ENXIO;
> >               ret =3D pmbus_read_word_data(client, page,
> >                                          MAX34446_MFR_IOUT_AVG);
> > @@ -143,7 +146,7 @@ static int max34440_write_word_data(struct i2c_clie=
nt *client, int page,
> >       case PMBUS_VIRT_RESET_IOUT_HISTORY:
> >               ret =3D pmbus_write_word_data(client, page,
> >                                           MAX34440_MFR_IOUT_PEAK, 0);
> > -             if (!ret && data->id =3D=3D max34446)
> > +             if (!ret && (data->id =3D=3D max34446 || data->id =3D=3D =
max34451))
> >                       ret =3D pmbus_write_word_data(client, page,
> >                                       MAX34446_MFR_IOUT_AVG, 0);
> >
> > @@ -202,6 +205,58 @@ static int max34440_read_byte_data(struct i2c_clie=
nt *client, int page, int reg)
> >       return ret;
> >  }
> >
> > +static int max34451_set_supported_funcs(struct i2c_client *client,
> > +                                      struct max34440_data *data)
> > +{
> > +     /*
> > +      * Each of the channel 0-15 can be configured to monitor the foll=
owing
> > +      * functions based on MFR_CHANNEL_CONFIG[5:0]
> > +      * 0x10: Sequencing + voltage monitoring (only valid for PAGES 0=
=E2=80=9311)
> > +      * 0x20: Voltage monitoring (no sequencing)
> > +      * 0x21: Voltage read only
> > +      * 0x22: Current monitoring
> > +      * 0x23: Current read only
> > +      * 0x30: General-purpose input active low
> > +      * 0x34: General-purpose input active high
> > +      * 0x00:  Disabled
> > +      */
> > +
> > +     int page, rv;
> > +
> > +     for (page =3D 0; page < 16; page++) {
> > +             rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page=
);
> > +             if (rv < 0)
> > +                     return rv;
> > +
> > +             rv =3D i2c_smbus_read_word_data(client,
> > +                                           MAX34451_MFR_CHANNEL_CONFIG=
);
> > +             if (rv < 0)
> > +                     return rv;
> > +
> > +             switch (rv & MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK) {
> > +             case 0x10:
> > +             case 0x20:
> > +                     data->info.func[page] =3D PMBUS_HAVE_VOUT |
> > +                             PMBUS_HAVE_STATUS_VOUT;
> > +                     break;
> > +             case 0x21:
> > +                     data->info.func[page] =3D PMBUS_HAVE_VOUT;
> > +                     break;
> > +             case 0x22:
> > +                     data->info.func[page] =3D PMBUS_HAVE_IOUT |
> > +                             PMBUS_HAVE_STATUS_IOUT;
> > +                     break;
> > +             case 0x23:
> > +                     data->info.func[page] =3D PMBUS_HAVE_IOUT;
> > +                     break;
> > +             default:
> > +                     break;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static struct pmbus_driver_info max34440_info[] =3D {
> >       [max34440] =3D {
> >               .pages =3D 14,
> > @@ -325,6 +380,30 @@ static struct pmbus_driver_info max34440_info[] =
=3D {
> >               .read_word_data =3D max34440_read_word_data,
> >               .write_word_data =3D max34440_write_word_data,
> >       },
> > +     [max34451] =3D {
> > +             .pages =3D 21,
> > +             .format[PSC_VOLTAGE_OUT] =3D direct,
> > +             .format[PSC_TEMPERATURE] =3D direct,
> > +             .format[PSC_CURRENT_OUT] =3D direct,
> > +             .m[PSC_VOLTAGE_OUT] =3D 1,
> > +             .b[PSC_VOLTAGE_OUT] =3D 0,
> > +             .R[PSC_VOLTAGE_OUT] =3D 3,
> > +             .m[PSC_CURRENT_OUT] =3D 1,
> > +             .b[PSC_CURRENT_OUT] =3D 0,
> > +             .R[PSC_CURRENT_OUT] =3D 2,
> > +             .m[PSC_TEMPERATURE] =3D 1,
> > +             .b[PSC_TEMPERATURE] =3D 0,
> > +             .R[PSC_TEMPERATURE] =3D 2,
> > +             /* func 0-15 is set dynamically before probing */
> > +             .func[16] =3D PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> > +             .func[17] =3D PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> > +             .func[18] =3D PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> > +             .func[19] =3D PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> > +             .func[20] =3D PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> > +             .read_byte_data =3D max34440_read_byte_data,
> > +             .read_word_data =3D max34440_read_word_data,
> > +             .write_word_data =3D max34440_write_word_data,
> > +     },
> >       [max34460] =3D {
> >               .pages =3D 18,
> >               .format[PSC_VOLTAGE_OUT] =3D direct,
> > @@ -398,6 +477,7 @@ static int max34440_probe(struct i2c_client *client=
,
> >                         const struct i2c_device_id *id)
> >  {
> >       struct max34440_data *data;
> > +     int rv;
> >
> >       data =3D devm_kzalloc(&client->dev, sizeof(struct max34440_data),
> >                           GFP_KERNEL);
> > @@ -406,6 +486,12 @@ static int max34440_probe(struct i2c_client *clien=
t,
> >       data->id =3D id->driver_data;
> >       data->info =3D max34440_info[id->driver_data];
> >
> > +     if (data->id =3D=3D max34451) {
> > +             rv =3D max34451_set_supported_funcs(client, data);
> > +             if (rv)
> > +                     return rv;
> > +     }
> > +
> >       return pmbus_do_probe(client, id, &data->info);
> >  }
> >
> > @@ -413,6 +499,7 @@ static const struct i2c_device_id max34440_id[] =3D=
 {
> >       {"max34440", max34440},
> >       {"max34441", max34441},
> >       {"max34446", max34446},
> > +     {"max34451", max34451},
> >       {"max34460", max34460},
> >       {"max34461", max34461},
> >       {}



--=20
Regards,
Kun
