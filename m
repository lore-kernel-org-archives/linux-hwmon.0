Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563E6C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 02:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DBFF2070E
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 02:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDFnL77P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgGOCdP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 22:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgGOCdP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 22:33:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511CDC061755
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 19:33:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 72so1111367ple.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 19:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9nyv2CH2cwe2dKVyT24SIUY2d9MbXVF4DV2J6NeBMWc=;
        b=ZDFnL77PvAVIfTIEFOgk88DWwAcv7ouvfYclv/qoET20ju72ClW391g9mMUZn60XA5
         xTKvxI+S9YiMWI8AFV4jBejmqNYtlw+9MdZSL8SmQS0YfZgtVdhbq8GrD2yKTPTK3HOT
         6bgdRuB95GCipnHoo+7kIbEDnqfXyBhVHgm7YmQJPZIsX7CDzzeXCT9Zm2lFxQKlKK9I
         HiDyHrsxR5JafpHgySa9O/YngbmjCs1OqmUB8Is2Zh9S5GyFSc+lpABgRC6fLtlvbrtS
         qIsxImwdNng4sswjUB3oa5VoqT7TxJTKGgb/0UDOa7xHGc5AhWULBaHXJqmtDf8E17+E
         px1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9nyv2CH2cwe2dKVyT24SIUY2d9MbXVF4DV2J6NeBMWc=;
        b=OOnvg6lVXO1h+jVsKy6XG1szTEXfit7/uyZ/hqEoycb5qoKZALm0AyCcC/FtzxVsvF
         uMjcabC1MvXuXz5d/UO5pwaOfLpBJApmdPRaKAAmSX/W7m1gRqDy6Uzq6Cu1lK5Sq/h0
         8RbzaP6AhdzWsprfURYLD9thUYivwcVoSbQZZJybHznHH26eaO6jXFv/XKWMdHqI7LH5
         18KFRLQsAL2ei/B8oO/5l/zvpFMLeSQ0ZthOyvahLLTcIvj2vKOiW6O2w4J3/7W6upDX
         1nT27dA4O8LDmGiXClSEr/9N3v01JkwADO99Wq6CZF5+pLKSguRmp2iAWoeJRDRj8g5J
         wXhQ==
X-Gm-Message-State: AOAM532nhhqj/W7PjwOZWsmZiWR8CSuO39T2410kEd0CgSxMYfpQjTiA
        aJxvwd6i/c8fu3+NBD+89fDaZ4jr
X-Google-Smtp-Source: ABdhPJw7pFeo9Usl9417tiAMQ7OhKko35hApZFPQehcQPjwX41vqJ1pVNHpPM8idtX7Brrxb6sEGEg==
X-Received: by 2002:a17:90a:148:: with SMTP id z8mr8194697pje.197.1594780394542;
        Tue, 14 Jul 2020 19:33:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l207sm393903pfd.79.2020.07.14.19.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 19:33:13 -0700 (PDT)
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error for
 NCT6798D
To:     Alexey Galakhov <agalakhov@gmail.com>, linux-hwmon@vger.kernel.org
References: <20200715011748.3507fc2b.agalakhov@gmail.com>
 <d2769820-426c-bc4a-bcc2-2720fde4f5bc@roeck-us.net>
 <20200715021954.68a03582.agalakhov@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a134f3d8-09d6-be9c-de97-26e9c048c6a3@roeck-us.net>
Date:   Tue, 14 Jul 2020 19:33:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715021954.68a03582.agalakhov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/14/20 5:19 PM, Alexey Galakhov wrote:
> On Tue, 14 Jul 2020 16:58:29 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 7/14/20 4:17 PM, Alexey Galakhov wrote:
>>> Hi,
>>>
>>> I'm facing the same problem. I did some research on my machine.
>>>
>>> On Fri, 2020-07-03 at 10:10 -0700, Guenter Roeck wrote:
>>>   
>>>> There is nothing much if anything we can do about that. The NCT6798D
>>>> datasheet reports temperature source 28 as reserved. You could ask
>>>> Asus for support, but their usual response is that they don't support
>>>> Linux.  
>>>
>>> Looks like there are different versions of the datasheet. The one of
>>> NCT6796D, Revision 0.6 states that 28 (0x1c or 11100) is "Select PECI  
>>
>> We are talking about NCT6798D here.
> 
> I have NCT6798D on my machine and I also double-checked the chip marking
> on the motherboard. I just looked at the 96's datasheet (not found a
> 98's one). Even with 98 this configuration seems to be correct. Looks
> like at least on some revisions of 98 it is not reserved and usable.
> The fan in controlled correctly with this setting.
> 

FWIW: https://patchwork.kernel.org/patch/11663841/

>> I have no idea how to access the "HM Read-Only" registers. The datasheets
>> are not exactly verbal about it.
> 
> I successfully accessed them. The access procedure is poorly described
> but quite simple.
> 
> Each of these "HM Read-Only" registers is just a plain I/O port. Just
> inb() reads them. Their addresses are sequential. The base address
> (address of register 00) is configured similar to the main I/O address
> (the one which is usually 0x295). Its MSB is in register 0x64 and its
> LSB is in 0x65 of the SuperIO. Like that:
> 
>   superio_select(sioreg, NCT6775_LD_HWM);
>   hm_ro_base = superio_inb(sioreg, 0x64) << 8;
>   hm_ro_base |= superio_inb(sioreg, 0x65);
> 
>   // on my machine hm_ro_base == 0x800
> 
>   val = inb(hm_io_base + hm_reg);
> 
> Hope this helps.
> 
Interesting. I'll keep it in mind, but I don't think I'll be able to
submit any patches anytime soon.

Thanks,
Guenter
