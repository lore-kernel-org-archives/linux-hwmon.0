Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083F367F48
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787317; cv=none; b=cEyyt36q1JEQBW0RRBDPIl6A8MbyBWOXY8KIeYZeISZnTDP4zQiJw+5hhKyRiQmVNfRvHdHcUajHmwsB4z1fqbv+cZC1HngcgLVqTwQKVRrzUHY2wFJ1m+a66IBIWeQpnKwTEhIeU2CkVLJgVvSRXhw6QFVIgOUDCMRdyL0rWAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787317; c=relaxed/simple;
	bh=DJWg6i9DE0m8GO5eekxnXvdRpFxQZRk6q4zTYswIC4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HSGgs3Jplku6Du1smPbFcw3j5BByOMuMOJzwiA8MzRbFmnmFHCJ8pkSCrZ0MO+wf8brzaxjvsHNjpfPsANSUTUpqTXj9mPrfRlC4ppzs6H5LbRBZF74TtMn3zbSRy3BPlZ+/w5HGlD8T6YkBtphfll40MIwUCGc4k/VZ0RukQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gk143dB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gk143dB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA0E1F000E9;
	Thu, 23 Jul 2026 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784787316;
	bh=mWViNt0xKU9C9hlnuIN3YFV2NVQVl4CfrNYuft/Icq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gk143dB0lORxpuN9T2mjKhFbA+hDf7fW166JZOEWGL8+EJn++BFxKt1GwgyblGEqo
	 Q3dj2ETPCGLNmbTYu16t6SZT2yYWoS+C+05wwHMDtfV+4lelV85k2v1LJpglqjiXEX
	 nEUGJXH6H9KUoRNo6MOUML4tCw5sTEBOM0VKTsTS279cA2Or6Krn+WWvy+mB15pyd0
	 WiRqT9dMdmkOE/mfNPeJLVkevv7as1L9GrfNy34oXdZ8YFAsV7E31F+3XiiY5gIU6t
	 rwzcbXYmwVIecdkzFls3YskWj+0lf7JBAULSikelMuH+dEVSHkqd+ZWf1T76Ut7x5D
	 g1Xl87DELsTNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <d29d05f8bc25a89a0dbf59c8a0bb705f676a58a0.1784785709.git.tze.yee.ng@altera.com>
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <d29d05f8bc25a89a0dbf59c8a0bb705f676a58a0.1784785709.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 06:15:03 +0000
Message-Id: <20260723061515.BAA0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Timeouts in both synchronous and asynchronous read paths abandon p=
ending requests without flushing queues or canceling them, causing permanen=
t data desynchronization or hangs for subsequent reads.
--

--- Patch [2]: [PATCH v8 2/2] hwmon: add Altera SoC FPGA hardware monitorin=
g driver ---
commit 467543c9f9e3893d8c84995c5e7bc8bab31dfb20
Author: Tze Yee Ng <tze.yee.ng@altera.com>

hwmon: add Altera SoC FPGA hardware monitoring driver

This commit adds a hardware monitoring driver for Altera SoC FPGA devices
using the Stratix 10 service layer. It supports temperature and voltage
sensors based on the service layer compatible string.

> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> new file mode 100644
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
> +			/* still in progress */
> +		} else if (status < 0) {
> +			ret =3D status;
> +			break;
> +		} else if (status =3D=3D 0) {
> +			ret =3D 0;
> +			break;
> +		}
> +		usleep_range(HWMON_RETRY_SLEEP_US, HWMON_RETRY_SLEEP_US * 2);
> +	}
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to get async response\n");
> +		goto done;
> +	}
[ ... ]
> +done:
> +	stratix10_svc_async_done(priv->chan, handle);
> +	return ret;
> +}

[Severity: High]
If the polling loop times out, this calls stratix10_svc_async_done() which
immediately frees the job ID via ida_free().

Since the firmware might still be processing this request, could the next
async read reuse this job ID and intercept the delayed completion of this
timed-out request?

[ ... ]
> +static int socfpga_hwmon_sync_read(struct device *dev,
> +				   enum hwmon_sensor_types type,
> +				   struct stratix10_svc_client_msg *msg)
> +{
[ ... ]
> +	ret =3D wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
> +	if (!ret) {
> +		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
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

[Severity: High]
If wait_for_completion_timeout() times out, this calls stratix10_svc_done(),
which stops the worker thread via kthread_stop() without flushing the pendi=
ng
message from the channel's svc_fifo.

If the worker thread evaluates kthread_should_stop() before dequeuing the
message, will the stale message stay in the queue?

If so, could the next read spawn a new thread that dequeues the stale messa=
ge
and returns wrong data (like returning a voltage reading for a temperature
request)?

Also, if the worker thread is stuck inside the SMC call, won't kthread_stop=
()
block indefinitely, hanging the reader process?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784785709.gi=
t.tze.yee.ng@altera.com?part=3D2
