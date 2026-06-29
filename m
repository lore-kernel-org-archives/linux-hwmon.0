Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A933D9DB9
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718972; cv=none; b=UVFkpaa0xwPE1qgB9BHeiWdWSaIcLuZZJjXbXeyLoABkwLhzW9MHB1/epgTOUIR3a7kyBzWGodosH9EM5xoIKv+yPO7Ta/W4YRALYkT1q6gV9ixBszM+NnwqifaXOIMv0HNxqcQHy9WmEU80YsaWvrbiTdYv+uceFRMyhXnlQas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718972; c=relaxed/simple;
	bh=3UpejLBOgMii/hPogNpNRtAPl4xGgPXtXjU7NjjtUcs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YoYr7BcS5a0TzLrOjij/+15XOQ0KDRLSbmIQ+STp76yHJug3uviLQRvSkLGvk2yYeyf18E/26GaTPktspqotkCr0++CFcR2RDd17F2wTo/zCGmCzV3TUNirK9mjXHRwSha2jG8p1ErZC0+uelRD2uOjbF2iDlnUouIEY/DSySNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ethaSz1K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ethaSz1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2759D1F000E9;
	Mon, 29 Jun 2026 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782718965;
	bh=BOLatCr//rUi/dWjWnPkCjBeEKfUAsTw5Gt8eN5zops=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ethaSz1KjfO/FaL96euxAa+XTDZmDNu3F7R+I98caMIXc3RMfA1tzh2JKj6ontp1C
	 P7S+az02CoDs+qeBBiIf2mjSOYpvvCcgx4vz0Wk6FejFKeGQtCgx/mgRX7lo3+L+GE
	 pIRI846eb2qJuK1PtoGZrJhzDqqROB/tV6FD+N7h1qMymyA9SkOqEtSiXmPb3SJq/6
	 q5aEnJEeWL2AW7RwAtE5CACXcYqXP8CmPbRGmehnFUc619qfF0g+WNYFEEK88xRDan
	 9dehMXYduCPcjOBDTmkZV8TqFThPHYD6mpCHA45oyG1JCNPqHrTetyZ0p5fmGA9d8l
	 +sOKGo0CZJXVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <793342c7e73a87484fa0e476eadc41886cc34f0d.1782715159.git.tze.yee.ng@altera.com>
References: <cover.1782715159.git.tze.yee.ng@altera.com>
 <793342c7e73a87484fa0e476eadc41886cc34f0d.1782715159.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:42:44 +0000
Message-Id: <20260629074245.2759D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Mixing devm_hwmon_device_register_with_info with manual cleanup in=
 remove() creates a Use-After-Free race condition during device unbind.
- [High] Asynchronous hardware monitoring reads always time out, introducin=
g a severe 2-second blocking delay per read.
- [High] Incorrect error code check causes probe failure on firmware lackin=
g async support instead of falling back to sync mode.
- [High] A timeout or signal interruption during a synchronous read abandon=
s a pending SMC call, causing its late response to prematurely complete and=
 corrupt a subsequent read.
- [Medium] Incorrect sign extension of Q8.8 temperature values will misinte=
rpret negative temperatures.
--

commit afeb154cb3aefd3ae7be5eaa69494d4428dd9007
Author: Tze Yee Ng <tze.yee.ng@altera.com>

hwmon: add Altera SoC FPGA hardware monitoring driver

Add a hardware monitor driver for Altera SoC FPGA devices using the
Stratix 10 service layer. Sensor channels are selected based on the
service layer compatible string.

> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> new file mode 100644
> index 0000000000000..1104b603f5b41
> --- /dev/null
> +++ b/drivers/hwmon/socfpga-hwmon.c

[ ... ]

> +static int socfpga_hwmon_parse_temp(long *val, u32 temperature)
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
> +		/* Convert Q8.8 degrees Celsius to millidegrees for hwmon. */
> +		*val =3D (long)(s32)temperature * SOCFPGA_HWMON_TEMP_MDEG_SCALE /
> +			SOCFPGA_HWMON_TEMP_FRAC_DIV;
> +		return 0;
> +	}
> +}

[Severity: Medium]
Does this correctly sign-extend negative temperatures?=20

The Stratix 10 SDM firmware returns temperature as a 16-bit signed Q8.8 val=
ue
inside a u32. Since negative values aren't sign-extended to 32 bits before
this cast (for example, -1.0 is returned as 0x0000FF00), casting directly to
s32 evaluates to 65280 instead of -256.=20

Could we cast to s16 first to ensure the sign bit is properly extended?

[ ... ]

> +static int socfpga_hwmon_async_read(struct device *dev,
> +				    enum hwmon_sensor_types type,
> +				    struct stratix10_svc_client_msg *msg)
> +{
> +	struct socfpga_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct stratix10_svc_cb_data data =3D {};
> +	struct completion completion;
> +	unsigned long wait_ret;
> +	void *handle =3D NULL;
> +	int status, index, ret;
> +
> +	init_completion(&completion);
> +
> +	for (index =3D 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
> +		status =3D stratix10_svc_async_send(priv->chan, msg, &handle,
> +						  socfpga_hwmon_async_callback,
> +						  &completion);
> +		if (status =3D=3D 0)
> +			break;
> +		dev_warn(dev, "Failed to send async message: %d", status);
> +		msleep(HWMON_RETRY_SLEEP_MS);
> +	}
> +
> +	if (status && !handle) {
> +		dev_err(dev, "Failed to send async message after %u retries: %d\n",
> +			HWMON_ASYNC_MSG_RETRY, status);
> +		return status;
> +	}
> +
> +	wait_ret =3D wait_for_completion_io_timeout(&completion, HWMON_TIMEOUT);

[Severity: High]
Does the service layer ever invoke the provided callback?

Looking at stratix10_svc_async_send() in the firmware driver, it saves
socfpga_hwmon_async_callback but it appears the service layer never actually
calls it anywhere in its execution path.

Will this cause wait_for_completion_io_timeout() to always block for the fu=
ll
2-second timeout before falling back to stratix10_svc_async_poll() below?

[ ... ]

> +static int socfpga_hwmon_sync_read(struct device *dev,
> +				   enum hwmon_sensor_types type,
> +				   struct stratix10_svc_client_msg *msg)
> +{
> +	struct socfpga_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	reinit_completion(&priv->completion);
> +
> +	if (type =3D=3D hwmon_temp)
> +		priv->client.receive_cb =3D socfpga_hwmon_readtemp_cb;
> +	else
> +		priv->client.receive_cb =3D socfpga_hwmon_readvolt_cb;
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
> +	if (ret < 0) {
> +		dev_err(priv->client.dev, "error %d waiting for SMC call\n", ret);
> +		goto status_done;
> +	}
> +
> +	ret =3D priv->last_err;
> +
> +status_done:
> +	stratix10_svc_done(priv->chan);
> +	return ret;
> +}

[Severity: High]
If this wait is interrupted by a signal, does this leave a pending firmware
response that could corrupt a subsequent read?

When stratix10_svc_done() is called on the error paths, it stops the kthrea=
d=20
but does not cancel the in-flight hardware command or flush chan->svc_fifo.

When a subsequent sensor read calls reinit_completion() and spawns a new
kthread, couldn't the old abandoned response unconditionally call the active
receive_cb and trigger a premature completion with stale data?

[ ... ]

> +static int socfpga_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device *parent =3D dev->parent;
> +	const struct socfpga_hwmon_board_data *board;
> +	struct socfpga_hwmon_priv *priv;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	if (!parent || !parent->of_node) {
> +		dev_err(dev, "missing parent device node\n");
> +		return -ENODEV;
> +	}

[ ... ]

> +	ret =3D stratix10_svc_add_async_client(priv->chan, false);
> +	switch (ret) {
> +	case 0:
> +		priv->async =3D true;
> +		break;
> +	case -EINVAL:
> +		dev_dbg(dev, "async operations not supported, using sync mode\n");
> +		priv->async =3D false;
> +		break;
> +	default:
> +		dev_err(dev, "failed to add async client: %d\n", ret);
> +		stratix10_svc_free_channel(priv->chan);
> +		return ret;
> +	}

[Severity: High]
Is this checking the correct error code for unsupported async operations?

When the firmware lacks async support, stratix10_svc_add_async_client()
returns -EOPNOTSUPP. Since this switch statement checks for -EINVAL, will
the driver fall into the default case and fail to probe entirely on
unsupported hardware instead of correctly falling back to synchronous mode?

> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "socfpga_hwmon",
> +							 priv,
> +							 &socfpga_hwmon_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		if (priv->async)
> +			stratix10_svc_remove_async_client(priv->chan);
> +		stratix10_svc_free_channel(priv->chan);
> +		return PTR_ERR(hwmon_dev);
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	return 0;
> +}
> +
> +static void socfpga_hwmon_remove(struct platform_device *pdev)
> +{
> +	struct socfpga_hwmon_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	if (priv->async)
> +		stratix10_svc_remove_async_client(priv->chan);
> +	stratix10_svc_free_channel(priv->chan);
> +}

[Severity: High]
Can this mixture of devm and manual cleanup cause a use-after-free during
device unbind?

The hwmon device is registered with devm_hwmon_device_register_with_info(),
so its unregistration is delayed until after socfpga_hwmon_remove() returns.

This allows concurrent sysfs reads to continue while socfpga_hwmon_remove()
frees the async client and channel. A concurrent socfpga_hwmon_async_read()
could then attempt to allocate from the freed achan->job_id_pool.

Should the channel cleanup be deferred via devm_add_action_or_reset() to
ensure it runs strictly after the hwmon device is unregistered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782715159.gi=
t.tze.yee.ng@altera.com?part=3D2
