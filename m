Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20274C6FA8B
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 11:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiIPLJt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 07:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbiIPLJ1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 07:09:27 -0400
X-Greylist: delayed 1270 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Sep 2022 04:03:25 PDT
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.4.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8208A3895
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 04:03:25 -0700 (PDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 21189400C4377
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 05:42:07 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id Z8nOoBAz7QLX5Z8nOo2K86; Fri, 16 Sep 2022 05:42:07 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cdkVS+B4fyYiAriQrnqRsI7YRvJGQgIVmLVg3RoDh0s=; b=CFngebensG4FV/kl5v6dB66LFp
        9+/k1i/zQKTMC1DzDdsjD+fbO1dX2DDOVZgGJXrdqf8q1jPJwvWf3NosUgMfkEs/9zbbmQu5sNySn
        HwCA9ilI/2HShFnUZwR0MLSJ85jhd9WhxuIhBzSVm9Na+sbtgXccAP2e89V7Wl3ygRN/7OpeFLYkX
        Ays0zR/NERo/zpK/3bdY242JCYzJjKT4WPrNToMJAHGJ9Oy64przNoUb4j5Z5Qqmytn7ssqWGY8uo
        cjb4O2qZvTkPBJujM/xiUQdsLvnbpjs9lGZKhm4Jt1DhBWQxlhwv4MTeGEE75bxNhm8mWOYixAQ4d
        Ra1vTgXg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36880 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oZ8nO-000m9S-4S;
        Fri, 16 Sep 2022 10:42:06 +0000
Date:   Fri, 16 Sep 2022 03:42:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Liang He <windhl@126.com>
Cc:     tharvey@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re: Re: Re: [PATCH v2] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
Message-ID: <20220916104201.GA4060280@roeck-us.net>
References: <20220915090627.4007728-1-windhl@126.com>
 <20220915122536.GA3190145@roeck-us.net>
 <34c8065f.783c.18341453f34.Coremail.windhl@126.com>
 <20220915164346.GA2994323@roeck-us.net>
 <4173bc92.fe1.18343edbfc7.Coremail.windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4173bc92.fe1.18343edbfc7.Coremail.windhl@126.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1oZ8nO-000m9S-4S
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:36880
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 16, 2022 at 09:33:18AM +0800, Liang He wrote:
> 
> Thanks for your advice, so following tag order is acceptable?
> 
> Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
> Signed-off-by: Liang He <windhl@126.com>
> Co-developed-by: Mengda Chen <chenmengda2009@163.com>
> Signed-off-by: Mengda Chen <chenmengda2009@163.com>
> 
Yes, if the author is Liang He and I get the e-mail from Mengda Chen.

Guenter
