Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882523C50A;
	Sun, 11 Jan 2026 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768127709; cv=none; b=CUxm1/jFtxoV20hGO2DaCNTq9wnGH/VMkZfiWKpNhg8D4mEnLN6nis7HLqzANs+64Ie3N+03hOqCqEezWVHDK+xsweVvuqUCm52LiaWzqrIkiaZJZZudzL4syIXFBgoMQ45O6jv1uX45WMGqTuXEXrvKHpMBV53VTgtLppprLJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768127709; c=relaxed/simple;
	bh=vmZqK5wkoBO+ewnNPSZkU5atM5vOYmBL91/E4AQomWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HznISaA+lgZtZuSygILY03X2rSgHFkq3SgzqatPXravJj4zVMWjYxV8sqkTxbxOxMAi88h+T+wErqLwlaum9flhJRTH3ZPpQFyBxJ4v88qbK/h7bTxTbkbTE8z9NfQ6RGg2XMb+UGyfLJ9FOFePXoy8yC0dHe1RJdkegqYNfoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOLKI/R0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOLKI/R0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D52C4CEF7;
	Sun, 11 Jan 2026 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768127709;
	bh=vmZqK5wkoBO+ewnNPSZkU5atM5vOYmBL91/E4AQomWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOLKI/R0Tg6RXEz+JltLyTIrb0p6m7M+emb6+A48mz1hGG+TtuKp+pBY4dDGi8ZN7
	 y34iHSmFhEO2RmsIoGaxNatzbLN8M3qek724ya7+DNojjbzci6TmMRTuQxBsWZXcJ0
	 0zmoSkVsz1aK9RggmKogPUZ+Cjcg5wAf7UcsUtsKijj4LqC6bds3CjYVg+YPS+Zyp9
	 Alr6MQ7onyt7dpLjO6yqokQ+F0k4uv5LDHI4dXJKOIcFY+GKZGCrO3nDH0eG7Cu2Ky
	 HjcyxiwbD+5JM24k56/6JXeKfYfLtOxn0AmZyX9jIY/7wGpGCcnSeGwZT/YA0PKCcE
	 By7SNqcIxvG/w==
Date: Sun, 11 Jan 2026 11:35:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com, 
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Message-ID: <20260111-poetic-kittiwake-of-certainty-f60f4d@quoll>
References: <20260109090718.442-1-hehuan1@eswincomputing.com>
 <20260109090929.567-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109090929.567-1-hehuan1@eswincomputing.com>

On Fri, Jan 09, 2026 at 05:09:29PM +0800, hehuan1@eswincomputing.com wrote:
> +static void pvt_clear_data(void *data)
> +{
> +	struct pvt_hwmon *pvt = data;
> +	int idx;
> +
> +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> +		complete_all(&pvt->cache[idx].conversion);
> +
> +	mutex_destroy(&pvt->iface_mtx);
> +}
> +
> +static struct pvt_hwmon *eic7700_pvt_create_data(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pvt_hwmon *pvt;
> +	int ret, idx;
> +
> +	pvt = devm_kzalloc(dev, sizeof(*pvt), GFP_KERNEL);
> +	if (!pvt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = devm_add_action(dev, pvt_clear_data, pvt);
> +	if (ret) {
> +		dev_err(dev, "Can't add PVT data clear action\n");
> +		return ERR_PTR(ret);

Why do you set up cleaning - mutex destroy, complete - before even
initializing them?

This is very messy or even buggy coding style.

> +	}
> +
> +	pvt->dev = dev;
> +	pvt->sensor = PVT_SENSOR_FIRST;
> +	mutex_init(&pvt->iface_mtx);
> +
> +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> +		init_completion(&pvt->cache[idx].conversion);
> +
> +	return pvt;
> +}
> +
> +static void eic7700_pvt_remove(void *data)
> +{
> +	int ret;
> +	struct pvt_hwmon *pvt = data;
> +
> +	pm_runtime_disable(pvt->dev);
> +	pm_runtime_dont_use_autosuspend(pvt->dev);
> +	pm_runtime_get_sync(pvt->dev);
> +
> +	ret = reset_control_assert(pvt->rst);
> +	if (ret)
> +		dev_err(pvt->dev, "Failed to assert reset: %d\n", ret);
> +
> +	if (pm_runtime_active(pvt->dev))
> +		clk_disable_unprepare(pvt->clk);
> +
> +	pm_runtime_put_noidle(pvt->dev);
> +}
> +
> +static int eic7700_pvt_check_pwr(struct pvt_hwmon *pvt)
> +{
> +	unsigned long tout;
> +	int ret = 0;
> +
> +	/*
> +	 * Test out the sensor conversion functionality. If it is not done on
> +	 * time then the domain must have been unpowered and we won't be able
> +	 * to use the device later in this driver.
> +	 */
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);
> +	readl(pvt->regs + PVT_DATA);
> +
> +	tout = PVT_TOUT_MIN / NSEC_PER_USEC;
> +	usleep_range(tout, 2 * tout);
> +
> +	readl(pvt->regs + PVT_DATA);
> +	if (!(readl(pvt->regs + PVT_INT) & PVT_INT_STAT)) {
> +		ret = -ENODEV;
> +		dev_err(pvt->dev,
> +			"Sensor is powered down - no interrupt generated\n");
> +	}
> +
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +
> +	return ret;
> +}
> +
> +static int eic7700_pvt_init_iface(struct pvt_hwmon *pvt)
> +{
> +	unsigned long rate;
> +	const struct pvt_sensor_info *pvt_info = pvt->sensor_info;
> +
> +	rate = clk_get_rate(pvt->clk);
> +	if (!rate) {
> +		dev_err(pvt->dev, "Invalid reference clock rate\n");
> +		return -ENODEV;
> +	}
> +	if (!pvt_info) {
> +		dev_err(pvt->dev, "No matching device data found\n");
> +		return -EINVAL;
> +	}
> +	/*
> +	 * Make sure controller are disabled so not to accidentally have ISR
> +	 * executed before the driver data is fully initialized. Clear the IRQ
> +	 * status as well.
> +	 */
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	readl(pvt->regs + PVT_INT);
> +	readl(pvt->regs + PVT_DATA);
> +
> +	/* Setup default sensor mode and temperature trim. */
> +	eic7700_pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
> +
> +	eic7700_pvt_set_trim(pvt, PVT_TRIM_DEF);
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_request_irq(struct pvt_hwmon *pvt)
> +{
> +	struct platform_device *pdev = to_platform_device(pvt->dev);
> +	int ret;
> +
> +	pvt->irq = platform_get_irq(pdev, 0);
> +	if (pvt->irq < 0)
> +		return pvt->irq;
> +
> +	ret = devm_request_threaded_irq(pvt->dev, pvt->irq,
> +					eic7700_pvt_hard_isr, NULL,
> +					IRQF_SHARED | IRQF_TRIGGER_HIGH, "pvt",
> +					pvt);
> +	if (ret) {
> +		dev_err(pvt->dev, "Couldn't request PVT IRQ\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_create_hwmon(struct pvt_hwmon *pvt)
> +{
> +	struct device *dev = pvt->dev;
> +	struct device_node *np = dev->of_node;
> +	const char *node_label;
> +	int type;
> +	const char *names[2] = {"soc_pvt", "ddr_pvt"};
> +
> +	if (of_property_read_string(np, "label", &node_label)) {
> +		dev_err(dev, "Missing 'label' property in DTS node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (strcmp(node_label, "pvt0") == 0) {
> +		type = 0;
> +	} else if (strcmp(node_label, "pvt1") == 0) {
> +		type = 1;
> +	} else {
> +		dev_err(pvt->dev, "Unsupported label: %s\n", node_label);
> +		return -EINVAL;
> +	}
> +
> +	pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev, names[type],
> +							  pvt, &pvt_hwmon_info,
> +							  NULL);
> +	if (IS_ERR(pvt->hwmon)) {
> +		dev_err(pvt->dev, "Couldn't create hwmon device\n");
> +		return PTR_ERR(pvt->hwmon);
> +	}
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_probe(struct platform_device *pdev)
> +{
> +	struct pvt_hwmon *pvt;
> +	int ret;
> +
> +	pvt = eic7700_pvt_create_data(pdev);
> +	if (IS_ERR(pvt))
> +		return PTR_ERR(pvt);
> +
> +	platform_set_drvdata(pdev, pvt);
> +
> +	ret = eic7700_pvt_create_sensor_info(pvt);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to create sensor info\n");
> +		return ret;
> +	}
> +
> +	pvt->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pvt->regs))
> +		return PTR_ERR(pvt->regs);
> +
> +	pvt->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(pvt->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pvt->clk),
> +				     "Couldn't get clock\n");
> +
> +	pvt->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(pvt->rst))
> +		return dev_err_probe(pvt->dev, PTR_ERR(pvt->rst),
> +				     "Couldn't to get reset control\n");
> +
> +	if (pvt->rst) {
> +		ret = reset_control_reset(pvt->rst);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Couldn't to trigger reset\n");
> +	}
> +
> +	ret = eic7700_pvt_check_pwr(pvt);
> +	if (ret)
> +		return ret;
> +
> +	ret = eic7700_pvt_init_iface(pvt);
> +	if (ret)
> +		return ret;
> +
> +	ret = eic7700_pvt_request_irq(pvt);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +
> +	ret = eic7700_pvt_create_hwmon(pvt);
> +	if (ret)

You leak here - missing PM runtime cleanup.

> +		return ret;
> +
> +	ret = devm_add_action_or_reset(pvt->dev, eic7700_pvt_remove, pvt);
> +	if (ret) {
> +		dev_err(pvt->dev, "Can't add PVT clocks disable action\n");

Why PM runtime cleanup should happen only from this moment/error path?

Way you organized your code and stuffed multiple cleanups at once is
very messy. This is unreadable at best or even buggy code.

> +		return ret;
> +	}
> +
> +	pm_runtime_put_autosuspend(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused eic7700_pvt_runtime_resume(struct device *dev)
> +{
> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!pvt->clk) {
> +		dev_err(dev, "clk not initialized\n");

What? How?

> +		return -ENODEV;
> +	}

Best regards,
Krzysztof

