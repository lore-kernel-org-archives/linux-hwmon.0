Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76593FE364
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588504; cv=none; b=pVK1NK1WnsGzsGM4G4lN2z/HPu9M86vdJxYP0IScXjX72DSV+8zgqEgBHcgKwUPmGZ86/lrWvuMfx7LRTQ3xYs6V8L0qasGDDTOcJDmxiDSwVkqtWt/qgheAILP0E90of4244FZwS8W9nG5ONCgvMLrzkTQcaf/a7J++KwD9EBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588504; c=relaxed/simple;
	bh=PpKC5B12U7uALTbWJ8U7rrdB51VVcbsLnCBxvU+LJFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bcI0McV91SEwOcEc24bNnfV+YqPz/t20JrjQp1TDrxieuZ1Z9RJg8p5nZBfUk6c8fKX7wpItVzQSImyydEr/kk+ze1KQRPi4TgW/Y7/dHCYJZiw8MDJdljEerg98js+gaCC9bFWFlRQK5a7k5mxwo2RkcXSTNov49GUinE8qETQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F67OrrsY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F67OrrsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB2A1F000E9;
	Thu,  9 Jul 2026 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588502;
	bh=5QEbEUiGZ0ARNp9A4NlvSaxpn56OLbl2NICRUwhu9YI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F67OrrsYcsdCJVtJB23liqHB5LQ2H8iwqVMhONpoIpaFsSeVDS64N1Q5juwB9IDlk
	 Ji85Klp26ZUaJqN9mz1den0WqQVAGqToWonwzjlFzayH9RqNWxIM8XLgDPlM6n8nFK
	 i5lPU/s6yqkFaNGE7NXUvMBkOdkbMg5PN59pLNPXLB56S012GC8WVbdvCaWq8k5//W
	 B6/io7vNZuibJ9P28Or7WN5t4eUpx5IEfu2kM/nZHZMyP7wOZd4TD6x66rAO7tLlbt
	 LRcKyWUURag1mNPOxtWRaGp2TTETiJ5+Dah7TxGnWsCmJT/GoR2al6obzz3dpTtK0f
	 M1X0nPMD6cMAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260709090153.21675-3-tze.yee.ng@altera.com>
References: <20260709090153.21675-1-tze.yee.ng@altera.com>
 <20260709090153.21675-3-tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:15:01 +0000
Message-Id: <20260709091502.2EB2A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The asynchronous read path times out prematurely and frees the SMC=
 transaction ID while the Secure Device Manager (SDM) may still be processi=
ng the request, causing ID reuse and state confusion.
- [Medium] Missing MODULE_ALIAS prevents automatic module loading.
- [Medium] Voltage readings lack SDM error code validation, leading to mass=
ive bogus voltage values being exported to userspace upon sensor error.
--

--- Patch [2]: [PATCH v4 2/2] hwmon: add Altera SoC FPGA hardware monitorin=
g driver ---
commit 356596525564df534eb70c8e10fde9c433f2dafd
Author: Tze Yee Ng <tze.yee.ng@altera.com>
Subject: hwmon: add Altera SoC FPGA hardware monitoring driver

Adds a hardware monitor driver for Altera SoC FPGA devices using the
Stratix 10 service layer. Sensor channels are selected based on the
service layer compatible string.

> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> new file mode 100644
> index 0000000000000..1cd3a06fec42b
> --- /dev/null
> +++ b/drivers/hwmon/socfpga-hwmon.c

[ ... ]

> +static int socfpga_hwmon_async_read(struct device *dev,
> +				    enum hwmon_sensor_types type,
> +				    struct stratix10_svc_client_msg *msg)
> +{
> +	struct socfpga_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct stratix10_svc_cb_data data =3D {};
> +	void *handle =3D NULL;
> +	int status, index, ret;

[ ... ]

> +	ret =3D -ETIMEDOUT;
> +	for (index =3D 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
> +		status =3D stratix10_svc_async_poll(priv->chan, handle, &data);

[Severity: High]
The synchronous path uses a 2000ms timeout, but this loop times out after j=
ust
3 iterations (with a 1ms sleep), allowing only ~3ms. Is this polling durati=
on
sufficient for the worst-case response time from the Secure Device Manager
(SDM)?

> +		if (status =3D=3D -EAGAIN) {
> +			dev_dbg(dev, "Async message is still in progress\n");
> +		} else if (status < 0) {
> +			dev_alert(dev, "Failed to poll async message: %d\n", status);
> +			ret =3D -ETIMEDOUT;
> +		} else if (status =3D=3D 0) {
> +			ret =3D 0;
> +			break;
> +		}
> +		msleep(HWMON_RETRY_SLEEP_MS);
> +	}
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to get async response\n");
> +		goto done;
> +	}
> +
> +	if (data.status) {
> +		dev_err(dev, "%s returned 0x%x from SDM\n", __func__,
> +			data.status);
> +		ret =3D -EFAULT;
> +		goto done;
> +	}
> +
> +	if (type =3D=3D hwmon_temp)
> +		priv->temperature =3D (u32)*(unsigned long *)data.kaddr1;
> +	else
> +		priv->voltage =3D (u32)*(unsigned long *)data.kaddr1;
> +
> +	ret =3D 0;
> +
> +done:
> +	stratix10_svc_async_done(priv->chan, handle);

[Severity: High]
If the async read times out, calling stratix10_svc_async_done() frees the
transaction ID immediately.=20

Can this cause the ID to be reused for a new request while the SDM is still
processing the original delayed request, violating the SMC protocol and
potentially causing corrupted data to be returned?

> +	return ret;
> +}

[ ... ]

> +static int socfpga_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			      u32 attr, int chan, long *val)
> +{
> +	struct socfpga_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct stratix10_svc_client_msg msg =3D {0};
> +	int ret;

[ ... ]

> +	if (type =3D=3D hwmon_temp)
> +		ret =3D socfpga_hwmon_parse_temp(val, priv->temperature);
> +	else
> +		/* Convert Q16 volts to millivolts for hwmon. */
> +		*val =3D (long)priv->voltage * SOCFPGA_HWMON_VOLT_MV_SCALE /
> +			SOCFPGA_HWMON_VOLT_FRAC_DIV;

[Severity: Medium]
The temperature reading path explicitly validates against generic SDM error
codes (like ETEMP_INACTIVE or 0x80000000U).=20

Since voltage readings lack this check, will a sensor error code here be
blindly converted and exported as a massive bogus voltage value to userspace
instead of returning a proper Linux error code?

> +	return ret;
> +}

[ ... ]

> +static struct platform_driver socfpga_hwmon_driver =3D {
> +	.probe =3D socfpga_hwmon_probe,
> +	.driver =3D {
> +		.name =3D "socfpga-hwmon",
> +	},
> +};

[Severity: Medium]
Since this driver binds to a platform device dynamically registered by the
service layer (and lacks an id_table or of_match_table), is a MODULE_ALIAS
declaration (like MODULE_ALIAS("platform:socfpga-hwmon")) needed here so th=
at
udev can automatically load the module when the device is registered?

> +module_platform_driver(socfpga_hwmon_driver);
> +
> +MODULE_AUTHOR("Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.c=
om>");
> +MODULE_AUTHOR("Tze Yee Ng <tze.yee.ng@altera.com>");
> +MODULE_DESCRIPTION("Altera SoC FPGA hardware monitoring driver");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709090153.2167=
5-1-tze.yee.ng@altera.com?part=3D2
