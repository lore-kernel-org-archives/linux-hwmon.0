Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959C5C83024
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D9BA221FF
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="rq0L3sJD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388832AbgK1Vtp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:45 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:54067 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387681AbgK1UVE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Nov 2020 15:21:04 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id A7568175ADF
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 13:20:19 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id j6hfkTFRddCH5j6hfkXy7m; Sat, 28 Nov 2020 13:20:19 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=cYj8UELM c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=k-42gJp3AAAA:8
 a=_jlGtV7tAAAA:8 a=CzpCDfCmYOB-EhiA7ZkA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=uCSXFHLys93vLW5PjgO_:22 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UJbb9VFU43HcmwG6wyFs+VS+QBKf/BcH5kepjPTxOC4=; b=rq0L3sJD53RCZpzSJ8Nxup5bGh
        EU9tMooz9Og5Foglt+68BjZbZgW/0zQQlTOMBiI/I6WFzMOl7gNV5fHsYd4D3YHGmZGeOGqHa0BfI
        ErWQNLM2Vmz5vAI27vVjeCZ4MvmuLenK2PxwE3nMhCdPgGKPt1kiW+bm5LOINNtGpiIhqtdxjGdi9
        C+Qoog37CwnDQpCNteIzQGdv1E/5x7LE/KKVwgwLwWg2Lh2tWGfx1EIEoKvUrNpc6n5zLYEK7Zn07
        +3T9n7LR5GIrBQa2WKVlYkRFvMjscKS/tlT1B2LFHanZbI3d9kKKucUvf6KZGxpRp9fkYPkEP6Gge
        wvseKrSw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48424 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kj6he-0029DY-Mk; Sat, 28 Nov 2020 20:20:18 +0000
Date:   Sat, 28 Nov 2020 12:20:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: pwm-fan: Refactor pwm_fan_probe
Message-ID: <20201128202018.GA88973@roeck-us.net>
References: <20201128174909.26687-1-pbarker@konsulko.com>
 <20201128174909.26687-2-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128174909.26687-2-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kj6he-0029DY-Mk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:48424
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Nov 28, 2020 at 05:49:08PM +0000, Paul Barker wrote:
> Use platform_irq_count to determine the number of fan tachometer inputs
> configured in the device tree. At this stage we support either 0 or 1
> inputs.
> 
> Once we have this information we only need to read the
> pulses-per-revolution value if a fan tachometer is actually configured
> via an IRQ value.
> 
> Also add a debug print of the IRQ number and the pulses-per-revolution
> value to aid in investigating issues.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pwm-fan.c | 50 +++++++++++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 1f63807c0399..efe2764f42d3 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -286,7 +286,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	struct device *hwmon;
>  	int ret;
>  	struct pwm_state state = { };
> -	u32 ppr = 2;
> +	int tach_count;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -300,10 +300,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, ctx);
>  
> -	ctx->irq = platform_get_irq_optional(pdev, 0);
> -	if (ctx->irq == -EPROBE_DEFER)
> -		return ctx->irq;
> -
>  	ctx->reg_en = devm_regulator_get_optional(dev, "fan");
>  	if (IS_ERR(ctx->reg_en)) {
>  		if (PTR_ERR(ctx->reg_en) != -ENODEV)
> @@ -339,20 +335,40 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	of_property_read_u32(dev->of_node, "pulses-per-revolution", &ppr);
> -	ctx->pulses_per_revolution = ppr;
> -	if (!ctx->pulses_per_revolution) {
> -		dev_err(dev, "pulses-per-revolution can't be zero.\n");
> -		return -EINVAL;
> -	}
> +	tach_count = platform_irq_count(pdev);
> +	if (tach_count < 0)
> +		return dev_err_probe(dev, tach_count,
> +				     "Could not get number of fan tachometer inputs\n");
> +
> +	if (tach_count > 0) {
> +		u32 ppr = 2;
> +
> +		ctx->irq = platform_get_irq(pdev, 0);
> +		if (ctx->irq == -EPROBE_DEFER)
> +			return ctx->irq;
> +		if (ctx->irq > 0) {
> +			ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
> +					       pdev->name, ctx);
> +			if (ret) {
> +				dev_err(dev,
> +					"Failed to request interrupt: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
>  
> -	if (ctx->irq > 0) {
> -		ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
> -				       pdev->name, ctx);
> -		if (ret) {
> -			dev_err(dev, "Failed to request interrupt: %d\n", ret);
> -			return ret;
> +		of_property_read_u32(dev->of_node,
> +				     "pulses-per-revolution",
> +				     &ppr);
> +		ctx->pulses_per_revolution = ppr;
> +		if (!ctx->pulses_per_revolution) {
> +			dev_err(dev, "pulses-per-revolution can't be zero.\n");
> +			return -EINVAL;
>  		}
> +
> +		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
> +			ctx->irq, ctx->pulses_per_revolution);
> +
>  		ctx->sample_start = ktime_get();
>  		mod_timer(&ctx->rpm_timer, jiffies + HZ);
>  	}
> -- 
> 2.26.2
> 
