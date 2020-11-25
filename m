Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC34C5519F
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Nov 2020 14:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E55E2083E
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Nov 2020 14:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="rhB2jare"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgKYOlD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 09:41:03 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:54248 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgKYOlC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 09:41:02 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id EE7ED14056D
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2020 07:41:01 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id hvyfk4ZgcdCH5hvyfk9kke; Wed, 25 Nov 2020 07:41:01 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=CKwEoyjD c=1 sm=1 tr=0
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
        bh=whq5Ve+sFwJrmiYOMx+jfwgja+nzE1LKf0PSfqEI2lU=; b=rhB2jareZPLHqd3xOQIFEFcnGf
        gukUK+o2EiH4je+MDxzjD2HE8v1HIlKu/dbUb2obz7I+nG0LIOK+4ecCKvxijM6EqrsYS4mUguHMq
        dqdrM8GVtzWHeeOQbn3+dvXXsSpEzr/vtykS2WfrkrJ8u/4L2GUDOooQWqpPLizvcNa8xxZ4wsbsc
        FUy8RKq+yhF+N2YL8yjsO6d3DtV3D4ZYVtO4fIMrkQAQaeApjDzyAHl4OyiUnHGBf4Gn4qt/tll+6
        NUa64BmVeCSXDAZS1blsVtTKqG24Oo4phviykJahZG249mtIqf5S5NJQHU7zHog8eT4P+9AmrkF3S
        chz89gWA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34486 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1khvyf-002UPP-31; Wed, 25 Nov 2020 14:41:01 +0000
Date:   Wed, 25 Nov 2020 06:41:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina3221) Fix PM usage counter unbalance in
 ina3221_write_enable
Message-ID: <20201125144100.GA97684@roeck-us.net>
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
X-Exim-ID: 1khvyf-002UPP-31
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:34486
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 42
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
> Fixes: 323aeb0eb5d9a ("hwmon: (ina3221) Add PM runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Applied.

Thanks,
Guenter

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
