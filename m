Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67641A4FB
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378617; cv=pass; b=tBwyFRBkd6SWLeerddIvS2EgjwQ6K6A1stLPhSuLwM572h9lCUDIetjrldbwC2DOSglLVSl0Eec4ep1AJkN0Atm2GKiYwmHkzYPuZ1XgDKA2kaIqkivQgvG17sqAdmsf2EZEjMwwPzpGdv0EJ1koEOFuFbsipYcN+27H8B4/Wj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378617; c=relaxed/simple;
	bh=wbTsbaaraRurUVBMZm1/N3nbYDvOMB8ZhzA+hO9kfIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpkDUusxklvnSeR5zaHRl4sTOfQ3BsxuXmc/Y4NwNNouL7lccDTrIH70R6L5nYZWuoJaqN+jfpfh0aKEMIpKo3soWHrVeIbkMThR0+CoGlEzgPVxFheqzY1wc2VRm4+P86f4LI1ZTBSkTZjP709DPoAB82NVD9tmK2F7aQEggdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psTZMUxj; arc=pass smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psTZMUxj"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so573652e0c.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 02:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789378614; cv=none;
        d=google.com; s=arc-20260327;
        b=kvzeHEQuTNs35Py5c6lInD1g+YIVjYysuxDUK4kLBhA6kTZH3h1ULhj/SRhxbvuZKa
         3FNKkUYDii1GskNwsbJ15vXRMz7hKgZqbarIin8Az9wFVSbIjahZ6u1CYDQOFguf7/pi
         QhSJ8Evc24N3OcCex2xSiofdEGalTVXa23DTQoYO8hoL9JASCa15Wbs9PI0ekB2gEIte
         CHqCTfYfRAA0SJ0Ljcs0RqmXUtpA0iZ86eFO/K/T9Ytw4jPBbyIKFATjpL19cS6VhOJO
         LCoLFYLK00DzKHG5D0Q49Ccj4wGtGpVuzLrKKseYa2bpU1pdEGz5qbXJSNPyTYqp2+AK
         V35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bH2hEpXtRoRU2iikLb41kShYLYcasMrhcO4+UhblFzQ=;
        fh=qeShl+LyYtf4AD2Gx/3IXuvklx3Mv3qbQQUxs7UdoDI=;
        b=JzYuu8lvg2uBy9xxCsc4wcqfmMrqLvm6tuxMkhY/rISHY8ZUxXCU2SHKyDZ74IWqsh
         6QQyADSCNZyN/52qwi4MPUbsA4fXjqCaX2/9Q2cNZ1rde8mTIavRStfmS8DhNKiuzfsi
         DnNvAD9qDgqSa9hq9fDflMUnZA6Og2sPzQ/8kY7oE2lziT6EQDV2UgRAxEBMbFjJMuSt
         lZWoR8KNqMh+W3w0RwiMv2x2SXbETBt74EK+RjV3j7tMMov4+9aJuJ7puoaiD06t+8NP
         WKHuf3ORW9O16GQ7R9XYDUvxfIvw4JvOB1iDbYomjYchmIyUGfkz2IYDGmXcqiQEnaM7
         PIkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378614; x=1789983414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bH2hEpXtRoRU2iikLb41kShYLYcasMrhcO4+UhblFzQ=;
        b=psTZMUxjGibfNKdUxqs2LYkifssd0mqqMAIRzgrCW+mAZDj9acj0dP+bjjJIW/mXVM
         CJEU81R5Y3eh7Vp59cjbnxAk4SH5rFaS6BhGaYiNHLXe8zQWlYqcDbVk7Dn0xjJ7nNs0
         ZGMS5NCPUkIVvwgyORYTdhSF+g0bYEA8TedwWliyQXnnIsqjnyJ3rPZuH61IS4fCGmFe
         EId+yukwBxdM6phB/q2Y+7tECuRj1L72ez1QnZnQC4LLDohgAKE+SFKpkpCZdzBjiuxD
         8i2VapveuA1v+Nrdl9ok+RYbLjCOO5cGXzZV8gAaOQs+BsWvYJ+oWIN9eyxyK3sTLXdx
         57hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378614; x=1789983414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH2hEpXtRoRU2iikLb41kShYLYcasMrhcO4+UhblFzQ=;
        b=gkoFzjIFX8fv3riJCElcR4ungJHg+YDwCEv73qmy7nwiiwq8YOjhOYvxwyGS5Ea7ln
         nTQSeVIGlGJxwGqal0QJKG9EGBRbwbl7N+evFjfVs9w5on3g1v97t9VLA0jBEK3iXnGC
         Otddp9bt3M5NCYOkAEL0le/3AfkgWQWJMCv86x2sjyQ33Pp2UWIqy6JS38ZGm46WpFXH
         CyRLw0xTtLXk5+54qaF88SDHNwyryB1K/uH0pbBs5jp8OQIqNYDWg8+96SjNcNxxFJhT
         L9u1bm8J0Ghz8EkDKGBnRRsuweVU87ZCfwdAmhN9Vuk0KtbUWhGCTFGRskDRb5YDRKl0
         DJaw==
X-Forwarded-Encrypted: i=1; AKwUvBwIGuX2flyFNvVWEHvTzNYrpTE+0TqccZiCP4LRCWb5Tbg/6ZBQ7QthhelaHJo4WB9L+bQD+m3l/Aq9BA==@vger.kernel.org
X-Gm-Message-State: AFuF++kyz/10w2Ws08U5V77eRb/jXbszLZi22tzp+ZK8EzdcAE5VXcSp
	ZjTmtUi95UEIcBvQtleNUugUkJsLPuNKBNcBfFQjEfHVLOXdCZ1N/JXwPDX4Gg48CcmjDUTCHFG
	V0iAOfQjJqFHdmK1H5Uoz6ZS/c713Ims=
X-Gm-Gg: AYBFou2QgMz2dD6RnOo2H1xA97Ox8NndKVdZ/8nyi2JeNgeRQaqCspKBxcPxC62xQbt
	bI0jFdcrvxrtVFL7suq4QaowlyaE6auy2p6F3gDGBtinzTFDEjkEwfdQ6bguNPv1Lwheoc+gQr2
	w8J/TUQUIq3HHLU7QZh5m3ShBAaNFWgDpzoM22uT7GBEUkKFHT6yWhRg65qEBSIxFxaK6ezLnvN
	AQI0u+cggUUuJyM1XhlVwoyvjNPqwOwKfk5h+xukjSuTFptfQ+uN7if1+KKvLbZmyZiLj7zlAJB
	BvCZCe6Bi+yI8brhMCfuvwUC5oLHLtpDwjyex4hYTUqmTw6/D2YEGevTFA==
X-Received: by 2002:a05:6122:8cc:b0:5bd:71b1:d5c6 with SMTP id
 71dfb90a1353d-5c981b4a790mr891390e0c.4.1789378614538; Mon, 14 Sep 2026
 02:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-2-dbae7fabce09@gmail.com> <7317a007-3995-47b3-b9f8-3aaf7702c7a4@roeck-us.net>
In-Reply-To: <7317a007-3995-47b3-b9f8-3aaf7702c7a4@roeck-us.net>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:36:42 +0800
X-Gm-Features: AcwNN1VEtBxmaPHhbUkPMT-6OnFxOWdVDaJlXfoqr6_GZOAayu7CdhuyNqvV14E
Message-ID: <CAPBH0A-PGwYQRD=eVZaZfzuT+LA3iasbqrVvS4-umekjg5r6VA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
To: Guenter Roeck <linux@roeck-us.net>
Cc: Colin Huang <colin.huang2@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 9/10/26 05:35, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add a PMBus driver for Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >   Documentation/hwmon/index.rst    |  1 +
> >   Documentation/hwmon/tda38740.rst | 65 +++++++++++++++++++++++++++
> >   drivers/hwmon/pmbus/Kconfig      |  9 ++++
> >   drivers/hwmon/pmbus/Makefile     |  1 +
> >   drivers/hwmon/pmbus/tda38740.c   | 94 +++++++++++++++++++++++++++++++=
+++++++++
> >   5 files changed, 170 insertions(+)
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index f07977a20271..aeff87b3d46d 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -265,6 +265,7 @@ Hardware Monitoring Kernel Drivers
> >      sy7636a-hwmon
> >      tc654
> >      tc74
> > +   tda38740
> >      thmc50
> >      tmp102
> >      tmp103
> > diff --git a/Documentation/hwmon/tda38740.rst b/Documentation/hwmon/tda=
38740.rst
> > new file mode 100644
> > index 000000000000..55ce12f14914
> > --- /dev/null
> > +++ b/Documentation/hwmon/tda38740.rst
> > @@ -0,0 +1,65 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Kernel driver tda38740
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +  * Infineon TDA38740
> > +  * Infineon TDA38725
> > +
> > +    Prefix: 'tda38740'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet:
> > +      https://www.infineon.com/row/public/documents/24/49/infineon-tda=
38740-tda38725-datasheet-en.pdf
> > +
> > +Author: Colin Huang <u8813345@gmail.com>
> > +
> > +Description
> > +-----------
> > +
> > +The TDA38740 and TDA38725 are single-output synchronous buck regulator=
s with a
> > +PMBus interface. They expose basic voltage, current, power and tempera=
ture
> > +telemetry through the standard PMBus hwmon interfaces.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +curr1_alarm          Input current alarm
> > +curr1_input          Measured input current
> > +curr1_label          "iin"
> > +
> > +curr2_crit           Critical maximum output current
> > +curr2_crit_alarm     Output current critical high alarm
> > +curr2_input          Measured output current
> > +curr2_label          "iout"
> > +
> > +in1_crit             Critical maximum input voltage
> > +in1_crit_alarm               Input voltage critical high alarm
> > +in1_input            Measured input voltage
> > +in1_label            "vin"
> > +
> > +in2_crit             Critical maximum output voltage
> > +in2_crit_alarm               Output voltage critical high alarm
> > +in2_input            Measured output voltage
> > +in2_label            "vout"
> > +in2_lcrit            Critical minimum output voltage
> > +in2_lcrit_alarm              Output voltage critical low alarm
> > +
> > +power1_alarm         Input power alarm
> > +power1_input         Measured input power
> > +power1_label         "pin"
> > +
> > +power2_input         Measured output power
> > +power2_label         "pout"
> > +
> > +temp1_crit           Critical high temperature
> > +temp1_crit_alarm     Chip temperature critical high alarm
> > +temp1_input          Measured temperature
> > +temp1_max            Maximum temperature
> > +temp1_max_alarm              Chip temperature high alarm
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index bcfdc4ce4c10..e4ca80dd0574 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
> >         If you say yes here you get regulator support for Infineon
> >         TDA38640 as regulator.
> >
> > +config SENSORS_TDA38740
> > +     tristate "Infineon TDA38725/TDA38740"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Inf=
ineon
> > +       TDA38725 and TDA38740.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called tda38740.
> > +
> >   config SENSORS_TPS25990
> >       tristate "TI TPS25990"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index e288fe72a437..eb06d47816fd 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)     +=3D stef48h28.o
> >   obj-$(CONFIG_SENSORS_SQ24860)       +=3D sq24860.o
> >   obj-$(CONFIG_SENSORS_STPDDC60)      +=3D stpddc60.o
> >   obj-$(CONFIG_SENSORS_TDA38640)      +=3D tda38640.o
> > +obj-$(CONFIG_SENSORS_TDA38740)       +=3D tda38740.o
> >   obj-$(CONFIG_SENSORS_TPS25990)      +=3D tps25990.o
> >   obj-$(CONFIG_SENSORS_TPS40422)      +=3D tps40422.o
> >   obj-$(CONFIG_SENSORS_TPS53679)      +=3D tps53679.o
> > diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38=
740.c
> > new file mode 100644
> > index 000000000000..6d3e9884f733
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tda38740.c
> > @@ -0,0 +1,94 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Infineon TDA38725/TDA38740
> > + *
> > + * Copyright (c) 2023 9elements GmbH
> > + *
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +/*
> > + * TDA38725/TDA38740 only support Linear format for VOUT related comma=
nds,
> > + * with exponents in the range of -8 to -12 (see datasheet VOUT_MODE
> > + * description). Direct format is not supported by this device.
> > + */
> > +static int tda38740_identify(struct i2c_client *client,
> > +                          struct pmbus_driver_info *info)
> > +{
> > +     int vout_mode;
> > +
> > +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > +     if (vout_mode < 0 || vout_mode =3D=3D 0xff)
> > +             return vout_mode < 0 ? vout_mode : -ENODEV;
> > +
> > +     if ((vout_mode >> 5) !=3D 0)
> > +             return -ENODEV;
> > +
>
> What is the point of this code ? The PMBus core, in pmbus_identify_common=
(),
> already compares the configured mode (info->format[PSC_VOLTAGE_OUT]) with
> the value in the PMBUS_VOUT_MODE register and bails out if it does not ma=
tch.
> The code here just seems to duplicate that. Am I missing something ?
Hi Guenter,
  Thanks for your review.
  Yes, code is duplicating.
  I will remove this function in next.

Best regards,
Colin Huang

> > +     info->format[PSC_VOLTAGE_OUT] =3D linear;
> > +
> > +     return 0;
> > +}
> > +
> > +static struct pmbus_driver_info tda38740_info =3D {
> > +     .pages =3D 1,
> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_CURRENT_IN] =3D linear,
> > +     .format[PSC_POWER] =3D linear,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +         | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +         | PMBUS_HAVE_IIN
> > +         | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +         | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +         | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> > +     .identify =3D tda38740_identify,
> > +};
> > +
> > +static int tda38740_probe(struct i2c_client *client)
> > +{
> > +     struct tda38740_data *data;
> > +
>
> This definition got lost, and I don't immediately see why it would be
> needed.
>
> Thanks,
> Guenter
>
Thanks for the review.
I plan to change it to:
```
static int tda38740_probe(struct i2c_client *client)
{
return pmbus_do_probe(client, &tda38740_info);
}
```
Best regards,
Colin Huang


> > +     data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> > +
> > +     return pmbus_do_probe(client, &data->info);
> > +}
> > +
> > +static const struct i2c_device_id tda38740_id[] =3D {
> > +     { .name =3D "tda38725"},
> > +     { .name =3D "tda38740"},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, tda38740_id);
> > +
> > +static const struct of_device_id __maybe_unused tda38740_of_match[] =
=3D {
> > +     { .compatible =3D "infineon,tda38725"},
> > +     { .compatible =3D "infineon,tda38740"},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> > +
> > +static struct i2c_driver tda38740_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "tda38740",
> > +             .of_match_table =3D of_match_ptr(tda38740_of_match),
> > +     },
> > +     .probe =3D tda38740_probe,
> > +     .id_table =3D tda38740_id,
> > +};
> > +
> > +module_i2c_driver(tda38740_driver);
> > +
> > +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
> >
>
