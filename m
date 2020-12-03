Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8638C6369E
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Dec 2020 01:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B78B20B80
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Dec 2020 01:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgLCBmu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Dec 2020 20:42:50 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:42380 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725959AbgLCBmt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Dec 2020 20:42:49 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id 21278175B38
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Dec 2020 18:42:08 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kddHkV7Qih41lkddHkXrlZ; Wed, 02 Dec 2020 18:42:08 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=RNid4bq+ c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=i0EeH86SAAAA:8
 a=Xh6zJbZDEGPx5RZpYiQA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CJQBZQgclR2qlRVrWV0UWebR3MfcFwB4yyNtVK5d43o=; b=OMX2Q+OmG/f2Tr4t8SzpzGZ2yi
        SkNAe6sVj/TChA9QJOehmCvfFVyrQzDUuUOmLn2f/BtgmZ9bvR8kQS94HYO7sPiVRwKmsznYDhkM1
        kiqlkEKvqWZcBzNObkHBGdVmMxiAbzyyKU6DAHejit9Xawz8arXZDNZ+RpnTejCBujeldr7LJryeW
        8x3knTZMtillVuSm5C51k1s/elzZJpZphPu+Bi3tRjmE7bTAsdDfmkcfC2Oq001BodU/ImhxgAGcf
        obHSegJSi7OFo24qABdNIqEh4DV7aZQvYGDhwMIG5fvAPWZMcnh18I4uJm577HiCvua4hWj5zwhkO
        W09zODlA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40118 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkddH-002PvZ-7s; Thu, 03 Dec 2020 01:42:07 +0000
Date:   Wed, 2 Dec 2020 17:42:06 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (ina3221) Fix PM usage counter unbalance in
 ina3221_write_enable
Message-ID: <20201203014206.GA229313@roeck-us.net>
References: <20201202145320.1135614-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202145320.1135614-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkddH-002PvZ-7s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:40118
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 02, 2020 at 10:53:20PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced. It depends on the mainline commit[PM: runtime:
> Add pm_runtime_resume_and_get to deal with usagecounter].
> 
> Fixes: 323aeb0eb5d9a ("hwmon: (ina3221) Add PM runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Applied (again), this time on top of v5.10-rc6.

> ---
> Changlog:
> v2
> - add the dependency for the fix.
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
