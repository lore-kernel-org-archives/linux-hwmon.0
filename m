Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D128233943
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518598; cv=none; b=GWXYN5CpaQdFwOPpkF9RAXTcPHAXIpHDXShIc0+h1w2SsvlJDF9jzGWd89Zm3GsCu1BzEEV23hkxmEq/ilP25gVHJxM48OiYMHaLBqVRttcikPEcghrbuT4TOh+3iCNyuB9l7SwOOcDFxFIrS3UZfJ5dsu55RHFsqvAHmbvBldA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518598; c=relaxed/simple;
	bh=5uUnb4bE6lPF77zfOhBByE6lviiA+bke4gO2J7nr9sE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q1RZDeaCi5lvw5e1G+/R/bPOTpLhIq7OoTx+mBU+O1tMa0kTLoRPBNRX4VWVK+zHlrZvazgQNZOEWdEZM7LUCQzNKv/T3AedmWfz3nV3M+yQagy4vWkMfUKUrKCaWJRSH3o6mDJYZ5htqiFYFd9nwiXgn3oL+3Sj0j3QSGAja4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeWsHI8x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeWsHI8x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08491F000E9;
	Mon, 20 Jul 2026 03:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518596;
	bh=Or2g76TUWiid7Cqy8Ubi747lebIkiNYW2pX4ITs3RqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CeWsHI8xbaXdQiH5EmOJp5nnAS8mzlFaUDZk5olvC2W3enz+2IaaxNQ8TOiKN+zeO
	 1qNxEslxFcxNnX4H17O9779KyZeqFWHOdwR5dONfDTAR6NNsOSciwvrlQ//h9d0PgL
	 nymNW4Xjr3K4oTJvaojiF4X7SDmII+dtBjaO4usY9x0L//r5o9jUh2TJ/aIiKY8Kgv
	 Ihblo6ePVkUBy94e87jau9XivZ6qcQ4IkZ3LEyOHX/QIcZIQcp0fBnT4NhncWJ5ptx
	 pu5FqDZc7EnasPEQnmgdj5Fq8tr8rlyvkn/9KCBHldsbjIp6nXQLR3sq/86+ds5FmT
	 7s9sCtP1bDQGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <a686d2c3ef56a3ce28b059621a237259af314032.1784516953.git.tze.yee.ng@altera.com>
References: <cover.1784516953.git.tze.yee.ng@altera.com>
 <a686d2c3ef56a3ce28b059621a237259af314032.1784516953.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:36:36 +0000
Message-Id: <20260720033636.A08491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing break in async poll loop causes severe kernel log spam and=
 unnecessary blocking on hard errors.
- [High] Synchronous read timeouts leave stale requests in the channel FIFO=
, causing all subsequent reads to process stale data and return mismatched =
sensor values.
--

--- Patch [2]: [PATCH v6 2/2] hwmon: add Altera SoC FPGA hardware monitorin=
g driver ---
commit ab6c0c0f95d3890d759e04d9d9aecd151d6406fd
Author: Tze Yee Ng <tze.yee.ng@altera.com>
Subject: hwmon: add Altera SoC FPGA hardware monitoring driver

This commit adds a hardware monitoring driver for Altera SoC FPGA devices u=
sing
the Stratix 10 service layer.

> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> new file mode 100644
> index 0000000000000..72418201b65d6
> --- /dev/null
> +++ b/drivers/hwmon/socfpga-hwmon.c
[ ... ]
> +static int socfpga_hwmon_async_read(struct device *dev,
> +				    enum hwmon_sensor_types type,
> +				    struct stratix10_svc_client_msg *msg)
> +{
[ ... ]
> +	ret =3D -ETIMEDOUT;
> +	while (!time_after(jiffies, deadline)) {
> +		status =3D stratix10_svc_async_poll(priv->chan, handle, &data);
> +		if (status =3D=3D -EAGAIN) {
> +			dev_dbg(dev, "Async message is still in progress\n");
> +		} else if (status < 0) {
> +			dev_alert(dev, "Failed to poll async message: %d\n", status);
> +			ret =3D -ETIMEDOUT;

[Severity: High]
Does this loop need a break statement here when status < 0?=20

If stratix10_svc_async_poll() returns a hard error, the code sets=20
ret =3D -ETIMEDOUT but continues to loop for up to 2 seconds. This could
flood the kernel log with dev_alert() messages on every 1ms retry.

> +		} else if (status =3D=3D 0) {
> +			ret =3D 0;
> +			break;
> +		}
> +		msleep(HWMON_RETRY_SLEEP_MS);
> +	}
[ ... ]
> +static int socfpga_hwmon_sync_read(struct device *dev,
> +				   enum hwmon_sensor_types type,
> +				   struct stratix10_svc_client_msg *msg)
> +{
[ ... ]
> +	ret =3D stratix10_svc_send(priv->chan, msg);
> +	if (ret < 0)
> +		goto status_done;
> +
> +	ret =3D wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
> +	if (!ret) {
> +		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
> +		ret =3D -ETIMEDOUT;
> +		goto status_done;

[Severity: High]
If a timeout occurs here, could the unfulfilled request remain in the
SVC channel's FIFO?

When the timeout hits, this path calls stratix10_svc_done() which stops the
worker thread, but it doesn't appear to remove the request from chan->svc_f=
ifo.

Would the next sensor read enqueue a new request and receive the stale data
from this timed-out request, permanently desynchronizing all subsequent
sensor readings?

> +	}
> +
> +	ret =3D priv->last_err;
> +
> +status_done:
> +	stratix10_svc_done(priv->chan);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784516953.gi=
t.tze.yee.ng@altera.com?part=3D2
