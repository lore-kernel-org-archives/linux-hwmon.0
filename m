Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68583C83F24
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243273AbjH3SrY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245528AbjH3P0X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 11:26:23 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7189983
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 08:26:20 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7928dc54896so163398939f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693409180; x=1694013980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DDoOH4leiFgeZ6QL9Yoocebwck9AGjjx6AaR94bF1E=;
        b=hZsmw0z5NT1eWnsl2RSx/Maib6kyowmz+3cotA48TjxYHIMgPhuZdqb6XoFC2bVl4a
         HX2gMDFfALbOm53U2C3ZzbtTjQXePJ8wShwnmEKYcApQNTqV1wzYYnmqaN83rRC6zMKd
         32elVHUQk9jV2X9r5vwoDiJIU2Olz8T94a0nTgZDKLCErhOWy4GwIuqyIW3uI1HAmxAS
         CUzVEtjhptGE3PQPV1mT6C3RsW5EsKxjY3CikcMRC40U73gWbgH/hkzkcWrPv5bHX/Dl
         EjPsjjWprg+1DTvYv1KjZEL2MmqWXlOzJqPQVhb6F93mIQO0Rwlio2imYyGN6F6EMdY+
         Xdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693409180; x=1694013980;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DDoOH4leiFgeZ6QL9Yoocebwck9AGjjx6AaR94bF1E=;
        b=PnpdfppYYKBxvU3x0r19b0/b5rJtD619CARmUsXqJe5EAI25i66OhZeCXGZfJuCgdT
         8Dgpkp0WXpP5Yj0k9LjXefLjv7kPTp2Ty1jU7bm2kecRpZNH1ku09NGoDiQsfE4DXSxe
         wRjk6J2fd5FyuzN3SOk4uqgRzmI2Lb7TstbqU5Hk7AvELmNf1YIxFjguonb6hFu39HX2
         jrMrvsZ1dSpX7nnYjA0PHkcAM/ezbZd2KeS2NHcfwToExDWpImAIfbZ5/eWOLWDkdBa8
         6hEhWuMtL/rBN4kQWqrmq92e1emS0RpLRwpvUARhVSlCGfYPhYzWme3DiqCf7fWRlsYR
         H2YA==
X-Gm-Message-State: AOJu0Yy4cB8FCxNYT/28qzuKO0VL6Ojy+AL+hcMa45cjk5ipnXnqNJ9d
        JavpYkhqMHG0+dauz3Ih5Get8KbOFCs=
X-Google-Smtp-Source: AGHT+IHVqDuUQQTh5Z/pEVIukd1OAUli+4ZKfDvUTda0HJ6vhCFpeSB0N7CtYS5UDhRUIEOD3MUaoA==
X-Received: by 2002:a05:6602:2768:b0:783:4f8d:4484 with SMTP id l8-20020a056602276800b007834f8d4484mr2922398ioe.2.1693409179697;
        Wed, 30 Aug 2023 08:26:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dk54-20020a0566384bf600b0042bbd3e49b9sm3927051jab.24.2023.08.30.08.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 08:26:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a148cb9e-e108-5513-39f1-b307d517d8b2@roeck-us.net>
Date:   Wed, 30 Aug 2023 08:26:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Pankaj Pandey <pankaj.embedded@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <CAOdCjQtTzQpsko+vqkF9zW5RPe1520r4B5kFsJzHjSkK+KxvMw@mail.gmail.com>
 <CAOdCjQv-dCsd_EDnmWN786H57=cN2U8GBZLS96gXme6hfYpC4A@mail.gmail.com>
 <d41992ac-9670-44af-963b-d171bfcdd8f9@roeck-us.net>
 <CAOdCjQvEvqoQQQLUX3tuLzuY0sedi2mGzA=aMJg4UY+uMtcr0g@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Fwd: Regarding pmbus_core.c
In-Reply-To: <CAOdCjQvEvqoQQQLUX3tuLzuY0sedi2mGzA=aMJg4UY+uMtcr0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pankaj,

On 8/30/23 02:28, Pankaj Pandey wrote:
> Hi Guenter,
> 
> Thanks for the pointer. Actually during bmr454 probing during kernel boots-up it
> called system reset/crash. For reference please find bmr454 probing log below:
> 

First of all, please don't top-post.

> [   14.910630] pmbus 7-0010: bmr454 BMR status word : 0x2
> [   14.922945] pmbus 7-0010: bmr454 BMR status cml : 0x2
>

Bit 1 of the CML status register suggests that there is a communication
problem. Per PMBus standard:

Bit 1 - A communication fault other than the ones listed in this table has occurred

> ---> Immediately after above bmr454 probing it reset/crash the system
> and jump to u-boot.
> 

I don't think anything _called_ system reset/crash. There is no code
in the driver that would do that.

> Using debug prints I observed system got resettted after reaching to
> _pmbus_write_byte  function. But
> sometimes probing is fine, not observing any system reset/crash.
> 

My best guess is that the i2c communication with the chip is unstable,
and that the write causes it to do something that causes the reset.
How it would do that - I don't know. Maybe one of the module pins is wired
to the system's reset pin (though I can not imagine why that would be
the case), or the miscommunication causes a chip reset. Either case,
maybe the problem is in the I2C bus speed. If you can, I would suggest
to lower it to 100 KHz to see if that makes a difference.

Guenter


> Regards,
> Pankaj Pandey
> 
> 
> On Wed, Aug 30, 2023 at 7:38 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Wed, Aug 30, 2023 at 07:16:46AM +0530, Pankaj Pandey wrote:
>>> ---------- Forwarded message ---------
>>> From: Pankaj Pandey <pankaj.embedded@gmail.com>
>>> Date: Wed, Aug 30, 2023 at 4:42 AM
>>> Subject: Regarding pmbus_core.c
>>> To: <linux@roeck-us.net>
>>>
>>>
>>> Hi Guenter Roeck,
>>>
>>> I am facing an issue at drivers/hwmon/pmbus/pmbus_core.c of linux-5.10 kernel.
>>> I am using the bm454 driver from drivers/hwmon/pmbus/pmbus.c.
>>> Observed sometimes my Powepc based target board called for reset from
>>> inside int pmbus_write_byte_data(struct i2c_client *client, int page,
>>> u8 reg, u8 value)  function.  It is not consistent, sometimes not
>>
>> Sorry, I don't understand what you mean with "called for reset from
>> inside int pmbus_write_byte_data". Please clarify.
>>
>> If I recall correctly, bmr454 is very picky when it comes to i2c bus
>> speed. If it acts up, you might have some success with picking a different
>> bus speed.
>>
>> Thanks,
>> Guenter
>>
>>> observed any reset and bmr454 initialized fine.  Please suggest any
>>> pointers to debug this issue.
>>>
>>> Regards,
>>> Pankaj Pandey

