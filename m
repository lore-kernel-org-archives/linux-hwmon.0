Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70BCC433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 05:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A858F221E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 05:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axBsVLhK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgGNFSm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 01:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNFSm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 01:18:42 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0994BC061755
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2020 22:18:42 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id k5so6520513plk.13
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2020 22:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=49wr6tDmOFjzAPI+MBeHg1DV8/fnyP9jQxjPXTlWXSA=;
        b=axBsVLhKty/NPqFFv7CmL89a9b7xUKEwX7Aqsva9MXpft7z/xTY1MhWTNg3zwM9OJN
         jEQH9cjecdGQWt/PijQbyvoihtqDCFp7wODLj9Ostbk9teCRza7MUZ9as6nxrP6YZAFH
         GcynvFLN124ywUQd3CNEeRYEmGjj1GxAIIyrHrnH7VV8B3aZbHotujH5o8SkcNENgbLV
         v9FMfPChpaTSNcQpkqF63gKkn5bv5APJECLn47KxbFh3Pa3JjbRIwDx4Bu8BY6YuqxK/
         RQvWuULvBJXJsorHHv52OZwr/hBwoIjPrS1yVJ86k6IThjhLkkY1kPL+3V/bjgX9KrVW
         zdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=49wr6tDmOFjzAPI+MBeHg1DV8/fnyP9jQxjPXTlWXSA=;
        b=Z/K+ikFLBmhQ75q6RvCfYppw92WkyeytqM1PnJ99S78ALyMkojicabxy6UPJLpE6Ev
         sPOWygezHdn/ScfcwVTTpS96fBJvFDiWsgs4z7nckfAZJcC9U566w/rVnwWGZmyClvfL
         sFNoiuGxJmJsbSIkbQSbk5Okaufk94736zRosOLBEKDa4KchfKR7U6QqIB3v/AaLiN90
         RL29q8dFyuJfE+FltVtiY5yqhhx9lItnaE6l15jjLsdsOriv0oryPZaEckRNeRdaK7uf
         xthk3itEZ/1vbMiz1ZoymoJ58NArwjHmhbRoK6/Oa6tv5qPl0fBoubfHbhlmA+AXULVW
         CCrA==
X-Gm-Message-State: AOAM5329K1NhVABO8wAZjIzfm60KvMbgkTRUhQSk7djGBXSMsJdrl7MO
        KJLr5yn6UnR7iITxbNW1PsC6Cf1bwQQ=
X-Google-Smtp-Source: ABdhPJwhB0lBp6XgqkJuYHmk75s/DAkeuXAJgiwD1Qof6+JGk81t5mKckzt+2uV4vsTWagSg2nG4sA==
X-Received: by 2002:a17:902:9b8f:: with SMTP id y15mr2621964plp.322.1594703921350;
        Mon, 13 Jul 2020 22:18:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 141sm16117542pfw.72.2020.07.13.22.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 22:18:40 -0700 (PDT)
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error for
 NCT6798D
To:     Stefan Dietrich <roots@gmx.de>
Cc:     linux-hwmon@vger.kernel.org
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
 <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
 <48f415c34f4ca3f5239650711daaf1e11342da8e.camel@gmx.de>
 <d54732db-255c-54be-ab43-997369e0da87@roeck-us.net>
 <e02ef4f8633e035ecf6019abb72e3a22bfc29732.camel@gmx.de>
 <20200712224620.GA19097@roeck-us.net>
 <119b8c4d3791bafae015f1643b4fba9114d3eb65.camel@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2569643c-d050-1663-7da7-641211618aee@roeck-us.net>
Date:   Mon, 13 Jul 2020 22:18:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <119b8c4d3791bafae015f1643b4fba9114d3eb65.camel@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/13/20 10:40 AM, Stefan Dietrich wrote:
> On Sun, 2020-07-12 at 15:46 -0700, Guenter Roeck wrote:
>> On Sun, Jul 12, 2020 at 09:51:42AM +0200, Stefan Dietrich wrote:
>>> On Sun, 2020-07-05 at 07:21 -0700, Guenter Roeck wrote:
>> [ ... ]
>>> Would you mind giving me a pointer on how this would be done? I
>>> assume
>>> for those familiar with the driver it will be less than a handful
>>> of
>>> lines of code?!
>>> I will certainly report back as soon as I have obtained any
>>> results.
>>
>> Something like the diffs below should do. Caution - this is cut-and-
>> paste,
>> so you'll have to make the changes manually.
>>
>> Guenter
>>
>> ---
>> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>> index 7efa6bfef060..ec427ce503f0 100644
>> --- a/drivers/hwmon/nct6775.c
>> +++ b/drivers/hwmon/nct6775.c
>> @@ -786,9 +786,9 @@ static const char *const nct6798_temp_label[] = {
>>         "Agent1 Dimm1",
>>         "BYTE_TEMP0",
>>         "BYTE_TEMP1",
>> -       "",
>> -       "",
>> -       "",
>> +       "Unknown28",
>> +       "Unknown29",
>> +       "Unknown30",
>>         "Virtual_TEMP"
>>  };
> 
> Dankeschoen - I just tried that, but I'm still getting
> 
> [  324.901595] nct6775 nct6775.656: Invalid temperature source 28 at
> index 0, source register 0x100, temp register 0x73
> [  324.901637] nct6775 nct6775.656: Invalid temperature source 28 at
> index 1, source register 0x200, temp register 0x75
> [  324.901679] nct6775 nct6775.656: Invalid temperature source 28 at
> index 2, source register 0x300, temp register 0x77
> [  324.901722] nct6775 nct6775.656: Invalid temperature source 28 at
> index 3, source register 0x800, temp register 0x79
> [  324.901765] nct6775 nct6775.656: Invalid temperature source 28 at
> index 4, source register 0x900, temp register 0x7b
> [  324.901807] nct6775 nct6775.656: Invalid temperature source 28 at
> index 5, source register 0xa00, temp register 0x7d
> 
> I double checked that it really is the modified driver that is loaded.
> Now does that mean the diffs did not do the trick, or that there's
> really nothing to see here?
> 


I forgot: Also change NCT6798_TEMP_MASK to 0xffff0ffe.

Guenter
