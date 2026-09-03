Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8648231B803;
	Thu,  3 Sep 2026 03:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405850; cv=none; b=Vkck/K18opp69e1NPWR8wwa+gBQUabrrTjA45GCyOQdGLX9H2GACjTxxqDE/HbdjZtp/lcrXOBxjzYUTEMTOQjo6KJ8/4BQRaIAtuw2d67BOVTuvwg80TncXFzGFU9U5seODgJ5nuTLjgDs1BWT+E0ih1q84oBegKgU31O0/psM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405850; c=relaxed/simple;
	bh=a0iD3HKIQqp0g0qMdjqfUfv2L24HZqLs4Rg7OjXCDQI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W8/sBfhpKkjt1zg8EB6Er9gOyEDp1DeAdAU7S/UsgeSAoMOV+T4HFg98JPJCQgKO8vfhuFQ2D8zsdVk6f/hIlIVPIe35BG5z0VL7TC4eCNq2EWWlJfmLgXF6LTKwzvsqGG+1aMRBRHXm7aY1b4nh7EZJLwL8NOAMaXCl1qVG3bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBXMIVgb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBXMIVgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3271F000E9;
	Thu,  3 Sep 2026 03:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788405849;
	bh=hqWrARcc9cjPZdi51DCmmMTQ53+iRbUgJGKsw13o9G8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cBXMIVgbaov2z4yaSe/GjZd7H0Dydw2IIM3i/UKI/Uxsdht67ugBYYykObfXmohqo
	 n8t3dn1Sk3Q6lFrzj3VwM51paSJsg5ZEax3s84C84ZXx3tJv7HVIxlAL6g9GNMWQRL
	 PNZSf8U0/ILwQwGo2kw4KBE/1A6+QKvibLK/ZXKmFkEmAMfrwzKjgylhfPYgxuqXH2
	 1xwj07JNjAQQ7JxSVi56DCzRV/jL3ogzN4sCcNudjkEzV7vUFu7/WlyLlKQS4+NBdU
	 7z9ZlfUoJTFkHXx83SmClRSAP+NmtIqmxsNUH68Pskpv+aft5voowxdqAH4aEtMi6M
	 1GH2EPfU+8jeg==
Subject: Re: [net-next,v2,2/6] eth: fbnic: expose all hwmon attributes
 unconditionally as read-only
From: netdev-bot+sashiko@kernel.org
To: limzhineng2@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@roeck-us.net, horms@kernel.org, mohsin.bashr@gmail.com,
 kernel-team@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, zinclim@meta.com
Date: Thu, 03 Sep 2026 03:24:07 +0000
Message-ID: <178840584782.3394541.7997326009686113604@kernel.org>
In-Reply-To: <20260831212234.1212971-3-limzhineng2@gmail.com>
References: <20260831212234.1212971-3-limzhineng2@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] fbnic_hwmon_is_visible() is reduced to an unconditional `return
  0444;` that ignores all four of its arguments (drvdata, type, attr,…

--

eth: fbnic: expose all hwmon attributes unconditionally as read-only

This changes fbnic_hwmon_is_visible() so that it returns 0444 for every
sensor type and attribute instead of matching on hwmon_temp_input and
hwmon_in_input.  The stated motivation is to prepare for threshold and
alarm attributes added later in the series.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> index 6c8c66ab86c13..38bb26cb8e6cb 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
>  				      enum hwmon_sensor_types type,
>  				      u32 attr, int channel)
>  {
> -	if (type == hwmon_temp && attr == hwmon_temp_input)
> -		return 0444;
> -	if (type == hwmon_in && attr == hwmon_in_input)
> -		return 0444;
> -
> -	return 0;
> +	return 0444;
>  }

[Severity: Low]
This isn't a bug, but now that fbnic_hwmon_is_visible() ignores all four
of its parameters (drvdata, type, attr and channel) and returns a constant,
could the static visibility field in struct hwmon_ops be used instead?

include/linux/hwmon.h documents it that way:

  /**
   * struct hwmon_ops - hwmon device operations
   * @visible:	Static visibility. If non-zero, 'is_visible' is ignored.
   * @is_visible: Callback to return attribute visibility. Mandatory unless
   *		'visible' is non-zero.

and hwmon_device_register_with_info() accepts either form, so
fbnic_hwmon_ops could become:

  static const struct hwmon_ops fbnic_hwmon_ops = {
	.visible = 0444,
	.read = fbnic_hwmon_read,
  };

with fbnic_hwmon_is_visible() deleted entirely.  Other drivers such as
drivers/net/phy/realtek/realtek_hwmon.c already use the .visible form.

This shape persists through the end of the series (fbnic_hwmon_is_visible()
is still a plain "return 0444;" installed via .is_visible at the last
patch), so a later patch does not convert it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831212234.1212971-1-limzhineng2%40gmail.com
