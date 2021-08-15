Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5F5C4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Aug 2021 11:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DD1B61056
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Aug 2021 11:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238244AbhHOLlF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Aug 2021 07:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237921AbhHOLkz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Aug 2021 07:40:55 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5131AC0617AD
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Aug 2021 04:40:25 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id r5so22845607oiw.7
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Aug 2021 04:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rcW7m1uISjcX0SNSKrmpg6o+psKMNDOMUgPminb4CH4=;
        b=OFB9n+pcSJBXtxY4ZoqhjMid+ht/fkJJbALI+2LokZs5KdYUNtrVv0+UavgtLGGeNu
         c8hXhKypAmkixYObJibC1xkln6NxPj+ny/D1K8FbizV3YI2nIrjU4cgVSqvhB25UeOMf
         Gt2QmHkC3l7YRR8Spr9xoRTrMq+eeneASdvuCPE70sHqfHLSGyKGJTRzmNWOi89o7IDn
         a7qWC8Ti9kKtHRjsVdyuEWJplitL/PnzH8jVYLHjuSyn5r15US7Kt+8ukZUrN+uEbpT2
         6eaNuBIHmnieMu9tgbqWTrYFajnYg8wVnjgAwDEzJUqd9tyd7dIznmUd9rtPQ0wdZDds
         yPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=rcW7m1uISjcX0SNSKrmpg6o+psKMNDOMUgPminb4CH4=;
        b=gYB75bFNNAfnZ2BqiUtptjLhfD09Kh62Xwaf1z88M5xd2fnkKsQEGmK88T+xAWUxMa
         1Qvz86leoeKDrYznW5WyGYnXehyjY2aVfDcKtugsm9oWAjQKUdb97J3AeZuKpVSSF4Qb
         BBVR2dl9xZyA/+jZUps+C4zxIaQ35Vpz8HO5z9hjqlRFdWn0tzwJxiHM5YP59kRaJLHb
         2lsYwUSaz/x3GvdNrTbKjFhg7tNjjbJGDa9zlC/1kEIYGhj863JNQ7rGRBcmWEWYToit
         ETzoJFe8K6mM08VunUyAidBd+zMp2QkLtSWQX5ng1ctoxPUWWyEVbytVzXlXAdw7bf8v
         hsmw==
X-Gm-Message-State: AOAM531aI0CSpOJk/XBguAeLk9pO1rx6b9gWp/+wfQZFsMle8jLgwqDI
        8n4qms0vjBNRT2Qhe7Duw55IAqiFRII=
X-Google-Smtp-Source: ABdhPJwLJ2OF594n6+vAa3bEQ/qOkfWlDLmibaYr7iLFnV1twpTuU6H3GnXuxlj/ywXr+g5MhO1BTA==
X-Received: by 2002:a54:4192:: with SMTP id 18mr2768164oiy.163.1629027624638;
        Sun, 15 Aug 2021 04:40:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o68sm1588768ota.33.2021.08.15.04.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 04:40:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 15 Aug 2021 04:40:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND v2] hwmon: (dell-smm) Rework SMM function debugging
Message-ID: <20210815114022.GA1425118@roeck-us.net>
References: <20210814190516.26718-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814190516.26718-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Aug 14, 2021 at 09:05:16PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Drop #ifdef DEBUG and use ktime_us_delta()
> for improved precision.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter

> ---
> Changes in v2:
> - remove #ifdef DEBUG completly
> - init each variable at one line
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 68af95c1d90c..25fac796fc86 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -158,17 +158,12 @@ static inline const char __init *i8k_get_dmi_data(int field)
>   */
>  static int i8k_smm_func(void *par)
>  {
> -	int rc;
> +	ktime_t calltime = ktime_get();
>  	struct smm_regs *regs = par;
>  	int eax = regs->eax;
> -
> -#ifdef DEBUG
>  	int ebx = regs->ebx;
> -	unsigned long duration;
> -	ktime_t calltime, delta, rettime;
> -
> -	calltime = ktime_get();
> -#endif
> +	long long duration;
> +	int rc;
> 
>  	/* SMM requires CPU 0 */
>  	if (smp_processor_id() != 0)
> @@ -230,13 +225,9 @@ static int i8k_smm_func(void *par)
>  	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
>  		rc = -EINVAL;
> 
> -#ifdef DEBUG
> -	rettime = ktime_get();
> -	delta = ktime_sub(rettime, calltime);
> -	duration = ktime_to_ns(delta) >> 10;
> -	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lu usecs)\n", eax, ebx,
> -		(rc ? 0xffff : regs->eax & 0xffff), duration);
> -#endif
> +	duration = ktime_us_delta(ktime_get(), calltime);
> +	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lld usecs)\n", eax, ebx,
> +		 (rc ? 0xffff : regs->eax & 0xffff), duration);
> 
>  	return rc;
>  }
