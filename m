Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB531ED80;
	Tue, 19 May 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179475; cv=none; b=mPBgGp70dCY4wLkILTNg0Hv061hvmrfmYU7DnhmOnqgGyPEbTrZqqBjpHh4ZYLLe4Z7EnVLjf6dBtJPLdHaS8f89lDD/nd93tVvsZSy3wFyqnpTylkODqDXei+nnTWbg5ODcHRFLYTClhn1llT01tK/M1x9dW0ckmr29fz7SHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179475; c=relaxed/simple;
	bh=Io93NkVGqxQcKu7wcpYV8CEw6O34JYizbrdKAnre7Ss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OP3HhHx6u/XfYpF5jpK+dDdF64HNLiFtSOMTz3/8GajHcxIu1FD3o5N+DzRY4h/uQIsv+oiiU+OhzrAMm7IOAzTPWtujn5PVBDE750Zkudsc3vftCdIGWWEAB8g5LCU48LzeAEjc8jaah5E/VCiE0dGzuI07qv1Ynl2N4Kb4gok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FokOUq18; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FokOUq18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854ABC2BD04;
	Tue, 19 May 2026 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179474;
	bh=Io93NkVGqxQcKu7wcpYV8CEw6O34JYizbrdKAnre7Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FokOUq18e/ahZGUtWQF7In17uayLI5l2wmSyiRDl6ayoET+SuDCR/fY0OE/FQ/6O8
	 +k6vxBTxUCN/sHhqVyoXaS7v+QvlaTG1fWfEe6FoEwMcA+91+sjlX8fzi+PEVhJpRZ
	 60CUM42yaZef34CallSz2dma34h7JETu0gIEpE0SKW6FRKi64KDVMDwziMooU2E5KS
	 pqA7MlwIuqDuujo87pUwpuSYZHLMKzyOf1PTX40OQjszxPbfH2KbNXnEnEUEiFbYGY
	 1ZEz98FjCALD6DDeqavkUmMP+3j9UbVwyBCszicqLkl/1jythQnoiSHtDQA8iO/fcb
	 0+r4C+n4W2u2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdp730) Add support for efuse xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519075558.91466-3-Ashish.Yadav@infineon.com>
References: <20260519075558.91466-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:31:13 +0000
Message-Id: <20260519083114.854ABC2BD04@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Usage of firmware-specific `of_property_read_u32` instead of firmwa=
re-agnostic `device_property_read_u32`.
- [Low] The `xdp730_info` template structure is not marked as `const`.
- [Low] Missing explicit `#include <linux/regulator/consumer.h>` for `devm_=
regulator_get_enable()`.
--

commit c84eadae1a13e6d451b4eb98ba41bc9f1c1c537c
Author: Ashish Yadav <ashish.yadav@infineon.com>

hwmon:(pmbus/xdp730) Add support for efuse xdp730

Add the pmbus driver for Infineon XDP730 Digital eFuse Controller.

> diff --git a/drivers/hwmon/pmbus/xdp730.c b/drivers/hwmon/pmbus/xdp730.c
> new file mode 100644
> index 0000000000000..ea8968de9f267
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp730.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon XDP730 Digital eFuse Controll=
er
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of_device.h>
> +#include <linux/bitops.h>
> +#include <linux/math64.h>

Is it possible to explicitly include <linux/regulator/consumer.h>?

The driver invokes devm_regulator_get_enable() below but relies on indirect
inclusion, which might break if subsystem headers are refactored in the
future.

> +#include "pmbus.h"
> +
> +/*
> + * The IMON resistor required to generate the system overcurrent protect=
ion.
> + * Arbitrary default Rimon value: 2k Ohm
> + */
> +#define XDP730_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP730_TELEMETRY_AVG 0xE9
> +
> +static struct pmbus_driver_info xdp730_info =3D {

Could this template structure be marked as const?

It is copied per-instance during probe via devm_kmemdup(), so declaring it
const would move it to the read-only .rodata section and prevent accidental
modifications.

> +	.pages =3D 1,
> +	.format[PSC_VOLTAGE_IN] =3D direct,
> +	.format[PSC_VOLTAGE_OUT] =3D direct,

[ ... ]

> +	ret >>=3D 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> +	ret &=3D GENMASK(0, 0);
> +	if (ret =3D=3D 1)
> +		gimon =3D 20000; /* output gain 20 microA/A */
> +	else
> +		gimon =3D 10000; /* output gain 10 microA/A */
> +
> +	if (of_property_read_u32(client->dev.of_node,
> +				 "infineon,rimon-micro-ohms", &rimon))

Should this use device_property_read_u32(&client->dev, ...) instead?

Using of_property_read_u32() restricts the driver to Device Tree-based
systems. If the driver is instantiated via ACPI, client->dev.of_node will
be NULL, causing the read to silently fail and fall back to the default val=
ue.

device_property_read_u32() from <linux/property.h> would seamlessly support
DT, ACPI, and software nodes.

> +		rimon =3D XDP730_DEFAULT_RIMON; /* Default if not set via DT */
> +	if (rimon =3D=3D 0)
> +		return -EINVAL;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519075558.9146=
6-1-Ashish.Yadav@infineon.com?part=3D2
