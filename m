Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052BBC6FA86
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 17:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIOREi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 13:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiIOREh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 13:04:37 -0400
X-Greylist: delayed 1242 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 10:04:35 PDT
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.196.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAF864ED
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 10:04:34 -0700 (PDT)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 587C28DFF
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 11:43:51 -0500 (CDT)
Received: from 162-215-252-169.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id YrxvoNU3dCE4UYrxvoENi0; Thu, 15 Sep 2022 11:43:51 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Gx1WpFdNpjFVVHDr8oKxzkXRSQSy9ZJLGokEEIMJstE=; b=ZmRf2v72JCjb+dEs2elmDLAd9B
        FizZRAod3gUnBVXVCdzMdcmUpm1d4aLRu516L5Tup4lF46BH9+kGqV0SPUVBnD8ZPv95LrbE2FAml
        MXxJwI7dseHz1Z26mpPWqBM+oJWXhhWfjV7RQ0EbR6Ksw72nvuHGoLD4AT2A9lkx5pHBoryp2r0eu
        P1YqaQrdjBWlGsThpd80AyDzc8bPGLFmHPlXeml8lYfLlAfDm6ucpshfSABuY5kzQ2r0qv2Ip81JV
        XsNlDBIn662jx8N2JJ12icRwDZJiv0Q7iM7KjvfP43QKixTq+zXK6zbLluTEeBOE2rqkuKvHm5dcL
        /flf+wYg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53704 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <linux@roeck-us.net>)
        id 1oYrxu-003qpq-Jo;
        Thu, 15 Sep 2022 16:43:50 +0000
Date:   Thu, 15 Sep 2022 09:43:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Liang He <windhl@126.com>
Cc:     tharvey@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re: Re: [PATCH v2] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
Message-ID: <20220915164346.GA2994323@roeck-us.net>
References: <20220915090627.4007728-1-windhl@126.com>
 <20220915122536.GA3190145@roeck-us.net>
 <34c8065f.783c.18341453f34.Coremail.windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34c8065f.783c.18341453f34.Coremail.windhl@126.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1oYrxu-003qpq-Jo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:53704
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 15, 2022 at 09:10:00PM +0800, Liang He wrote:
> 
> 
> At 2022-09-15 20:25:36, "Guenter Roeck" <linux@roeck-us.net> wrote:
> >On Thu, Sep 15, 2022 at 05:06:27PM +0800, Liang He wrote:
> >> In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
> >> the of_find_compatible_node() which will automatically call
> >> of_node_put() for the 'from' argument.
> >> 
> >> Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
> >> Co-developed-by: Mengda Chen <chenmengda2009@163.com>
> >> Signed-off-by: Mengda Chen <chenmengda2009@163.com>
> >> Signed-off-by: Liang He <windhl@126.com>
> >
> >Sigh. The first signer is supposed to be the author.
> >
> >Guenter
> 
> Hi, Guenter
> 
> I search the commit history and found several recent but different commits 
> 
> This one is same with mine: Co-developed-by: A & SOB First & SOB Author,  following the kernel doc 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.0-rc5&id=7e97cfed9929eaabc41829c395eb0d1350fccb9d
> 
> But, this one is consistent with your advise: SOB Author & Co-developed-by: A & SOB A
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.0-rc5&id=ef69aa3a986ef94f01ce8b5b619f550db54432fe
> 

Yes, I know, one can always find an example for everything
in the Linux kernel.

I expect the first signer to be the author, and the last signer
to be the person who sent me the patch.

Guenter
