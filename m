Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E03D413C
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 02:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600804; cv=none; b=RnSEYIm5aO9G2BUfUfEPMCFNsIDPevlRHvzfs86kARAWgNEdPUYbKYudJjeByJZyazLlD5z88qs20ePPFQW4jx0eCg6ahs3pWOt+V57uVUWEj0KQbhuCHLsHdtrUvHMR3Owryn5ilGGvF4v3BnDj0j1mtxYOAewqw8GzSSL4ieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600804; c=relaxed/simple;
	bh=o2qtm15MRkopgkFf8mT1xxQrtECKHdDbEBhGwmoPcYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q2LaqVgOQcVmUxKDENCTQS/NYXetRE7xNck8S+ZE2NhxUzXtJzgld75KGksItIU5IKwYz8cZRTWuCq7ru8YTOq5PUnSl4LNIGIsSMYC/J2CtUOOwwfwT8vo8ohxYekV1H5vnscRCs0r9uUCpykz3VwhLKgSN2Hb6DkUm39inCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRvBfHVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRvBfHVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845E31F000E9;
	Tue, 21 Jul 2026 02:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784600802;
	bh=UlhNMMxzHQrm5S99M5zO0VAwoGkHkHhYD576hxdUit0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YRvBfHVx45UZu9l1X1qt2hp/lfKt+qWcPRfXTQlm01G+0yhNMr4vfBtdqb+C+g060
	 acCcXY9xZvPnpHAudqUQHfpWSXDSEk2ecM//Xjoyq+i2Kg28pgn19x2IgxI1Ank33Q
	 CJKptA9zspQhbNGO3elR81GYBvgM2gXbI5OkzQGdYktjFrVykI4I+1vHH0ivQKpgQz
	 rxw2k+4Ls/LUFuof2GHaL7m0wypn9NZKinicdbrs+DEB4OnzJzsJg+M+ECndQoqfS8
	 PmstKINv4XtlhO9JVoomhSPNDVE32i72LaS5pFQzwDtTyGX8ME3gdTVKRSJvjgqvDm
	 rffTmirTANoaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <c8f4fbc1d8c3b1d161c94f66feb2ebbc038dab6d.1784599864.git.tze.yee.ng@altera.com>
References: <cover.1784599864.git.tze.yee.ng@altera.com>
 <c8f4fbc1d8c3b1d161c94f66feb2ebbc038dab6d.1784599864.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:26:42 +0000
Message-Id: <20260721022642.845E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver converts a timeout condition into an infinite wait on e=
rror paths, causing the calling process to hang in an unkillable D-state if=
 the firmware fails to respond or drops the request.
--

--- Patch [2]: [PATCH v7 2/2] hwmon: add Altera SoC FPGA hardware monitorin=
g driver ---
commit 0a6e38858fabeb08e3528c04db8dd1a253733f50
Author: Tze Yee Ng <tze.yee.ng@altera.com>

hwmon: add Altera SoC FPGA hardware monitoring driver

This commit adds a hardware monitor driver for Altera SoC FPGA devices
using the Stratix 10 service layer. Sensor channels are selected based
on the service layer compatible string.

> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/socfpga-hwmon.c

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
> +	ret =3D wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
> +	if (!ret) {
> +		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
> +		/*
> +		 * stratix10_svc_done() stops the worker but does not flush
> +		 * svc_fifo. Wait for the outstanding callback before stopping
> +		 * so a leftover request cannot complete a later sensor read.
> +		 * Discard the late result and still report -ETIMEDOUT.
> +		 */
> +		wait_for_completion(&priv->completion);

[Severity: High]
Does this unconditional wait_for_completion() cause the reading process to
hang indefinitely in an unkillable D-state?

If the firmware fails to respond, or if the underlying service thread recei=
ves
a busy or rejected status from the firmware during the SMC call, the service
thread skips invoking the receive_cb callback entirely.

Because the callback is never invoked in these failure modes,
wait_for_completion_timeout() correctly expires. However, the subsequent
wait_for_completion() then blocks forever while the process still holds
priv->lock, deadlocking all future sensor reads for the device.

> +		ret =3D -ETIMEDOUT;
> +		goto status_done;
> +	}
> +
> +	ret =3D priv->last_err;
> +
> +status_done:
> +	stratix10_svc_done(priv->chan);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784599864.gi=
t.tze.yee.ng@altera.com?part=3D2
