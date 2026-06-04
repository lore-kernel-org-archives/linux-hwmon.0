Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D643A1D0C;
	Thu,  4 Jun 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561041; cv=none; b=WpN9CLfWZgrGCyuo+4iuFte9qieFCT5+w4sISUE5AZ79agWgMfwnbEVxob6dnqoIhWLnj3k5rIWeC+Wcf0Z2IxL2uQKJv6zVKQNjGyJS9fzj8A3niJmoKXRoeDzPtJCo3FolZ/kEZ75c7mYSOe64zdcCqtc4tvisZ2kqPgx1BdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561041; c=relaxed/simple;
	bh=WaIpu+mYBmXerhjCY+gB3dP/XRakT3MaV9043JcrdvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KmTkkZqQwcb2g+BvfUXjSzOHtQIitX6MmtT5I2HlTi5Gkf+WQlNw2E3VqhFl2KYvtQlkHUfVHarCCb5MDp02zzQ6idSQaG4bg5xvQZ5Bk8QuIIYXMd3XCLeGJYR9lc2BvowUUKX9T/CsmxxY9uj5Wu6ylKpm6ElSqG3bTDO8oSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdKvQUzA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdKvQUzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5251F00893;
	Thu,  4 Jun 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780561040;
	bh=FJVAbbEBWYarbWavIQRTcWPKhCK7h4/HOCYcRtl00Io=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdKvQUzAqyg1fnVi/p5vHmdm/+g7xD/h4NwFFFFVEkQDhTuss6mVu60ikBy4i225V
	 nYkuPgFBijeptACObd9eyNUEV9Wpw3SjTuKzZnO9PKGnQdMDLa/RiCpOyzqfyO7Lcb
	 RW5xrxnAJU+rCFQiUhMYiQF5HW46IriZx4gocRmQhlgCNtWTQGF3GOsduZkbaNeJ4C
	 6S2/LPQ2ybySnzhXpdFyZ1yUktMkZWJumSOHHKoVuBdIdM2WUWBXgoQ03HRjSlxi/a
	 VKiWQQoiTxFbkmgdBwpEzpXhKCVGrSjfl33djxqamb0LpOKxxJmxoMRwMCzVf/bmhA
	 jh5ZzRH3PEM7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604080552.169-1-hehuan1@eswincomputing.com>
References: <20260604080552.169-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:17:19 +0000
Message-Id: <20260604081720.5D5251F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Clearing the interrupt status before disabling sensor conversions =
in init_iface() creates a race condition that can lead to an unhandled inte=
rrupt storm.
- [Medium] Missing pm_runtime_disable() in the device cleanup path causes a=
n unbalanced PM runtime state.
--

commit 5842ad32271f7d967e9f1e10c13474a5b57da8ad
Author: Huan He <hehuan1@eswincomputing.com>

hwmon: Add Eswin EIC7700 PVT sensor driver

Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
supports temperature and voltage monitoring with polynomial conversion,
and provides sysfs interface for sensor data access.

> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c
[ ... ]
> +static int eic7700_pvt_init_iface(struct pvt_hwmon *pvt)
> +{
> +	/*
> +	 * Make sure controller are disabled so not to accidentally have ISR
> +	 * executed before the driver data is fully initialized. Clear the IRQ
> +	 * status as well.
> +	 */
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);

[Severity: High]
Could this clear-then-disable sequence cause an unhandled interrupt storm?

If a bootloader left the sensor active, a conversion might complete in the
small window between clearing PVT_INT_CLR and disabling PVT_ENA_EN. This
would assert the IRQ line.

When the IRQ is later requested in probe(), the ISR eic7700_pvt_hard_isr()
will fire immediately. However, since the device is suspended,
pm_runtime_get_if_active() returns <=3D 0, causing the ISR to return IRQ_NO=
NE
without clearing the interrupt.

Because the interrupt is level-triggered (IRQF_TRIGGER_HIGH), would this
result in a continuous interrupt storm that ultimately forces the kernel
to permanently disable the IRQ line?

Should the conversion engine be disabled before the interrupt is cleared?

[ ... ]
> +static void eic7700_pvt_disable_pm_runtime(void *data)
> +{
> +	struct pvt_hwmon *pvt =3D data;
> +
> +	pm_runtime_dont_use_autosuspend(pvt->dev);
> +	pm_runtime_force_suspend(pvt->dev);
> +
> +	if (!IS_ENABLED(CONFIG_PM))
> +		clk_disable_unprepare(pvt->clk);
> +}

[Severity: Medium]
Does this device cleanup path need a call to pm_runtime_disable()?

In eic7700_pvt_probe(), pm_runtime_enable() is called, which alters the
PM core's disable_depth count. Since pm_runtime_disable() is missing here,
if the driver is unbound and later rebound, the next pm_runtime_enable()
will encounter an unbalanced depth.

Could this trigger an "Unbalanced pm_runtime_enable!" warning and cause
inconsistent PM state tracking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604080430.126-=
1-hehuan1@eswincomputing.com?part=3D2
