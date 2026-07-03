Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58930B53F
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Jul 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066730; cv=none; b=MR6LLNznWxmbpPWp7Nm5Fcp/eVzo967dtVXSk6wutnN3AbaUdz9UAKZBb6XReq5T0BNvoawvh+eev8oUz/cS8NxoV0efl5/4FBkH5/40iIIfO9Uy3FKuO4ftFyft8VpANZeRWqOLkzryFxdPLnS2ctGa3Rpx0glBJOxwytWEELU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066730; c=relaxed/simple;
	bh=DgsyayS14Wyzyh9cigYpMcprVsGbNGuCtkPQ97VuSJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n74SBfsDxbqj0Yxai8AQLQrsHKyA6I7XMuNBjta7nqTL9AseNyp1cwbhmCihskI97KelPF9L9j+NiwrTpNGVwpBHxz1KWxmbH6eEmPSth/wH0OoJnt+HKyjSzDarfwToMf7MDhHcNSeLy1RBak2iH0omUoRbAkQiojtyQZsbkTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKHEKSvZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKHEKSvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A831F000E9;
	Fri,  3 Jul 2026 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066728;
	bh=iCMzOczFXytZG1MiUv938S0tahCb/wRo3kTrpS1fy2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKHEKSvZbq8vNdWqPCZvvepLQtQEZerSdyea97UREmXzL6d95aZDxbvbXhgawqY1a
	 agVOojODqFQTNqLHftHT63twq7jUZg45KoSHWN9aQejArCSpDZwQeoWJbd7j4JWkf4
	 VdjSo8TyafQu4vhlDWpnMAllqL4aHo+evifRZ4f2zoDPeGqOU40no130/VdBkKWVr9
	 DSKRL8A4g0Yu2XLAtl6RhxX8OQr7+irtex/qzqdtn7yArvHwIxUJ2SVoMgaiN40E78
	 0ABdwsoL9GD6BpclBvVXu6s/PuvCAAkHlCS2Dv2WLC/9DkaX86qwFDpNfBwUaMqJZM
	 jk5QMFzDWKxOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <577acf0d5355db7d9b73c78e142649aefaf92d28.1783062999.git.tze.yee.ng@altera.com>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
 <577acf0d5355db7d9b73c78e142649aefaf92d28.1783062999.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 08:18:48 +0000
Message-Id: <20260703081848.C5A831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect devm registration order causes a Use-After-Free vulnerab=
ility during device unbind or probe failure.
- [Medium] Unreferenced `completion` causes a guaranteed maximum timeout de=
lay on every asynchronous sensor read.
--

commit 9e088a070299b309352aa9a88006e3927d0c50bd
Author: Tze Yee Ng <tze.yee.ng@altera.com>

hwmon: add Altera SoC FPGA hardware monitoring driver

Add a hardware monitor driver for Altera SoC FPGA devices using the Stratix=
 10
service layer. Sensor channels are selected based on the service layer
compatible string.

> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/socfpga-hwmon.c
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
> +						  NULL, NULL);
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
> +	/*
> +	 * The service layer never invokes the async callback, but wait
> +	 * before polling anyway: RSU uses the same pattern and the firmware
> +	 * needs time to complete the transaction after async_send().
> +	 */
> +	wait_ret =3D wait_for_completion_io_timeout(&completion, HWMON_TIMEOUT);

[Severity: Medium]
Will this cause a guaranteed timeout delay on every sensor read?

In socfpga_hwmon_async_read(), a local completion is initialized but is
never passed to any asynchronous function or callback (the function
stratix10_svc_async_send() receives NULL for the callback).

Because the completion can never be signaled, the execution will
unconditionally block in an uninterruptible sleep for the entire
HWMON_TIMEOUT duration on every single sensor read. Only after this maximum
timeout expires does the function proceed to poll for the response.

> +	if (wait_ret > 0)
> +		dev_dbg(dev, "Received async interrupt\n");
[ ... ]
> +static int socfpga_hwmon_probe(struct platform_device *pdev)
> +{
[ ... ]
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
> +	ret =3D devm_add_action_or_reset(dev, socfpga_hwmon_release_svc, priv);

[Severity: High]
Does this devres registration order create a use-after-free vulnerability
during device unbind?

In socfpga_hwmon_probe(), the hwmon device is registered via
devm_hwmon_device_register_with_info() before the cleanup action
socfpga_hwmon_release_svc is added via devm_add_action_or_reset().

Because devres unwinds actions in reverse order of addition (LIFO), upon
device unbind, socfpga_hwmon_release_svc will execute first, freeing the
service layer channel (priv->chan).

However, the hwmon device will still be active and its sysfs attributes
accessible to user space during this time. A concurrent sysfs read can
invoke socfpga_hwmon_read(), which will attempt to use the already-freed
priv->chan, resulting in a use-after-free.

> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783062999.gi=
t.tze.yee.ng@altera.com?part=3D2
