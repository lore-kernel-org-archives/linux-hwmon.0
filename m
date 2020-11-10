Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CF3C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 17:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75F432076E
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 17:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A88VpFF6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgKJRcX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJRcW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 12:32:22 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EFEC0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 09:32:21 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id m17so15259877oie.4
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1P0Eao9ZVyrN7F65AUTHzP7iWTMvrc6L24E0Bn6vzuY=;
        b=A88VpFF6AeJOqziJix5jN/i3AXLqqppbInEshKgE58bCS75Ueo6QeI2hUdINvuFxTq
         voeHi/aTnhytkb3ulCq/DPnjvnH3Urq5QNQdwtKwhF52eFKRv3X1W9C/4cyg3TCdbj3M
         bd5Rxp6/9uxcAVU43vOvsznN3B1DsuFvgZpbexEFVN7+ZPJgraWkBSB8+JeOGRFKgp0/
         mQwWHN7QJyysP+1KYG7NO71i78aLaAbAWC0Aqx+Nvfc2IwOLkbR03s71VInnUXsdbKL6
         4/44FibHbYm5vXCxTePqOeCTm/2t03nmTkGzmQqHRrABkvGh+2nFafao/Tg438E1VEcW
         zGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1P0Eao9ZVyrN7F65AUTHzP7iWTMvrc6L24E0Bn6vzuY=;
        b=NLxUCjnDayX/BjNyt4OtkPHYTi38ySKbZ4EofoSRSREzatQ9cbfySXqs1hF+XuQkZq
         GWOPydIQVwz93FCSj3qpF/s1ZtHp1nWfjWtGm4PFvWUE+OyoxOtPoHXPyfqGpd5ndl2O
         oBFA4JBdabTKY1NQx/GyGbAZ9VOKaE7YuOEmAuWINLnISD8jbVafX57T8eUJc4mkIHtL
         y2yooIu3vTsyILiwV1Q1cfC8BwzrAJBhFqqwrw+tcTYO6EOvKhxTwswUnMfw2lTB0r99
         8nuyRBk0GfnX1ebnjCem7F4/qWeN5rTaGHVuBPH9Gzj9IZldy6LbAUKmeJAMP7uXf20b
         8cKg==
X-Gm-Message-State: AOAM531LEBB4jDrWd3wjKspItgw+e81PO62BySwf1rjJWYuVnyK2BTGO
        ahScZtF2Uaf2TBTauGngNUN4KhOZWas=
X-Google-Smtp-Source: ABdhPJxan6bFMSZMTtYILJL0wHmUIkUIyTeREFhqQcepknMsT1JUfLbWpLdpmI9Jzoic+TDGNyXRlA==
X-Received: by 2002:aca:494b:: with SMTP id w72mr91799oia.99.1605029540477;
        Tue, 10 Nov 2020 09:32:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 61sm3516938otc.9.2020.11.10.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 09:32:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: pwm-fan: Fix RPM calculation
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20201110112817.52549-1-pbarker@konsulko.com>
 <20201110112817.52549-3-pbarker@konsulko.com>
 <20201110160826.GC17288@roeck-us.net>
 <CAM9ZRVsQHPLDCMcjq7WDAdC15qQfHbU15o3bOT5P-y-WOnNuxg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a4d22b1f-0203-74e0-71d3-3f106c62d32e@roeck-us.net>
Date:   Tue, 10 Nov 2020 09:32:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsQHPLDCMcjq7WDAdC15qQfHbU15o3bOT5P-y-WOnNuxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/10/20 8:20 AM, Paul Barker wrote:
> On Tue, 10 Nov 2020 at 16:08, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Tue, Nov 10, 2020 at 11:28:17AM +0000, Paul Barker wrote:
>>> To convert the number of pulses counted into an RPM estimation, we need
>>> to divide by the width of our measurement interval instead of
>>> multiplying by it. If the width of the measurement interval is zero we
>>> bail out instead of dividing by it.
>>>
>>> We also don't need to do 64-bit division, with 32-bits we can handle a
>>> fan running at over 4 million RPM.
>>>
>>> Signed-off-by: Paul Barker <pbarker@konsulko.com>
>>> ---
>>>  drivers/hwmon/pwm-fan.c | 17 +++++++++++------
>>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
>>> index edc0453be25a..24cfed4d625e 100644
>>> --- a/drivers/hwmon/pwm-fan.c
>>> +++ b/drivers/hwmon/pwm-fan.c
>>> @@ -55,14 +55,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
>>>  static void sample_timer(struct timer_list *t)
>>>  {
>>>       struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
>>> +     unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
>>>       int pulses;
>>> -     u64 tmp;
>>>
>>> -     pulses = atomic_read(&ctx->pulses);
>>> -     atomic_sub(pulses, &ctx->pulses);
>>> -     tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
>>> -     do_div(tmp, ctx->pulses_per_revolution * 1000);
>>> -     ctx->rpm = tmp;
>>> +     if (delta) {
>>> +             pulses = atomic_read(&ctx->pulses);
>>> +             atomic_sub(pulses, &ctx->pulses);
>>> +             ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
>>> +                     (ctx->pulses_per_revolution * delta);
>>> +     } else {
>>> +             dev_err(ctx->dev,
>>> +                     "Cannot determine fan RPM as time delta is zero\n");
>>> +             ctx->rpm = 0;
>>
>> I don't think that warrants an error message. At best it should be a debug
>> message, but even that seems not worth it. I would suggest to not update
>> rpm if that happens. After all, it is pretty much a theoretic case.
> 
> My thought process was that setting an RPM value of zero would be
> confusing - it could be caused due to fan failure or due to this
> (theoretical) error. I'm happy to drop the error message though - is

Yes, that is why I suggested to keep the old speed in that situation.
After all, it _will_ be updated shortly afterwards. Either case, people
won't typically look into the kernel log if they see the 0 rpm.

Guenter

> the patch acceptable other than that?
> 

