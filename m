Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF5BC433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:51:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB2B20675
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBSAiE/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgHPAvt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 20:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgHPAvs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 20:51:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11A5C061786;
        Sat, 15 Aug 2020 17:51:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id v15so6305749pgh.6;
        Sat, 15 Aug 2020 17:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Upj22j0sxOgVT3otRco9kcYm75BAM0CHVVViry2QIig=;
        b=LBSAiE/F1SzGiMgWtOzXK7hCKNu6awAYl9VZLG5GwqC/f5HBPxPnEFcb3wsek07Bvl
         080HVtwtD2wJV42cHsOMVsQwSZ4zHF/ooSrITcvZqT0h/wMm3c/so7fkRciMJOJQxTXv
         94wbS5ZNMqG/x5HhvVOxBCq2PTW8fwcBpxWi8etKLTe8I4kndFqQnVfkUHq1+f2Zg3hj
         ydF4PVnQfpjESP+9b4szyUAbK82skyIQkvon63Hq080zluQkVIYNTLHS04apRMHU1LrR
         UepkCERUNXCs/+04gxXlioJDQvCrzHGrkSnx2a3jcmAhWwPUCjmBpwWeGjQ4EGxSiUQZ
         jOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Upj22j0sxOgVT3otRco9kcYm75BAM0CHVVViry2QIig=;
        b=rMf88HPNVxZL5W6ACzMtZHGYeJGoNr6sfxMAxKqXMpQqO00lWTz6zyGhyiqVq2yDVF
         SSGnwQ4WN9kcC2voW+g2IlyoIn2wf9vbHyQItsFrx3zzFNoTahXaF03TfpCSo8iQgh4f
         PRmdQUwfOgutCjDTQed5+PenedGC7JtvuhxqtgU1uhIOpMzvGkGDf+HUrzbdVbMbX53X
         T8qy4tg1LP99rHcKyWvjI+2kWnauZpMzRV/qZYOP0h3EQR6QjKCes8U4YuPBQQGJOMj/
         wn5jfszOoVgXt0zTwuQnZIzZ3o7soUaxqyZmO6e4Afttbfgsn2nKGyFGhyyR0S+5jZE+
         sqmw==
X-Gm-Message-State: AOAM530wru7xTv3i6wYatPO8N5bCq/JsglltO9DiT/3EWUC8icwYe/et
        36l3xldjDZSyUdYbRci5GlW9XzUUeI8=
X-Google-Smtp-Source: ABdhPJwF116yPlGZDTcWtW/f585jYDczH9/MwSXX5Bu/YDuK4bW4Q6zXCQx0miPHbi71EDTsIiQkUg==
X-Received: by 2002:a62:aa07:: with SMTP id e7mr6501853pff.71.1597539108135;
        Sat, 15 Aug 2020 17:51:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f77sm13560895pfa.216.2020.08.15.17.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2020 17:51:47 -0700 (PDT)
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20200815211617.86565-1-jaap.aarts1@gmail.com>
 <2uSV3Shd92hhPyvj_GgPWEXYDX0o7GczgyAP4ue9S7xTHvwhqa9-4bcdMf3XNKCZ5jkq_KN7xqDRXT_X39VTcqxdvrE5x2Dft1hqNBjhXk4=@protonmail.com>
 <99ee823b-b1fa-74a0-e377-31dc97e4d985@roeck-us.net>
 <IqRa8ZnjuWETvNkGXEMzUaLtyG7SwgZ5aZNmrh2rN_97fIHMgcHAKR7pAHteqmzuXIVEuBB5jtBN00OBzb85KA92_RyKEDaC1V8SctNLvZ8=@protonmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <38cb8109-0868-c00c-e701-050cc0b20ac9@roeck-us.net>
Date:   Sat, 15 Aug 2020 17:51:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <IqRa8ZnjuWETvNkGXEMzUaLtyG7SwgZ5aZNmrh2rN_97fIHMgcHAKR7pAHteqmzuXIVEuBB5jtBN00OBzb85KA92_RyKEDaC1V8SctNLvZ8=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/15/20 5:27 PM, Barnabás Pőcze wrote:
>> [...]
>>>> +			if (val < (2 ^ 16) - 2)
>>>
>>> Did you intend to write 2 to the power of 16? Because 2^16 is not that.
>>> 2 to the power 16 may be written as '(1 << 16)' or 'BIT(16)'
>>> (you may need to include linux/bits.h for the latter)
>>>
>>> But something like this is my suggestion:
>>>
>>> if (val < 0 || 0xFFFF < val)
>>> 	return -EINVAL;
>>>
>>
>> I would suggest to use clamp_val; we don't expect users to know device
>> specific limits. Also, FTR, I won't accept any Yoda programming.
>>
>> Guenter
>> [...]
> 
> 
> If you don't mind me asking, why is that? I, too, don't like Yoda conditions,
> but I've always thought that in this specific case - when checking if a value
> lies within/outside a certain range - it makes the code more easily readable
> if it is written like this: (lo < val && val < hi).
> 

You are suggesting (val < lo || hi < val) here, which is a bit different.

Anyway, good for you. If you are signing up as code reviewer for a Linux kernel
subsystem, please feel free to accept and promote such code. For me, it is just
confusing.

Guenter

> Maybe I'm just too accustomed to it?
> 
> (Don't get me wrong, I'm not trying to argue with your decision about not
> accepting such code, neither am I trying to convince you otherwise.)
> >
> Barnabás Pőcze
> 

