Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7307EC77B75
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 May 2023 06:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235121AbjEIG5n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 May 2023 02:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbjEIG5b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 May 2023 02:57:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818AB72AB
        for <linux-hwmon@vger.kernel.org>; Mon,  8 May 2023 23:57:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso983049666b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 08 May 2023 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615448; x=1686207448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzZXYxSnMAFFywm1C7KVZWc7H16q1JK0Rvl408X7Xx0=;
        b=jSU/2cHRMnaNJzrawEDrGOL/+hxU6i/YiAxwc2qA4+lbB4OrdhbNWi4NtSYWYf1VOV
         C1ZunL+V78BBY7QwYzhtSP8wfptx9lSenfUsd7rNLM9wV9CsnPSMaqvuBQWIlHliTsht
         2xc6EK63KUfJLt/nRPAyizegM9kghWqvuKqqsCOO7nZuUakJ/mAlM5n/H7iMWmUpL0sf
         xL3oLJQedPxT/zzJj4QmmZKuLv4sn7wB4v3PlVL7hzrWfBlqmXKHBHUnGLGHwyAQ/Pn5
         3fZccGAALA5kgpsOt+pMnlnrvwuyljjUh4tQ6JtXuZUm5Opza4ZhoDdC65zKiN+uWgI+
         gjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615448; x=1686207448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzZXYxSnMAFFywm1C7KVZWc7H16q1JK0Rvl408X7Xx0=;
        b=ivxoRvjWw3k9BJ88iRLTjp0hybsLAaFU52tILz8J36wqWPdA6OxfLVkQgy2Xef/Jnu
         0OnFQfZLHAbBHm9oUYBlGC3bTdvRJ93k68b2TszRF7dUGQ59I9mKLP1pecYCvQ3APEHX
         kE9gAknbeGaQ4NcdDnZk1pMv0oDEnQ2+50j1v1nb2iT+2+mW9wf0mSIrMPT4kmO3v9z8
         U6iAgsSG2S8EWfnmDgUzQcRligtme78OnAGU6HUIqjCawbOCk1wUMs7s9qzrjO5jvQD3
         DJZ0eZeQBh9d7UfztbdOncBx4ZC/jN5IGK0zyfq2O/1Ps0YaHMU2nw8a+ph690xXDLHJ
         dC9A==
X-Gm-Message-State: AC+VfDwuR3MrhzYd+eSbc9dt3xALJMGLd407cYujF5+sec9bmmxLzOQy
        FD4C+auNwBrGwJr8cLpF/o4fLw==
X-Google-Smtp-Source: ACHHUZ6+lykY2FBUwQeNqtYFgfYyGTFb1zCiCSFvOIHWl0AP7L9t491+7rC+fNj8Tn27eTpZL1e/Ww==
X-Received: by 2002:a17:907:94d0:b0:965:6603:34fa with SMTP id dn16-20020a17090794d000b00965660334famr12217209ejc.12.1683615447933;
        Mon, 08 May 2023 23:57:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id gz20-20020a170907a05400b0095342bfb701sm948043ejc.16.2023.05.08.23.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:57:27 -0700 (PDT)
Message-ID: <9459547a-0ff9-9972-602d-3098b616602b@linaro.org>
Date:   Tue, 9 May 2023 08:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv2 3/6] hwmon: (socfpga) Add hardware monitoring support on
 SoCFPGA platforms
Content-Language: en-US
To:     dinh.nguyen@linux.intel.com, linux-hwmon@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux@roeck-us.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230508212852.8413-1-dinh.nguyen@linux.intel.com>
 <20230508212852.8413-3-dinh.nguyen@linux.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508212852.8413-3-dinh.nguyen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/05/2023 23:28, dinh.nguyen@linux.intel.com wrote:
> From: Dinh Nguyen <dinh.nguyen@linux.intel.com>
> 
> The driver supports 64-bit SoCFPGA platforms for temperature and voltage
> reading using the platform's SDM(Secure Device Manager). The driver
> also uses the Stratix10 Service layer driver.
> 
> This driver only supports OF SoCFPGA 64-bit platforms.
> 

(...)

> +static int socfpga_probe_child_from_dt(struct device *dev,
> +				       struct device_node *child,
> +				       struct socfpga_hwmon_priv *priv)
> +{
> +	struct device_node *grandchild;
> +	const char *label;
> +	const char *type;
> +	u32 val;
> +	int ret;
> +
> +	if (of_property_read_string(child, "name", &type))
> +		return dev_err_probe(dev, -EINVAL, "No type for %pOF\n", child);
> +
> +	for_each_child_of_node(child, grandchild) {
> +		ret = of_property_read_u32(grandchild, "reg", &val);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "missing reg property of %pOF\n",
> +					     grandchild);

Where do you drop child reference?

> +
> +		ret = of_property_read_string(grandchild, "label", &label);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "missing label propoerty of %pOF\n",
> +					     grandchild);
> +		ret = socfpga_add_channel(dev, type, val, label, priv);
> +		if (ret == -ENOSPC)
> +			return dev_err_probe(dev, ret, "too many channels, only %d supported\n",
> +					     SOCFPGA_HWMON_MAXSENSORS);
> +	}
> +	return 0;
> +}
> +
> +static int socfpga_probe_from_dt(struct device *dev,
> +				 struct socfpga_hwmon_priv *priv)
> +{
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int ret = 0;
> +
> +	for_each_child_of_node(np, child) {
> +		ret = socfpga_probe_child_from_dt(dev, child, priv);
> +		if (ret)
> +			break;
> +	}
> +	of_node_put(child);

Hm, and if the loop does not break, is this still correct?

> +
> +	return ret;
> +}
> +
> +static int socfpga_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct socfpga_hwmon_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client.dev = dev;
> +	priv->client.priv = priv;
> +
> +	ret = socfpga_probe_from_dt(dev, priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to probe from device tree\n");
> +
> +	mutex_init(&priv->lock);
> +	init_completion(&priv->completion);
> +	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
> +							  SVC_CLIENT_HWMON);
> +	if (IS_ERR(priv->chan))
> +		return dev_err_probe(dev, PTR_ERR(priv->chan),
> +				     "couldn't get service channel %s\n",
> +				     SVC_CLIENT_RSU);
> +
> +	priv->hwmon_dev = devm_hwmon_device_register_with_info(dev, "socfpgahwmon",
> +							       priv,
> +							       &socfpga_chip_info,
> +							       NULL);
> +	if (IS_ERR(priv->hwmon_dev))
> +		return PTR_ERR(priv->hwmon_dev);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return 0;
> +}
> +
> +static int socfpga_hwmon_remove(struct platform_device *pdev)
> +{
> +	struct socfpga_hwmon_priv *priv = platform_get_drvdata(pdev);
> +
> +	hwmon_device_unregister(priv->hwmon_dev);

Please test it. I am pretty sure you will have double free here.

> +	stratix10_svc_free_channel(priv->chan);
> +	return 0;
> +}
> +
> +static const struct of_device_id socfpga_of_match[] = {
> +	{ .compatible = "intel,socfpga-hwmon" },
> +	{ .compatible = "intel,socfpga-agilex-hwmon" },
> +	{ .compatible = "intel,socfpga-n5x-hwmon" },
> +	{ .compatible = "intel,socfpga-stratix10-hwmon" },

These are all compatible, so why having 4 entries?

Best regards,
Krzysztof

