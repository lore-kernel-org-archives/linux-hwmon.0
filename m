Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AA4ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 08:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiIOIuY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 04:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiIOIuR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 04:50:17 -0400
X-Greylist: delayed 1435 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 01:50:16 PDT
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com [192.185.145.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7006AA29
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 01:50:15 -0700 (PDT)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 233F95BC3C
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 03:25:16 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id YkBPoolibQLX5YkBQogagS; Thu, 15 Sep 2022 03:25:16 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lIkX/rQ4hOCTEnWtvuRwJCKkdN6HwFRfJWeoCMpyD5w=; b=vXCX9yxPmztN0iX30qMbiDnEHL
        sj/IrH/ZcuhrK0902dzDz3n0nXtcolH6Dri2ykCNIxCPX/PxDxyc5Pjmljyfq2Rqrq2HZTEpkLNpv
        4AmpGD0vE83j8Z7jwIAhlhk2g7xjAIYbil3IXaHXiK5vBPXPFLI/7qcSKEerlTzn8EM8UY43u7zzz
        9v7RrKh5cbTbYwg0a3vUVKUDsa7B580iBkKWcS0+STlZ74gKqSJaBdlEguWii1mZ4h51etYOYtlK1
        4m0NN50smSvxY6R+Rd6UBmbeiDA9GWx690HIR+HoAaeh09OnzXieQAxpcF/bHGq3i9ZiwgR3/tDYS
        id2mlDaw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55630 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oYkBP-003RIK-D3;
        Thu, 15 Sep 2022 08:25:15 +0000
Date:   Thu, 15 Sep 2022 01:25:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Message-ID: <20220915082511.GA1313949@roeck-us.net>
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <20220906201035.GA3453623@roeck-us.net>
 <CAB95QAQRT5p5k=0D781aOra9uF3vw-92+T_CePd_7tzJDDH0Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB95QAQRT5p5k=0D781aOra9uF3vw-92+T_CePd_7tzJDDH0Yg@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1oYkBP-003RIK-D3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:55630
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 06, 2022 at 10:23:08PM +0200, Eugene Shalygin wrote:
> On Tue, 6 Sept 2022 at 22:10, Guenter Roeck <linux@roeck-us.net> wrote:
> > Are we getting any closer to fixing this problem ? If not, I'll have to start
> > reverting patches or even declare the driver as BROKEN.
> 
> Out of a few workarounds I've tried, none worked. I rework the module
> autoloading back to plain dmi data. Sorry, I'm totally busy until this
> Friday and can't prepare a patch until the end of the week. If that is
> too late, removing just the module autoloading
> (MODULE_DEVICE_TABLE(acpi, ...)) will fix the problem.
> 

Let's see if this works:

#regzbot fixed-by: 88700d1396ba

Guenter
