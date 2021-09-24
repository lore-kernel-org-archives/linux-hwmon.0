Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20650C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D5161164
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244854AbhIXMHP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:07:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:54820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239965AbhIXMHO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:07:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6D7F6103B;
        Fri, 24 Sep 2021 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632485141;
        bh=jAFVQ2WX/R+7fe+RczhhiIroLG2ushyyDQxrVccLfRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qhcgTfhIhAK30wRGnDbHc1Ml/a/+1vfSGcEPThvH0V89hdcYvHAO7KhOVZduDBNbi
         cZ4reiMi9Q3cGCEf00itr1jP3n/fJqu/5KMatENQNk+9HWzdWripojvTQcpnoL59Z+
         fIxYjTs2VMkHwfjE9BCKYqJgvqx8itO2/jsgABX5Z3qGer7W5qaeQ5XKURJvurbXTI
         hOuWxipMW+Bka/ii0BSJb4OsvkisFWX8rQMX6ZnTYr3sg2irc+/y8l7vs/ZuvH7rq1
         wCk/etSnvRFm581HyOZ4YGtVn2Y3742FJ5sjpJg6vg8zaMa7lTeOHEWHNwI1LJNS51
         tase1gfT5BDnw==
Received: by pali.im (Postfix)
        id 3D7347A6; Fri, 24 Sep 2021 14:05:39 +0200 (CEST)
Date:   Fri, 24 Sep 2021 14:05:39 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (dell-smm) Remove unnecessary includes
Message-ID: <20210924120539.mlelnybf23rhtgh6@pali>
References: <20210924114505.20416-1-W_Armin@gmx.de>
 <20210924114505.20416-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924114505.20416-3-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 24 September 2021 13:45:05 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> sched.h and io.h are not used anywhere in dell-smm-hwmon.c.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Pali Rohár <pali@kernel.org>

sched.h is not used anymore as driver now calls smp_call_on_cpu() function.

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index d7d8da4a63db..30be7e5574a3 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -26,8 +26,6 @@
>  #include <linux/mutex.h>
>  #include <linux/hwmon.h>
>  #include <linux/uaccess.h>
> -#include <linux/io.h>
> -#include <linux/sched.h>
>  #include <linux/ctype.h>
>  #include <linux/smp.h>
> 
> --
> 2.20.1
> 
