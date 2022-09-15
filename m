Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91103ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 12:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiIOMZo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 08:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiIOMZn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 08:25:43 -0400
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com [192.185.51.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3903B65836
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 05:25:42 -0700 (PDT)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id AC447A052F
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 07:25:41 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id Ynw5o2GJsMdPuYnw5oR9mh; Thu, 15 Sep 2022 07:25:41 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=a/IJK6SMLChfmxSeE6cT43Vu89G3qJJfLypYnEY3NZY=; b=3edQTINZXCHYt13HZLLRzudEWV
        qzAV2GQM8d3VObljWq9Hjc2kPY7gMGBEeVAasxIn1JmUIvMq2UIdydghZ4LVgoic+Inq/HDcblm4g
        Ae6fSoNKuydt+SNS9zmrvdoH5Opog/ibsU8J522k8c2FAeklibfhhaoypLR3zTF5BD2p6eon3sst/
        w4DCKSf/8HJk4KxkfoaT+uTLrnwbNXIJE19N2JyIpHRG9jPMj77zvmOJHlrfeYyHnol+bGA5rySUB
        PsjCb/4bDuzRRjbJBAtSpsVRblZDlqpqFCMwOXFLuBL4OJdOZjFbFHVK+FnvJ/yYV3EpTe9xVb/qJ
        8JOWSHfg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53160 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oYnw4-001LpW-Px;
        Thu, 15 Sep 2022 12:25:40 +0000
Date:   Thu, 15 Sep 2022 05:25:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Liang He <windhl@126.com>
Cc:     tharvey@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re: [PATCH v2] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
Message-ID: <20220915122536.GA3190145@roeck-us.net>
References: <20220915090627.4007728-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915090627.4007728-1-windhl@126.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1oYnw4-001LpW-Px
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:53160
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 15, 2022 at 05:06:27PM +0800, Liang He wrote:
> In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
> the of_find_compatible_node() which will automatically call
> of_node_put() for the 'from' argument.
> 
> Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
> Co-developed-by: Mengda Chen <chenmengda2009@163.com>
> Signed-off-by: Mengda Chen <chenmengda2009@163.com>
> Signed-off-by: Liang He <windhl@126.com>

Sigh. The first signer is supposed to be the author.

Guenter

> ---
> 
>  v2: use proper tags advised by Guenter and based on Kernel Doc
> 
>  drivers/hwmon/gsc-hwmon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
> index d64be48f1ef6..b60ec95b5edb 100644
> --- a/drivers/hwmon/gsc-hwmon.c
> +++ b/drivers/hwmon/gsc-hwmon.c
> @@ -267,6 +267,7 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
>  	pdata->nchannels = nchannels;
>  
>  	/* fan controller base address */
> +	of_node_get(dev->parent->of_node);
>  	fan = of_find_compatible_node(dev->parent->of_node, NULL, "gw,gsc-fan");
>  	if (fan && of_property_read_u32(fan, "reg", &pdata->fan_base)) {
>  		of_node_put(fan);
> -- 
> 2.25.1
> 
