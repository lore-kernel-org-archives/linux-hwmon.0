Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D4221546;
	Tue,  7 Jul 2026 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406403; cv=none; b=F+KF04454cdIQK3HZXXUGe7xCjLJHa3e0Hw4EGn1DAezVcvFKRKmcGqN3QuLynLHEgG0aLqCi4MV2p1hejJAkysfmFBKqjdgfIXjNjMqwS71pBC3yczM1i0S8S7+Jvv386sfFHB7cuoHDq5wR7g1nmdIz9cbycwi+QyUBqhnseE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406403; c=relaxed/simple;
	bh=qM0hDuXyKzE8shzXBS864JDFVSj0uqWGlsm7xlLjiPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe3g0riFW42uvx6hW+yIaydevdu768LvvoLJl9yvn3HCpvGIIlCRkOem8nkH/JhMRD5USEHcUwIFiKWaB5Xkf/OvMxfwneISq+ULqqhI+1He4dE6/j1l4bWcr0IB5Ygu6NDl3MUUuBecOW+4b8ftWol6unnm9tJy1idM3uNhP9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zf+ADeX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zf+ADeX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853281F000E9;
	Tue,  7 Jul 2026 06:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783406401;
	bh=S5O4/ahBKvaYgtYKaJDznh0lfg+kgCemB1pgNHMlBKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zf+ADeX7zsKvXTlAk0xQteskUKFMuykxPe5HaLid0JEyFyyYJsfx5YkAtzUBFUehA
	 2gLOBrjTHX/Pucpc/uRtVwukcZN5K2cSwZfNX9TiHZ40v7oPW09/Zoxt8X2umvBq9+
	 2doz2qGKKz5Euco2IvvchlG53ubR3kGcfq3HBP5Koibv9lgvxycHJbncvovXvXsVSp
	 ngi/RXqd9hOzZE8C+3w8XMUmCdwNgB8fwwylulOa4qIuQwXiuCu9Z0dkoDmKYLh14e
	 GlM0bYkepdJlMfImJX93KHWZ3TBy0oe26imubI0xlm1byuQkiCaqfwCxbY8J+Zel60
	 ZYiaKQXfAc6Pg==
Date: Tue, 7 Jul 2026 08:39:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com, 
	priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <20260707-accomplished-hare-of-success-ddcfb4@quoll>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>

On Mon, Jul 06, 2026 at 08:46:47PM +0200, Daniel Lezcano wrote:
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> +	};
> +
> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
> +						     ARRAY_SIZE(sys_thermx),
> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
> +	if (!ec->ec_hwmon.sys_thermx)
> +		return -ENOMEM;
> +
> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> +						   &t14s_ec_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(dev);

... and this ...

> +}
> +
>  static int t14s_ec_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = t14s_ec_hwmon_probe(ec);
> +	if (ret < 0)
> +		return ret;

... and this is actual implemented ABI break, if I understood hwmon and
thermal code correctly.

> +
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL,
>  					t14s_ec_irq_handler,
>  					IRQF_ONESHOT, dev_name(dev), ec);

Best regards,
Krzysztof

