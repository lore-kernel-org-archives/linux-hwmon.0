Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793350497;
	b=LFMgVZBwfqSPuB3sh35pYvBXJZwE+rsMgxfOtQa8LVXIerL8U5EYsUTGvVTdjDisHxR/
	 BXg3lvBW/akOSXbrtq78AiWF8zUaT0Obv9gQUd85ovJi8Xxuo439Gn5bMBeUY0cUGVY5Z
	 3J4NLZDxp3BkKk/lAfYXCz8N6wEjtefaRYwyjoijIR58t1VVlOdQlH0ceqKDhxRPWwcDE
	 BgBig3jEWd8jHtvMMWUY5EwIl+DvTporqKzOyyFyhvrL5LOFeThtgoLQq+9vValoXFDs5
	 OiY9DtX9ri382kqnz5LRcKijTIVzi/lYYLttRAQvFLkCThnWPP/iWPdJR92tKDXlcbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IlJmW55tYwj1lxVdJeH6cEzggbu13BjqMtferC5gyRo=;
	b=XDalF6PGRk7GoUe+FwmJKgg4PCgnBHC2kzT9xfhVnPRES5Mp089T3u+iUTPj6ey8RV/u
	 jb6hpsr9l2SeeDJl1+DWLu+VLe5bMIvpj0HShmJbaU22dv5UG4SPieES+Vx3DkbfMhc6e
	 jV/1Vb609P4p/+Xf7Arj9rQpXL5bD2mqis1nPfP5FNcXAdvqqioPUOMbv3fg7+mkh/N4n
	 +C1NHOCVsoG6/mNBhNJXAPRi4hrGyYRg2m0QJLNf0YzVt2IDS6KuiZLDFhRys6Y+2+OaS
	 uHXCx7IOVOsliDzmIlrTkNkim05qrjaAjUkj8kJaDfsP0hCDRz0xWYr8fgIDOYPZi2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfdFX7OE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CC2606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 08:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfdFX7OE
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c3cecbda48so82934137.3
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 01:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793350496; cv=none;
        d=google.com; s=arc-20260327;
        b=JrOlz9W7Ire2Zj++ksHngsJwwbzMCwCAlwX30k0gjoY/2DMC9zRVw0m0a47anCLpxO
         s8EfVYCQjZx55K4y3GbqWBnRE5S7Jkp1wa3R6n04jssFG9cMcD2V+kBiR4oMPVDUCiRp
         cP3Xpy39Pg9mHZ+mCQrZ1iN7mE39+dCA3qqp/oB1ZjE0qBSnFVRBeoDDOe2Sz6OaFkZT
         24RB3e+cGVnhKc+76FUn4X5N18YQm35i/dJDQsP2z1fblK1fKy3S077v/KrrzRLwWOwE
         3fDlmY4377ntOgZSv+iRRLKHzjCBg3dhd6W5x+IUXVG5i1KK5gSGiod2VLwh3/VcqEKf
         XsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=IlJmW55tYwj1lxVdJeH6cEzggbu13BjqMtferC5gyRo=;
        fh=EuVMr/dJePQNuug+AeSWnv0UsmaEhCt7Yg22TQo2rNc=;
        b=sZTZliFzAMXX8IoGBOQvGoT3XtY0/cCfFahyVe/IQ0FlabltLVKZODhcIhWv3mFGbg
         pGek0kAcE/tyGmorQ8Jn7u9mHApAwxBFXHPzVvO0v2TggyWWj28Q+U7+TGT2wmxCtk3c
         DfVRwvUWW2uJihNMuZGcr4MpDJyPN7hbsvDkPXInav+aB5eg/QrLiqy/m6qBG9mqYs39
         ish0tU5nyiqM7iahu77xxU8/GOpmg+jieePGhtWJHftOob84psR2+f3oswg/EqI3Fw81
         steK5IiNkVcEauoypLCKCBttN7i/uJwDyyO809mWhi8D0EgolgjxuYQooa1o7UpwqUom
         sEjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350496; x=1793955296; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlJmW55tYwj1lxVdJeH6cEzggbu13BjqMtferC5gyRo=;
        b=SfdFX7OEm0bHpHbQq1YLlvD6TrA+6PUMXr5/yLNGaOuWN9Kb9/ZnAFS9QWVanrX3Gh
         6q2P/j5y9OmD8AQEfr5K8A8c+8l7hSCxY90rWF8vFU4wR5a2ihkIU3etXUvvmh23wqUI
         TzxI5qitCZvMgTaqVuqBMdML/AtPbKBJProAoj4JWZ2llq5ss7eDhmkh6BIH24Xeofug
         /4c2g68YSu2+Ldu4OYeWsTYoqF2r9u0/3/kmXdVq/WboZUZLG+6pK/TicubXTkW/qeDt
         PDo5ndJWVtpI+43TEw8f0sWBnCqa3iAJjK8+saV5A7BwR4nysaFCWTyvS+2HMgkvcmgE
         F3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350496; x=1793955296;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlJmW55tYwj1lxVdJeH6cEzggbu13BjqMtferC5gyRo=;
        b=lrrX2RgsSIYLd5vMfFV/N2+exguQuKA5anz7IK09N6uz4iS4sExedFx2pTxyXE7KhF
         dZo+r0+kv9JDXhHu+2j7nqfMt59To80TLFVeK/DX+XealFvr1TcX4wnOd6ei+JNbBcpB
         RwthFNULrdxU/XtVwQRvo17IoXRMniQUyWGeronXnLhjVu81vrPoqnRbdGqTBkFoMu+I
         fm67NT1Ykruklo434ohCC3i7GKrZN0ATTx8ggfwzRLT1i+j7t0/cm9V3aCxshLkOO39C
         qyYnpBIic7LJhZ2JGeRcIYb8Vc9cMtWcSoVBaoZb1XmUgaE7ulT7ZSj5BA+7Dtg1dAcu
         ihiw==
X-Forwarded-Encrypted: i=1; AKwUvByOUoVv01XRBIuqGUxnsn0ng1pIZobQqx9IZm2r8EU1Aq2rchwfnglT7K1ctGzVZCtjhED7jhGWe62Slw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgx1ZF1grJXn+fQLiOJbzH+H3rZmL7X0Q4OFyvirLFUG8yKT8T
	gbk6G2Y1UKQhLVZU95RTN9FM9DnXlOaVjMs9F7C/gGxlrTelczDmUnVuXLv4nQstrKoXxV3U+Eb
	HfcUmZB++CTbZMcEO7fQcL3NMC9ldoI8An0Q0
X-Gm-Gg: AYBFou3X3SgWGpB9pzvh+U8HOb65hB5vKM54AUQRqpCUH/MYwLe6Lq7Z6s4FisHIH5p
	iODUHkODkFuIsjfx7GEd0qCxa3syYSo+42Klv06mx5WEtP7WJWOJy6LZpYBryfuTXpZgpEVYEnF
	jXCsKpxtmyTtmKS3CHAL2lWONU0qL4Ei36gIBQGG/aX5jgIEeSRqVUf76CT56I4uanAx6O1ts98
	01RozfBDsXmhNesK3GAe6Avh5yYqTFgZjVxxSwHBHeZxJaSguOcmz7S5j+8H5IPZH9eMqhx6Ova
	z853FUNXRUWw8A9t1Um684hvfkvukU5JQD7SRxyBKVolf7Ze8Lf97dVI67UNR8qr1HnAxwNXJyA
	knz8klqDp3YCTbWGXLRW5LFGor6Bha+gYqt/HN4P/Yw+ZOFS0bhSBHmL0+8fUh9VuLMs=
X-Received: by 2002:a05:6102:5712:b0:7c4:6246:6ed7 with SMTP id
 ada2fe7eead31-7d072caf24fmr862435137.26.1793350495916; Fri, 30 Oct 2026
 01:54:55 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 30 Oct 2026 03:54:55 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 30 Oct 2026 03:54:55 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de>
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de>
From: LIght JUNction <lightjunction.me@gmail.com>
Date: Fri, 30 Oct 2026 03:54:55 -0500
X-Gm-Features: AclHuK-UzaBZ7dy8imodsZBEqP7oeWWsEv_UJTo3Kxtt4DOag5iiHL_cuQrI4eU
Message-ID: <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: W_Armin@gmx.de, linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

I checked the in-tree uniwill_laptop driver and its force path. I have
not loaded it with force=1 on the GM6PX0X. For an unsupported DMI
entry, force enables all features except the battery charge limit.
Probe sets EC 0x0741 bit 0 and initializes NVIDIA CTGP, writing 0 to
the CTGP offset at 0x0744. The current ctgp_offset here is 25, so this
would overwrite the active value.

The sensor map is a partial match: CPU/GPU temperatures and the
primary fan address match. The secondary fan low byte differs:
uniwill_laptop uses 0x046D; the verified GM6PX0X map uses 0x046B. The
generic driver also reads the fan bytes without the high/low/high
check in my patch.

I can't confirm full operation with force=1 on this model. A
sensor-only test path without those EC writes would be needed to
verify it.

Thanks,
LIghtJUNction

On Fri, 30 Oct 2026 08:37:43 +0100, Armin Wolf <W_Armin@gmx.de> wrote:
> Am 29.10.26 um 21:35 schrieb LIght JUNction:
> > From: LIghtJUNction <lightjunction.me@gmail.com>
> >
> > The GM6PX0X firmware exposes CPU and GPU temperatures and fan speeds
> > through the INOU.ECRR ACPI method. Add a read-only hwmon driver for
> > these sensors, scoped to the verified MECHREVO Kuangshi16Pro GM6PX0X,
> > board GM6PX0X, and BIOS N.1.09MRO07.
> >
> > The driver checks the firmware project ID and fan capability before
> > registering the device. It uses only ECRR reads and exposes standard
> > hwmon temperature and fan input attributes. It does not write EC
> > registers or expose fan controls. Fan counters are sampled high/low/high
> > to reject a high-byte rollover.
> >
> > Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X, BIOS
> > N.1.09MRO07, running 7.2.11-arch1-1: the module built with W=1, loaded
> > beside the installed sensor module, provided all four readings, and
> > unloaded without removing the existing module. Other systems and BIOS
> > versions have not been tested.
>
> Hi,
>
> can you check if the uniwill-laptop driver works by loading it with the
> force module option being set to 1?
>
> Thanks,
> Armin Wolf
>
> > Assisted-by: Codex:GPT-6
> > Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
> > ---
> > AI assistance: Codex was used to draft the read-only driver, its Kconfig
> > and Makefile integration, documentation, and commit message. The request
> > was to prepare a hwmon submission for the locally verified GM6PX0X using
> > the firmware read interface and no EC writes.
> >
> > Validation is limited to an external-module W=1 build and runtime reads on
> > the laptop and BIOS listed above; no full kernel-tree build was performed.
> > checkpatch --strict reports no errors and one advisory about a new
> > MAINTAINERS entry. The general HWMON entry covers these paths.
> >
> >   Documentation/hwmon/index.rst       |   1 +
> >   Documentation/hwmon/mechrevo-ec.rst |  31 +++
> >   drivers/hwmon/Kconfig               |  11 ++
> >   drivers/hwmon/Makefile              |   1 +
> >   drivers/hwmon/mechrevo-ec.c         | 290 ++++++++++++++++++++++++++++
> >   5 files changed, 334 insertions(+)
> >   create mode 100644 Documentation/hwmon/mechrevo-ec.rst
> >   create mode 100644 drivers/hwmon/mechrevo-ec.c
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> > index 199ca79..6bd4ece 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
> >      mc34vr500
> >      mcp3021
> >      mcp9982
> > +   mechrevo-ec
> >      menf21bmc
> >      minisforum-um780xtx
> >      mlxreg-fan
> > diff --git a/Documentation/hwmon/mechrevo-ec.rst
> > b/Documentation/hwmon/mechrevo-ec.rst
> > new file mode 100644
> > index 0000000..91ffd77
> > --- /dev/null
> > +++ b/Documentation/hwmon/mechrevo-ec.rst
> > @@ -0,0 +1,31 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=======================
> > +MECHREVO GM6PX0X EC
> > +=======================
> > +
> > +Supported systems:
> > +
> > +  * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
> > +  * BIOS N.1.09MRO07
> > +
> > +The driver exposes two EC temperatures and two fan speeds through hwmon. It
> > +uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC bytes. Temperatures
> > +are reported in millidegrees Celsius and fan speeds in RPM. The CPU and GPU
> > +temperature bytes are at ``0x043e`` and ``0x044f``. The 16-bit CPU and GPU fan
> > +counters use high/low bytes at ``0x0464``/``0x0465`` and ``0x046c``/``0x046b``,
> > +respectively.
> > +
> > +Each successful ECRR read is followed by a 6 to 12 ms delay. Fan reads sample
> > +the high byte before and after the low byte and retry up to three times if the
> > +high byte changes. The EC updates independently, so the driver cannot provide
> > +an atomic snapshot of the two bytes.
> > +
> > +At probe, the driver checks EC project ID ``0x10`` at ``0x0740`` and bit 6 of
> > +the capability byte at ``0x078e``. It only binds the exact DMI identity and
> > +BIOS version listed above. Other models and BIOS versions have not been
> > +validated.
> > +
> > +The driver is read-only. It does not call the firmware write method, change EC
> > +configuration, or expose fan-control attributes. Values above 125 degrees C
> > +are reported as unavailable; zero is passed through as read from firmware.
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 18c682e..7e397c2 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called hp_wmi_sensors.
> >
> > +config SENSORS_MECHREVO_EC
> > +	tristate "MECHREVO GM6PX0X EC sensors"
> > +	depends on X86 && ACPI
> > +	help
> > +	  If you say yes here you get read-only temperature and fan speed
> > +	  monitoring for the MECHREVO Kuangshi16Pro Series GM6PX0X with BIOS
> > +	  N.1.09MRO07, using its firmware ACPI method.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called mechrevo_ec.
> > +
> >   endif # ACPI
> >
> >   endif # HWMON
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index d4c345e..ac362a1 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
> >   obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
> >   obj-$(CONFIG_SENSORS_HONOR_FMI)	+= honor-fmi.o
> >   obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
> > +obj-$(CONFIG_SENSORS_MECHREVO_EC)	+= mechrevo-ec.o
> >
> >   # Native drivers
> >   # asb100, then w83781d go first, as they can override other drivers' addresses.
> > diff --git a/drivers/hwmon/mechrevo-ec.c b/drivers/hwmon/mechrevo-ec.c
> > new file mode 100644
> > index 0000000..d4a3430
> > --- /dev/null
> > +++ b/drivers/hwmon/mechrevo-ec.c
> > @@ -0,0 +1,290 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro GM6PX0X. */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/delay.h>
> > +#include <linux/dmi.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#define MECHREVO_ECRR_DELAY_MIN_US	6000
> > +#define MECHREVO_ECRR_DELAY_MAX_US	12000
> > +#define MECHREVO_RPM_ATTEMPTS		3
> > +
> > +struct mechrevo_ec_data {
> > +	acpi_handle inou;
> > +	/* Serialize the three ECRR calls that make up one fan sample. */
> > +	struct mutex rpm_lock;
> > +};
> > +
> > +static const struct dmi_system_id mechrevo_ec_dmi_table[] = {
> > +	{
> > +		.matches = {
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> > +					"Kuangshi16Pro Series GM6PX0X"),
> > +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
> > +			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
> > +		},
> > +	},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
> > +
> > +static int mechrevo_ec_read_byte(struct mechrevo_ec_data *data, u16 address,
> > +				 u8 *value)
> > +{
> > +	union acpi_object argument = {
> > +		.integer.type = ACPI_TYPE_INTEGER,
> > +		.integer.value = address,
> > +	};
> > +	struct acpi_object_list arguments = {
> > +		.count = 1,
> > +		.pointer = &argument,
> > +	};
> > +	unsigned long long raw;
> > +	acpi_status status;
> > +
> > +	status = acpi_evaluate_integer(data->inou, "ECRR", &arguments, &raw);
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	/* Match the delay used by the in-tree Uniwill ECRR transport. */
> > +	usleep_range(MECHREVO_ECRR_DELAY_MIN_US, MECHREVO_ECRR_DELAY_MAX_US);
> > +	if (raw > 255)
> > +		return -ERANGE;
> > +
> > +	*value = raw;
> > +	return 0;
> > +}
> > +
> > +static int mechrevo_ec_read_temp(struct mechrevo_ec_data *data, int channel,
> > +				 long *value)
> > +{
> > +	u16 address;
> > +	u8 raw;
> > +	int ret;
> > +
> > +	switch (channel) {
> > +	case 0:
> > +		address = 0x043e;
> > +		break;
> > +	case 1:
> > +		address = 0x044f;
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	ret = mechrevo_ec_read_byte(data, address, &raw);
> > +	if (ret)
> > +		return ret;
> > +	if (raw > 125)
> > +		return -ENODATA;
> > +
> > +	*value = raw * 1000;
> > +	return 0;
> > +}
> > +
> > +static int mechrevo_ec_read_fan(struct mechrevo_ec_data *data, int channel,
> > +				long *value)
> > +{
> > +	u16 high_address, low_address;
> > +	u8 high, low, check;
> > +	int attempt, ret;
> > +
> > +	switch (channel) {
> > +	case 0:
> > +		high_address = 0x0464;
> > +		low_address = 0x0465;
> > +		break;
> > +	case 1:
> > +		high_address = 0x046c;
> > +		low_address = 0x046b;
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	/* The EC can update between byte reads; reject a high-byte rollover. */
> > +	mutex_lock(&data->rpm_lock);
> > +	for (attempt = 0; attempt < MECHREVO_RPM_ATTEMPTS; attempt++) {
> > +		ret = mechrevo_ec_read_byte(data, high_address, &high);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		ret = mechrevo_ec_read_byte(data, low_address, &low);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		ret = mechrevo_ec_read_byte(data, high_address, &check);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		if (high == check) {
> > +			*value = ((long)high << 8) | low;
> > +			ret = 0;
> > +			goto out_unlock;
> > +		}
> > +	}
> > +	ret = -EAGAIN;
> > +
> > +out_unlock:
> > +	mutex_unlock(&data->rpm_lock);
> > +	return ret;
> > +}
> > +
> > +static umode_t mechrevo_ec_is_visible(const void *data,
> > +				      enum hwmon_sensor_types type,
> > +				      u32 attr, int channel)
> > +{
> > +	if (channel < 0 || channel > 1)
> > +		return 0;
> > +
> > +	if (type == hwmon_temp)
> > +		return attr == hwmon_temp_input || attr == hwmon_temp_label ? 0444 : 0;
> > +	if (type == hwmon_fan)
> > +		return attr == hwmon_fan_input || attr == hwmon_fan_label ? 0444 : 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mechrevo_ec_read(struct device *dev, enum hwmon_sensor_types type,
> > +			    u32 attr, int channel, long *value)
> > +{
> > +	struct mechrevo_ec_data *data = dev_get_drvdata(dev);
> > +
> > +	if (type == hwmon_temp && attr == hwmon_temp_input)
> > +		return mechrevo_ec_read_temp(data, channel, value);
> > +	if (type == hwmon_fan && attr == hwmon_fan_input)
> > +		return mechrevo_ec_read_fan(data, channel, value);
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static int mechrevo_ec_read_string(struct device *dev,
> > +				   enum hwmon_sensor_types type, u32 attr,
> > +				   int channel, const char **value)
> > +{
> > +	if (channel < 0 || channel > 1)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (type == hwmon_temp && attr == hwmon_temp_label)
> > +		*value = channel ? "GPU EC" : "CPU EC";
> > +	else if (type == hwmon_fan && attr == hwmon_fan_label)
> > +		*value = channel ? "GPU fan" : "CPU fan";
> > +	else
> > +		return -EOPNOTSUPP;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct hwmon_ops mechrevo_ec_hwmon_ops = {
> > +	.is_visible = mechrevo_ec_is_visible,
> > +	.read = mechrevo_ec_read,
> > +	.read_string = mechrevo_ec_read_string,
> > +};
> > +
> > +static const struct hwmon_channel_info * const mechrevo_ec_hwmon_info[] = {
> > +	HWMON_CHANNEL_INFO(temp,
> > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > +			   HWMON_T_INPUT | HWMON_T_LABEL),
> > +	HWMON_CHANNEL_INFO(fan,
> > +			   HWMON_F_INPUT | HWMON_F_LABEL,
> > +			   HWMON_F_INPUT | HWMON_F_LABEL),
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_chip_info mechrevo_ec_chip_info = {
> > +	.ops = &mechrevo_ec_hwmon_ops,
> > +	.info = mechrevo_ec_hwmon_info,
> > +};
> > +
> > +static int mechrevo_ec_probe(struct platform_device *pdev)
> > +{
> > +	struct mechrevo_ec_data *data;
> > +	struct device *hwmon_dev;
> > +	u8 project, capability;
> > +	acpi_status status;
> > +	int ret;
> > +
> > +	if (!dmi_check_system(mechrevo_ec_dmi_table))
> > +		return -ENODEV;
> > +
> > +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&data->rpm_lock);
> > +	status = acpi_get_handle(NULL, "\\_SB.INOU", &data->inou);
> > +	if (ACPI_FAILURE(status) || !acpi_has_method(data->inou, "ECRR"))
> > +		return dev_err_probe(&pdev->dev, -ENODEV,
> > +				     "missing INOU.ECRR method\n");
> > +
> > +	ret = mechrevo_ec_read_byte(data, 0x0740, &project);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to read EC project ID\n");
> > +	ret = mechrevo_ec_read_byte(data, 0x078e, &capability);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to read EC fan capability\n");
> > +	if (project != 0x10 || !(capability & 0x40))
> > +		return dev_err_probe(&pdev->dev, -ENODEV,
> > +				     "unsupported EC project or fan layout\n");
> > +
> > +	platform_set_drvdata(pdev, data);
> > +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "mechrevo",
> > +							 data,
> > +							 &mechrevo_ec_chip_info,
> > +							 NULL);
> > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static struct platform_driver mechrevo_ec_driver = {
> > +	.probe = mechrevo_ec_probe,
> > +	.driver = {
> > +		.name = "mechrevo-ec-hwmon",
> > +	},
> > +};
> > +
> > +static struct platform_device *mechrevo_ec_device;
> > +
> > +static int __init mechrevo_ec_init(void)
> > +{
> > +	int ret;
> > +
> > +	if (!dmi_check_system(mechrevo_ec_dmi_table))
> > +		return -ENODEV;
> > +
> > +	ret = platform_driver_register(&mechrevo_ec_driver);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mechrevo_ec_device = platform_device_register_simple("mechrevo-ec-hwmon",
> > +							     PLATFORM_DEVID_NONE,
> > +							     NULL, 0);
> > +	if (IS_ERR(mechrevo_ec_device)) {
> > +		ret = PTR_ERR(mechrevo_ec_device);
> > +		platform_driver_unregister(&mechrevo_ec_driver);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void __exit mechrevo_ec_exit(void)
> > +{
> > +	platform_device_unregister(mechrevo_ec_device);
> > +	platform_driver_unregister(&mechrevo_ec_driver);
> > +}
> > +
> > +module_init(mechrevo_ec_init);
> > +module_exit(mechrevo_ec_exit);
> > +
> > +MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
> > +MODULE_LICENSE("GPL");
