Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AC8342CB6;
	Fri, 15 May 2026 03:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816099; cv=none; b=LQ3OOik2ZQZnSofnhLj7aMnDZ1VMi1BQxqEFBJuAdCeWhmtdfCnaWNJSqW4U912xGXNv50uNPvyV1wvzKuH8qrfFipQAejAIB0AlLIXJWIbTTyV3pEOxJYnyVhuGQQLE/GuHM7BsYTgeRLs2c4otOCQqD0aOaPq+h/2YmnoSIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816099; c=relaxed/simple;
	bh=EsdR/1Z/BBuDH6Fiii9AY83b9NACD6uCzeniHf/SHKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WM0SlgL2k0XyMCYAtn3QR7s0CDv//0XflgdsNw+2ogDnoRUIL8jiU4RenQBmoAISIP/SU8s6mT+nRBlJNM6iru5/4YeJX4KK6FEYyRGm7usrAnmB1nMJUqCgIfo5W7t1KYHx+XhaKxquMAY3m10VwSc/yvAdpbNafdXBP0kwa00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjz5Gnue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjz5Gnue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBFCC2BCB0;
	Fri, 15 May 2026 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778816099;
	bh=EsdR/1Z/BBuDH6Fiii9AY83b9NACD6uCzeniHf/SHKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fjz5GnueD1VZPDTDZtRBEqy6lDKN0tU8NLM+z7JHHkCFPEprZ+igEyvwl6KhX2x/2
	 3SMX2Su73PwvzFEw29OhvunpvFphnip3UPXc+PuPu5n9BCTU1C5uAY4jYc0VP/p3xz
	 A9k5zuXE9UqfXj+5E+mLd/Jgm5n9eRQupJfpYUjCpiEi/mSjOamxFr0CCxLTMNWH8K
	 qvlZoVdy5ICTyV6jNsodjQe7tJmNxaoikMooNxLWTtEmmGwKhop8x3xATYICWQQyNr
	 iTwKWth1uG/zhGtfw+j4FSvb2sLkyqmpX+WBqXI1d+i1Im1InP7vOh6ed4wMSp/RgJ
	 v3XtIGhHsc//w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514-d1u74t-v4-2-1f1ee7b002ec@nexthop.ai>
References: <20260514-d1u74t-v4-2-1f1ee7b002ec@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 03:34:58 +0000
Message-Id: <20260515033458.CFBFCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing includes for <linux/module.h> and <linux/string.h>.
- [Low] Logging raw I2C device strings without escaping.
--

commit f645f72f2f4d8cc53bec169fb4350e6231e649a4
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

This commit adds a PMBus client driver for the Murata D1U74T power supplies.

Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@int=
el.com/

> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
> new file mode 100644
> index 0000000000000..286ba492e3362
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/d1u74t.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2026 Nexthop Systems.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/pmbus.h>
> +
> +#include "pmbus.h"

This isn't a bug, but should this file include <linux/module.h> and
<linux/string.h>? It uses module-specific macros like MODULE_DEVICE_TABLE
and MODULE_AUTHOR, as well as the strncmp function. While compilation might
succeed due to transitive includes, it could lead to build failures or
implicit declaration warnings on some architectures.

[ ... ]

> +static int d1u74t_probe(struct i2c_client *client)
> +{
> +	char buf[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };
> +	struct device *dev =3D &client->dev;
> +	int rc;
> +
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
> +
> +	if (rc !=3D 9 || strncmp(buf, "Murata-PS", 9)) {
> +		buf[rc] =3D '\0';
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported Manufacturer ID '%s'\n",
> +				     buf);
> +	}
> +
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc,
> +				     "Failed to read PMBUS_MFR_MODEL\n");
> +
> +	if (rc < 8 || strncmp(buf, "D1U74T-W", 8)) {
> +		buf[rc] =3D '\0';
> +		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
> +				     buf);
> +	}

Does this code log potentially unescaped strings directly from the device?

Since the I2C bus can return garbage data or unprintable characters from a
malfunctioning device, using the %s format specifier could result in
corrupted log output. Would it be safer to use the %*pE specifier to safely
escape these untrusted strings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-d1u74t-v4-=
0-1f1ee7b002ec@nexthop.ai?part=3D2
