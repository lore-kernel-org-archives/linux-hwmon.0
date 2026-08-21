Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120FF3F4DE9
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 05:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290261; cv=none; b=eA2WFfhaoyLVPrfoDbV3tt83URVBkIVvw+woAROhnrZ82kguUVooF/rCZwJWNQVtQcsMQD48LcqGMPDzpqxZLv1eWurlr0nw4o8KyH1bNEZIlMcom7KtsP+hEfqx+L5k6b/p8VNwJsw08XkbPy31+NUzF2kimMIvzaJNukl96dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290261; c=relaxed/simple;
	bh=jalYg9gd5HcD1/XwijjXK8+to7Uagyw/wGKNu6PDOTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lDCIy2xPDzx/galDjxoaijspbJZOV1zind/F2DxjQmzouLhiOwavHjJPYV7m2kiWq5OCX1yhVsCzA7nQBbdJtRdcpvETFSAci/JJDOQzg8IodfnCj109RODDRpeM4jQ7nMHX7rGv9dZLvz6wAHudlmMopcv2THkgBnWSgT3gOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLa6+1WX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLa6+1WX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B82F1F000E9;
	Fri, 21 Aug 2026 05:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787290259;
	bh=7z/T2duadx7v+LeEpAIoprEEc6q0sr3aqRRQtsHEFLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JLa6+1WXKItj7tlaemzjYZFUWy9dnTN9e88irBkqRrlwbwkHNH9FKuVjZiVfAmUxw
	 /KvdTQGuE7zjZCkA+eYHwrNw2iEp33F/OeDtCQO6AKAx22AEoERxUa9go9Y68mX9eu
	 odywTvfQzJNTg6yrVhQEdqxMG2MRzk2LwmtjKEhb0svbRstWks5rQuG7Sq8J5hVA01
	 NFyD4kgtDmw9Jr9KSniVc4HPE9mEOa24J8CBIynjec9iMYdQqrljqiHT2i585wUmum
	 hRM+2EW/jOUjVROC8o5IgIWNKmQyJKvkGEZ+o67068dN8Mp8dDqTJzbglc3lqaCliO
	 rXnMI1lQvPI5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: Ensure that 'dev' passed to hwmon_notify_event()
 is a hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821052258.672697-1-linux@roeck-us.net>
References: <20260821052258.672697-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 05:30:58 +0000
Message-Id: <20260821053059.7B82F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The newly added WARN will be unconditionally triggered by the exis=
ting bnxt driver, causing a loud regression.
--

--- Patch [1]: [PATCH] hwmon: Ensure that 'dev' passed to hwmon_notify_even=
t() is a hwmon device ---
commit d2961b1d473d8c128ab5a2aa551a3dc59e8bed39
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device

This patch enforces that the device passed to hwmon_notify_event() is actua=
lly
a hardware monitoring device. It introduces a warning and aborts the event
notification if an incorrect device class is provided.

> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 41755910a25a0..4110b5c45ee8d 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
[ ... ]
> @@ -782,6 +787,9 @@ int hwmon_notify_event(struct device *dev, enum hwmon=
_sensor_types type,
>  	const char *template;
>  	int base;
> =20
> +	if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device=
\n",
> +		 dev_name(dev)))
> +		return -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but will this strict check cause=
 a
regression for the bnxt driver?

Looking at bnxt_hwmon_notify_event() in
drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c, it currently passes the
parent PCI device instead of the hwmon device:

void bnxt_hwmon_notify_event(struct bnxt *bp)
{
	u32 attr;
	...
	hwmon_notify_event(&bp->pdev->dev, hwmon_temp, attr, 0);
}

Since the device passed here is not a hwmon device, won't this new WARN
trigger unconditionally on every thermal event for bnxt hardware?

For systems configured with panic_on_warn, wouldn't this lead to a panic
during normal hardware thermal events?

>  	if (type >=3D ARRAY_SIZE(__templates))
>  		return -EINVAL;
>  	if (attr >=3D __templates_size[type])

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821052258.6726=
97-1-linux@roeck-us.net?part=3D1
