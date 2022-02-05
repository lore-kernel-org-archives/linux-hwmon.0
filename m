Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E15C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 17:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380798AbiBER5q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 12:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiBER5q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 12:57:46 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB01C061348
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Feb 2022 09:57:45 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id u13so12503481oie.5
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Feb 2022 09:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=unWkpnT2aWo4Ge6R2otyIk3cQsT5CMlyKuWQ6jlxwG4=;
        b=JX4C/aTZuj15loiYTYyYf7/6bViEwSjpz3b8Qc3E25rVmEp7IeYUZ6NFra0hKIgivU
         vsXZOxc7/FCpU2scIXKKiiUPWUrFe7tFH9ad+JddXKRFHLpDQwJDj1eGbBPECIT/HRUi
         u/LJDDcNSnkPESDxshcGEKEB65wH5JZ3z3TQrVAsLZLeiW1rBcOI9GGU4ftJ+GEjj/gv
         iLhO0OoQBluMfDumSq5P8omuSodbyzTLi5AyJDTyE8Hba5iexmoJL2p7L+l2DPO3HIxz
         s11uTRTyVO5OK+8I1lYobBNa+OHqm74yAT2YfdrDlktacHKF69lrbkyGZUVFj0dPamx6
         fNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=unWkpnT2aWo4Ge6R2otyIk3cQsT5CMlyKuWQ6jlxwG4=;
        b=UPDQWAK4axwzN55GFl/W2asQAMoSuQRn9xwKixTlLqpOr+G1sLbhfi3UZspK8yTPp0
         lUFSpGLQW43EMVIu2xjBeeV4DMhrKuLNS68Lor2hMSn81BgkhJlMiKwwUUFacP1F0e7s
         uaLjORGqxzpC4CpA7WjWIuh1ly8ZAuLSMESHmk8q2UOw0Ii71S5IHi7OXi7GbwRyqZtg
         r/O/dcmUAmgiFr0kAEEz/qTUzIxbRWCw6Ub1VHYpbvipa/FEZYO45myO9ZTlUwde/Pf6
         /Tuz3GI8+KRE3BqTx+5vLOQ/5uDfdVIrtQe0i8LVVq54OJyhnxMkyk50km7fG/zStwBb
         NjZg==
X-Gm-Message-State: AOAM531RB61Ae/H6xy0kdZnHr6Kz2bCPWGKWcfYJA35aAKEWJTe9qe8p
        t4uxATRsH7Kjrh78paXGHrw=
X-Google-Smtp-Source: ABdhPJyiyg6NLM2uy9NHwuxk/yycCywsC73UcDki/Uwa63PZBmhcuzXUxNmOLyLMm3GOV/PeQto0SQ==
X-Received: by 2002:aca:aa14:: with SMTP id t20mr3709601oie.302.1644083864392;
        Sat, 05 Feb 2022 09:57:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s6sm1945920oap.32.2022.02.05.09.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 09:57:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 5 Feb 2022 09:57:42 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ntc_thermistor) Underscore Samsung thermistor
Message-ID: <20220205175742.GA3076305@roeck-us.net>
References: <20220205005804.123245-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205005804.123245-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Feb 05, 2022 at 01:58:04AM +0100, Linus Walleij wrote:
> The sysfs does not like that we name the thermistor something
> that contains a dash:
> 
> ntc-thermistor thermistor: hwmon: 'ssg1404-001221' is not a valid
> name attribute, please fix
> 
> Fix it up by switching to an underscore.
> 
> Fixes: e13e979b2b3d ("hwmon: (ntc_thermistor) Add Samsung 1404-001221 NTC")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ntc_thermistor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index 414204f5704c..9c9e9f4ccb9e 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -59,7 +59,7 @@ static const struct platform_device_id ntc_thermistor_id[] = {
>  	[NTC_NCP15XH103]      = { "ncp15xh103",      TYPE_NCPXXXH103 },
>  	[NTC_NCP18WB473]      = { "ncp18wb473",      TYPE_NCPXXWB473 },
>  	[NTC_NCP21WB473]      = { "ncp21wb473",      TYPE_NCPXXWB473 },
> -	[NTC_SSG1404001221]   = { "ssg1404-001221",  TYPE_NCPXXWB473 },
> +	[NTC_SSG1404001221]   = { "ssg1404_001221",  TYPE_NCPXXWB473 },
>  	[NTC_LAST]            = { },
>  };
>  
