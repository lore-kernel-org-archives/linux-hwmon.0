Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B463EBF3C
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771820380; cv=pass; b=pruvQgBA6/L/8tKNK3hjk9g+/BLEa5PAs1LD8xAMJaqD9bfc+Gs/CsfvsR29nZiE4QopRbDTblklXwRCLS06MHhudORKwQ5d9ThY63mOGVU0vBeGY6CemprqQDd+So1tQybyy/qDYby/Z/QvUOx2hjJMRNh7ZLoqORvxw+wrsOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771820380; c=relaxed/simple;
	bh=jM45qqctqlM/VogUUQobRlhVmKJ7riScTexf9ECTyJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GB8QGmqXIq4kmW+NX5lHCqYgQkaoYeDl/5ks8Irf8Pd87W2zNWVT4kjH6kwbdz8BFKTz5WrKMaTm4cahE24Kuq3pyQIuf33PbPETWBhDegcTxMaG43g7lmvi8mjQb16sbGmsMigpb9WJx+MiypEGh0kSTzLOm3oZVqfoD5AH9FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9g2Stpt; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9g2Stpt"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso3784496eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 20:19:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771820378; cv=none;
        d=google.com; s=arc-20240605;
        b=fjHtCYbX2kqD5NRJltqZpr8CMWQuUKLi3dkaoPLjXuUFHRPebIdBraYodOTM00bkcm
         4vtPz//nhZukdaWAbNBaLbVtdl5tHZxBd1cyCm9O3UK1IZpWVRn6jbtFeGvV5TLNi8bN
         jHGwcKWg5xxw+l/MQn2jLwzqUKzdr0WebWo+hPYc6i0SQ7ZyfAuTxQB+qtx6Wuzra6lk
         ey7LjAgyjnhkkQcw2GrF73s+VTaIz4y+qQlqcAHXP/V9KV8mWP6ldA26/ybb1CtlD0bq
         zZmsNTAK4bIL9RQbkNSfX0fL+JWkS2S0YQI2hAwW4IQbSMviCSqyo8LeJJ+SqRxi7W1N
         NA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11waszKOYJgp5VLka4prCG9IJPV9kG1G6r0q3Tip35Q=;
        fh=MyvfBWdFGu+esXUkJF7MOaVSUniUhPC7dhrMjTzPT8A=;
        b=S13tunz1QXtkwkkePy2bkpGD+kUPT5zD6j9EY5Wpp4eMEGHelzATCOUYai83/ygFxV
         A5j86UnBvxejGjPU1+LuyItug832eoEJosZFcekXqpBHJSzEzFQX8vzxjnhv4TdLumQm
         GYTImqaAoqJCmGCfzVvT72qZMfkxdqodSw6hJzUr2vvn/DvxTqvzRgG7Vw7xfQhD+VbU
         DTBVmieU/in2r7WgBBEMivTpFvreDj8dkuWet2bmWbo7Mn70Z2dRxhE2gcYGWy5nvblO
         g8j1hCuImtZndUaWuostVdYqP7QdCArEJ+nPiDd/tx/GHRVaofAAGaQxKxGzl4O/jHeI
         fkkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771820378; x=1772425178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11waszKOYJgp5VLka4prCG9IJPV9kG1G6r0q3Tip35Q=;
        b=K9g2Stpt9Nn5KwT/4o7CmhxIQBPZ3rkPfyw5G2sFIDxosDFPFXK0mAnNlXEKsAAxCm
         Vx/4dPN/VX8aqp4x4pbFY8uMt8vQywbg9Cwq7/JVdJQaV8MOiqSg/Tai0nT8p7MEb9z0
         NHp8byTSRFxFYhxlLNjdimirmrtVm5cqqvw/WyNrKqN+muvN61hm3+asnDqAScriNAIL
         Z/GXuCLUbiTnXmFVBTdRmN9OSMC82QlK22232To1tWVGOB7WcEO/CbvDOWeZUbgkDOpp
         X+KhsDMD3tbUD3Z44z1gBWQ1DvCx/jJrh2wS7Ajcc4CIR3wLvYIKNtjzFafLSCCz08gc
         vN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771820378; x=1772425178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11waszKOYJgp5VLka4prCG9IJPV9kG1G6r0q3Tip35Q=;
        b=Pq79HHoyy6AvNDYf5duMMUp23xL+WOLJdq93B1QcfTJRKiJAfBrfYElaIuQ07bZ9xU
         EupafXnFRcIqr/R1Z/HteHQm3fCvrfl5JQZ7h/XQ22E4mJttPsPksYAoQCrvMcGYxmqU
         QCEzOVcMJslRvnuQTDVbJcx16PDiiZ6hNmBM0m6jseQPEEnJIVCOOI3Vj9xHhHHwP09h
         9qij1fM7ID1YLpRhB7ZVYZ3pqyF3N+uHHMUIm+3uMJiqTKIALbQKDeRSR6Jjd8S5uVv9
         JzQHwUq1TMAj31iDEZi01Oj7J7veclzRGdb+gGVc31Ca3YA5meL/1cNNQGnr66TUnE2x
         Cxmg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Svh1z+it4MQOJc4qtIQmQJgVn5E/frRsE/h6kvTtWFLIebWeVphPSttIWdQxAlF/Rh4yNDq2UCFSWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/thLSJNwpZNRBMvJhigadTKXRaXC6R55jQX7LflYqE+HatxPr
	zvGbZLDGBBV7UkXrII8Xxvl+tf4MpntWr2eA+xiQnAL0XoYat9gC/E/eWQr22k/Ket6KIiZWUl+
	3oIgkO9F9N9ATDTsGfjtt3ehm/EW8Y9c=
X-Gm-Gg: ATEYQzyZ/TrLWlasj38wvVGYiCYuR1Sil5pz+sZGKp7CApqJtJvEjlYz/4fS+ynoJBY
	zu0tej2eQTyRdhjTt+QGZxOISyvrSmreroXggOdwCx/qbH7ZY+Iln/6IK6cJ2CqN0ptbGF21r9b
	ovxk/HLuUJMY5v4P2yNfUWRX/djo2IczqyRYzAcoO0SdwDtQxP5oLYeaRT6vh4xmp/FquPDYc7j
	5Q/KnWag3/kTdmbY7TfkBQpRsFUZFNPsIDp2kwHt61r+YVkgYwEG3+itr8vREZ3KNXOn9Ex4HCq
	BkPOzfgN
X-Received: by 2002:a05:7301:418b:b0:2ba:7f8c:6754 with SMTP id
 5a478bee46e88-2bd7bd99977mr2368355eec.37.1771820377768; Sun, 22 Feb 2026
 20:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
 <20260219105630.11929-4-Ashish.Yadav@infineon.com> <ac930a67-01ee-4c68-a9ed-bf1c321e78f8@roeck-us.net>
In-Reply-To: <ac930a67-01ee-4c68-a9ed-bf1c321e78f8@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 23 Feb 2026 09:49:26 +0530
X-Gm-Features: AaiRm53or6HpeNxz3kI91T36AT-_r8mp8ke7ZIuUmWsOSHUvXEMqN6PH3xMeMns
Message-ID: <CAJKbuCZo9bsHVne4UpPWesAcpBvYqU-ZGSeiXiZ4X8rURRmtcw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hwmon:(pmbus/xdpe1a2g7b) Add support for
 xdpe1a2g5b/7b controllers
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for your time and feedback.
Please find my response inline.

With Best Regards,
    Ashish Yadav


On Sun, Feb 22, 2026 at 4:52=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 2/19/26 02:56, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> > XDPE1A2G7B controllers.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> > XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID Data
> > formats for VOUT_MODE.
> > The configuring both loops/pages of the device independently is not
> > supported for VOUT_MODE.
> > In case of vid mode, NVIDIA PWM VID vrm_version is supported:
> > Vout =3D 5mV * (VID-1) + 195mV
> > ---
> >   drivers/hwmon/pmbus/Kconfig      |   9 +++
> >   drivers/hwmon/pmbus/Makefile     |   1 +
> >   drivers/hwmon/pmbus/xdpe1a2g7b.c | 120 ++++++++++++++++++++++++++++++=
+
> >   3 files changed, 130 insertions(+)
> >   create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index fc1273abe357..a4513fc6bc26 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -711,6 +711,15 @@ config SENSORS_XDPE152
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
> > index d6c86924f887..d592d8c77bec 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_UCD9200)       +=3D ucd9200.o
> >   obj-$(CONFIG_SENSORS_XDP710)        +=3D xdp710.o
> >   obj-$(CONFIG_SENSORS_XDPE122)       +=3D xdpe12284.o
> >   obj-$(CONFIG_SENSORS_XDPE152)       +=3D xdpe152c4.o
> > +obj-$(CONFIG_SENSORS_XDPE1A2G7B)     +=3D xdpe1a2g7b.o
> >   obj-$(CONFIG_SENSORS_ZL6100)        +=3D zl6100.o
> >   obj-$(CONFIG_SENSORS_PIM4328)       +=3D pim4328.o
> >   obj-$(CONFIG_SENSORS_CRPS)  +=3D crps.o
> > diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdp=
e1a2g7b.c
> > new file mode 100644
> > index 000000000000..e10bafeb0984
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> > @@ -0,0 +1,120 @@
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
> > +     int vout_mode;
> > +
> > +     /*
> > +      * XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM V=
ID data
> > +      * formats via VOUT_MODE. Note that the device pages/loops are no=
t fully
> > +      * independent: configuration is shared, so programming each page=
/loop
> > +      * separately is not supported for VOUT_MODE.
> > +      */
> > +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > +     if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
>
> "vout_mode !=3D 0xff only makes sense in generic code, where it is possib=
le
> that the command is not properly implemented. It does not make sense
> in a device specific driver: Either the command is implemented and return=
s
> a useful value, or it is not implemented. So this code should simply be
>
>         if (vout_mode < 0)
>                 return vout_mode;
>
>         switch (vout_mode >> 5) {
>         ...
>
> If the controller is really so unstable that it returns 0xff once
> in a while, a respective comment would be needed in the code. However,
> even then, I would suggest something like
>
>         if (vout_mode < 0)
>                 return vout_mode;
>
>         /* Explain instability */
>         if (vout_mode =3D=3D 0xff)
>                 return -ENODEV;
>
>         switch (vout_mode >> 5) {
>         ...
>
> i.e., error handling first.
  The chip and command are stable, so I will proceed with making the
necessary changes as suggested by you.

> If the concern is that this isn't really one of the chips supported by th=
e driver,
> I would suggest to implement chip detection code either in the identify
> function or better in the probe function. If that is the case, the return=
 value
> from PMBUS_VOUT_MODE isn't useful anyway.
>
> Thanks,
> Guenter
>
