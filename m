Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18BFC56201
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 01:45:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D7CC20B1F
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 01:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="yLV7LShA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731040AbgKZBp1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 20:45:27 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:56951 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbgKZBp1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 20:45:27 -0500
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id BFF44176343
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2020 18:45:26 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id i6LekxjteeMJHi6Lek5I0y; Wed, 25 Nov 2020 18:45:26 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Dpx4Bl3+ c=1 sm=1 tr=0
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
        bh=Zypw0dI7Wi9fB7HddjxJ7as97tr3VosQbpzHWpsm780=; b=yLV7LShAjovvfqS+zadinUhlVu
        GheJNLxAQgWdHfy21s1F+kOEq3URpsObPlB4yRpCiGBPGsNl9/76lHMK+9ddIoKeux+ODU/kByoMj
        l7TWAZelqr6lyeJB8xDbzOYfXTP3cmUfUQl3vW46WOx2dG2COTa54tg0fejK1xc/9Mg9zpPM2NNhZ
        ydWCexFmmmcNLLHWBHLfywgFfIOP8xwYHTiwQCs2ipM5G1LUYtfkNOxxw6e5+r1RdCMNAcb+p+Lvw
        fMkNHIxZlJmdzcRJDqq+y9xndBrVT7Rx5hi2daCyeLQHn6XUHmMiIus8LjeijWkLKgyBrQgWrN57l
        U7w2Fq0w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36398 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1ki6Ld-002cZJ-Rt; Thu, 26 Nov 2020 01:45:25 +0000
Date:   Wed, 25 Nov 2020 17:45:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: pwm-fan: Refactor pwm_fan_probe
Message-ID: <20201126014525.GD111386@roeck-us.net>
References: <20201113150853.155495-1-pbarker@konsulko.com>
 <20201113150853.155495-2-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113150853.155495-2-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1ki6Ld-002cZJ-Rt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:36398
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 13, 2020 at 03:08:50PM +0000, Paul Barker wrote:
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

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
> 2.29.2
> 
