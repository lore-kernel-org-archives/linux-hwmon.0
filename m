Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A9C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 21:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhLJVMF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 16:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237562AbhLJVL6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 16:11:58 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA2BC061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 13:08:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b40so20207710lfv.10
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 13:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H4lUag5QsYbjd8xiOEG9Os9MwcQ8VoOkVBeYOTStQ5I=;
        b=Bg0hkHPj8xOi+eI77uU1OIYE99NTUg32Hj0fXBwP2203rG3iiIuqj9H+y2Y14hMOjN
         ABdTKcXKzYcQcMsvd+zL1eFOA6VEZWlEHKcPnLOgqCKDjXRfFBkuWSyiXrwLP3zFKeoA
         Et39yDiE5X4E/AhBNM8xgD/P9Ew70E1nJQYRD/hpQyOIENXr3vsfQu7QbZ+763QxOCql
         U7luuNbpVlFIe2UcoX1KCm8dbY6s6GZ1Rlmylg4aAqTZxosh2iw3q5sO18vMt4GPSavF
         2dSzalh6gblH8dWnRWnXxzIh6opT8cax/N54BjBc+c0jszyWI3T9f+4iNGvwW8nanFVa
         F1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H4lUag5QsYbjd8xiOEG9Os9MwcQ8VoOkVBeYOTStQ5I=;
        b=QRupObQg5htYOnTypybZCaeMbzMMzzF51F3FkYUOWplmIw+Y5B/DqzDvvKmLIoypxq
         9Tzue0w92v6nuGob2xKfr0RewQC7jHjRPu8GRKSsdJXJOYG2sLl0cn8mda3gJSl6LKgr
         gj47stvskOHcrthsluY6AlzCZdN1fvzZpe2OzYi3QpWaYt61nnlolxwPqwMJvJSuQCpf
         VemQq0z9eL6M5vc++lv6dfmXEihgb0W1XDMvACqg2+CFaARAQa6sRQwPRGrxymtlQIX3
         7xNEU55gchWl3jxT8DC7yTKgzIwdoAmePYf2ajAQvx1ijJ3toLzo1OqNTyFE8/z+Pkhy
         Rskw==
X-Gm-Message-State: AOAM530OIfVMnKSmuTcKDo8qe0xK2xhRCIniEti9BTKNJDEkETSaV+B5
        XQc/nGGfXH9AM5xxQd/w57VB6ZMarjk=
X-Google-Smtp-Source: ABdhPJyF2fbq0BOqQvPEK9X7rZ3SLc8QNBMYXRFLHYMJGgow8I+nEirqKbAee6PyowsEiBA05+hTXw==
X-Received: by 2002:a05:6512:3a91:: with SMTP id q17mr13940565lfu.425.1639170500850;
        Fri, 10 Dec 2021 13:08:20 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id a29sm408139lfi.302.2021.12.10.13.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 13:08:20 -0800 (PST)
Subject: Re: [PATCH 2/5] hwmon: (lm90) Prevent integer overflow/underflow in
 hysteresis calculations
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20211210200136.1662127-1-linux@roeck-us.net>
 <20211210200136.1662127-3-linux@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0f9b61eb-7cd9-654a-e526-8a6f8d2c0533@gmail.com>
Date:   Sat, 11 Dec 2021 00:08:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210200136.1662127-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

10.12.2021 23:01, Guenter Roeck пишет:
> Commit b50aa49638c7 ("hwmon: (lm90) Prevent integer underflows of
> temperature calculations") addressed a number of underflow situations
> when writing temperature limits. However, it missed one situation, seen
> when an attempt is made to set the hysteresis value to MAX_LONG and the
> critical temperature limit is negative.
> 
> Use clamp_val() when setting the hysteresis temperature to ensure that
> the provided value can never overflow or underflow.
> 
> Fixes: b50aa49638c7 ("hwmon: (lm90) Prevent integer underflows of temperature calculations")
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm90.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index b05d73c4fbe2..72969ea83d82 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1160,8 +1160,8 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
>  	else
>  		temp = temp_from_s8(data->temp8[LOCAL_CRIT]);
>  
> -	/* prevent integer underflow */
> -	val = max(val, -128000l);
> +	/* prevent integer overflow/underflow */
> +	val = clamp_val(val, -128000l, 255000l);
>  
>  	data->temp_hyst = hyst_to_reg(temp - val);
>  	err = i2c_smbus_write_byte_data(client, LM90_REG_W_TCRIT_HYST,
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
