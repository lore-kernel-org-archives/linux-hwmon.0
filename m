Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0B35295F
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281426; cv=pass; b=AJrSq4QZYi8po3VOfXREybfTT4E7qcqD3BA7gbWKaa0nwxmJ2ilQdeXYFSsUweI7YhV5qyz0v2Wkxx7U6CWBgII4Mgwk47fzb2Z64xEPW53m9Bb2fDy7wu3+cVWLIO+HLGe8rAJoRJkF1B3YLAHn9JP+uj/Ay4B22cpObLmBTHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281426; c=relaxed/simple;
	bh=rlNn/Ya+cv52RkHmFZGmY52OZzJ3EGOkX3v5AkKzn9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pz8XFp+wA2LXTljo3cdqN+C08xnyaSYlStpnbNiWidH3FLafJz6u2AoNbm9MK3pYAiNmITcFkSiD6zfWD6qiAwHrhkl61GcQKJs4uTO+olcMUlyPyuDALMmnxG80I5ai7QWnXREjFHNEFaTGmfKH2bqD5BlYZtmSvynt9Il6mdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SedGzFQw; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SedGzFQw"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b71515d8adso570084eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 00:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770281425; cv=none;
        d=google.com; s=arc-20240605;
        b=NUCvKc0pfPpEzs/qd6oTNx2/k6+05tj8rfvRsWgUXARhHR2Ob3k4cpNiUcM3v4GHyg
         VW20JNzKAWhJmJG1oh8RQ0zEOHDAoWjQXstFl9boFeRdTGMZar2GU1xRQtrDGegNUu/R
         wkFj2b39y3JElf/AXXU232EE+2fbUPznVPYYBCb0gGgcW0yGCxyovrecACdqOploYLB6
         B0PST0R4GfcnW2lbnXfoQtz7fsb7DjwncxKl581+nYuLSWll4xziLRIbHq9LZL6I8qQt
         2Xl/JMNIFvIOlPF9F9SMbSSUTZn+VGij6EaMqPgkbls6ek2u5z9L+FtUVwKi+oPy5Vg8
         5XOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XxjXpoOe3CFlmXniMkswftA6j+cTekO8KOykjsuHkHE=;
        fh=pZ8P8XP7KlbAkJ88ltbiuGIWMfJoYkEg2Wcn3gwxvAA=;
        b=USRL/dQxi2b8jDOnH3uQcKdWEzJNmk5lrBzgecc2L94yHikj0c8jg9CKfkzGjcR7B/
         49tsOg1R3KDI5leECIjaO4nw1jvJzCPYtId9CuUADaJcnaYsBtRKfKSc6hQSMidg/hXn
         UwM1ngxeZVnLAWe54hKpe23rgN/o7TLozIqiqcY5/sU4dAty6VgUOtm9fE06R8vUA50Z
         OlX9yJfd35QrOQ94iiEJosM/pkba5Ru4caSDRiC6lAeaBBMVCsDex3Uehj+tBjwvGY78
         qCNyisBMm7vRMBEbbv26393eSpzfRQDBWglTq7GQl9ynut/a7/E+eL3YuQh2yIcoV1TB
         PaKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770281425; x=1770886225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxjXpoOe3CFlmXniMkswftA6j+cTekO8KOykjsuHkHE=;
        b=SedGzFQwi/bb69BMSlIvPNugFCYqjMhDzA86qi9GTJ/kNeWGv7t4wyaBDtKBhNR/M8
         f4OIyQ5x9D6lX4T+ucOv1L+RWIcuKMWn3xPt+EKLqaYHWGNm8pQxRbkBPfcMzKhVti4K
         PboiD/G1PX3CELRmWSpLuLAZD6CM383w1bd/9qrhabs07VGHvc8AwXoVETNT7LY+e7Qt
         Rfhop2NGqUNig/O/xU/1cGMkQbUlWHhPVTCtNbnms+w7SchLcYwkJzQS4Co6w+xfspGR
         GiWvq2IgULCQILalbbMYjjPPuH3ESxCo2Ctza8QI6EVVPbtK4k9rpVdwct2oXE/bjQG7
         Pcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281425; x=1770886225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxjXpoOe3CFlmXniMkswftA6j+cTekO8KOykjsuHkHE=;
        b=YfSQz6gxseMYMP2jZBu7VU+tP/vZy8WFL4MJHnPTrRZBs60Pq8gm+ityTDH52ADqO4
         XGdP8PVOmgoGMBsGSrm0BG4SeA8qx8ufGTQjrcPRVwAGk7DbgRJdOfNZar/wFfAXMLgt
         EZc1PTdWj0QDyQ5Z41aK2dJDr0zhWV27vAcMw8xum8/6W/04lHykVoxXAFsqI39yPUrL
         1WStoEfMX0IY1gTtdYW6USYLccdk5BFZZGkdILnk0aDGFMqgauhICpz1lHCqPWigifnk
         X+r1Nb5q0R4DFeL+03pzAjzgWXwhLcI9btDmw20OMapbsA4iXn+0M/J1H5S/hRttZdrx
         +7lw==
X-Forwarded-Encrypted: i=1; AJvYcCXXm5bGowf5SmsN0ZGmLk9g4jMRjZOJhXes+qsNicws5w6yctaE48wNnHoWnqSddmMHVd95M9qZPl8UeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSwMGCmk2Q/KRDFnUVio85uG2rXndTtsRuui9C+fhQgTjkS0Yr
	6KhOXkS+mfnIX+SGkZ8ojdfcIUPWa6ax13uSi64aPNUjGsPdhWxreM7xOHkHBquznwXr+qY5Y6I
	XjaStdvNzw5j723rAdFcb4ZgQvEzDzd0=
X-Gm-Gg: AZuq6aIk5X+8TPsBMJcpueZPc8IUp+XtJkOzF+9vMV3ygovQ2PKGX4NBR9gfJgZ+9NQ
	HSkCs5STJ5+GRufsDnLw/FQDWNwaCDWmogsCbfKO3byZ54cB+t0Id+31oAHhbQHwcDn/5wEtP+f
	qDVVVtJsIFhJ1akXzUqrQzw4w0YPF1yKQSEdrjaX2TIAh5kSjGU9zTrKQlj+q2fWJIJfU+QY6D+
	BYBvArBAGEPJ/W24nl0S7S4cmGuD+YTIEBgeV30U0b6FRyul7VsWQ4pHXAqVzdny8z4qZU1
X-Received: by 2002:a05:7301:4592:b0:2b6:c03d:9ff0 with SMTP id
 5a478bee46e88-2b8329c263emr2491667eec.22.1770281424875; Thu, 05 Feb 2026
 00:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
 <20260202080355.53061-3-Ashish.Yadav@infineon.com> <d0854014-7977-48b9-bf31-d66865352ecf@roeck-us.net>
In-Reply-To: <d0854014-7977-48b9-bf31-d66865352ecf@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 5 Feb 2026 14:20:13 +0530
X-Gm-Features: AZwV_QjtjOmY33a02gUHtxXYSSwRgoUhWsRiXwDwwJCzy3lbLWDxlov01vCpuQo
Message-ID: <CAJKbuCan+5AMuGuqKg4V1qs5HYZQ9zgS9S1rDDJ1usjJAjEGqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for
 xdpe1a2g5b/7b controllers
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for taking the time to review and provide feedback.
I appreciate your input and insights.
Please find my comments inline below.

Best regards,
Ashish Yadav

On Mon, Feb 2, 2026 at 9:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 2/2/26 00:03, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> > XDPE1A2G7B controllers.
> >
> > XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT_M=
ODE
> > command.
> > XDPE1A2G7B controller supports Linear and VID Data format for VOUT usin=
g
> > VOUT_MODE command.
> >
> > In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_versio=
n
> > is supported:
> > Vout =3D 5mV * (VID-1) + 195mV
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> >   drivers/hwmon/pmbus/Kconfig      |   9 +++
> >   drivers/hwmon/pmbus/Makefile     |   1 +
> >   drivers/hwmon/pmbus/pmbus.h      |   2 +-
> >   drivers/hwmon/pmbus/pmbus_core.c |   4 ++
> >   drivers/hwmon/pmbus/xdpe1a2g7b.c | 115 ++++++++++++++++++++++++++++++=
+
>
> Driver documentation missing.
>
   ACK, We will take care of this in the next release.

> >   5 files changed, 130 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index f3fb94cebf1a..c6750bce446d 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -684,6 +684,15 @@ config SENSORS_XDPE152
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called xdpe152c4.
> >
> > +config SENSORS_XDPE1A2G7B
> > +     tristate "Infineon XDPE1A2G7B"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Inf=
ineon
> > +       XDPE1A2G5B and XDPE1A2G7B.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called xdpe1a2g7b.
> > +
> >   config SENSORS_XDPE122
> >       tristate "Infineon XDPE122 family"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index 349a89b6d92e..620f24baa289 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -67,6 +67,7 @@ obj-$(CONFIG_SENSORS_UCD9200)       +=3D ucd9200.o
> >   obj-$(CONFIG_SENSORS_XDP710)        +=3D xdp710.o
> >   obj-$(CONFIG_SENSORS_XDPE122)       +=3D xdpe12284.o
> >   obj-$(CONFIG_SENSORS_XDPE152)       +=3D xdpe152c4.o
> > +obj-$(CONFIG_SENSORS_XDPE1A2G7B)     +=3D xdpe1a2g7b.o
> >   obj-$(CONFIG_SENSORS_ZL6100)        +=3D zl6100.o
> >   obj-$(CONFIG_SENSORS_PIM4328)       +=3D pim4328.o
> >   obj-$(CONFIG_SENSORS_CRPS)  +=3D crps.o
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index d2e9bfb5320f..3ddcb742d289 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
> >   #define PMBUS_PAGE_VIRTUAL  BIT(31) /* Page is virtual */
> >
> >   enum pmbus_data_format { linear =3D 0, ieee754, direct, vid };
> > -enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd625mv };
> > +enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd625mv, nvidia195m=
v };
> >
> >   /* PMBus revision identifiers */
> >   #define PMBUS_REV_10 0x00   /* PMBus revision 1.0 */
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index be6d05def115..4d7634ee6148 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data *d=
ata,
> >               if (val >=3D 0x0 && val <=3D 0xd8)
> >                       rv =3D DIV_ROUND_CLOSEST(155000 - val * 625, 100)=
;
> >               break;
> > +     case nvidia195mv:
> > +             if (val >=3D 0x01)
> > +                     rv =3D 195 + (val - 1) * 5;  /* VID step is 5mv *=
/
> > +             break;
> >       }
> >       return rv;
> >   }
>
> The core change needs to be a separate patch.
>
ACK, We will take care of this in the next release.

> > diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdp=
e1a2g7b.c
> > new file mode 100644
> > index 000000000000..79b12b56e7b6
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> > @@ -0,0 +1,115 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2=
G5B
> > + * and XDPE1A2G7B Controllers
> > + *
> > + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +#define XDPE1A2G7B_PAGE_NUM 2
> > +#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step i=
s 5mV */
> > +
> > +static int xdpe1a2g7b_identify(struct i2c_client *client,
> > +                            struct pmbus_driver_info *info)
> > +{
> > +     u8 vout_params;
> > +     int i, ret, vout_mode;
> > +
> > +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > +     if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
>
> What if vout_mode < 0 ? Also, what if the mode is different for page 1 ?

ACK, We will take care of this in the next release.

> Also, if I understand patch 0 correctly, executing this function is not n=
eeded
> for XDPE1A2G5B.
>
ACK, We will take care of this in the next release.

> > +             switch (vout_mode >> 5) {
> > +             case 0:
> > +                     info->format[PSC_VOLTAGE_OUT] =3D linear;
> > +                     return 0;
> > +             case 1:
> > +                     info->format[PSC_VOLTAGE_OUT] =3D vid;
> > +                     break;
> > +             default:
> > +                     return -ENODEV;
> > +             }
> > +     }
> > +
> > +     for (i =3D 0; i < info->pages; i++) {
> > +             /* Read the VOUT_MODE register for VID Code Type. */
> > +             ret =3D pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
>
> Given that there are only two pages, reading PMBUS_VOUT_MODE for
> page 0 twice is a bit of a waste. On top of that, the need for the loop
> suggests that the mode can be different across pages. That needs to be
> supported: Bailing out in that case is not acceptable. Worse:
> What if the mode is linear on page 0 but vid on page 1 ?
>
ACK, We will take care of this in the next release.

> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             vout_params =3D ret & GENMASK(4, 0);
> > +             switch (vout_params) {
> > +             case XDPE1A2G7B_NVIDIA_195MV:
> > +                     info->vrm_version[i] =3D nvidia195mv;
> > +                     break;
> > +             default:
> > +                     return -EINVAL;
>
> This warrants an error message and an explanation (comment) why other mod=
es
> are not supported by the driver. The detailed datasheet is not public, so
> you'll have to help out here. As mentioned above, bailing out because the
> mode on page 1 is linear is not acceptable.
>
ACK, we will provide comments in the next release.
Additionally, please note that the XDPE1A2G7B Controller only supports
the 'nvidia195mv' vrm_version in the VID Data format for VOUT.
We will ensure that this limitation is properly documented and
commented on in the next release.

> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct pmbus_driver_info xdpe1a2g7b_info =3D {
> > +     .pages =3D XDPE1A2G7B_PAGE_NUM,
> > +     .identify =3D xdpe1a2g7b_identify,
> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .format[PSC_CURRENT_IN] =3D linear,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_POWER] =3D linear,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS=
_VOUT |
> > +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_I=
OUT |
> > +                PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS=
_TEMP |
> > +                PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_I=
NPUT,
> > +     .func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS=
_VOUT |
> > +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_I=
OUT |
> > +                PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_I=
NPUT,
> > +};
> > +
> > +static int xdpe1a2g7b_probe(struct i2c_client *client)
> > +{
> > +     struct pmbus_driver_info *info;
> > +
> > +     info =3D devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*inf=
o),
> > +                         GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     return pmbus_do_probe(client, info);
> > +}
> > +
> > +static const struct i2c_device_id xdpe1a2g7b_id[] =3D { { "xdpe1a2g5b"=
 },
> > +                                                   { "xdpe1a2g7b" },
> > +                                                   {} };
>
> Please use more lines and less indentation.
>
ACK, We will take care of this in the next release.

> > +
> > +MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
> > +
> > +static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[] =
=3D {
> > +     { .compatible =3D "infineon,xdpe1a2g5b" },
> > +     { .compatible =3D "infineon,xdpe1a2g7b" },
> > +     {}
>
> ... just like here.
>
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
> > +
> > +static struct i2c_driver xdpe1a2g7b_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "xdpe1a2g7b",
> > +             .of_match_table =3D of_match_ptr(xdpe1a2g7b_of_match),
> > +     },
> > +     .probe =3D xdpe1a2g7b_probe,
> > +     .id_table =3D xdpe1a2g7b_id,
> > +};
> > +
> > +module_i2c_driver(xdpe1a2g7b_driver);
> > +
> > +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
>
