Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9A3783C8
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457995; cv=none; b=ed1mSG2EaIKFFXc9l9w7jT781UdrI6nxJc92VIQsJMka2Z4Z4ERJIkH7xJ1jEklBCH3UNqhEdwz/5evilgLOYgCngObpjeLVuWR/5wq21teGenGp8E9wB9KEczIhF7y9iiRCh9q8hvkgml605ytKkG67a/WCzIjt0vRRnOREq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457995; c=relaxed/simple;
	bh=B7we+FvBrhcMhg/YFrWM6lqpiLRaLZpmVaFcXVOfGrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Igz3ObhJkZmfgRuwmC9tdP1cOanWUNAehDnc0N+ff3zILq3zyD6CRnXUfLbJq5pafJwKQ8etANN1L1083rY0Fz9SwzrHW7SifjbFBKUToVPjXleoMnJ5GVUEAT3E0RQmfqqN81vXkGmucQQPTQ6pTfkBpgipQH3L23rHGCtFFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uaHQgS5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaHQgS5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAB8C19425;
	Wed, 29 Apr 2026 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777457994;
	bh=B7we+FvBrhcMhg/YFrWM6lqpiLRaLZpmVaFcXVOfGrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uaHQgS5wVW5bD6XbFUuVDLy2Io2Q5+mOYxTccwVxD5wW3UKoUOE12ZTWHZ7aqMViU
	 avQ8vzLtBaKASs9+ODpshqW6Keettj5V51jaslP/hHcHogl61hlBuVHOkMZ92Srgcy
	 pwCM2RdQG91MhSNyi6IdlviDJRTGicO4iq7cAIN7hKQSjTJThLUHHyjfP3Zs+ZRntM
	 HjtRxL67ndRKd5KALMFPD6GyHcoDMbYAFgkGpphMFjJrBcfssFs4K4rbjTTyfSm99N
	 /b3LhvJX18WfZZkCr+dzhp5+i4rNXpSp9q7L2ADtLmb2eUCjEJN7I1AHNMy3GVxI9L
	 EPbtm1kZrIQDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Reply-To: sashiko@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-add-e50sn12051-v1-3-c101e6c80bbb@gmail.com>
References: <20260429-add-e50sn12051-v1-3-c101e6c80bbb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 10:19:53 +0000
Message-Id: <20260429101954.1AAB8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The driver uses `pmbus_do_probe()` which is exported in the `PMBUS`=
 namespace, but fails to include `MODULE_IMPORT_NS("PMBUS");`.
- [Low] The driver includes `<linux/debugfs.h>`, `<linux/kstrtox.h>`, and `=
<linux/of_device.h>` when they are either unused or technically incorrect.
--

commit 8b9d265ffa7130b1c2d0afd9fd591168b6c43156
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus) add support for Delta E50SN12051

Add the pmbus driver for Delta E50SN12051 600W Non-isolated 1/8th Brick
DCDC Power Modules.

> diff --git a/drivers/hwmon/pmbus/e50sn12051.c b/drivers/hwmon/pmbus/e50sn=
12051.c
> new file mode 100644
> index 000000000000..56935e9543b6
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/e50sn12051.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for E50SN12051
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/i2c.h>
> +#include <linux/kstrtox.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

Are linux/debugfs.h and linux/kstrtox.h used in this driver? I don't see
any debugfs interfaces or string parsing functions being utilized.

Also, since this driver only uses of_device_id from linux/of_device.h,
should it include linux/mod_devicetable.h instead to follow the standard
device match table patterns?

[ ... ]

> +static int e50sn12051_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info =3D devm_kmemdup(&client->dev, &e50sn12051_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}

[ ... ]

> +MODULE_AUTHOR("Kevin Chang <kevin.chang2@amd.com>");
> +MODULE_DESCRIPTION("PMBus driver for E50SN12051");
> +MODULE_LICENSE("GPL");

Since this driver calls pmbus_do_probe() which is exported in the PMBUS
namespace, does it need a MODULE_IMPORT_NS("PMBUS") declaration?

Without it, modpost might fail the build with a missing namespace import
error if CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-add-e50sn1=
2051-v1-0-c101e6c80bbb@gmail.com?part=3D3
