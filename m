Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58135C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 23:14:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E10961206
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 23:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhIJXPw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 19:15:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231742AbhIJXPv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 19:15:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B078E611AD;
        Fri, 10 Sep 2021 23:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631315679;
        bh=zQ+USSdtVq3YPexHfl3leCZXEF0GEF17q+rx40pNFVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i+q6VcNIqaRvtjK+Ic4yzNIWB8GYk0wtTLzhcEY6rfnU6oxpQvzn4YQWoKY6MjDTB
         dEYZhfvBZW/ivJSYKDst0IyvzfWWMgG5tCMS5rIGIiZdXm9L3dTRt4xEnEwFV2z9zR
         gs/ktHtcSPt+qHe14GYNWcKVSHsseKZVuX9vSys6ov25yHqAiUhAlNgdOZ0ROrTfjQ
         VKDkw6v9kXFXeZMhZbYRlHNwRS8L13AqFcJezIPnGt9E5V0nGpPr1lpKLGrHc4VJPD
         LnbypL6mJOcqth9akc8kq529leZyCXw/EEP538Su8FQs+gwspY/ToIq69e58KLAsWO
         mzfIp233LeKSA==
Received: by pali.im (Postfix)
        id F41D02828; Sat, 11 Sep 2021 01:14:37 +0200 (CEST)
Date:   Sat, 11 Sep 2021 01:14:37 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
        Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH] hwmon: dell-smm-hwmon: fix unused variable error
Message-ID: <20210910231437.vsfnsgn2a2wmcexp@pali>
References: <20210910071921.16777-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910071921.16777-1-rdunlap@infradead.org>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 10 September 2021 00:19:21 Randy Dunlap wrote:
> When CONFIG_PROC_FS is not set, there is a build warning (turned
> into an error):
> 
> ../drivers/hwmon/dell-smm-hwmon.c: In function 'i8k_init_procfs':
> ../drivers/hwmon/dell-smm-hwmon.c:624:24: error: unused variable 'data' [-Werror=unused-variable]
>   struct dell_smm_data *data = dev_get_drvdata(dev);
> 
> Fix this by making I8K depend on PROC_FS and HWMON (instead of
> selecting HWMON -- we prefer and try hard not to select entire
> subsystems).
> 
> Build tested in all possible combinations of SENSORS_DELL_SMM,
> I8K, and PROC_FS.
> 
> Fixes: 039ae58503f3 ("hwmon: Allow to compile dell-smm-hwmon driver without /proc/i8k")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pali Rohár <pali@kernel.org>

Acked-by: Pali Rohár <pali@kernel.org>

> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: x86@kernel.org
> Cc: Armin Wolf <W_Armin@gmx.de>
> ---
>  arch/x86/Kconfig |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20210910.orig/arch/x86/Kconfig
> +++ linux-next-20210910/arch/x86/Kconfig
> @@ -1255,7 +1255,8 @@ config TOSHIBA
>  
>  config I8K
>  	tristate "Dell i8k legacy laptop support"
> -	select HWMON
> +	depends on HWMON
> +	depends on PROC_FS
>  	select SENSORS_DELL_SMM
>  	help
>  	  This option enables legacy /proc/i8k userspace interface in hwmon
