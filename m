Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBA7C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 17:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBCB160F42
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 17:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhHNRuj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 13:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhHNRuj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 13:50:39 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B09C061764
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 10:50:10 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso3193955ott.13
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3DsaZ4LHR0nzEV92W33alIhl6fb3QxneFTiANcfHJDo=;
        b=Tkl4LJz+8EfV2UjPmxqWcOOwxEceVrY/t//gh1kE3hWtbTeG3gn4B5rREWVWtUTbmG
         WncjK/ZQkLeNXFpp3a3RznVhxopmARyM+3farBmjVvid2+wJRFT7CLTYDnTJylfK6rfJ
         r8AFvKjOz1oBMklGJg3gIgucA4sGoYo6J9T1cnYmeYgXbYMsUILihWqDIGHUg9dtc2Kn
         qjxrflrU2cdNt2k0PnsbqdYhrQwpxMm8aQjRGWOkHIbgjn7zBFJW+OlcElsbMuFCgRs8
         jiBGawS2RNHIJ3ldTuR2e5E80kgAeQDSqVQpjIiIYqvO5Q1EghGNGWmEAcHni6dwCWFT
         14gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=3DsaZ4LHR0nzEV92W33alIhl6fb3QxneFTiANcfHJDo=;
        b=U60uXN/uyDW1SIXvjblACGYAXXGv1o/eKMpKbdJ/jrrS/UVmZc10LfpjTXcwYkFJA4
         Fn4kZVs4hdJ0NlNa+gO8em2EiEN/766Q4Xo0O1mRK9B6TzIa/taiUFlVuBXOvphNpTAs
         /ocrrKrlKAwgLG4fCRYiQ2Y3kXChmDUH/vjio9XFx1mCBbdaT9BC3Tqy1hVdoGuV/ggK
         SfikzwqjAmrgX+08fj4PFAuzjJlkfBI3LT8xodHGHzbXs+SLILObN/L6sP160sBOfRJK
         DboPLw9KiIBLqk7fBQvvBBu+HoujV/86Gq3WZET52DYkQoAoiO3oLefgmglPkHNydQfl
         CG8Q==
X-Gm-Message-State: AOAM531PozHhtOlxprwXaoqq+l1JOly/rBBr3PFysICs3MO9ly5mz2L0
        UvMo3s2Ko0X7wRTpEuKJRaU=
X-Google-Smtp-Source: ABdhPJzRCYRS0IfpW27MuEfRPvaUb/x00AX4F96e/19xWKWRp36RGiluVfSCx8Z9Lc/LQ9Np8YptCw==
X-Received: by 2002:a05:6830:1bec:: with SMTP id k12mr6630089otb.118.1628963410059;
        Sat, 14 Aug 2021 10:50:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b11sm994313ooi.0.2021.08.14.10.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 10:50:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 Aug 2021 10:50:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (dell-smm) Mark i8k_get_fan_nominal_speed as
 __init
Message-ID: <20210814175008.GA2769226@roeck-us.net>
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-5-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814143637.11922-5-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Aug 14, 2021 at 04:36:37PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Mark function i8k_get_fan_nominal_speed() as __init since
> it is only used in code also marked as __init.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 0e229e3dae33..8bbeeda13faf 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -303,7 +303,7 @@ static int i8k_get_fan_type(struct dell_smm_data *data, int fan)
>  /*
>   * Read the fan nominal rpm for specific fan speed.
>   */
> -static int i8k_get_fan_nominal_speed(const struct dell_smm_data *data, int fan, int speed)
> +static int __init i8k_get_fan_nominal_speed(const struct dell_smm_data *data, int fan, int speed)
>  {
>  	struct smm_regs regs = { .eax = I8K_SMM_GET_NOM_SPEED, };
