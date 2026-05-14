Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524E2857EE
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 06:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739497; cv=none; b=KfWoOCMklLB4otxYNEo9beeqJqs5W4KLTTkZ31gIaqjJ+jkQfD3Avpl4WJl6VNKdBen3Z7i3VCBJCRwuCPH+qJap3wk6JeXsNsb5T2ssO89NNEiT3bk8En+j+M7KN8h8kMcAJBEtvbU2ub8AStRhg8CQ1l2IbGvklSee93GPht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739497; c=relaxed/simple;
	bh=qc2Regf4nWSwFLUT5KladB5dyvaD7UUFFunvcJiXPDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMH6uJ7gZFN9tnwbRUK0Xs+z7d+UjwLVh5FrlFdCR0k8FcxgtqBxNUXdtXbvvV1rRSJjSE3h45JcjRUOz5y+kI5ztuhLpLIPQgJ30haLIL5Lwd6gW7wdUnxRYSNGXKC3J2G/eSibOKnVp/ywRRLV9vn3jd1ytFHiJGw0mn3e8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERgZ4DkW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERgZ4DkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270BDC2BCC9;
	Thu, 14 May 2026 06:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778739497;
	bh=qc2Regf4nWSwFLUT5KladB5dyvaD7UUFFunvcJiXPDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ERgZ4DkWS5R+/jwBqM7sB/iDuHNQg7P/RTWHX4sG+OIwfISqIyWmIv04SYNbIxyy+
	 WBiUGe87oqBvAPbMYrpq/79PAmT1Tc5YrtoI3Sl+rGIvGj4fNAwWDZ+ViEsWIRRbKf
	 Hdn/hfl0E0bVEnQqtaWPN8YVxB4AVz6ufB0uJK/HEpc1dWG7Wtr5AZfBRIwNpVRU0J
	 dayLslYSWPyV1woJj9GWdWssWaeex9olZRA3chbQou06lbLUspCadZzG8qVeVkFa6R
	 rM2DinorW/ysCHD1YAEdS6qOJvYri/poN+8uVGMvc0obgbyezxsrDi6zt0JmMtWXZH
	 0WnvInG8qjbuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] hwmon: (lm90) Use guard() to acquire subsystem lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513142514.419345-3-linux@roeck-us.net>
References: <20260513142514.419345-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:18:16 +0000
Message-Id: <20260514061817.270BDC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Devm registration ordering causes a Use-After-Free of `data->hwmon=
_dev` if delayed works run during driver removal.
- [High] Modifying `data->config` in `lm90_alert()` without holding `hwmon_=
lock` creates a data race with sysfs operations.
--

commit 7118ba7da109d5ac53da9e4739a437d57be7a2f6
Author: Guenter Roeck <linux@roeck-us.net>
Subject: hwmon: (lm90) Use guard() to acquire subsystem lock

This commit converts the lm90 driver to use the scope-based guard() macro
for acquiring and releasing the hardware monitoring subsystem lock, replaci=
ng
the explicit hwmon_lock() and hwmon_unlock() calls.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 3c10a5066b53d..9ca49abc1a93a 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1222,13 +1222,8 @@ static int lm90_update_alarms_locked(struct lm90_d=
ata *data, bool force)
> =20
>  static int lm90_update_alarms(struct lm90_data *data, bool force)
>  {
> -	int err;
> -
> -	hwmon_lock(data->hwmon_dev);
> -	err =3D lm90_update_alarms_locked(data, force);
> -	hwmon_unlock(data->hwmon_dev);
> -
> -	return err;
> +	guard(hwmon_lock)(data->hwmon_dev);

Can this cause a use-after-free of data->hwmon_dev if the delayed works
run during driver removal?

This is a pre-existing issue, but looking at lm90_probe(), the devm action
to cancel the alert_work and report_work (lm90_restore_conf) is registered
in lm90_init_client() before devm_hwmon_device_register_with_info() is call=
ed.

Because devm executes cleanup actions in reverse order during module
unbind or probe failure, the hwmon device is unregistered and freed first.

If lm90_alert_work() or lm90_report_alarms() runs in the window between
the hwmon device being freed and the delayed works being cancelled,
lm90_update_alarms() will dereference the freed data->hwmon_dev here.

Is there also a data race when modifying data->config in lm90_alert() witho=
ut
holding the subsystem lock?

This is another pre-existing issue. lm90_alert() executes in the smbus alert
context and calls lm90_update_confreg() to disable the hardware alert line,
without acquiring hwmon_lock.

Concurrently, sysfs write operations (such as lm90_write_convrate) hold
the hwmon_lock, temporarily modify data->config, and then restore it.

If an alert interrupt occurs concurrently with a sysfs write, the sysfs
path will overwrite the alert handler's modifications to data->config
and the hardware register.=20

This unintentionally re-enables the hardware alert line while the alarm is=
=20
still active, causing an interrupt storm.

> +	return lm90_update_alarms_locked(data, force);
>  }
> =20
>  static void lm90_alert_work(struct work_struct *__work)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513142514.4193=
45-1-linux@roeck-us.net?part=3D2
