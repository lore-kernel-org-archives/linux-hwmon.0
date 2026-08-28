Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB437A4AF
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914903; cv=none; b=egcCgGSje6qYIAf76dxvMSn9V+ktCYms0HDx2jNQ8RZE0+mUSp6Y3URxHrERSfvbY4mgMcir1CoNHdl81PkIyHKpSbR0ova+EqkWfPzcdk2mZHBkf5k2w1bxY1PvYNIXHxThXtAB9ojkWoOWsyCOxbwMd7F8GvYMS/Z9RxMGhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914903; c=relaxed/simple;
	bh=F8PrNUFHFcSCvqgJ+WiSs02kf8tPOtwQBftONOH1rWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SWwmBKPJUjsF1NVYZ/9MPGpZAu3sYrD68wJZGQNT3JQLYe3cXvRWqrNfvk5VmCZz4jfTidrTvM3iVWVYpo78FUWlVA8T9dVbC2K96peVZJR9SwepaiUN9ZvcWCI7k5/CZyqkWSKot2d7Dtmxi2o1GAmOcU/1iSTatTanO6+DuZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUcoz3pk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUcoz3pk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725E61F000E9;
	Fri, 28 Aug 2026 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787914902;
	bh=vNpXeHhtpy14F7A5QgqMBIPx3+syZJ4cidoJ1fm5EP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUcoz3pkn8WGXstlPaLej8jbp1ozQUpmhA84FV4zsgkfqeu9EjyjlfoYxWFGgHqCA
	 iuV3ktHlZZ9FW2xsWkTfSHVZRaJQT/hxtURk5DYQmaPDQIHvImuL0JePIxKqMaH/gh
	 chlhALugGbfSNIxJH1mFcHrdQSTf7r5xddJa/fpWKKns/l//FHmsOF0eikY1BvsOsK
	 nyDCQQZ/dTzdZx45KFItXA1TvZGWZILuJY1/tIXpcEDqm23f0ZPDiu4YQu07+qeE/T
	 DngZixoMAKWAr76ms272L1CNwITXqmN98XJbl44KfvQvWJMbUHQXMXa3AooKWu6xZK
	 fJTC4ciEUYiRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260828105018.2392383-1-congnt264@gmail.com>
References: <20260828105018.2392383-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 11:01:41 +0000
Message-Id: <20260828110142.725E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Converting to `devm_pm_runtime_enable()` and placing it at the end=
 of `probe()` incorrectly reverses the teardown order, causing PM runtime t=
o be disabled too early. This leads to a regulator enable count leak and ex=
poses a sysfs race condition on driver unbind.
--

commit 728a875c515df8244bd554b338f4f008d88b3b9e
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans

This commit changes the driver to use devm_pm_runtime_enable() during probe
and removes the manual pm_runtime_disable() from gpio_fan_stop(). This ensu=
res
PM runtime is automatically disabled on unbind, fixing an imbalance for
alarm-only fans.

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e2817..0bd5561b7a405 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
>  	mutex_lock(&fan_data->lock);
>  	set_fan_speed(data, 0);
>  	mutex_unlock(&fan_data->lock);
> -
> -	pm_runtime_disable(fan_data->dev);
>  }
> =20
>  static int gpio_fan_probe(struct platform_device *pdev)
> @@ -581,7 +579,9 @@ static int gpio_fan_probe(struct platform_device *pde=
v)
>  	}
> =20
>  	pm_runtime_set_suspended(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	err =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (err)
> +		return err;

[Severity: High]
Does moving the pm_runtime_disable() action to the end of probe reverse the
teardown order in a way that breaks unbind?

Because devm unwinds in LIFO order, registering devm_pm_runtime_enable() at
the end of gpio_fan_probe() means pm_runtime_disable() will execute first
during unbind. The cleanup action for gpio_fan_stop() is registered
earlier in probe via devm_add_action_or_reset(), so it will execute after
PM runtime has already been disabled.

When gpio_fan_stop() calls set_fan_speed(..., 0), it invokes
pm_runtime_put_sync(). Since PM runtime is already disabled, this will
fail with -EACCES. This bypasses the runtime suspend callback, leaving the
hardware regulator permanently enabled and causing a regulator enable count
leak.

>  	/* If current GPIO state is active, mark RPM as active as well */
>  	if (fan_data->speed_index > 0) {
>  		int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828105018.2392=
383-1-congnt264@gmail.com?part=3D1
