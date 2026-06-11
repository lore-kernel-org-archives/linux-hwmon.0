Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15502346FA0;
	Thu, 11 Jun 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169470; cv=none; b=HWqPXVfPklzNtTKRKhD0gtS+6U9Ljhad6xfNX/NUsbpBPpC3rosUFPtYiO8IXM8wnvHbB8FPEK84xNORS7osH8wE2Eyk0GERBeOG7Gbt6oADN+RAeKJdQT2ffnfXY5QmWW/GY4S0V1hYA+s37LMo0gauqfmStgx+v0BZnEO9EvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169470; c=relaxed/simple;
	bh=8+py1khzw68T54j2tBlj+Cr/UoMeaavBHaXTmQilBVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucaCV5ZHpVpDn44sws/A2p2yD1Y3N7MEGoj1dsBcJm679Zwy7Iyn3t0p0+baa3+m47P6iQe8QgMV0pqXoNYsKwn/AFJQBhKD0VHwy0gFDTxy57ZHLMB8drpo1rz/hyhkIAawWoT0XOBrfMwh66EWUzSM2VPQzAAspEerY0JecAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rzw7nWe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rzw7nWe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EAC1F00898;
	Thu, 11 Jun 2026 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169468;
	bh=PRnK6ge20270ePEYW6Cg3LQgqEfp82CmA+Pdgj+oKhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rzw7nWe9mlmcEWibexYmkA3O3O75E61OzLcO+PW4cH78odY7LX0d0sy1rA+vHOgwY
	 smZV+W1Qg3isLTXy6lk1/4vJLVoPuhwDDtBUuaIlCH0K+qy1ec+GDtpP4sYRf1+yDW
	 vyuRB0VptjuYl0ncrd1xt9w0INEnom/ccQFOi1fSRT7awZ+mDtpIC94UyqVF/a6+mg
	 /nfobPsuNXvnWvqZY4MHFBQ8cMdG4nbazd0aM2qF+VvInOlUl0M/DxTp2wKydiciIv
	 4jN5touNKnXlbFGguVZB1kj+14RIwgUeg2gzf1Atuo2VXuUssnvDwQW4IFmFEj7bT3
	 HZ/+gsds7ENdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611090639.777-1-hehuan1@eswincomputing.com>
References: <20260611090639.777-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:17:48 +0000
Message-Id: <20260611091748.A6EAC1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The IRQ is requested before the PM runtime cleanup action is regis=
tered, leading to a possible use-after-disable of the hardware clock in the=
 ISR on driver removal.
- [Medium] The interrupt handler `eic7700_pvt_hard_isr` does not check the =
hardware interrupt status bit to verify if the device actually generated th=
e interrupt.
--

commit 0f4c8aefb83780ee09652639eb2843f01c2baf38
Author: Huan He <hehuan1@eswincomputing.com>

hwmon: Add Eswin EIC7700 PVT sensor driver

Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
supports temperature and voltage monitoring with polynomial conversion,
and provides sysfs interface for sensor data access.

> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> new file mode 100644
> index 0000000000000..3b3aed74c3941
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c

[ ... ]

> +static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
> +{
> +	struct pvt_hwmon *pvt =3D data;
> +	int active;
> +	u32 val;
> +
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		active =3D pm_runtime_get_if_active(pvt->dev);
> +		if (active <=3D 0)
> +			return IRQ_NONE;
> +	}
> +
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	/*
> +	 * Read the data, update the cache and notify a waiter of this event.
> +	 */
> +	val =3D readl(pvt->regs + PVT_DATA);
> +	WRITE_ONCE(pvt->data_cache, FIELD_GET(PVT_DATA_OUT, val));
> +	complete(&pvt->conversion);

[Severity: Medium]
Does this unconditionally process the interrupt without checking if the dev=
ice
actually generated it?

If a spurious interrupt occurs, the ISR will prematurely clear the interrup=
t,
read whatever stale value is in PVT_DATA, and call complete(&pvt->conversio=
n).
This will cause the waiting thread in eic7700_pvt_read_data() to wake up ea=
rly
and return stale or garbage data to userspace.

Should the ISR read the status register and return IRQ_NONE if its device d=
id
not assert the interrupt?

[ ... ]

> +	ret =3D eic7700_pvt_request_irq(pvt);
> +	if (ret) {
> +		if (!IS_ENABLED(CONFIG_PM))
> +			clk_disable_unprepare(pvt->clk);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +
> +	ret =3D devm_add_action_or_reset(pvt->dev, eic7700_pvt_disable_pm_runti=
me,
> +				       pvt);

[Severity: High]
Can this devres setup lead to accessing unclocked registers during device
removal?

Because devres executes teardown callbacks in reverse order of their
registration, eic7700_pvt_disable_pm_runtime() will run before the IRQ
is freed by devm_request_threaded_irq()'s teardown.

During removal, eic7700_pvt_disable_pm_runtime() disables the clock:

eic7700_pvt_disable_pm_runtime() {
    ...
    if (!pm_runtime_status_suspended(pvt->dev)) {
        clk_disable_unprepare(pvt->clk);
        pm_runtime_set_suspended(pvt->dev);
    }
}

If an interrupt fires concurrently and the ISR executes past the
pm_runtime_get_if_active() check before the clock is disabled, the ISR
will attempt to access hardware registers while unclocked, which can lead
to an external abort or kernel panic:

eic7700_pvt_hard_isr() {
    ...
    eic7700_pvt_update(pvt->regs + PVT_INT, ...);
}

Should the PM runtime cleanup action be registered before the IRQ is reques=
ted?

> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Can't register PM cleanup\n");
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611090505.734-=
1-hehuan1@eswincomputing.com?part=3D2
