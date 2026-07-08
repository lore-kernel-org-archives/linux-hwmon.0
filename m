Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B203D4137;
	Wed,  8 Jul 2026 06:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783492239; cv=none; b=XgPJk5IyDl51b8HGgojTeZJjgt3nEtfKKwDY0XAYk/m4vn/fF+t2LUJIms62gXUI8GyFKOrTuJa/JVsalE6dmRFHiZYtEc/OtdmrAblBssoKaPDtImXIrYYwxjevtmt9zHocXVreER7TlkcCfc4yCTFkAxtDSyKUhoxP+2M2hTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783492239; c=relaxed/simple;
	bh=zRGC77rbPRmwPgKmKa7QmquR/h+sYBgxsqYA/MVxJP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQUiNA0R169+5JUtPYdHtaRwtonyGNmvt/yUD/TiEALOTexWaJSSdixChS05fLP5hFq6uiRb6VvcRBBMjwJQ+fR8QvIEZGLGcwNhLLo+a8cgStP4WoQvP47q1VzEEwt+XeeWaADtVR22Ng63NvgDmYfhPtZtn+wWnM5V6NDNFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOqWVtUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOqWVtUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD601F000E9;
	Wed,  8 Jul 2026 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783492231;
	bh=/zESf3S3k+dvyXjGtUm80zCdMjbphr9Utw1GugQbuLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOqWVtUmZndfpODtVJDU3xAVKXrRVaNafg0IXwSz/sJmslLhI2ZRL0xzzZqnltSAQ
	 Gb2T9UQlLUyjXKV+WkHiN/rfL8CsKLDI/HywL4fU6Cebptl1ZgKARDEQrhb+NiBibT
	 5kSTUq4TZOYUsds4YloVCqDtiWMxZyQwwp//O7tSnYQwR0JiKF5VIa1vHZpIn9SWhn
	 wfi6ZwPEfPbaJbbatiKhfDYAdZ/Dy4FuhMVNswGOHGLgFAL776rbxmYS1Ssea7iWbw
	 b27aj9Ig0FTw/zLJ3Gtwc67peptrozACPQe5lWhL9q8Ny+xmb6NdBWd94nLWoIdpdN
	 FNDBWFg00VwZg==
Date: Wed, 8 Jul 2026 08:30:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com, 
	priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <20260708-wakeful-cyan-caribou-35fd09@quoll>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>

On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
> +	.is_visible = t14s_ec_hwmon_is_visible,
> +	.read = t14s_ec_hwmon_read,
> +	.read_string = t14s_ec_hwmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info = {
> +	.ops = &t14s_ec_hwmon_ops,
> +	.info = t14s_ec_hwmon_info,
> +};
> +
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

Last time I commented this looks like actual ABI break. You did not respond to
that, so I assume my finding was right, thus:
1. binding is not correct (although driver should be fixed, not binding)
2. the code still breaks users

Best regards,
Krzysztof

