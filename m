Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461127;
	b=KKARRbG2+grs5qKGFmQWRDHH9mZxHFcpxbSjiWcUPYds9mVk+XlyZ22sQNDLOAGMIsqt
	 7ybmdpgCivMP3FCJrlGY6R2tf7CVKKpvdcL0we+m8/5e05d8hnLK1igDXfcpe18fqrG/b
	 vu1dVL42HJSg28vxpsyWZlzP+UAbsFe3aImlL/kJteWuwadFBiHf34fqN+YNVJJg36jWI
	 7gz4+5Evd8o0iKN1fin7S2TTeFrC0+6nYzeG/QThtel8XPNIfPkqKYGP6Yzugt93PLRzA
	 B7Vd0tivm22ym0fgYp9ZBOp1su6GP0twQGg2HNWbPHQn28P9ZyZ//BhKGrH+5EQFRZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461127;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=79TJ+5b5fcsuj0fWUnREoUYSx0fpsARLtke0zePfYVY=;
	b=eAwRi2Eqk06GrOSYUvtrKHp8v5/m7dDNOuie6SRH6zrHT/FnkdrEfJHhhGnIu8ZHxob8
	 DeDdOecJj9iKQcpuMsXou3bYeo6WojupKvSuwd5WtbSFmLGLaWm670wlobQq8BgD87nlz
	 9JfDx8KpBD1qiMvvj/xQBQGlJh0xd04x9mHxQFe2s2629KVW8Tsp4QFJIN/FNUW0IZ/Pv
	 YCYLp0YUBswanB3NETaDjcJ+yMOcmF1/6ygnLl38FQ2xMujVW0woCXa8fY2z8qsZG4kYX
	 pZI4sOdhauAsrljR2Y+JYkLoa8fGmp283x41rW64f56XDwuscYCI8mTezP29x+6NQAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LtTjNycQ;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC957606A31D
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC957606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LtTjNycQ
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id N4wVxIxxzMylkNBALxn5l5; Sat, 31 Oct 2026 15:38:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NBALxrQ8563hBNBALxNn5v; Sat, 31 Oct 2026 15:38:45 +0000
X-Authority-Analysis: v=2.4 cv=CYsI5Krl c=1 sm=1 tr=0 ts=6ae60b85
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=U7MTmcDNI1qvhRoEBlQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=79TJ+5b5fcsuj0fWUnREoUYSx0fpsARLtke0zePfYVY=; b=LtTjNycQCo51sQMSOhfjyVYGFc
	RSBjbY/veRnCxeVYzOg7Yw7Z/yEVIuwUU+lft5ArGREvouqz9ABzPWAyYzwg8rH0o24jUp+UsMAAR
	klV6YuzDcFo7sniBKYx5XNdvLKhszuKBDQn7oB6ttwxKr6stNklMPShINKy9QAQ3QrfD9hDvzKb0C
	5xOfOJ+FLD8p7r5M2wEaluOrBOhsvTyFlqhNuVJf0M3vFh0K/ncFArxPsBJ+T5+8PCevYKEiu9Y95
	HsFbxz6o8DGM4AcpWkO6mofccaIyqp3cUX3KFjywlQNygsTQYmaDpHCf97whBGQ9jEyfOwx2KNGKN
	8TypUixA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:59280 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNBAK-00000001smV-3uNE;
	Sat, 31 Oct 2026 21:08:45 +0530
Date: Sat, 31 Oct 2026 08:38:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) Update the speed cache before dropping
 the PM reference
Message-ID: <a1505bd8-2cc4-462a-8b2d-fdf08d67c6c1@roeck-us.net>
References: <20261031095039.11683-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031095039.11683-1-pocj8ur4in@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNBAK-00000001smV-3uNE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:59280
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIC1J3KByN9GzuUcd4s4GCwl7vsPli6qmuJG/JQpr69UjkjKcGf2CBZXgpTXkqVNimgBZxDB9wZl79Bo/ujoi5hD579MJSSxHsW3jgrE9ntW1se6l7ba
 kHJZ/dkE5zIcomv1mxSpNiI9dRSIm/Ouv/WPbGvtS/iiXg0DwxzV/5V2Rgicll6vc5Dkjaad+j0CH/ZcWP/Mmy0L3JNXUnMTtN2wThHthOK9f2e24ct/bHrU

On Sat, Oct 31, 2026 at 06:50:39PM +0900, Baek Kyu, Kim wrote:
> set_fan_speed() writes the GPIO control value before dropping the runtime
> PM reference when stopping the fan. pm_runtime_put_sync() decrements the
> usage count even when suspending the device fails, but the error return
> currently leaves speed_index at the previous running speed.
> 
> A request for that same running speed then returns success without
> changing the GPIOs or taking a runtime PM reference. Retrying the stop
> instead drops a reference the driver no longer owns and can trigger a
> runtime PM usage count underflow warning.
> 
> Update speed_index after writing the GPIOs and before dropping the PM
> reference. The initial same-speed check already excludes a stopped fan,
> so a zero target is sufficient to identify the transition that needs a
> PM put. Preserve the PM error return and the CONFIG_PM=n exception.
> 
> This keeps the cached control state and PM reference ownership consistent
> without restoring running GPIOs after a possibly partial supply failure.
> It does not clear persistent runtime PM errors or claim that a failing
> regulator has successfully powered off.
> 
> Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> 
For the future: No blank line here, please.

> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied.

Thanks,
Guenter

> ---
> An arm64 QEMU/KVM kernel exercised gpio-fan through hwmon sysfs with
> virtual GPIO and regulator providers and the actual runtime PM core.
> An injected -EBUSY regulator disable error after a running-to-stopped
> request left GPIOs off and PM usage at zero. Before the change the
> speed cache stayed running and a repeated stop underflowed PM usage;
> after the change the cache stayed stopped and no PM underflow occurred.
> No physical fan or RPM was tested.
> 
>  drivers/hwmon/gpio-fan.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 3f78375eeb448..08b58b49be5b9 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -150,7 +150,10 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
>  
>  	__set_fan_ctrl(fan_data, fan_data->speed[speed_index].ctrl_val);
>  
> -	if (fan_data->speed_index > 0 && speed_index == 0) {
> +	/* The GPIOs have changed, and a PM put drops the reference on error. */
> +	fan_data->speed_index = speed_index;
> +
> +	if (speed_index == 0) {
>  		int ret;
>  
>  		ret = pm_runtime_put_sync(fan_data->dev);
> @@ -158,8 +161,6 @@ static int set_fan_speed(struct gpio_fan_data *fan_data, int speed_index)
>  			return ret;
>  	}
>  
> -	fan_data->speed_index = speed_index;
> -
>  	return 0;
>  }
>  
