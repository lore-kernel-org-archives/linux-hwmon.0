Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02143C1F;
	Sun, 16 Nov 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763308964; cv=none; b=oUuvOBIZcNPxxev3M+a+LTaBEH8mP1UNw3Q9qGvTEW6TgIChbt5SNq1g1WDnbsROH3HcAjV2Lsx/4dc/+Xn/2SDP8or7puXHbO4WwA3OqsZHe5q+q8bU4E4u0iPa2NUjvTSNhVgBHTmt3pPvyPTMIm8KaXQTdeHRzAJsc5e7OWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763308964; c=relaxed/simple;
	bh=DMwaOqkSTb4TL0rCNRqMeiD8CEtH2IzE6dJiibZWj74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joy6BFzEJVrhI+tzUgNh1r9eprIEgW+0Y0h7ji8eD0mI9VQssW20StCWgR/XYbBprCg9hKeQG6CXtAQzgZ5mr6N4RHUa0R/w+EZq+mw9/PQAyNVBAuNJbBaAwcmq53X9ETETj00mysMOX/iMjkGP1c03qYPCXuCJRfOIXe0Gxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nw81EhKG; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nw81EhKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763308934; x=1763913734; i=w_armin@gmx.de;
	bh=rVIYDFYsneJPl+XSjGSbLnO/IH0bHEbQt4ILyIdQMh8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nw81EhKGovoqkQfSyYEyBwxy2qzPE0a8ote02Jv8uqGiN4fxTgtujN0wr7gyisSA
	 eDVbyYF97gUu7whhriqn29m0hFzMhAWsR8aKaCZ99nvl+MfskBeamnn40ixOqxnO9
	 wW1X3It+LLXfRRO3hm50gOlExq8y1tBHPrfCPF4JRd6mTZeqjfUY7uo+jv5FtpxHW
	 SuOsOayf1Y/Hr5oCMrrU95+aa/sysB2j42aChFnE3evymZMbBJG/83xMz0VLdHnKr
	 WZvqYuEsV6axQSrHAUd8RY+awB2Bwhw5oXQeBuTWlZepiiCIdorvaqlpSOIuz55wr
	 YlOHGF7aNMo33TuEKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1w4vCo48OB-0141t1; Sun, 16
 Nov 2025 17:02:14 +0100
Message-ID: <e4651da4-60e0-41d5-94aa-a53b44be5901@gmx.de>
Date: Sun, 16 Nov 2025 17:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-2-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251113212221.456875-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/U3WgmB5PKbaGQ2qMFjwBsoAf/05cy+hA7Jg0YyLKTGNNTlVv0t
 /lzf95jeQm81NDQy6cZm5XI0yeudHy5moLDXaamXGA4r4KEy8XqQlooFoxhuLzHL5izM7b8
 2hmsiYwjFZ0rQZEojsmJ7tA4KtYEbpI9JdNdqEh5/BEU/DOsN5RdZbck63p6Kz2a3Qiyftm
 MKowdLJWKqnuDgMJJ4DTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dQNlROTUZWA=;8iQEwEPivniFsq7WK4Dukcj3477
 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
 mwnIw9PE=

Am 13.11.25 um 22:22 schrieb Antheas Kapenekakis:

> Recent Ayaneo devices feature an ACPI mapped Embedded Controller (EC)
> with standard addresses across models that provides access to fan
> speed, fan control, battery charge limits, and controller power
> controls. Introduce a new driver stub that will handle these driver
> features.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   MAINTAINERS                      |  6 +++
>   drivers/platform/x86/Kconfig     | 10 ++++
>   drivers/platform/x86/Makefile    |  3 ++
>   drivers/platform/x86/ayaneo-ec.c | 90 ++++++++++++++++++++++++++++++++
>   4 files changed, 109 insertions(+)
>   create mode 100644 drivers/platform/x86/ayaneo-ec.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddecf1ef3bed..c5bf7207c45f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4192,6 +4192,12 @@ W:	https://ez.analog.com/linux-software-drivers
>   F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>   F:	drivers/pwm/pwm-axi-pwmgen.c
>  =20
> +AYANEO PLATFORM EC DRIVER
> +M:	Antheas Kapenekakis <lkml@antheas.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/ayaneo-ec.c
> +
>   AZ6007 DVB DRIVER
>   M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index c122016d82f1..8ca95536f8d9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -316,6 +316,16 @@ config ASUS_TF103C_DOCK
>   	  If you have an Asus TF103C tablet say Y or M here, for a generic x8=
6
>   	  distro config say M here.
>  =20
> +config AYANEO_EC
> +	tristate "Ayaneo EC platform control"
> +	depends on DMI
> +	help
> +	  Enables support for the platform EC of Ayaneo devices. This
> +	  includes fan control, fan speed, charge limit, magic
> +	  module detection, and controller power control.
> +
> +	  If you have an Ayaneo device, say Y or M here.
> +
>   config MERAKI_MX100
>   	tristate "Cisco Meraki MX100 Platform Driver"
>   	depends on GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index c7db2a88c11a..274a685eb92d 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_TF103C_DOCK)	+=3D asus-tf103c-dock.o
>   obj-$(CONFIG_EEEPC_LAPTOP)	+=3D eeepc-laptop.o
>   obj-$(CONFIG_EEEPC_WMI)		+=3D eeepc-wmi.o
>  =20
> +# Ayaneo
> +obj-$(CONFIG_AYANEO_EC)		+=3D ayaneo-ec.o
> +
>   # Cisco/Meraki
>   obj-$(CONFIG_MERAKI_MX100)	+=3D meraki-mx100.o
>  =20
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/aya=
neo-ec.c
> new file mode 100644
> index 000000000000..2fe66c8a89f4
> --- /dev/null
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Platform driver for the Embedded Controller (EC) of Ayaneo devices. =
Handles
> + * hwmon (fan speed, fan control), battery charge limits, and magic mod=
ule
> + * control (connected modules, controller disconnection).
> + *
> + * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +struct ayaneo_ec_quirk {
> +};
> +
> +struct ayaneo_ec_platform_data {
> +	struct platform_device *pdev;
> +	struct ayaneo_ec_quirk *quirks;
> +};
> +
> +static const struct ayaneo_ec_quirk quirk_ayaneo3 =3D {
> +};
> +
> +static const struct dmi_system_id dmi_table[] =3D {
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> +		},
> +		.driver_data =3D (void *)&quirk_ayaneo3,
> +	},
> +	{},
> +};
> +
> +static int ayaneo_ec_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_entry;
> +	struct ayaneo_ec_platform_data *data;
> +
> +	dmi_entry =3D dmi_first_match(dmi_table);
> +	if (!dmi_entry)
> +		return -ENODEV;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->pdev =3D pdev;
> +	data->quirks =3D dmi_entry->driver_data;
> +	platform_set_drvdata(pdev, data);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ayaneo_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "ayaneo-ec",
> +	},
> +	.probe =3D ayaneo_ec_probe,
> +};
> +
> +static struct platform_device *ayaneo_platform_device;
> +
> +static int __init ayaneo_ec_init(void)
> +{
> +	ayaneo_platform_device =3D
> +		platform_create_bundle(&ayaneo_platform_driver,
> +				       ayaneo_ec_probe, NULL, 0, NULL, 0);
> +
> +	return PTR_ERR_OR_ZERO(ayaneo_platform_device);
> +}
> +
> +static void __exit ayaneo_ec_exit(void)
> +{
> +	platform_device_unregister(ayaneo_platform_device);
> +	platform_driver_unregister(&ayaneo_platform_driver);
> +}
> +
> +MODULE_DEVICE_TABLE(dmi, dmi_table);
> +
> +module_init(ayaneo_ec_init);
> +module_exit(ayaneo_ec_exit);
> +
> +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> +MODULE_DESCRIPTION("Ayaneo Embedded Controller (EC) platform features")=
;
> +MODULE_LICENSE("GPL");
