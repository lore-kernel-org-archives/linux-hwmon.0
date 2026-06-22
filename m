Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87753B7757;
	Mon, 22 Jun 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137285; cv=none; b=cHczXhWemRGJ0Az2ui2WmG/JzYFZ6OPeSkxNSGVcQ3+/E3uzoVicKGA9z0aJkYGOK3XhvgyDi0/DdO+eskbWyNGLxF7wSABsas/ax6fr3t/7Y5AssoTLfI0AxiHeJvOGfYsOzf4pmnZsloXLk1PQlZVTx9HotM/szGtbc8GiBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137285; c=relaxed/simple;
	bh=3Fe8l0qGvTsptAGla3GgzoAaMqepP26kQruBa5ssRfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERcRD2d+RkS0GFXns97ggjNZ8zWRpyKYyGpuS3wC1jfeZrIyB3E7kC1vx0uzuUkZ5P1EnlvNCmx8MBoCKlmhPUgoyTtFgOzbC4CtHTPgcOBbeEtFtsRkL7dQJ8Eq3sSF8I5xN9OB5Qt0Dt1Kzorp518qpJJMBJaxboAjn2sQzeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6eePdQE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6eePdQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F041F000E9;
	Mon, 22 Jun 2026 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137284;
	bh=T+5K4dyYL0Ct9bHh4YXB1JDossf6zpnWvBsLhvK4p70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6eePdQEOhJ4qUek0c3+wWgywZLcryfynrhlOwSPD4PGeGl6jofp1DLhivo2oVQGk
	 2zP/OFe+W4eQ6GVBrogvYFR051QnkLYymQ4PV5G8APrOS4PU0+xRDGBrviIW2qAVzf
	 +JEvoMZjBkzDjeqPsXFK8M5jbZE4qr9v6zcJCDq2TStJ0+ZLoJ4IaKkZUnXQooHRWB
	 YePDUMfeBcH6d3zddeQ/BdYpW14Zsf3L36nkeejNQZHvXBGg2zlC0O6jYgbUf50HYM
	 nue3XRlUtTnegX3Jy8EzvVgWEavLNsr7N7EVKA1tJjGXaGUrLD7i7/Makb5IQTGoz4
	 S5RKHYULyo+mA==
Date: Mon, 22 Jun 2026 16:08:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: tze.yee.ng@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Mahesh Rao <mahesh.rao@altera.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: add Stratix 10 SoC FPGA hardware monitor
 driver
Message-ID: <20260622-wise-fearless-frog-ed30fd@quoll>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <081650bc4d92e9497b7a5a926e79a067cca3519f.1781861409.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <081650bc4d92e9497b7a5a926e79a067cca3519f.1781861409.git.tze.yee.ng@altera.com>

On Fri, Jun 19, 2026 at 02:38:55AM -0700, tze.yee.ng@altera.com wrote:
> +	dev_warn(dev, "unsupported sensor type %s\n", type);
> +	return 0;
> +}
> +
> +static int stratix10_hwmon_probe_child_from_dt(struct device *dev,
> +					       struct device_node *child,

np

> +					      struct stratix10_hwmon_priv *priv)
> +{
> +	struct device_node *grandchild;

child

> +	const char *label;
> +	u32 val;
> +	int ret;
> +
> +	for_each_child_of_node(child, grandchild) {

child

> +		ret = of_property_read_u32(grandchild, "reg", &val);
> +		if (ret) {
> +			dev_err(dev, "missing reg property of %pOFn\n",
> +				grandchild);
> +			of_node_put(grandchild);
> +			return ret;
> +		}
> +
> +		ret = of_property_read_string(grandchild, "label", &label);
> +		if (ret)
> +			label = grandchild->name;
> +
> +		stratix10_hwmon_add_channel(dev, child->name, val, label, priv);
> +	}
> +
> +	return 0;
> +}
> +
> +static int stratix10_hwmon_probe_from_dt(struct device *dev,
> +					 struct stratix10_hwmon_priv *priv)
> +{
> +	struct device_node *child;
> +	int ret;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	for_each_child_of_node(dev->of_node, child) {

Just use scoped. And why not available child node? Why do you probe
disabled channels?

> +		ret = stratix10_hwmon_probe_child_from_dt(dev, child, priv);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int stratix10_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct stratix10_hwmon_priv *priv;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client.dev = dev;
> +	priv->client.priv = priv;
> +	init_completion(&priv->completion);
> +	mutex_init(&priv->lock);
> +
> +	ret = stratix10_hwmon_probe_from_dt(dev, priv);
> +	if (ret) {
> +		dev_err(dev, "Unable to probe from device tree\n");
> +		return ret;
> +	}
> +
> +	if (!priv->temperature_channels && !priv->voltage_channels) {
> +		dev_err(dev, "no temperature or voltage channels in device tree\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
> +							  SVC_CLIENT_HWMON);
> +	if (IS_ERR(priv->chan)) {
> +		ret = PTR_ERR(priv->chan);
> +		if (ret == -EPROBE_DEFER)
> +			dev_dbg(dev, "service channel %s not ready, deferring probe\n",
> +				SVC_CLIENT_HWMON);
> +		else
> +			dev_err(dev, "couldn't get service channel %s: %d\n",
> +				SVC_CLIENT_HWMON, ret);
> +		return ret;
> +	}
> +
> +	ret = stratix10_svc_add_async_client(priv->chan, false);
> +	switch (ret) {
> +	case 0:
> +		priv->async = true;
> +		break;
> +	case -EINVAL:
> +		dev_dbg(dev, "async operations not supported, using sync mode\n");
> +		priv->async = false;
> +		break;
> +	default:
> +		dev_err(dev, "failed to add async client: %d\n", ret);
> +		stratix10_svc_free_channel(priv->chan);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "Initialized %d temperature and %d voltage channels\n",
> +		 priv->temperature_channels, priv->voltage_channels);

Drop, driver should be silent on success. dev_dbg might be fine, but
honestly that's static information from DT so zero usefulness.

Best regards,
Krzysztof

