Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20442236F0
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Feb 2026 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771221058; cv=pass; b=KTTUVf5Ke8IiYlUAo39I3I1vw4SycLdI/hqzyNTh6M54UYtfjAyfl+3DvnZnpApTqx8A0cFvLhidIT7hvh1HR7AaTy53Awi0rqS1BWqs5+zX359vRaqufZgt29TpVwujqpRqabtZ3bfqm6Ky+kSypmik5AS2u7J5pi/4yhp87KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771221058; c=relaxed/simple;
	bh=8N6sHoUocgLKylL6+OeyZy0DKP5s3E1uVeGhaLvbgQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2le7zezNLTZEnwZ8KTYEKS9A2oOJFqTcK+fCyeT6tozKWx+hQ3fY7rKuSD7pkDCiKM3eDsc+r42exS6If3YM/I/ScpztrTRTqdfbQZ+fdKUHN7FLJinU1Nb6TjzKRbxsS+U2QCpLkXjCuzpm/5kLHj1UDAyLo1tymXYGESG2kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmJaFS1H; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmJaFS1H"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2923082eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 21:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771221056; cv=none;
        d=google.com; s=arc-20240605;
        b=ER7Pa015ahCYdr6mKVmzWyQxvsZggNFNoAZOHkU+1q/5bU6yN9fqnMZzCC7k07/h8+
         FIC6ollZQ/Ckvbd+3b76jFZGLddfcAzEORw2AdWDWwRpz9NqKYpT1JPI3hSE8pIrP65j
         cbjRa/wVxrl7n54RMqichY5pP8pkIgXif0nCK90eV7BRYF09MeEsGQau2qAsOA+4CLKn
         d6FRFGAIkR/AOOlrrUU45w2dzLIK/lkBcYLxrOM9osR4NxuW1vdqGCx45+GaR7tuw4K7
         l8EieK3aDlo+DE9BzUzXMaqXyMlKqgjS4XlHfobRws7GCGsxaK7/cftA4w0kXTeFhx5k
         RzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fm+iCKNQvKaZ2VySunGW9Kgo/WZL9LMB8aA7YGMIP0U=;
        fh=J05Uzz7HcafeTZQxziVXyync1C3XAElnA1md6NAbDAU=;
        b=Yu6LosEQfMWdbjpkB7rvaCdOHWMfJVpiGq5SB09l3XFZz6gL390ZbniPs6hecgHor+
         c4VskRItFJey5hFwuheWx5kI5BKN1n4R5kVoPGq/xLJbM/UkMR5p2V8WP2nyUxQtDQv7
         wcvWxwxXhrQo8PMWLa/R2a4rNANG2V8qXwQJ4poY2iM9T4hWu57XuV8+NXOLAhgImK4b
         q3yC3VkeM2Q759mNHh+3e5UapZSmXKqcRKWa/em+1v2SrGilLTt+RBmJQS+yRW/WgQFP
         Le16qgOekhh3J8eMEVHDER1CZTqT1LVMesO3A92iSbCTrfCEmkGLBIBNW+EWatV0zPCB
         raWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771221056; x=1771825856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm+iCKNQvKaZ2VySunGW9Kgo/WZL9LMB8aA7YGMIP0U=;
        b=XmJaFS1HQaIbR6fCFwJaSlrcBmwTda76LyzeCvmkLJxW4LlUrxQ7DHV7HzQqrgJz/7
         JERZUafCKOaKDZlJsSQ/nOiiYP7z34UWWFIr7WnWyVWYDKXHR/tl8C8KXvSE35IEniQU
         44xlGyZZEsttTA0Is4njzITiY10a/HwphgwAjPmKDYyFEZuDK6P2lEqqMMxYVo0k187A
         yRDQQm7zrFcPZ0MhF+hvdHjYj2/iOAVw//O0kpFeuW/85+th5ChBt72Knl0AUciH5onX
         v80ImPW/PhQfM1MhWjq4MOO1rK82fzm49e3Vng0JSs7gYk+v2uL6bZHFZnF0DcV1HxMH
         /+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771221056; x=1771825856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fm+iCKNQvKaZ2VySunGW9Kgo/WZL9LMB8aA7YGMIP0U=;
        b=wtG14eRDWPXelNQbDb7bvBJXr3Y0xJ7KCrM9/Ode5g/g8y2QJtUIzliF3K0OR5Wcjc
         /lfrfU/XWg9/OuoN8o9zGbNaWmrdQIy4F7ve8nDh/ipldMIh2BnfKhuBrT7o5z0u22OI
         U2ZcXANJECQhEKiWNcHfUT7pB+8uZBWN3Po1hJfSP8Gn1XmDQLLU00Xp7qfI8cy+5hvG
         XIycU4lGesQC4BxCO5Sp0m/Or40moffjOmd7+rMxi9t+5X9m5p9W3qSVMohkMH8R0NUV
         CGRCM1gqBtR23BsA1+e0EfrvSfS+b8BaXg8i8w3KEcZRMgnn5VA9h62bh3k2JNWzMo6k
         bsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5YxwvPe+TMr7s52BuAWFDKi1JAv7ZL04PV9l7jhq2do1E4ydnJn1STC9/S92VbmRE0QYzfLSzGHiyYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygK8XVjas+FGaZ8OvIcm2qUOK8kW11r7YOMcLsi8PROP4k+DUX
	kOlfSyoG+bS1DuTLOpiqdp4nrc3A6JDqS1JtCij74t/EfmkANR9qE2Qhxh4+IWKnR8KfT4CK/QY
	VeJVTfvL07v+lL/H7i7OMTyNQCfwNONk=
X-Gm-Gg: AZuq6aIh9hlSWJ2wGXAVwvqT4rNnMWl7Wk6O0uqEneEvbiz5xvXBiz4YrMgXU5hQL33
	MuK4Ln81TttmxmfyHk+cBp0E/MffsxsyIcFtBuq2Fj+7SvGES6wggBENUhoexYwIxBZZ2sJgt0y
	0DtkcmdC9rlKQbRvkIQnPj+szbWkWE3cxOdCMY5A865OVceNQiCbvBf77ZskaIxttoNC1NltWwL
	MKBJbgmVNUDYU2raUBNLebivCFdxerugM+x3+SogMglSNWs7NGHfySekxdbLRUnMq5wd5UtFKeg
	U0sT4ThJ
X-Received: by 2002:a05:7301:1f0a:b0:2ba:673b:e32f with SMTP id
 5a478bee46e88-2baba131414mr3382395eec.37.1771221055619; Sun, 15 Feb 2026
 21:50:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
 <20260202080355.53061-3-Ashish.Yadav@infineon.com> <d0854014-7977-48b9-bf31-d66865352ecf@roeck-us.net>
 <CAJKbuCan+5AMuGuqKg4V1qs5HYZQ9zgS9S1rDDJ1usjJAjEGqw@mail.gmail.com>
 <CAJKbuCavMxc7xc4-QW95NfCaUCbLZck5nP1+iMtVxOt4LZ5esg@mail.gmail.com> <4b1ab525-8a60-4980-90f4-c7a761cf1536@roeck-us.net>
In-Reply-To: <4b1ab525-8a60-4980-90f4-c7a761cf1536@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 16 Feb 2026 11:20:44 +0530
X-Gm-Features: AaiRm5288nLu9mJ4orvRIVndJnOlsgp8dWXuttdqasyv_7wYbQqB8CePLfLWmcI
Message-ID: <CAJKbuCYuTyu87Q+NY4yAE48xmfayG9Bkq7hqo5TJe01M6G01UA@mail.gmail.com>
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

I hope you are doing well.

Please find our response inline.

With Best Regards,
 Ashish Yadav

On Fri, Feb 13, 2026 at 10:28=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 2/12/26 19:45, ashish yadav wrote:
> > Hi Guenter,
> >
> > I hope this email finds you well.
> >
> > I am reaching out to request your assistance with a specific inquiry
> > regarding the handling of loops/pages for different VOUT modes
> > independently.
> > The challenge I am facing is that the Linux kernel provides a single
> > "PSC_VOLTAGE_OUT" for the chip, which is not page-specific, making it
> > difficult to handle these different modes independently.
> >
> > I would greatly appreciate it if you could provide me with more
> > information or guidance on how to address this issue, as your
> > expertise in this area would be invaluable in helping me find a
> > solution.
> >
>
> Best idea I have at this point is to announce a single mode for all pages
> and convert values for pages with other modes. We _could_ enhance the pmb=
us
> code to support per-page modes, but that only makes sense if more than a
> single chip is affected and if this is a real problem.
>
> Practical question is if the chip supports this. So far I have not encoun=
tered
> a chip which does. Unfortunately Infineon doesn't provide datasheets for =
these
> chips, so it is impossible for me to determine if this is a real or a the=
oretic
> problem.
>
> Guenter

After discussing with the concerned Infineon team, We have decided to
move forward with the following approach:
XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID Data
formats for VOUT_MODE.

The configuration options for both devices will be as follows:
1.  Both Page 0 and Page 1 can be set to Linear
2.  Both Page 0 and Page 1 can be set to VID (NVIDIA format)

Important Note:
Please note that configuring both loops/pages of the device
independently is not possible.
The following combinations are not supported:
  1. Page 0: Linear, Page 1: VID
  2. Page 0: VID, Page 1: Linear

I will document these details in the next version of the patch.


> > With Best Regards,
> >    Ashish Yadav
> >
> >
> > On Thu, Feb 5, 2026 at 2:20=E2=80=AFPM ashish yadav <ashishyadav78@gmai=
l.com> wrote:
> >>
> >> Hi Guenter,
> >>
> >> Thank you for taking the time to review and provide feedback.
> >> I appreciate your input and insights.
> >> Please find my comments inline below.
> >>
> >> Best regards,
> >> Ashish Yadav
> >>
> >> On Mon, Feb 2, 2026 at 9:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>>
> >>> On 2/2/26 00:03, ASHISH YADAV wrote:
> >>>> From: Ashish Yadav <ashish.yadav@infineon.com>
> >>>>
> >>>> Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> >>>> XDPE1A2G7B controllers.
> >>>>
> >>>> XDPE1A2G5B controller supports Linear Data format for VOUT using VOU=
T_MODE
> >>>> command.
> >>>> XDPE1A2G7B controller supports Linear and VID Data format for VOUT u=
sing
> >>>> VOUT_MODE command.
> >>>>
> >>>> In case of vid mode in XDPE1A2G7B controller, NVIDIA PWM VID vrm_ver=
sion
> >>>> is supported:
> >>>> Vout =3D 5mV * (VID-1) + 195mV
> >>>>
> >>>> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> >>>> ---
> >>>>    drivers/hwmon/pmbus/Kconfig      |   9 +++
> >>>>    drivers/hwmon/pmbus/Makefile     |   1 +
> >>>>    drivers/hwmon/pmbus/pmbus.h      |   2 +-
> >>>>    drivers/hwmon/pmbus/pmbus_core.c |   4 ++
> >>>>    drivers/hwmon/pmbus/xdpe1a2g7b.c | 115 ++++++++++++++++++++++++++=
+++++
> >>>
> >>> Driver documentation missing.
> >>>
> >>     ACK, We will take care of this in the next release.
> >>
> >>>>    5 files changed, 130 insertions(+), 1 deletion(-)
> >>>>    create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> >>>>
> >>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconf=
ig
> >>>> index f3fb94cebf1a..c6750bce446d 100644
> >>>> --- a/drivers/hwmon/pmbus/Kconfig
> >>>> +++ b/drivers/hwmon/pmbus/Kconfig
> >>>> @@ -684,6 +684,15 @@ config SENSORS_XDPE152
> >>>>          This driver can also be built as a module. If so, the modul=
e will
> >>>>          be called xdpe152c4.
> >>>>
> >>>> +config SENSORS_XDPE1A2G7B
> >>>> +     tristate "Infineon XDPE1A2G7B"
> >>>> +     help
> >>>> +       If you say yes here you get hardware monitoring support for =
Infineon
> >>>> +       XDPE1A2G5B and XDPE1A2G7B.
> >>>> +
> >>>> +       This driver can also be built as a module. If so, the module=
 will
> >>>> +       be called xdpe1a2g7b.
> >>>> +
> >>>>    config SENSORS_XDPE122
> >>>>        tristate "Infineon XDPE122 family"
> >>>>        help
> >>>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Make=
file
> >>>> index 349a89b6d92e..620f24baa289 100644
> >>>> --- a/drivers/hwmon/pmbus/Makefile
> >>>> +++ b/drivers/hwmon/pmbus/Makefile
> >>>> @@ -67,6 +67,7 @@ obj-$(CONFIG_SENSORS_UCD9200)       +=3D ucd9200.o
> >>>>    obj-$(CONFIG_SENSORS_XDP710)        +=3D xdp710.o
> >>>>    obj-$(CONFIG_SENSORS_XDPE122)       +=3D xdpe12284.o
> >>>>    obj-$(CONFIG_SENSORS_XDPE152)       +=3D xdpe152c4.o
> >>>> +obj-$(CONFIG_SENSORS_XDPE1A2G7B)     +=3D xdpe1a2g7b.o
> >>>>    obj-$(CONFIG_SENSORS_ZL6100)        +=3D zl6100.o
> >>>>    obj-$(CONFIG_SENSORS_PIM4328)       +=3D pim4328.o
> >>>>    obj-$(CONFIG_SENSORS_CRPS)  +=3D crps.o
> >>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus=
.h
> >>>> index d2e9bfb5320f..3ddcb742d289 100644
> >>>> --- a/drivers/hwmon/pmbus/pmbus.h
> >>>> +++ b/drivers/hwmon/pmbus/pmbus.h
> >>>> @@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
> >>>>    #define PMBUS_PAGE_VIRTUAL  BIT(31) /* Page is virtual */
> >>>>
> >>>>    enum pmbus_data_format { linear =3D 0, ieee754, direct, vid };
> >>>> -enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd625mv };
> >>>> +enum vrm_version { vr11 =3D 0, vr12, vr13, imvp9, amd625mv, nvidia1=
95mv };
> >>>>
> >>>>    /* PMBus revision identifiers */
> >>>>    #define PMBUS_REV_10 0x00   /* PMBus revision 1.0 */
> >>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/=
pmbus_core.c
> >>>> index be6d05def115..4d7634ee6148 100644
> >>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
> >>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> >>>> @@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data=
 *data,
> >>>>                if (val >=3D 0x0 && val <=3D 0xd8)
> >>>>                        rv =3D DIV_ROUND_CLOSEST(155000 - val * 625, =
100);
> >>>>                break;
> >>>> +     case nvidia195mv:
> >>>> +             if (val >=3D 0x01)
> >>>> +                     rv =3D 195 + (val - 1) * 5;  /* VID step is 5m=
v */
> >>>> +             break;
> >>>>        }
> >>>>        return rv;
> >>>>    }
> >>>
> >>> The core change needs to be a separate patch.
> >>>
> >> ACK, We will take care of this in the next release.
> >>
> >>>> diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/=
xdpe1a2g7b.c
> >>>> new file mode 100644
> >>>> index 000000000000..79b12b56e7b6
> >>>> --- /dev/null
> >>>> +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> >>>> @@ -0,0 +1,115 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0+
> >>>> +/*
> >>>> + * Hardware monitoring driver for Infineon Multi-phase Digital XDPE=
1A2G5B
> >>>> + * and XDPE1A2G7B Controllers
> >>>> + *
> >>>> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> >>>> + */
> >>>> +
> >>>> +#include <linux/err.h>
> >>>> +#include <linux/i2c.h>
> >>>> +#include <linux/init.h>
> >>>> +#include <linux/kernel.h>
> >>>> +#include <linux/module.h>
> >>>> +#include "pmbus.h"
> >>>> +
> >>>> +#define XDPE1A2G7B_PAGE_NUM 2
> >>>> +#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID ste=
p is 5mV */
> >>>> +
> >>>> +static int xdpe1a2g7b_identify(struct i2c_client *client,
> >>>> +                            struct pmbus_driver_info *info)
> >>>> +{
> >>>> +     u8 vout_params;
> >>>> +     int i, ret, vout_mode;
> >>>> +
> >>>> +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE)=
;
> >>>> +     if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
> >>>
> >>> What if vout_mode < 0 ? Also, what if the mode is different for page =
1 ?
> >>
> >> ACK, We will take care of this in the next release.
> >>
> >>> Also, if I understand patch 0 correctly, executing this function is n=
ot needed
> >>> for XDPE1A2G5B.
> >>>
> >> ACK, We will take care of this in the next release.
> >>
> >>>> +             switch (vout_mode >> 5) {
> >>>> +             case 0:
> >>>> +                     info->format[PSC_VOLTAGE_OUT] =3D linear;
> >>>> +                     return 0;
> >>>> +             case 1:
> >>>> +                     info->format[PSC_VOLTAGE_OUT] =3D vid;
> >>>> +                     break;
> >>>> +             default:
> >>>> +                     return -ENODEV;
> >>>> +             }
> >>>> +     }
> >>>> +
> >>>> +     for (i =3D 0; i < info->pages; i++) {
> >>>> +             /* Read the VOUT_MODE register for VID Code Type. */
> >>>> +             ret =3D pmbus_read_byte_data(client, i, PMBUS_VOUT_MOD=
E);
> >>>
> >>> Given that there are only two pages, reading PMBUS_VOUT_MODE for
> >>> page 0 twice is a bit of a waste. On top of that, the need for the lo=
op
> >>> suggests that the mode can be different across pages. That needs to b=
e
> >>> supported: Bailing out in that case is not acceptable. Worse:
> >>> What if the mode is linear on page 0 but vid on page 1 ?
> >>>
> >> ACK, We will take care of this in the next release.
> >>
> >>>> +             if (ret < 0)
> >>>> +                     return ret;
> >>>> +
> >>>> +             vout_params =3D ret & GENMASK(4, 0);
> >>>> +             switch (vout_params) {
> >>>> +             case XDPE1A2G7B_NVIDIA_195MV:
> >>>> +                     info->vrm_version[i] =3D nvidia195mv;
> >>>> +                     break;
> >>>> +             default:
> >>>> +                     return -EINVAL;
> >>>
> >>> This warrants an error message and an explanation (comment) why other=
 modes
> >>> are not supported by the driver. The detailed datasheet is not public=
, so
> >>> you'll have to help out here. As mentioned above, bailing out because=
 the
> >>> mode on page 1 is linear is not acceptable.
> >>>
> >> ACK, we will provide comments in the next release.
> >> Additionally, please note that the XDPE1A2G7B Controller only supports
> >> the 'nvidia195mv' vrm_version in the VID Data format for VOUT.
> >> We will ensure that this limitation is properly documented and
> >> commented on in the next release.
> >>
> >>>> +             }
> >>>> +     }
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static struct pmbus_driver_info xdpe1a2g7b_info =3D {
> >>>> +     .pages =3D XDPE1A2G7B_PAGE_NUM,
> >>>> +     .identify =3D xdpe1a2g7b_identify,
> >>>> +     .format[PSC_VOLTAGE_IN] =3D linear,
> >>>> +     .format[PSC_TEMPERATURE] =3D linear,
> >>>> +     .format[PSC_CURRENT_IN] =3D linear,
> >>>> +     .format[PSC_CURRENT_OUT] =3D linear,
> >>>> +     .format[PSC_POWER] =3D linear,
> >>>> +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STA=
TUS_VOUT |
> >>>> +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATU=
S_IOUT |
> >>>> +                PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STA=
TUS_TEMP |
> >>>> +                PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATU=
S_INPUT,
> >>>> +     .func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STA=
TUS_VOUT |
> >>>> +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATU=
S_IOUT |
> >>>> +                PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATU=
S_INPUT,
> >>>> +};
> >>>> +
> >>>> +static int xdpe1a2g7b_probe(struct i2c_client *client)
> >>>> +{
> >>>> +     struct pmbus_driver_info *info;
> >>>> +
> >>>> +     info =3D devm_kmemdup(&client->dev, &xdpe1a2g7b_info, sizeof(*=
info),
> >>>> +                         GFP_KERNEL);
> >>>> +     if (!info)
> >>>> +             return -ENOMEM;
> >>>> +
> >>>> +     return pmbus_do_probe(client, info);
> >>>> +}
> >>>> +
> >>>> +static const struct i2c_device_id xdpe1a2g7b_id[] =3D { { "xdpe1a2g=
5b" },
> >>>> +                                                   { "xdpe1a2g7b" }=
,
> >>>> +                                                   {} };
> >>>
> >>> Please use more lines and less indentation.
> >>>
> >> ACK, We will take care of this in the next release.
> >>
> >>>> +
> >>>> +MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
> >>>> +
> >>>> +static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match=
[] =3D {
> >>>> +     { .compatible =3D "infineon,xdpe1a2g5b" },
> >>>> +     { .compatible =3D "infineon,xdpe1a2g7b" },
> >>>> +     {}
> >>>
> >>> ... just like here.
> >>>
> >>>> +};
> >>>> +
> >>>> +MODULE_DEVICE_TABLE(of, xdpe1a2g7b_of_match);
> >>>> +
> >>>> +static struct i2c_driver xdpe1a2g7b_driver =3D {
> >>>> +     .driver =3D {
> >>>> +             .name =3D "xdpe1a2g7b",
> >>>> +             .of_match_table =3D of_match_ptr(xdpe1a2g7b_of_match),
> >>>> +     },
> >>>> +     .probe =3D xdpe1a2g7b_probe,
> >>>> +     .id_table =3D xdpe1a2g7b_id,
> >>>> +};
> >>>> +
> >>>> +module_i2c_driver(xdpe1a2g7b_driver);
> >>>> +
> >>>> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> >>>> +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
> >>>> +MODULE_LICENSE("GPL");
> >>>> +MODULE_IMPORT_NS("PMBUS");
> >>>
>
