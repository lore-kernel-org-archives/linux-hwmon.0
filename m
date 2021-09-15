Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB1DC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 15:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB6D961186
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 15:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbhIOPTW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Sep 2021 11:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234219AbhIOPTV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Sep 2021 11:19:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7319361250;
        Wed, 15 Sep 2021 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631719082;
        bh=rETl1ITFqJYTo4pM+KGuOaWAL+c/tZ2zI/j83Vx73+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hyT1FWdCfwby5C3tDIYxq/1rsVWHSjRvCR/jxInpV7JUYekdWtqkVtt9W/rpZyF7u
         0NMizs2FJqEXwE8C6+Wr/P7DqOGEWXhlM+OEeMs99wXPWJ8eJeHB5fiJQ0oty8AScr
         vOw/glNmItkbNWEVqwjw7jd1s7c8KX2vCF5voYso15F/9oWAVXXkWwm+Q/ocHkOyPd
         7W4noPTN0FuPfTxvgFnX6QwQCLQ/kX+7qWJYU/1wW1O3LkqGvtHePhVjyuZcOC5bQP
         vXZM3YKFQIwkLxczDwvHhPSLrqh7M+alnrGqXwajYECYb1FTG1J62+L+Q+fb9Afd5d
         HFaDAoU9HpXXA==
Received: by pali.im (Postfix)
        id 255BD5E1; Wed, 15 Sep 2021 17:18:00 +0200 (CEST)
Date:   Wed, 15 Sep 2021 17:17:59 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Adam Borowski <kilobyte@angband.pl>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Don't build the proc interface if
 there's no /proc
Message-ID: <20210915151759.cxcbzxd74weg4qw6@pali>
References: <7a259cc4-69a8-fc0c-e256-5d82b6f1bb35@roeck-us.net>
 <20210915143801.43419-1-kilobyte@angband.pl>
 <20210915151613.GA3272120@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915151613.GA3272120@roeck-us.net>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wednesday 15 September 2021 08:16:13 Guenter Roeck wrote:
> On Wed, Sep 15, 2021 at 04:38:01PM +0200, Adam Borowski wrote:
> 
> There should be some description here.
> 
> > Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> 
> Otherwise, for the content:
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> > ---
> > Guenter wrote:
> > > > -#if IS_ENABLED(CONFIG_I8K)
> > > > +#if IS_ENABLED(CONFIG_I8K) && IS_ENABLED(CONFIG_PROCFS)
> > 
> > > This should be expressed as Kconfig dependency: I8K should depend on PROCFS.
> > > Otherwise the configuration flag is misleading.
> > 
> > Right, I did not notice I8K does nothing otherwise.
> > 
> >  arch/x86/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 4e001bbbb425..a7365695ff72 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -1253,6 +1253,7 @@ config I8K
> >  	tristate "Dell i8k legacy laptop support"
> >  	select HWMON
> >  	select SENSORS_DELL_SMM
> > +	depends on PROC_FS

Seems like this patch is duplicate of another pending patch:
https://lore.kernel.org/linux-hwmon/20210910071921.16777-1-rdunlap@infradead.org/

> >  	help
> >  	  This option enables legacy /proc/i8k userspace interface in hwmon
> >  	  dell-smm-hwmon driver. Character file /proc/i8k reports bios version,
> > -- 
> > 2.33.0
> > 
