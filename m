Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE135E937;
	Fri, 19 Jun 2026 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781870110; cv=none; b=XOLUcLzAzyIF+o99M7o8beKatFmGjkoG2hUiIAoYCyxEebUo+FP2Pxx1jfhYoQX0b2+/oxFsvLPeTBXEVbZd9j/T3+OYHWVccOazqhOkiwMydI1Y/8p3BcjCLeUJfqo0VB1ufox4+Vqlz56HYB+bzw8qSrbFI5OsdTspmHG4Lpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781870110; c=relaxed/simple;
	bh=KE8S8l1lDv25HI792aYMZQwO68tcN1aDY/K0o470h6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7yvR8sK1QlNxZ92WTWKNwwvUPML53gtzMPaVZwNgom/aq7Fb0ZGGdzHvex/PINifIhZvn6/xz6ibdRCV1+20YF1B0TEF0XahI+1Thhm+4D7+AtdUDKlgzqVyADfr9T0wlXyMC3poY2auv/hnRiXoLiZnrxn0LaaAwA7st/yxK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJa7fI+T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJa7fI+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601D21F00A3D;
	Fri, 19 Jun 2026 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781870108;
	bh=qVIOJZ4fN8Xgxy0kWf2sWG0eFQFB1h2eq/cTGPl9qYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJa7fI+TOP+bV1IGEzGq46vgzfePiyzyZSal/sODxnW3hFpA37o4Yuz52+qZwJRXg
	 QiCPwdgBHd0k6Jcueq1cJVJIZEdzMIczbTWqtFCzw9lHK4u34DxNPh46GHn1yK2g/Q
	 blnDdwgwGIaBjVi/4TB8LY/o250FSbi9HZ8/gaZBmUvcBrTPQMLzB3NZVpw9N8yJk6
	 3YaaoDA91vX5jMiIy92cKJInra7trrsxaeKvLNXy2UWWqcfxbsW5jwp+PijDu97bBx
	 XwHsJaFAsOZebvj4Z9vg8RtpC5CtWNr/K7PLYO5jjP5XjxwOGgo923kXNFjiRh/Wji
	 zeTaDaaP2J38g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] hwmon: add Stratix 10 SoC FPGA hardware monitor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <081650bc4d92e9497b7a5a926e79a067cca3519f.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <081650bc4d92e9497b7a5a926e79a067cca3519f.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 11:55:07 +0000
Message-Id: <20260619115508.601D21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Use-After-Free due to improper devm lifecycle management during mo=
dule removal.
- [High] Negative temperatures are miscalculated as massive positive values=
 due to an implicit unsigned arithmetic promotion.
- [High] Synchronous read timeouts abandon requests in the FIFO, permanentl=
y desynchronizing responses.
- [Medium] Synchronous reads silently mask hardware failures and return sta=
le sensor data instead of errors.
- [Low] Improper initialization of a stack-allocated completion variable.
- [Low] Incorrect error code returned for hardware failure.
--

commit 6b98d9d7f6f87d18500b9518e6aa77d54c53dc50
Author: Tze Yee Ng <tze.yee.ng@altera.com>
Subject: hwmon: add Stratix 10 SoC FPGA hardware monitor driver

This commit adds a hardware monitoring driver for Altera Stratix 10 SoC FPGA
devices. It supports reading temperature and voltage sensors via the Stratix
10 service layer. The driver defaults to asynchronous interfaces but falls
back to synchronous reads if necessary.

> diff --git a/drivers/hwmon/stratix10-hwmon.c b/drivers/hwmon/stratix10-hw=
mon.c
> new file mode 100644
> index 0000000000000..7ed1116e57b87
> --- /dev/null
> +++ b/drivers/hwmon/stratix10-hwmon.c
> @@ -0,0 +1,575 @@

[ ... ]

> +#define STRATIX10_HWMON_ATTR_VISIBLE	0444
> +/* Temperature from SDM is signed Q8.8 millidegrees Celsius (8 fractiona=
l bits). */
> +#define STRATIX10_HWMON_TEMP_FRAC_BITS	8
> +#define STRATIX10_HWMON_TEMP_FRAC_DIV	BIT(STRATIX10_HWMON_TEMP_FRAC_BITS)
> +/* Voltage from SDM is unsigned Q16 (millivolts, 16 fractional bits). */

[ ... ]

> +static int stratix10_hwmon_parse_temp(long *val, u32 temperature)
> +{
> +	switch (temperature) {
> +	case ETEMP_INACTIVE:
> +	case ETEMP_NOT_PRESENT:
> +	case ETEMP_CORRUPT:
> +	case ETEMP_NOT_INITIALIZED:
> +		return -EOPNOTSUPP;
> +	case ETEMP_TIMEOUT:
> +	case ETEMP_BUSY:
> +	case ETEMP_TOO_OLD:
> +		return -EAGAIN;
> +	default:
> +		/* Convert Q8.8 millidegrees Celsius to millidegrees for hwmon. */
> +		*val =3D (long)(s32)temperature / STRATIX10_HWMON_TEMP_FRAC_DIV;

[Severity: High]
Will negative temperatures be miscalculated as massive positive values here?

The macro STRATIX10_HWMON_TEMP_FRAC_DIV is defined using BIT(), which expan=
ds
to an unsigned long literal.

When dividing a signed long by an unsigned long, C promotion rules convert
the signed operand to unsigned. This means a negative temperature is conver=
ted
into a huge positive integer prior to division, entirely corrupting the
resulting sensor reading.

[ ... ]

> +static int stratix10_hwmon_async_read(struct device *dev,
> +				      enum hwmon_sensor_types type,
> +				     struct stratix10_svc_client_msg *msg)
> +{
> +	struct stratix10_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct stratix10_svc_cb_data data =3D {};
> +	struct completion completion;
> +	unsigned long wait_ret;
> +	void *handle =3D NULL;
> +	int status, index, ret;
> +
> +	init_completion(&completion);

[Severity: Low]
Should this use init_completion_onstack() instead?

Initializing a stack-allocated completion with init_completion() can trigger
false positive circular locking dependency warnings from lockdep.

[ ... ]

> +	if (ret) {
> +		dev_err(dev, "Failed to get async response\n");
> +		goto done;
> +	}
> +
> +	if (data.status) {
> +		dev_err(dev, "%s returned 0x%x from SDM\n", __func__,
> +			data.status);
> +		ret =3D -EFAULT;

[Severity: Low]
Is -EFAULT the correct error code here?

In the kernel, -EFAULT typically denotes a bad user-space memory address.
Returning it for a hardware or firmware failure incorrectly implies that
user-space passed a bad pointer to a syscall. A more standard error code
such as -EIO or -ENODATA might be more appropriate.

> +		goto done;
> +	}

[ ... ]

> +static int stratix10_hwmon_sync_read(struct device *dev,
> +				     enum hwmon_sensor_types type,
> +				    struct stratix10_svc_client_msg *msg)
> +{
> +	struct stratix10_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	reinit_completion(&priv->completion);
> +
> +	if (type =3D=3D hwmon_temp)
> +		priv->client.receive_cb =3D stratix10_hwmon_readtemp_cb;
> +	else
> +		priv->client.receive_cb =3D stratix10_hwmon_readvolt_cb;
> +
> +	ret =3D stratix10_svc_send(priv->chan, msg);
> +	if (ret < 0)
> +		goto status_done;
> +
> +	ret =3D wait_for_completion_interruptible_timeout(&priv->completion,
> +							HWMON_TIMEOUT);
> +	if (!ret) {
> +		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
> +		ret =3D -ETIMEDOUT;
> +		goto status_done;
> +	}

[Severity: High]
Does a timeout here permanently desynchronize responses?

The timeout path abandons the unread request in chan->svc_fifo without
flushing it.

When a subsequent sysfs read triggers a new request, a new kthread is spawn=
ed
and immediately pops the abandoned request off the queue. When the response
arrives, the driver signals the new read's completion with the old read's
data, permanently shifting all subsequent reads.

> +	if (ret < 0) {
> +		dev_err(priv->client.dev, "error %d waiting for SMC call\n", ret);
> +		goto status_done;
> +	}
> +
> +	ret =3D 0;
> +
> +status_done:
> +	stratix10_svc_done(priv->chan);
> +	return ret;
> +}

[Severity: Medium]
Could this silently mask hardware failures?

If the transaction completes but the hardware rejects the command,
stratix10_hwmon_readtemp_cb() logs an error without modifying the cached
temperature or storing an error state.

This function then unconditionally returns 0 (success), causing the driver
to return the previously cached stale sensor value to user-space instead
of returning an error code.

[ ... ]

> +static void stratix10_hwmon_remove(struct platform_device *pdev)
> +{
> +	struct stratix10_hwmon_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	if (priv->async)
> +		stratix10_svc_remove_async_client(priv->chan);
> +	stratix10_svc_free_channel(priv->chan);
> +}

[Severity: High]
Can this result in a use-after-free crash during module unbind?

The sysfs attributes are registered using
devm_hwmon_device_register_with_info(), so they are removed by devres only
after this remove function returns.

Freeing the SVC channel manually here creates a race condition window where
the sysfs files are still active and readable, but the backend channel has
been destroyed. A concurrent sysfs read during driver unbinding will access
the freed channel.

Should the channel teardown be deferred using devm_add_action_or_reset()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D4
