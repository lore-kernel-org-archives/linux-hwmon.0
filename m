Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0058EC63777
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Nov 2020 03:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99A5120853
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Nov 2020 03:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="WQGTaWet"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgK2DFH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Nov 2020 22:05:07 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:43921 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725839AbgK2DFG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Nov 2020 22:05:06 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id 3592B215C62
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 20:04:24 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id jD0hk2OGGh41ljD0ik5ia8; Sat, 28 Nov 2020 20:04:24 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=GNom7NFK c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=i0EeH86SAAAA:8
 a=gn4bIdh1MlNQuH4KYN4A:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uMZPVbWJTPao6lJBCqVENczwTjgrEEYPDxJhzylDwes=; b=WQGTaWetRLfQ37AzCSFoTvvpaD
        YkLCTstV5l36t0dhz1/mENIr4Y2Jftoz5W/t6uw759yQxoRa2lZFQ3Ni7Di2bntnfwMQDGkOXUKcv
        eu5eP6Ifz7lAUQw7A9zle3H6VjnAxzI/u7KzuDMj59AV7z47GIXqvlpZNjuiQ/UijLtQ0SyxIEsaa
        MFhm/3/80Oe2H2Fykp55jL+YsKYV8v/ZkkiAQzlRwIguIkCk9lSg0MyZTgOww5wHYBLY+IE0aAHqB
        GZR8VzVZsDDfptdLW6GIBVvuwhz5Rqej92OmcSczUA0TgAaEIjfPDAyHfm0/2HY/Ov2foO7t1XdaT
        4ZltjEpg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49504 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kjD0h-000HEp-BY; Sun, 29 Nov 2020 03:04:23 +0000
Date:   Sat, 28 Nov 2020 19:04:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina3221) Fix PM usage counter unbalance in
 ina3221_write_enable
Message-ID: <20201129030422.GA96772@roeck-us.net>
References: <20201123102000.3864999-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123102000.3864999-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kjD0h-000HEp-BY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:49504
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Nov 23, 2020 at 06:20:00PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced.
> 
Turns out this function doesn't exist in the mainline kernel,
meaning it can not be used to fix a patch in the mainline kernel.
I dropped this patch from my queue.

Guenter

> Fixes: 323aeb0eb5d9a ("hwmon: (ina3221) Add PM runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/hwmon/ina3221.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 72cfdc007e60..d80bd3efcd6d 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -489,7 +489,7 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
>  
>  	/* For enabling routine, increase refcount and resume() at first */
>  	if (enable) {
> -		ret = pm_runtime_get_sync(ina->pm_dev);
> +		ret = pm_runtime_resume_and_get(ina->pm_dev);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to get PM runtime\n");
>  			return ret;
