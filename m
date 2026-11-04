Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834452;
	b=3GsnkCdwaGCxb4Sx0PJ8D+SjONyJ4xHHq+1b1LyOkRLBhQ+hj+/hUC3z2ynIfUoTmwPd
	 /YB+1Y8EVMHRoZNjjM0WVwAy4llFfonBFWPOGaYxuMPJaeaqpgJNKduZGZEbP1nKgl86f
	 Aqgb50BgaNwk97IVCwrU/8yAQSwjnOBN4tjVKsCe8oUgWLUqaAeEDF8KNauGy2+yKPNIS
	 9rNcC1/0z1lCRLddKIM9XL06iehE1U0AZwIfyFij+Q6YoNtY0HWmy3R62bNScbqxNLcU6
	 cSIKPiy8I6GNg013c3RQsuNveTakUVcBnizVClBhSgwQ1khasXzFLYj4Eyqi4j8ChAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834452;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=8ioPBLXoKsZSCxTIuHLWWhHJhXU/FTy/hw4maw0vQoQ=;
	b=SAnva1vUaiJhIorTpcrnFkvSK+Sf+nwI0Eh9bzHUf/KO1Xmoa48VuDRq3VM/vjrmRqRX
	 6frZZGaKlE5Id4IEx1zc/1/gJkm4e8RGxNhnzgcTuP1OjXWbx/Cig72JE6AA26jztjkla
	 iy5eJ6eAwxHbLyCiiBg2zQFdkh7eGSZ5/LbD+IGPOEWn4X+oLqwXTXeKjhe3o/TykW0fd
	 VqQd4AqfqJ5CDMqgqudjfwob/VDVjNr7Qm2pFzsqcCmoIa9fG8NdjMdaVZDO3wCBG70ur
	 PTqizmbY9CH4pZ3CXIxrIi2722WKh3xu6SWLwsXzg/mbq9+sXD72i2cgBhUhixV3PnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gn1xrYC2;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE59F606A31B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 23:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE59F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gn1xrYC2
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id OiGAxtxfzyb4YOkHjxDP11; Wed, 04 Nov 2026 23:20:51 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OkHixa1TB3MEFOkHjxFHaJ; Wed, 04 Nov 2026 23:20:51 +0000
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=6aebbdd3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=ICjA5wv23ds22tp88nIA:9 a=QEXdDO2ut3YA:10 a=oR4HUqRzxioTCyxudRYx:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8ioPBLXoKsZSCxTIuHLWWhHJhXU/FTy/hw4maw0vQoQ=; b=Gn1xrYC2uGjp
	bqKKFTTS4WIXZgyiBILwrchjjx89kZxtorGqvtK/hStfakwqaVudE41JTRjB4g3SA1qvneppQfLNw
	TqMWK5rNQklxO0MdL/aLjLlQCjtEzPUtGMZKNi+LfTExisDKZwCtRE4cZzK1IwbmktM7K611RF75y
	h+mwkHDyW+0jxeYNKa6c8o54eomgotSugnh6Nt58/JMDKKptbeZKKaJvr9XDhZ8kr0V0tyipopDbL
	ej7jFEIo813V4HqI2kd+5XpC+IiO6C+luzBeSRzk1oN9kSnxnUgUOQkD4jHoVKuMUGo3R7oRIpdkG
	H7/wNGD19k0em/wdBzSf4w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60068)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOkHi-00000001byH-28C7;
	Thu, 05 Nov 2026 04:50:50 +0530
Message-ID: <5612f56c-fec6-47fd-b2d1-9d21bcf56124@roeck-us.net>
Date: Wed, 4 Nov 2026 15:20:49 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: use managed timer shutdown
To: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261105-kasync-devm-timer-1-kirtiar15502@gmail.com>
 <CADZg-m3OJAhUi8EzBeMQbcKKVTkBBN70mnkGmJzkj2t54xFxDQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADZg-m3OJAhUi8EzBeMQbcKKVTkBBN70mnkGmJzkj2t54xFxDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOkHi-00000001byH-28C7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:60068
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKlV89b7Z18B9ehUiOkY93n5l9rwnnGTlGfj3x5Aj5MVay/ny5KryMuYuDxdPqfFjvrxc79x3PHF+xPCxCmx0CR10grayF1GIP2Tv7xringDoQlGOEpb
 eNd3e5LqoNvIHwMkl3CbtHg/MIBiURvteQTkLZGMynsI6SL9XLOl0xu4XnAuYEqrcCwOkJDcqP3fKORS93V6h4G+dB0NugULp3tB/O3FNvcJSIsQQeMGhXyC

On 11/4/26 15:03, Kirtikumar Anandrao Ramchandani wrote:
> Replace the private devres timer cleanup action with
> devm_timer_autoshutdown(). Keep initialization and action registration at
> their existing positions, preserving the cleanup order. The system
> shutdown path continues to call timer_shutdown_sync() directly.
> 
> Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>

I fail to see how this would improve the code. This looks like just
a random change to me with no real benefit. It just replaces
devm_add_action_or_reset() with devm_timer_autoshutdown().

It also seems logically wrong: devm functions should be associated with
some initialization or action (such as devm_kzalloc -> kfree), and not
require a separate cleanup. I'd expect to see a devm_timer_setup()
or similar instead, if at all.

Guenter

> ---
>   drivers/hwmon/pwm-fan.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 9cabbe9f8..6b02c2687 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -8,6 +8,7 @@
>    */
> 
>   #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/hwmon.h>
>   #include <linux/interrupt.h>
>   #include <linux/module.h>
> @@ -493,13 +494,6 @@ static void pwm_fan_cleanup(void *__ctx)
>   	}
>   }
> 
> -static void pwm_fan_timer_cleanup(void *__ctx)
> -{
> -	struct pwm_fan_ctx *ctx = __ctx;
> -
> -	timer_shutdown_sync(&ctx->rpm_timer);
> -}
> -
>   static int pwm_fan_probe(struct platform_device *pdev)
>   {
>   	struct thermal_cooling_device *cdev;
> @@ -650,7 +644,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	}
> 
>   	if (ctx->tach_count > 0) {
> -		ret = devm_add_action_or_reset(dev, pwm_fan_timer_cleanup, ctx);
> +		ret = devm_timer_autoshutdown(dev, &ctx->rpm_timer);
>   		if (ret)
>   			return ret;
> 
> @@ -710,7 +704,7 @@ static void pwm_fan_shutdown(struct platform_device *pdev)
>   {
>   	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
> 
> -	pwm_fan_timer_cleanup(ctx);
> +	timer_shutdown_sync(&ctx->rpm_timer);
>   	pwm_fan_cleanup(ctx);
>   }

