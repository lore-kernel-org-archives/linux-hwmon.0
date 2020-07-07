Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E71C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 03:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B2FB2053B
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 03:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPtrREZe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgGGDzL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jul 2020 23:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgGGDzL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 23:55:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF50C061755
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2020 20:55:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gc9so11192290pjb.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2020 20:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YmXdmtYP2ApS/YlgxcLzh/tyb78tbsjrJkiLUtu4SLU=;
        b=cPtrREZeZiEpexlIxuD5/H8HPIkfAt3LTLmKoa5XILZsDaTHpq5xOvWtjjFayW5J37
         K6OFWFLa21Izs64LkSuLYFT28ucR0aedHQYYD1nSkm1aHSuHMsgyBQa/1Nhm+PfMWn38
         zOvw4u88qImdXjdAzKOp8qBKIIqBvh9kSpcZVL7IiLqVqGvSc74mAAiLoGW+rhgiT5QF
         yOnbbMklXwsOupNQKKZohcjQw+pAlRlT7EqDQc8fXPJXjeqSPtDMDWzTS/YPFXfzbMS4
         ZPG1BJK/TXGiqZmW1rOQ2heUmjWvwOJGlnhTfiJRnFOT0ZHlcvDFojsaRCG72UsnYFEv
         oQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YmXdmtYP2ApS/YlgxcLzh/tyb78tbsjrJkiLUtu4SLU=;
        b=e764w/Sihe46cf2hEIaXRgUTJbMLo7wvWeK5+ZgjoIzHAwrQKh3l4cBcOQ9h61bWtm
         qrqivGgjd1Dgy3hfYxTXEVMUng7zf3Qm8W2zYr+G4ELQYtRqNy/MRdWmW5PwFSzm6/2s
         KK0diLloK/59Ir01RwJrrbLHuinR7+qW0BvKAfAfQ6TkhiSsMBcjfC3LCXnz+uTd6t9Q
         T6RofdpiWIjD2yXH7lmBWoujBBdcw3LHge7MVNkmdM2QizAC7m/P0DhF2981+zO9jESS
         f14LrjIO2Eq+5yVfMupt7RifhDYuFsEtjvs4iNYXgd6iVxnJiZ03DCsXjyXYMd7opctl
         I9cQ==
X-Gm-Message-State: AOAM530oNayVG5uN0eSNh4HIu4LyQWhhqeJ3/+l1rMjH0D1UJGcrn/pe
        fHucv6hNnieyAYlLIjL3J3AMLR9XKkk=
X-Google-Smtp-Source: ABdhPJx3dYumSZK2xCz331I7GTzD4fnkIDhuI/ho7s/1+w8ACoFUlJ4iwe1epnvjYZkrNihvLNljGg==
X-Received: by 2002:a17:90a:8e:: with SMTP id a14mr2340400pja.206.1594094110741;
        Mon, 06 Jul 2020 20:55:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t5sm20678828pgl.38.2020.07.06.20.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 20:55:10 -0700 (PDT)
Subject: Re: [PATCH] hwmon: amd_energy: match for supported models
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20200706171715.124993-1-nchatrad@amd.com>
 <CAHfPSqDfWs+LiYo7KdVKKQ6fP0hDyCHtVhwHMiG3Sn7=aHhLBQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5eae0fda-53cf-47d5-c857-c30bbb924ccb@roeck-us.net>
Date:   Mon, 6 Jul 2020 20:55:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHfPSqDfWs+LiYo7KdVKKQ6fP0hDyCHtVhwHMiG3Sn7=aHhLBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/6/20 10:20 AM, Naveen Krishna Ch wrote:
> Hi Guenter,
> 
> On Mon, 6 Jul 2020 at 22:47, Naveen Krishna Chatradhi <nchatrad@amd.com> wrote:
>>
>> The energy counters of certain models seems to be reporting
>> inconsisten values. Hence, match for the supported models.
> Actually, the supported models could be of family 0x17 in a range
> between 0x30 ~ 0x3f. I did not find any macro or usage for a range
> of models. Could you suggest to me if i've missed an existing way to
> provide a range for models.
> 
So, do you want me to apply the patch as-is, or are you going to send an
updated version ?

Thanks,
Guenter

>>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>>  drivers/hwmon/amd_energy.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
>> index e95b7426106e..29603742c858 100644
>> --- a/drivers/hwmon/amd_energy.c
>> +++ b/drivers/hwmon/amd_energy.c
>> @@ -362,7 +362,7 @@ static struct platform_driver amd_energy_driver = {
>>  static struct platform_device *amd_energy_platdev;
>>
>>  static const struct x86_cpu_id cpu_ids[] __initconst = {
>> -       X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
>> +       X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
>>         {}
>>  };
>>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
>> --
>> 2.17.1
>>
> 
> 

