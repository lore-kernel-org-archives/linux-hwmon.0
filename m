Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C732E6B4;
	Thu, 18 Dec 2025 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046598; cv=none; b=Xz7XpV8xNpyyr0E0ytQW+8xTi5I3byK/r3n5Hoyt/rotMXRgUt+JX0veYwPf9rtOjxY8Y6xtZgkwl4QRISqcxosopUxvez9YegWUNyPBluQvXb/C9h1krJUfpkW+SGxuRcT/QkOcCpUIm+yroMH+BEJcQ8RGUX+h5/jaAkg2TjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046598; c=relaxed/simple;
	bh=pQkXxJQZBNI3+6hwBS+1AAlIxOnx/WpNIAMQ5aX39fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiIvJ6XSERw7zrfyQcP0thgTuJr3qGwe2EcWtZN3sS55QnNU0c94OShjaPNbQYUMuCuV1ZOzDSU617icsczxo/NIVWK3zJNy0xvKtNXggluJKKmdvyTXf2q8oXa38U+KqBdjykqaU0a2xTONXHHY2xW85kNH0f6Qk9k8011wk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9Hsb3+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9Hsb3+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB1AC4CEFB;
	Thu, 18 Dec 2025 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046598;
	bh=pQkXxJQZBNI3+6hwBS+1AAlIxOnx/WpNIAMQ5aX39fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9Hsb3+d1kV8/dBQ2Ty3UaBaiEONB8MgLy9smtrjhi24K+jarpuCLs3BmY80q+Myb
	 jukSv/XmcDxEkH90iTaSxG59c2sYGeP6shu5c3+ltHCD9zkaZ27fhE46wXrnugeDQo
	 gnxSA6yOhlrxj3qmwAvgk4dkWm/40TiAqK50wUI/yyHbxGZOSmP5Azqh4q4bs5uc8T
	 OYW972cjWeO+gB2Do1wtz3nANSWJUX9reCq75rQdJrQE4iOivqI3dFL/8tQpR2xjiw
	 og+zGDR3J1eVJkYaZnE7fPFa7zLu3+NwLlmYnhOqMRgWjS+pGHBJCPPffi55p1gs3q
	 SE1Y5LoQGIWsA==
Date: Thu, 18 Dec 2025 09:29:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammadamirulasyraf.mohamadjamian@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ang Tien Sung <tien.sung.ang@altera.com>, 
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: Re: [PATCH v1 3/5] hwmon: (altr-hwmon): Add initial support for
 SoCFPGA
Message-ID: <20251218-gentle-jasmine-vole-1b36af@quoll>
References: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
 <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>

On Mon, Dec 15, 2025 at 10:49:24PM -0800, muhammadamirulasyraf.mohamadjamian@altera.com wrote:
> From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
> 
> This patch introduces a new hardware monitoring (hwmon) driver for the
> Altera SoCFPGA platform, enabling kernel support for monitoring voltage and
> temperature sensors critical for device health and system stability.
> 
> Changes include:
> - New driver implementation 'drivers/hwmon/altera-hwmon.c' providing sensor
>   reading and event handling capabilities tailored for SoCFPGA hardware.
> 
> - Build system integration by adding Kconfig and Makefile entries, allowing
>   users to enable the driver in kernel configuration.
> 
> - Documentation added in 'Documentation/hwmon/altera-hwmon.rst', detailing
>   driver features, usage instructions, device tree bindings, and
>   configuration options.
> 
> - Update to 'Documentation/hwmon/index.rst' to reference the new driver
>   documentation, improving discoverability and user guidance.
> 
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
> ---
>  Documentation/hwmon/altr-hwmon.rst |  32 +++
>  Documentation/hwmon/index.rst      |   1 +
>  MAINTAINERS                        |   2 +
>  drivers/hwmon/Kconfig              |  10 +
>  drivers/hwmon/Makefile             |   1 +
>  drivers/hwmon/altr-hwmon.c         | 427 +++++++++++++++++++++++++++++
>  6 files changed, 473 insertions(+)
>  create mode 100644 Documentation/hwmon/altr-hwmon.rst
>  create mode 100644 drivers/hwmon/altr-hwmon.c
> 
> diff --git a/Documentation/hwmon/altr-hwmon.rst b/Documentation/hwmon/altr-hwmon.rst
> new file mode 100644
> index 000000000000..3ef1ca0d1686
> --- /dev/null
> +++ b/Documentation/hwmon/altr-hwmon.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +Kernel driver altr-hwmon
> +=========================
> +
> +Supported chips:
> +
> + * Intel N5X
> + * Stratix10
> + * Agilex
> + * Agilex5
> +
> +Contributor: Kris Chaplin <kris.chaplin@intel.com>
> +             Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> +             Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for 64-Bit SoC FPGA and eASIC devices
> +based around the Secure Device Manager and Stratix 10 Service layer.
> +
> +The following sensor types are supported
> +
> +  * temperature
> +  * voltage
> +
> +
> +Usage Notes
> +-----------
> +
> +The driver relies on a device tree node to enumerate support present on the
> +specific device. See Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml for details of the device-tree node.
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..d37d4cbbe8b5 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -40,6 +40,7 @@ Hardware Monitoring Kernel Drivers
>     adt7470
>     adt7475
>     aht10
> +   altr-hwmon
>     amc6821
>     aquacomputer_d5next
>     asb100
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8ac7fef4563a..01f776fdbf6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -942,6 +942,8 @@ M:	Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
> +F:	Documentation/hwmon/altr-hwmon.rst
> +F:	drivers/hwmon/altr-hwmon.c
>  
>  ALTERA MAILBOX DRIVER
>  M:	Tien Sung Ang <tiensung.ang@altera.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d9bac1e3057b..4351725831d3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2122,6 +2122,16 @@ config SENSORS_SMSC47M192
>  	  This driver can also be built as a module. If so, the module
>  	  will be called smsc47m192.
>  
> +config SENSORS_ALTERA_SOCFPGA
> +	tristate "Altera SoC FPGA Hardware monitoring features"
> +	depends on INTEL_STRATIX10_SERVICE

Why this cannot be compile tested?

...


> +static int altr_socfpga_probe_child_from_dt(struct device *dev,
> +					    struct device_node *child,
> +					    struct altr_socfpga_hwmon_priv *priv)
> +{
> +	u32 val;
> +	int ret;
> +	struct device_node *grandchild;
> +	const char *label;
> +	const char *type;
> +
> +	of_property_read_string(child, "name", &type);
> +	for_each_child_of_node(child, grandchild) {

No, see my further comment.

> +		ret = of_property_read_u32(grandchild, "reg", &val);
> +		if (ret) {
> +			dev_err(dev, "missing reg property of %pOFn\n",
> +				grandchild);
> +			return ret;
> +		}
> +		ret = of_property_read_string(grandchild, "label", &label);
> +		if (ret) {
> +			dev_err(dev, "missing label propoerty of %pOFn\n",
> +				grandchild);
> +			return ret;
> +		}
> +
> +		altr_socfpga_add_channel(dev, type, val, label, priv);
> +	}
> +
> +	return 0;
> +}
> +
> +static int altr_socfpga_probe_from_dt(struct device *dev,
> +				      struct altr_socfpga_hwmon_priv *priv)
> +{
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int ret;
> +
> +	/* Compatible with non-DT platforms */
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node(np, child) {
> +		ret = altr_socfpga_probe_child_from_dt(dev, child, priv);
> +		if (ret) {
> +			of_node_put(child);

Just use scoped. Please don't upstream old code, but take new drivers
and use them as your starting point. You just repeat issues we fixed or
old style we changed loong time ago.


> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int altr_socfpga_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *hwmon_dev;
> +	struct altr_socfpga_hwmon_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client.dev = dev;
> +	priv->client.receive_cb = NULL;
> +	priv->client.priv = priv;
> +	priv->temperature_channels = 0;
> +	priv->voltage_channels = 0;
> +
> +	ret = altr_socfpga_probe_from_dt(dev, priv);
> +	if (ret) {
> +		dev_err(dev, "Unable to probe from device tree\n");
> +		return ret;

No, syntax is return dev_err_probe
> +	}
> +
> +	mutex_init(&priv->lock);
> +
> +	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
> +							  SVC_CLIENT_HWMON);
> +	if (IS_ERR(priv->chan)) {
> +		dev_err(dev, "couldn't get service channel %s defering probe...\n",
> +			SVC_CLIENT_HWMON);

No, you are now spamming the dmesg with useless deferrals. return
dev_err_probe


> +		return -EPROBE_DEFER;


Why ignoring actual error?

> +	}
> +
> +	dev_info(dev, "Initialized %d temperature and %d voltage channels",
> +		 priv->temperature_channels, priv->voltage_channels);

Drop, pretty useless. Drivers are supposed to be silent on success.


> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "altr_hwmon", priv,
> +							 &altr_socfpga_hwmon_chip_info,
> +							 NULL);
> +
> +	init_completion(&priv->completion);
> +	platform_set_drvdata(pdev, priv);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static void altr_socfpga_hwmon_remove(struct platform_device *pdev)
> +{
> +	struct altr_socfpga_hwmon_priv *priv = platform_get_drvdata(pdev);
> +
> +	stratix10_svc_free_channel(priv->chan);
> +}
> +
> +static const struct of_device_id altr_socfpga_of_match[] = {
> +	{ .compatible = "altr,socfpga-hwmon" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, altr_socfpga_of_match);
> +
> +static struct platform_driver altr_socfpga_hwmon_driver = {
> +	.driver = {
> +		.name = "altr-hwmon",
> +		.of_match_table = altr_socfpga_of_match,
> +	},
> +	.probe = altr_socfpga_hwmon_probe,
> +	.remove = altr_socfpga_hwmon_remove,
> +};
> +module_platform_driver(altr_socfpga_hwmon_driver);
> +
> +MODULE_AUTHOR("Altera Corporation");
> +MODULE_DESCRIPTION("Altera SoC FPGA hardware monitoring features");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.7
> 
