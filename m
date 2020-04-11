Return-Path: <SRS0=9wTL=53=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7599C2BB55
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 16:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8027C2075E
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 16:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvPVxV4g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgDKQqE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Apr 2020 12:46:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36020 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgDKQqE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Apr 2020 12:46:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id a201so5317314wme.1
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2020 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0XuVm3Mk47W7vB091NnlN7evrsw/rPsOjSxQ/C1HBTI=;
        b=lvPVxV4gjr7kxbfFT0m0y+qIz5lDB1lTGIsyVT45nDM98qfZzlDDdoxTQR/o2rZ6Cd
         /88as6hrvuoo9er1kaO8Atzh98OawCCm2i5qxV6ykkUMWECcU/JzSJzn77IafOSoUF3M
         caXRUAXdPLW4cgHRC92NclKr/5K4AmHmF6Q8ZyAtXdF8Ooue3XVneyVP9OLuwSU5J2cc
         BLZaipbOsAYQXJ2n4bfIWZnFtZN7G1VGp2+1J4yVTTahNdqIa79IdxtZg8A1JugUyEDR
         ON9UUCiOShaNRuEbHIZAlvNN695Ce7bfJfn9la5EcvDjue0jQat/jte72Pvm2Gt824HZ
         BecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0XuVm3Mk47W7vB091NnlN7evrsw/rPsOjSxQ/C1HBTI=;
        b=MIIEGj4nEIOCZ6iII42pPhE1sEOIOU2UpKN45MJ1d6hXWmQ81WnrY5en+5Y4Jag7n/
         l4W8EPYOIDKKWdUNfopB4VV57e897S6MqvectWDLCsWgPLLZJB97olJc/FHLZ5SQzRFA
         aScWtR0Eg2+K78G+OPHXmISxwkiR2zbc3aOtWG+5u2MuIymLVYav8CVfuYcp8Kvcf7o+
         5hs0EqnMsa48cnVI0WUDkE2WqZUQ7zCLl9mdoo1fEDsOOmyckHNvw1ufBbeyG727GrVP
         Q2HVOI5uiJTQGHwEZX9eg+pFIdknT1YzDxgiEJ08K/VMmqu0Y8rJEWF57Ih8nFCp29fq
         W2kQ==
X-Gm-Message-State: AGi0PuYYEvCJi4JipYdp2G3/HM8sVHDe/50CwH4c4aIWIxoUIlwo1vGB
        N33nJ8eqxzCtmn057wN5RpXtWpR8QPM=
X-Google-Smtp-Source: APiQypIdzCwi9i+tRVs4QJkSN1H4hDC+raQiBIRnR4W7A+D7wrQEntqXHfuwcBVCeeqMkM38nOLgXA==
X-Received: by 2002:a1c:32c7:: with SMTP id y190mr11146710wmy.13.1586623561027;
        Sat, 11 Apr 2020 09:46:01 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:6d65:1643:5f3d:f45d? ([2a01:e34:ed2f:f020:6d65:1643:5f3d:f45d])
        by smtp.googlemail.com with ESMTPSA id 145sm7890713wma.1.2020.04.11.09.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 09:46:00 -0700 (PDT)
Subject: Re: [PATCH 1/6] thermal: hwmon: Replace the call the
 thermal_cdev_update()
To:     Guenter Roeck <linux@roeck-us.net>, rui.zhang@intel.com
Cc:     amit.kucheria@verdurent.com, linux-kernel@vger.kernel.org,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        "open list:PWM FAN DRIVER" <linux-hwmon@vger.kernel.org>
References: <20200410221236.6484-1-daniel.lezcano@linaro.org>
 <20200410221236.6484-2-daniel.lezcano@linaro.org>
 <4ded7975-499d-024a-283f-de4f82d295f3@roeck-us.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <907914e7-7f5a-e66d-bf38-be110aa1f6f0@linaro.org>
Date:   Sat, 11 Apr 2020 18:45:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4ded7975-499d-024a-283f-de4f82d295f3@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/04/2020 03:32, Guenter Roeck wrote:
> On 4/10/20 3:12 PM, Daniel Lezcano wrote:
>> The function thermal_cdev_upadte is called from the throttling
> 
> misspelled
> 
>> functions in the governors not from the cooling device itself.
>>
>> The cooling device is set to its maximum state and then updated. Even
>> if I don't get the purpose of probing the pwm-fan to its maximum
>> cooling state, we can replace the thermal_cdev_update() call to the
>> internal set_cur_state() function directly.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>  drivers/hwmon/pwm-fan.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
>> index 30b7b3ea8836..a654ecdf21ab 100644
>> --- a/drivers/hwmon/pwm-fan.c
>> +++ b/drivers/hwmon/pwm-fan.c
>> @@ -372,7 +372,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
>>  	if (IS_ENABLED(CONFIG_THERMAL)) {
>>  		cdev = devm_thermal_of_cooling_device_register(dev,
>>  			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
>> @@ -384,7 +383,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>>  			return ret;
>>  		}
>>  		ctx->cdev = cdev;
>> -		thermal_cdev_update(cdev);
>> +		pwm_fan_set_cur_state(cdev, ctx->pwm_fan_max_state);
> 
> So far the function would only change the state if the new
> state is not equal to the old state. This was the case because
> pwm_fan_state was set to pwm_fan_max_state, and the call to
> thermal_cdev_update() and thus pwm_fan_set_cur_state() would
> do nothing except update statistics. The old code _assumed_
> that the current state is pwm_fan_max_state. The new code
> enforces it. That is a substantial semantic change, and it
> is not really reflected in the commit message. Is that really
> what you want ? If so, the commit message needs to state that
> and explain the rationale.

Well, to be honest I'm not getting the rational of calling
thermal_cdev_update(cdev) right after
devm_thermal_of_cooling_device_register() neither setting pwm_fan_state
to pwm_fan_max_state.

Do we have the guarantee there is at this point a thermal instance
making the target state working when thermal_cdev_update is called?

Are we sure a thermal_cdev_update(cdev) is actually right here?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
