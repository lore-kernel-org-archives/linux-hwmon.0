Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8DB25393B
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 03:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770954317; cv=pass; b=gqD+uzCTcpLEOBx65n0+h3j9DeUiTTKPqZVDG7it6R9LSNOz62zpdEjZU7cYxO/8zWOhaSsAy7lBVMeHDBZKT7pGhN2gjEm2wfLYaOZOE1u0mQwP4c2FLU4fpM74tBaI96B1CWoqyKtAyi2tnP7JKNvNuGGqkY0XyEuvVtBKPQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770954317; c=relaxed/simple;
	bh=7D7EnDMCLAJELKBu9mkUwvrGjkIa5L3M+RZ+AdYaLgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxQUnXwjWNNo3X8ZBbZW5P9KfLhwQoGZw8CeKGskUtlaxHt0gl2mYktDGTkmgIqoyN3f1Aj8R0MvPqhuxMGnoP6z9REjO/6Jd/gIGolZywIFFq9iRzesQ2mGJUoqS2U5DZZtCBmXrTvWls8DZcc2tAW8H5p33recE1q6EOvUXEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5nGHgTS; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5nGHgTS"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1270ac5d3efso569396c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 19:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770954315; cv=none;
        d=google.com; s=arc-20240605;
        b=WMILmVWh8U74mkhizBGzS/rky+k5ei5xKgCyBdr6yK7I/58v7xWW84LLL/R+kjVrNE
         38simhHs8ny070HH7aCUpDmocXCqhCSLwDFmqFIGqL5DbubhTTqCW3XFqIrh6nmUAb/g
         TC+tid2ESFXCg3WjSgAtm6eT2WYYlzU8zD+FITQB50TzX7lFyEuIBBaxfl8kf/dc+QuA
         QN0XnxzAXIw5UyWOYlv2MSUj3DQDwvieBybsvlgGPXLpgqJfxrKvyGSIjbS6akVpUU6W
         0f1cM0JFo5dgl/4eK6T959cXAVLjejnnyE0ns+/uLG/MetlfOzOMlMG3mW6Z+MC9D9mk
         lzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ebd6cUD3SUqeq4UwREWJDX9TbwBiWNuwGwVAMT29P98=;
        fh=g3PQoJUy1CXAOViBCMcgPTICMURdNAopbdeC9xF47vQ=;
        b=AlTMORGacT/ZJMah0ZRwOgaUy5Sr9oKsYJHuJDTvLdY8Ma6Pl0DzD0o6nZq6a/53BR
         cmpfYKyIdY+LfaBSa6ty4HpGV7IOk6yesSL2ubEWzB/Mrkwh5o6eu5HIVGdnZp8V/PeU
         sD+rwjxe5amKhCx51jUMbLVykJUf1qcAkcHAHgjyp187fn9a6hU72TWnYSYJMtDp62QK
         4eNMAxEh0uPrHj/mYWG7+faquEMaJkI8BDFgbXUI3/fORSRDButci3cuNCb0uJ0UFy5N
         fEDfjDnWcURiBcOhnrvKVPHkpRmYIHM/RntP5DxVRmg/IJiaCwwXEIUkgYKt07ZZ9OS1
         Giaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770954315; x=1771559115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebd6cUD3SUqeq4UwREWJDX9TbwBiWNuwGwVAMT29P98=;
        b=l5nGHgTSshQfUKHLizSNiQ0oM5TfMTnqx9v/V37vJyXNxdo5RwZlp2yD6ToYMXBjVi
         XsJYQud71SDD144boAX3N9r0PEfcOZ7bb1pOihIOqGogpHFODj1WCVQ03SwVhfcwwtup
         LqwCmzl2Bgreyl2dYSZhEx7H2RPSgHja8QB+VwiK2ff7Ld4o47niBvBGjTe32h0zlyFh
         lgPua5Q8wAv6TQT9oNDlVx45obvZ2wduflv0pcrn3WKKm7MaoYGN+IkR/UUAlgQlfFcg
         stS93Vf53JGQcKI8DSIk/S2Ajyz72XTbPIvUUgjDCQDH8+HeoikP5SmS5PvjHChifgT5
         YS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770954315; x=1771559115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebd6cUD3SUqeq4UwREWJDX9TbwBiWNuwGwVAMT29P98=;
        b=pQs87s4o9jsv6r3PUzrRiR8T1X59AZ1ShyzQFp43Cyno2oS5zd8wkStU4YCq4E0R/y
         h6nzvXajogSn8VPNQscti04Jpsi91jeppU4hf0jfFnSWM/gquFE9FpPRMoK8ZBLjZj+6
         tz4uWTpHXHjT453ZrD1qiCi7bfhtplducjZfHLDvagE7KXl3TxXgZqIrDlKcftebwkJq
         sAp/ZWE9YE7PfsjfRXCNulYN9FCKxEjvFmN3dn6E6oIIAeGLjP9KhXpHdP7fFVGlE7gY
         6zEK9gJOg7MoTa0cOQnsnc7gq8BbPkw/CjFMAx4NR6T16JsYlI8lc1CrN4LqAD5SAJoI
         KD9g==
X-Forwarded-Encrypted: i=1; AJvYcCWy8KWOjvtqOVOGowvl7RmH+hw6auQ/f4AaLIbKn344uxy/+WG5tDf1/Avgcg++xw0Qy58R8km+/L2UnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmoL8R9ohKYmCwUMgnpnd/4JwSSkXN6gJB/8sP0TR1uJE8xJa
	Db+bKpNcxn2mJZBm5vRzjKdEZufXtyIXJMSmE2YsKkVYqQRQs/jTQCQZCIqb2/WI8DOcvOFq9WA
	3qcFzAU/LjuCQpe6ON1tHquoEj5ff+K8=
X-Gm-Gg: AZuq6aKKDmfcjuV8qauVa2Q/QfdbazLeR0FQVpnzDmmJfkSXWghLeaMSZ8eclCI2auo
	aWWd1xLJH+cf5FA0PWAVc25O39Cycnaqdva4A14aPuYh/r14QsK0IB8vbX2YfliDCVjhTJwDkbH
	gNOKd/launw65j/yFllG6js81f5/98kCGKZTAdvBLsm56BX7i9sNJon7q746vokcypDBsB4Uxd6
	WWLe5fWiP9UVmzI+ZyUiQFvUnmKv/YXAJRATy/VE6pKMa+SKRh6b4k1Txg2g0RQw7xNPZ2ngTYO
	dnGCz293rBdtgf3S49Q=
X-Received: by 2002:a05:7022:618e:b0:119:e56b:91ec with SMTP id
 a92af1059eb24-1273ae30272mr128115c88.29.1770954314777; Thu, 12 Feb 2026
 19:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
 <20260202080355.53061-3-Ashish.Yadav@infineon.com> <d0854014-7977-48b9-bf31-d66865352ecf@roeck-us.net>
 <CAJKbuCan+5AMuGuqKg4V1qs5HYZQ9zgS9S1rDDJ1usjJAjEGqw@mail.gmail.com>
In-Reply-To: <CAJKbuCan+5AMuGuqKg4V1qs5HYZQ9zgS9S1rDDJ1usjJAjEGqw@mail.gmail.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Fri, 13 Feb 2026 09:15:02 +0530
X-Gm-Features: AZwV_QhIJGE4Rx07WcyWjPT2208y4-Ah1bZ6hHJYOYkZy_-nml0yEGPqJ71HtQk
Message-ID: <CAJKbuCavMxc7xc4-QW95NfCaUCbLZck5nP1+iMtVxOt4LZ5esg@mail.gmail.com>
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

I hope this email finds you well.

I am reaching out to request your assistance with a specific inquiry
regarding the handling of loops/pages for different VOUT modes
independently.
The challenge I am facing is that the Linux kernel provides a single
"PSC_VOLTAGE_OUT" for the chip, which is not page-specific, making it
difficult to handle these different modes independently.

I would greatly appreciate it if you could provide me with more
information or guidance on how to address this issue, as your
expertise in this area would be invaluable in helping me find a
solution.

With Best Regards,
  Ashish Yadav


On Thu, Feb 5, 2026 at 2:20=E2=80=AFPM ashish yadav <ashishyadav78@gmail.co=
m> wrote:
>
> Hi Guenter,
>
> Thank you for taking the time to review and provide feedback.
> I appreciate your input and insights.
> Please find my comments inline below.
>
> Best regards,
> Ashish Yadav
>
> On Mon, Feb 2, 2026 at 9:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> >
> > On 2/2/26 00:03, ASHISH YADAV wrote:
> > > From: Ashish Yadav <ashish.yadav@infineon.com>
> > >
> > > Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> > > XDPE1A2G7B controllers.
> > >
> > > XDPE1A2G5B controller supports Linear Data format for VOUT using VOUT=
_MODE
> > > command.
> > > XDPE1A2G7B controller supports Linear and VID Data format for VOUT us=
ing
> > > VOUT_MODE command.
> > >
> > > In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_vers=
ion
> > > is supported:
> > > Vout =3D 5mV * (VID-1) + 195mV
> > >
> > > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > > ---
> > >   drivers/hwmon/pmbus/Kconfig      |   9 +++
> > >   drivers/hwmon/pmbus/Makefile     |   1 +
> > >   drivers/hwmon/pmbus/pmbus.h      |   2 +-
> > >   drivers/hwmon/pmbus/pmbus_core.c |   4 ++
> > >   drivers/hwmon/pmbus/xdpe1a2g7b.c | 115 ++++++++++++++++++++++++++++=
+++
> >
> > Driver documentation missing.
> >
>    ACK, We will take care of this in the next release.
>
> > >   5 files changed, 130 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> > >
> > > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfi=
g
> > > index f3fb94cebf1a..c6750bce446d 100644
> > > --- a/drivers/hwmon/pmbus/Kconfig
> > > +++ b/drivers/hwmon/pmbus/Kconfig
> > > @@ -684,6 +684,15 @@ config SENSORS_XDPE152
> > >         This driver can also be built as a module. If so, the module =
will
> > >         be called xdpe152c4.
> > >
> > > +config SENSORS_XDPE1A2G7B
> > > +     tristate "Infineon XDPE1A2G7B"
> > > +     help
> > > +       If you say yes here you get hardware monitoring support for I=
nfineon
> > > +       XDPE1A2G5B and XDPE1A2G7B.
> > > +
> > > +       This driver can also be built as a module. If so, the module =
will
> > > +       be called xdpe1a2g7b.
> > > +
> > >   config SENSORS_XDPE122
> > >       tristate "Infineon XDPE122 family"
> > >       help
> > > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makef=
ile
> > > index 349a89b6d92e..620f24baa289 100644
> > > --- a/drivers/hwmon/pmbus/Makefile
> > > +++ b/drivers/hwmon/pmbus/Makefile
> > > @@ -67,6 +67,7 @@ obj-$(CONFIG_SENSORS_UCD9200)       +=3D ucd9200.o
> > >   obj-$(CONFIG_SENSORS_XDP710)        +=3D xdp710.o
> > >   obj-$(CONFIG_SENSORS_XDPE122)       +=3D xdpe12284.o
> > >   obj-$(CONFIG_SENSORS_XDPE152)       +=3D xdpe152c4.o
> > > +obj-$(CONFIG_SENSORS_XDPE1A2G7B)     +=3D xdpe1a2g7b.o
> > >   obj-$(CONFIG_SENSORS_ZL6100)        +=3D zl6100.o
> > >   obj-$(CONFIG_SENSORS_PIM4328)       +=3D pim4328.o
> > >   obj-$(CONFIG_SENSORS_CRPS)  +=3D crps.o
> > > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.=
h
> > > index d2e9bfb5320f..3ddcb742d289 100644
> > > --- a/drivers/hwmon/pmbus/pmbus.h
> > > +++ b/drivers/hwmon/pmbus/pmbus.h
> > > @@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
> > >   #define PMBUS_PAGE_VIRTUAL  BIT(31) /* Page is virtual */
> > >
> > >   enum pmbus_data_format { linear =3D 0, ieee754, direct, vid };
> > > -enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd625mv };
> > > +enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd625mv, nvidia19=
5mv };
> > >
> > >   /* PMBus revision identifiers */
> > >   #define PMBUS_REV_10 0x00   /* PMBus revision 1.0 */
> > > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/p=
mbus_core.c
> > > index be6d05def115..4d7634ee6148 100644
> > > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > > @@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data =
*data,
> > >               if (val >=3D 0x0 && val <=3D 0xd8)
> > >                       rv =3D DIV_ROUND_CLOSEST(155000 - val * 625, 10=
0);
> > >               break;
> > > +     case nvidia195mv:
> > > +             if (val >=3D 0x01)
> > > +                     rv =3D 195 + (val - 1) * 5;  /* VID step is 5mv=
 */
> > > +             break;
> > >       }
> > >       return rv;
> > >   }
> >
> > The core change needs to be a separate patch.
> >
> ACK, We will take care of this in the next release.
>
> > > diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/x=
dpe1a2g7b.c
> > > new file mode 100644
> > > index 000000000000..79b12b56e7b6
> > > --- /dev/null
> > > +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> > > @@ -0,0 +1,115 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1=
A2G5B
> > > + * and XDPE1A2G7B Controllers
> > > + *
> > > + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> > > + */
> > > +
> > > +#include <linux/err.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/init.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include "pmbus.h"
> > > +
> > > +#define XDPE1A2G7B_PAGE_NUM 2
> > > +#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step=
 is 5mV */
> > > +
> > > +static int xdpe1a2g7b_identify(struct i2c_client *client,
> > > +                            struct pmbus_driver_info *info)
> > > +{
> > > +     u8 vout_params;
> > > +     int i, ret, vout_mode;
> > > +
> > > +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > > +     if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
> >
> > What if vout_mode < 0 ? Also, what if the mode is different for page 1 =
?
>
> ACK, We will take care of this in the next release.
>
> > Also, if I understand patch 0 correctly, executing this function is not=
 needed
> > for XDPE1A2G5B.
> >
> ACK, We will take care of this in the next release.
>
> > > +             switch (vout_mode >> 5) {
> > > +             case 0:
> > > +                     info->format[PSC_VOLTAGE_OUT] =3D linear;
> > > +                     return 0;
> > > +             case 1:
> > > +                     info->format[PSC_VOLTAGE_OUT] =3D vid;
> > > +                     break;
> > > +             default:
> > > +                     return -ENODEV;
> > > +             }
> > > +     }
> > > +
> > > +     for (i =3D 0; i < info->pages; i++) {
> > > +             /* Read the VOUT_MODE register for VID Code Type. */
> > > +             ret =3D pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE=
);
> >
> > Given that there are only two pages, reading PMBUS_VOUT_MODE for
> > page 0 twice is a bit of a waste. On top of that, the need for the loop
> > suggests that the mode can be different across pages. That needs to be
> > supported: Bailing out in that case is not acceptable. Worse:
> > What if the mode is linear on page 0 but vid on page 1 ?
> >
> ACK, We will take care of this in the next release.
>
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             vout_params =3D ret & GENMASK(4, 0);
> > > +             switch (vout_params) {
> > > +             case XDPE1A2G7B_NVIDIA_195MV:
> > > +                     info->vrm_version[i] =3D nvidia195mv;
> > > +                     break;
> > > +             default:
> > > +                     return -EINVAL;
> >
> > This warrants an error message and an explanation (comment) why other m=
odes
> > are not supported by the driver. The detailed datasheet is not public, =
so
> > you'll have to help out here. As mentioned above, bailing out because t=
he
> > mode on page 1 is linear is not acceptable.
> >
> ACK, we will provide comments in the next release.
> Additionally, please note that the XDPE1A2G7B Controller only supports
> the 'nvidia195mv' vrm_version in the VID Data format for VOUT.
> We will ensure that this limitation is properly documented and
> commented on in the next release.
>
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static struct pmbus_driver_info xdpe1a2g7b_info =3D {
> > > +     .pages =3D XDPE1A2G7B_PAGE_NUM,
> > > +     .identify =3D xdpe1a2g7b_identify,
> > > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > > +     .format[PSC_TEMPERATURE] =3D linear,
> > > +     .format[PSC_CURRENT_IN] =3D linear,
> > > +     .format[PSC_CURRENT_OUT] =3D linear,
> > > +     .format[PSC_POWER] =3D linear,
> > > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STAT=
US_VOUT |
> > > +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS=
_IOUT |
> > > +                PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STAT=
US_TEMP |
> > > +                PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS=
_INPUT,
> > > +     .func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STAT=
US_VOUT |
> > > +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS=
_IOUT |
> > > +                PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS=
_INPUT,
> > > +};
> > > +
> > > +static int xdpe1a2g7b_probe(struct i2c_client *client)
> > > +{
> > > +     struct pmbus_driver_info *info;
> > > +
> > > +     info =3D devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*i=
nfo),
> > > +                         GFP_KERNEL);
> > > +     if (!info)
> > > +             return -ENOMEM;
> > > +
> > > +     return pmbus_do_probe(client, info);
> > > +}
> > > +
> > > +static const struct i2c_device_id xdpe1a2g7b_id[] =3D { { "xdpe1a2g5=
b" },
> > > +                                                   { "xdpe1a2g7b" },
> > > +                                                   {} };
> >
> > Please use more lines and less indentation.
> >
> ACK, We will take care of this in the next release.
>
> > > +
> > > +MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
> > > +
> > > +static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[=
] =3D {
> > > +     { .compatible =3D "infineon,xdpe1a2g5b" },
> > > +     { .compatible =3D "infineon,xdpe1a2g7b" },
> > > +     {}
> >
> > ... just like here.
> >
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
> > > +
> > > +static struct i2c_driver xdpe1a2g7b_driver =3D {
> > > +     .driver =3D {
> > > +             .name =3D "xdpe1a2g7b",
> > > +             .of_match_table =3D of_match_ptr(xdpe1a2g7b_of_match),
> > > +     },
> > > +     .probe =3D xdpe1a2g7b_probe,
> > > +     .id_table =3D xdpe1a2g7b_id,
> > > +};
> > > +
> > > +module_i2c_driver(xdpe1a2g7b_driver);
> > > +
> > > +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> > > +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_IMPORT_NS("PMBUS");
> >
