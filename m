Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4833BC636CC
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Feb 2023 20:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjBRUvL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Feb 2023 15:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjBRUvG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Feb 2023 15:51:06 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55331556F
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Feb 2023 12:50:35 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id d14so5103602eda.4
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Feb 2023 12:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/ju84wilLT36bNpC/ax2Fz7JvSwfF6z6eKJvHMjbeQ=;
        b=MNf/B1i7d235tljAlpHZFeRxkMdfY4xezQH7tVDY15tV/bL8DdDteP6R5T5xDzAlUu
         BG06GgnZLugfooIxeoZhIwNiTycc7MqjVXXBVdFiEhfL6/J3CoUzE6UXyplB1ezfD+OW
         TTnB8sxQwzmgc06IkTIw9MmiPRrMaT85pzPq9UmzsoQjP8PgsVIEzRtNYWftuctX7xIx
         jf0mxtiO6Dr9dKFGy91GE+y+EMT4JHs08sUPPIoPX0wv+B0hMvQooDpaBepVAByTY8sB
         NGLePPO1w4QBCA/PBXx5zDzjZHXHu1aFFz7Jd09rAfxRR2mQgzQTTq8agehvL//jNzgb
         O9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/ju84wilLT36bNpC/ax2Fz7JvSwfF6z6eKJvHMjbeQ=;
        b=IONv7FEJxCoT+Rj2LTqL/ZjogskMoYNbFFI75TTpx4lZwtKVbBkELu+qiErn7eTNJz
         Vz7z5pDkwCAfUdvCcxgSKOAuGrHCbE3t6oxMsVK7EHgUStvNuNpP1RYHXb2QH6QnGGGC
         jn9xkiqgDnZdHecKM2flUUG9GZAFRpODf6hQoGcEieur3rOOUF3XEE9ok2z0cCS+YyAU
         /qQU9JVR1rfwJNhQT8xYW0xgtPlV8fZfxUguwpz7YPIznehKnnLTYYjDq1nkpbOroczy
         5P0Kytj2+7FmW8+CBKjWDvgpk1iIUA4Jp+N2/PbWVIXZ/ZFuB2llIW6Cn0jcsa2n7Bq1
         3sBQ==
X-Gm-Message-State: AO0yUKUL5HcHRJi6qhQKUyJMZPJCBbzMqnmiZOoo0NXI6OB605KSS+gA
        1X9CVUAZ08SrxIrSC4ZE4ec=
X-Google-Smtp-Source: AK7set+kKwZLfwnUmfHFruSYp5Ab30Do3XomCLErTgq0GEvxUJsdXkdvoCh8M/jPKGqYrKNJWyjLJA==
X-Received: by 2002:a17:906:27c3:b0:885:2eb5:68a5 with SMTP id k3-20020a17090627c300b008852eb568a5mr3029023ejc.66.1676753430155;
        Sat, 18 Feb 2023 12:50:30 -0800 (PST)
Received: from rivendell (static.167.156.21.65.clients.your-server.de. [65.21.156.167])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709062b4700b008b1354f5a07sm3719761ejg.59.2023.02.18.12.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 12:50:29 -0800 (PST)
Date:   Sat, 18 Feb 2023 21:50:29 +0100 (CET)
From:   Enrico Mioso <mrkiko.rs@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Andrew Lunn <andrew@lunn.ch>, linux-hwmon@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] net: phy: aquantia: clamp temperature value in
 aqr_hwmon_set
In-Reply-To: <20230218144234.GA2652402@roeck-us.net>
Message-ID: <d49c3219-f67d-76c9-acba-f518ebbdb73f@gmail.com>
References: <20230217231647.968107-1-mrkiko.rs@gmail.com> <Y/AtxyXsMVHf0ygt@lunn.ch> <20230218144234.GA2652402@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=35662428419077906351676753429977221
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--35662428419077906351676753429977221
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT




On Sat, 18 Feb 2023, Guenter Roeck wrote:

> Date: Sat, 18 Feb 2023 15:42:34
> From: Guenter Roeck <linux@roeck-us.net>
> To: Andrew Lunn <andrew@lunn.ch>
> Cc: Enrico Mioso <mrkiko.rs@gmail.com>, linux-hwmon@vger.kernel.org,
>     Russell King <linux@armlinux.org.uk>
> Subject: Re: [PATCH] net: phy: aquantia: clamp temperature value in
>     aqr_hwmon_set
> 
> On Sat, Feb 18, 2023 at 02:45:43AM +0100, Andrew Lunn wrote:
>>> diff --git a/drivers/net/phy/aquantia_hwmon.c b/drivers/net/phy/aquantia_hwmon.c
>>> index 19c4c280a6cd..6444055e720c 100644
>>> --- a/drivers/net/phy/aquantia_hwmon.c
>>> +++ b/drivers/net/phy/aquantia_hwmon.c
>>> @@ -70,8 +70,7 @@ static int aqr_hwmon_set(struct phy_device *phydev, int reg, long value)
>>>  {
>>>  	int temp;
>>>
>>> -	if (value >= 128000 || value < -128000)
>>> -		return -ERANGE;
>>> +	clamp_val(value, -128000, 128000);
>>
>> It could be argued that value < -128000 should return
>> -EUNOBTAINABLE. I've had trouble getting DRAMS to work at -40C, even
>
> Hmm, I don't see that one anywhere.
>
>> those listed as industrial. Setting an alarm for -128C is pointless.
>>
>> +128C is also a bit questionable. The aQuantia PHYs do run hot, you
>> often see a heat sink, and they are supposed to support up to 108C. So
>> an alarm for 128C probably also does not work.
>>
>
> It has been an endless argument if limits should be clamped to the
> limits supported by the chip registers or to the limits supported by
> the chip according to its datasheet. I personally see that as the
> responsibility of the person actually configuring the limits, not the
> driver. After all, there could be chip variants supporting different
> limits, and who knows what chip variants are going to be available
> in the future. Anyway, as I said, this has been an endless argument,
> and it is another detail that I usually let driver developers decide
> because they often feel passionate about it.
>
> Guenter
>
>> Anyway, as Guenter suggested, please change -ERANGE to -EINVAL.
>>
>>      Andrew
>

Thanks a lot for your review and feedback.

I will send a new patch then, simply changing -ERANGE to -EINVAL.

Onanother side - if I want to set those limits to -10 °C and +90 °C, may you suggest me a DTS snippet? Thanks,
Enrico


Enrico
--35662428419077906351676753429977221--
