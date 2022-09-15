Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBB7ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 08:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbiIOI0X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 04:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiIOI0W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 04:26:22 -0400
X-Greylist: delayed 1368 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 01:26:21 PDT
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com [192.185.51.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6461697D57
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 01:26:21 -0700 (PDT)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 3CCA5168B5E
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 03:03:33 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id YjqOo634oSQZkYjqPoYJfU; Thu, 15 Sep 2022 03:03:33 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nJOP38J+FJePmFsRZ3YbUhjRCPH3GKLi7Y/i3Z3JxTA=; b=qdCOC0iL0HvKBN2nUSgxwis+Qo
        wb7rkyr4a8w87YY8/5FjbG5leAZB5m8dh3WzGg7yQf/iL2qIbluc5WTqbUXbym2CPqhbmPdJsrBvg
        q8hI9YSS37M4aR/jGXU/bgdwOuN5UzhuxYn90kgac3guobGIlI4VPwr39gMZ8DqV+S/ieJylYorSK
        tkQznD3VcKh8GAKLCEpkc7rkX8MBADfN8QaTOq7kpO3Psmr6QUYZhNRwAI/HCtb4l6GmYf0t3hnzE
        oMT+n3JcR3bRh0vK4nnMOUesvzZXTEuL9NYLkNxnG2/mTgmL2sDYds910PDEdWMk/xpHrDEPlyVbu
        hc3WJkbQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60676 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oYjqO-003AHL-D0;
        Thu, 15 Sep 2022 08:03:32 +0000
Date:   Thu, 15 Sep 2022 01:03:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Liang He <windhl@126.com>
Cc:     tharvey@gateworks.com, rjones@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re: Re: [PATCH] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
Message-ID: <20220915080331.GA109875@roeck-us.net>
References: <20220915020245.4001047-1-windhl@126.com>
 <20220915065910.GA4098423@roeck-us.net>
 <4dc7624a.479c.1833ffc78b1.Coremail.windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dc7624a.479c.1833ffc78b1.Coremail.windhl@126.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1oYjqO-003AHL-D0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:60676
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 15, 2022 at 03:10:54PM +0800, Liang He wrote:
> 
> 
> 
> At 2022-09-15 14:59:10, "Guenter Roeck" <linux@roeck-us.net> wrote:
> >On Thu, Sep 15, 2022 at 10:02:45AM +0800, Liang He wrote:
> >> In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
> >> the of_find_compatible_node() which will automatically call
> >> of_node_put() for the 'from' argument.
> >> 
> >> Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
> >> Signed-off-by: Liang He <windhl@126.com>
> >> Signed-off-by: Mengda Chen <chenmengda2009@163.com>
> >
> >That second Signed-off-by: doesn't make sense in this context since
> >the patch is from and was sent by the first signer.
> >
> 
> >Guenter
> 
> 
> Hi, Guenter
> 
> I wonder if it is OK if mengda send a Signed-off-by for this 
> or I shoud resend another new version (V2) in which I only attach my SOB 
> and then mengda sends his SOB.
> 

That is not how it works. SOB means a patch passed through a person
(for example a sub-maintainer). One does not send it as response to
a patch. A tag sent as response should be Reviewed-by: or Acked-by:.

Thanks,
Guenter

> Thanks very much!
> 
> Liang
> 
> 
> 
> >> ---
> >>  drivers/hwmon/gsc-hwmon.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
> >> index d64be48f1ef6..b60ec95b5edb 100644
> >> --- a/drivers/hwmon/gsc-hwmon.c
> >> +++ b/drivers/hwmon/gsc-hwmon.c
> >> @@ -267,6 +267,7 @@ gsc_hwmon_get_devtree_pdata(struct device *dev)
> >>  	pdata->nchannels = nchannels;
> >>  
> >>  	/* fan controller base address */
> >> +	of_node_get(dev->parent->of_node);
> >>  	fan = of_find_compatible_node(dev->parent->of_node, NULL, "gw,gsc-fan");
> >>  	if (fan && of_property_read_u32(fan, "reg", &pdata->fan_base)) {
> >>  		of_node_put(fan);
> >> -- 
> >> 2.25.1
> >> 
