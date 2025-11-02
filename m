Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5ED1F5617
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762108646; cv=none; b=ghpFmQrjCR9Kcv5bfUpKo/8MZUSVx9/ruBoVQrwJLNiFh+WCgcsp6P0WuQQ6k66tZVqxgJzPUP0f4b2/Kxkrxv6mWJ/eW6mMR8zy/4ybTKo787SgLvQjC22WGjqMGnIUC3bS9PX3t3x7d3mizwfVrf80fcjMtFJkVvSHCbSPxiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762108646; c=relaxed/simple;
	bh=SuE3Gv/yIOEnF9fqwhmPYHBzcE91dU1Pdju3o8CkYiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7h7NjYwjNiad5ecyI/J/fHQlDgsjxvPd6uhBLWi4nPNZklAAz5vuxJUca33yrHqkcCJ6Kr6W/529TxxGzx4rbd8GUEZHuurtx3S+P8VO8fgqShbxqJUwAsF77vwMp7HYaiLeYTOI1eZwP92iNjN/NwbEVCQN9Szf9yxKqmanQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ju8W3UOY; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ju8W3UOY"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 3845DC2A38
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 20:37:14 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 7BD19C2A3B
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 20:37:13 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AA6631FE109
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 20:37:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762108633;
	bh=NOgzqFx8JRgOccUBwmC58US8a1+LHyG3mnsCw+kUdHE=;
	h=Received:From:Subject:To;
	b=ju8W3UOY59IQu2tSDK5pT1ByHX3T7/m1WE6VH7OI7cTP2Mt+AXqF1C5amFkYANn6P
	 7jQ7Vo0PW8THBCzBnUhxmxpxyBD9wgxEWZCVsA5LhGx5unTOUVx1xPyHcOIELq+Bgo
	 5C6ceIfXFz3g4NvUh3u3ZnsObRAlEVc8wYEVH+FmMhEpvXp9oz3m/pCt5IFeaSFcPo
	 iPyUA81Z2bRg1TqG8X8N+7EKP1AOJtPhp354EkcM1JmDEAPX2/QKycnrhlVuT43MVR
	 5y6OoEW/m6AnJwdU6N4rQU/XenDz30+1Q9kX0dN0BNehCg48eT6chP3nqAK3RWZcpV
	 ylFOcWYAikSHw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-378ccb8f84aso40821191fa.3
        for <linux-hwmon@vger.kernel.org>;
 Sun, 02 Nov 2025 10:37:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUsx8YKTErno9dVkO88S9ZL8teWs+f2RptNuqZ7WHG+HHsevU7s/iYFnYrCiXOdzedcjDaYOOpelpArQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/nZuf1cVQffE12SRmKNgXTxWFv8DzQfkf++YfIFWsC639KbD
	245c7P1iHmGkU4ZbiuJYKsdA6HcJg6CePpudgVB4lmy/4jesupPBdz19sE1Kc7FQ4cDUsHB2FzO
	+7uLV79D8FMkCPRQpXog5xBrG3FmPPJ8=
X-Google-Smtp-Source: 
 AGHT+IGPz2iCydBPDfw3p/Vyg3+eP7aBxJr67ETVsPrwxRVDZtmw4zwU4Q/asy+6lCm5M5SAKCcTI8x/j2rOdaAAbgY=
X-Received: by 2002:a2e:be0b:0:b0:37a:3963:cec7 with SMTP id
 38308e7fff4ca-37a3963d86cmr446801fa.26.1762108632034; Sun, 02 Nov 2025
 10:37:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031163651.1465981-1-lkml@antheas.dev>
 <20251031163651.1465981-2-lkml@antheas.dev>
 <eb7a2631-eed0-4a91-81ff-a2efcb70ad29@gmx.de>
In-Reply-To: <eb7a2631-eed0-4a91-81ff-a2efcb70ad29@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 2 Nov 2025 19:37:00 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGO=sZjGro7NaKH=zC4x_GR8H7kaPSn8NP60H7EZ4s3+g@mail.gmail.com>
X-Gm-Features: AWmQ_blJyGsSJilsGGGbsYxTkkzNSHVAeZIiRKK1Es7tLcRroZVWIAh70dC9R3o
Message-ID: 
 <CAGwozwGO=sZjGro7NaKH=zC4x_GR8H7kaPSn8NP60H7EZ4s3+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176210863293.1937767.11639750542800210589@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 2 Nov 2025 at 19:21, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 31.10.25 um 17:36 schrieb Antheas Kapenekakis:
>
> > Recent Ayaneo devices feature an ACPI mapped Embedded Controller (EC)
> > with standard addresses across models that provides access to fan
> > speed, fan control, battery charge limits, and controller power
> > controls. Introduce a new driver stub that will handle these driver
> > features.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   MAINTAINERS                      |  6 +++
> >   drivers/platform/x86/Kconfig     |  9 ++++
> >   drivers/platform/x86/Makefile    |  3 ++
> >   drivers/platform/x86/ayaneo-ec.c | 90 ++++++++++++++++++++++++++++++++
> >   4 files changed, 108 insertions(+)
> >   create mode 100644 drivers/platform/x86/ayaneo-ec.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 545a4776795e..da9498d8cc89 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4187,6 +4187,12 @@ W:     https://ez.analog.com/linux-software-drivers
> >   F:  Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
> >   F:  drivers/pwm/pwm-axi-pwmgen.c
> >
> > +AYANEO PLATFORM EC DRIVER
> > +M:   Antheas Kapenekakis <lkml@antheas.dev>
> > +L:   platform-driver-x86@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/platform/x86/ayaneo-ec.c
> > +
> >   AZ6007 DVB DRIVER
> >   M:  Mauro Carvalho Chehab <mchehab@kernel.org>
> >   L:  linux-media@vger.kernel.org
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 46e62feeda3c..ebe7d2ab8758 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -316,6 +316,15 @@ config ASUS_TF103C_DOCK
> >         If you have an Asus TF103C tablet say Y or M here, for a generic x86
> >         distro config say M here.
> >
> > +config AYANEO_EC
> > +     tristate "Ayaneo EC platform control"
> > +     help
> > +       Enables support for the platform EC of Ayaneo devices. This
> > +       includes fan control, fan speed, charge limit, magic
> > +       module detection, and controller power control.
> > +
> > +       If you have an Ayaneo device, say Y or M here.
> > +
> >   config MERAKI_MX100
> >       tristate "Cisco Meraki MX100 Platform Driver"
> >       depends on GPIOLIB
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index c7db2a88c11a..274a685eb92d 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_TF103C_DOCK)      += asus-tf103c-dock.o
> >   obj-$(CONFIG_EEEPC_LAPTOP)  += eeepc-laptop.o
> >   obj-$(CONFIG_EEEPC_WMI)             += eeepc-wmi.o
> >
> > +# Ayaneo
> > +obj-$(CONFIG_AYANEO_EC)              += ayaneo-ec.o
> > +
> >   # Cisco/Meraki
> >   obj-$(CONFIG_MERAKI_MX100)  += meraki-mx100.o
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > new file mode 100644
> > index 000000000000..2fe66c8a89f4
> > --- /dev/null
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Platform driver for the Embedded Controller (EC) of Ayaneo devices. Handles
> > + * hwmon (fan speed, fan control), battery charge limits, and magic module
> > + * control (connected modules, controller disconnection).
> > + *
> > + * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
> > + */
> > +
> > +#include <linux/dmi.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +struct ayaneo_ec_quirk {
> > +};
> > +
> > +struct ayaneo_ec_platform_data {
> > +     struct platform_device *pdev;
> > +     struct ayaneo_ec_quirk *quirks;
> > +};
> > +
> > +static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
> > +};
> > +
> > +static const struct dmi_system_id dmi_table[] = {
> > +     {
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> > +             },
> > +             .driver_data = (void *)&quirk_ayaneo3,
> > +     },
> > +     {},
> > +};
>
> MODULE_DEVICE_TABLE() is missing, please add it so that the driver will
> automatically load on supported devices.

It is not. See below.

> > +
> > +static int ayaneo_ec_probe(struct platform_device *pdev)
> > +{
> > +     const struct dmi_system_id *dmi_entry;
> > +     struct ayaneo_ec_platform_data *data;
> > +
> > +     dmi_entry = dmi_first_match(dmi_table);
> > +     if (!dmi_entry)
> > +             return -ENODEV;
>
> Please store the quirk inside a global variable and perform the DMI match
> inside ayaneo_ec_init. This will allow you to mark the DMI table as __initconst.

This driver was designed to not need a global quirk variable, which
required a lot of additional work (the drvdata structure) . I am not
re-adding it as a workaround for __initconst.

Adding init to probe emits a warning because there is a dangling
reference to it.

> Thanks,
> Armin Wolf
>
> > +
> > +     data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->pdev = pdev;
> > +     data->quirks = dmi_entry->driver_data;
> > +     platform_set_drvdata(pdev, data);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver ayaneo_platform_driver = {
> > +     .driver = {
> > +             .name = "ayaneo-ec",
> > +     },
> > +     .probe = ayaneo_ec_probe,
> > +};
> > +
> > +static struct platform_device *ayaneo_platform_device;
> > +
> > +static int __init ayaneo_ec_init(void)
> > +{
> > +     ayaneo_platform_device =
> > +             platform_create_bundle(&ayaneo_platform_driver,
> > +                                    ayaneo_ec_probe, NULL, 0, NULL, 0);
> > +
> > +     return PTR_ERR_OR_ZERO(ayaneo_platform_device);
> > +}
> > +
> > +static void __exit ayaneo_ec_exit(void)
> > +{
> > +     platform_device_unregister(ayaneo_platform_device);
> > +     platform_driver_unregister(&ayaneo_platform_driver);
> > +}
> > +
> > +MODULE_DEVICE_TABLE(dmi, dmi_table);

Here

> > +
> > +module_init(ayaneo_ec_init);
> > +module_exit(ayaneo_ec_exit);
> > +
> > +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> > +MODULE_DESCRIPTION("Ayaneo Embedded Controller (EC) platform features");
> > +MODULE_LICENSE("GPL");
>

