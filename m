Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B6AC4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B56E61038
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238554AbhHNPa2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 11:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbhHNPa2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 11:30:28 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4DCC061764
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 08:30:00 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o185so20388679oih.13
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dIAb3KdHFHpkcBvUE7oFK+ZL3JXu/N5e+LzU85Ut+TE=;
        b=Wds2i3aGSFyaYmKFk4J0EqMESDsTLvAXTS6MpMXDjCvi8EN4Tyk/GCpA0h+V46tz4O
         tziY+jeFoc2oaKbDtR5FJ9vJmOv+vXcQoNVtQa2N+K1r824IP1FLnJm9pyb8S9ec9i+2
         qd/h2W08uvo2+JhRkQzChRifkeOIlIs3z4o3Z3tVyyJQZFqppMKeGxo6ocF6wrX6tAIW
         PJJg0Z8Ayt7NtfqXlzmugVXX3ta8JOb0czUR7X7dly1WiJDmuM3jcNpbgXOWgsl2sQoZ
         e7Arbh/hFKkRrssTv1kzP8n2z5J/UG7BJrKTtU1dA0VqhLcE7lHlliahKr+d9wxUERQM
         ye4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dIAb3KdHFHpkcBvUE7oFK+ZL3JXu/N5e+LzU85Ut+TE=;
        b=VtP2h5GEfsPOX7MuhxuFLZvudH4d+IRd6vduzcgs3oH2x96Gm0Ld6a53cDSmeTesfI
         ld//9pGiB4PNn7PH4nTqL0GSCxY7kBavfXQphLGEuiZerXDgknlX3igbvaoBFLYLux4R
         VmjmVa11PEndsbfWUQQhZL1q+eigNRkvV34dDvZeWTuObvmJ/FeuGiRROyTbhvov4ZcF
         Yc5a9wLWr8AsJA3rMTXwP9maIOgGC03FtOVcRlHCR8oSDlwMxG2fjVM9eSf3bNhy2v3g
         9OqL+BPA+TbytyvjexLJaph4pOWGX4NdHufsRvJMbaDbtPXAWHXEJv5J2xWKio21c94e
         GAzg==
X-Gm-Message-State: AOAM531Slfi4dnGoO16lvM2nbUX37ltkTzbQ3pknS2LldsGQABMuOudN
        SCQUbAKHMScYVWZ5SJfwz26/FGYNvig=
X-Google-Smtp-Source: ABdhPJwqL1fztQb2n1JMYo2Ylo9U2gXehTQAcVhQuVm9X0dG0lwb67k44D6Vjh6KBekU32hjjUOKpw==
X-Received: by 2002:a05:6808:2109:: with SMTP id r9mr5933919oiw.101.1628954999191;
        Sat, 14 Aug 2021 08:29:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h2sm1054597oti.24.2021.08.14.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 08:29:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-3-W_Armin@gmx.de>
 <20210814150531.3ssa6dc22tqtmbdn@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/4] hwmon: (dell-smm) Rework SMM function debugging
Message-ID: <8df3b639-2fa6-43d6-6555-7f93f5fd300c@roeck-us.net>
Date:   Sat, 14 Aug 2021 08:29:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814150531.3ssa6dc22tqtmbdn@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/14/21 8:05 AM, Pali Rohár wrote:
> On Saturday 14 August 2021 16:36:35 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> Use IS_ENABLED() instead of #ifdef and use ktime_us_delta()
>> for improved precision.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 26 ++++++++++----------------
>>   1 file changed, 10 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 68af95c1d90c..3aa09c1e4b1d 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -158,17 +158,13 @@ static inline const char __init *i8k_get_dmi_data(int field)
>>    */
>>   static int i8k_smm_func(void *par)
>>   {
>> -	int rc;
>>   	struct smm_regs *regs = par;
>> -	int eax = regs->eax;
>> -
>> -#ifdef DEBUG
>> -	int ebx = regs->ebx;
>> -	unsigned long duration;
>> -	ktime_t calltime, delta, rettime;
>> +	int rc, eax = regs->eax, __maybe_unused ebx = regs->ebx;
>> +	long long __maybe_unused duration;
>> +	ktime_t __maybe_unused calltime;
> 
> I think that new coding style for declaring variables is
> "reverse christmas tree", longer line before shorted line.
> 
> But here, I'm not sure if initializing more variables with its default
> values should be at one line...
> 
> Also I'm not sure if usage of __maybe_unused is better than hiding
> variable behind #ifdef. #ifdef guards variable to not be used when it
> should not be.
> 

I prefer reverse christmas tree because I think it looks nicer, but
I don't usually enforce it because I think it is at least somewhat POV.
One initialization per line makes sense, though.

As for __maybe_unused and IS_ENABLED(), it is better because it ensures
that the code compiles. Otherwise, especially with debug code like this,
there is always the danger that other changes cause compile errors
if the flag is enabled ... but that isn't found because the flag isn't
enabled.

There is a significant difference here, though: The "#ifdef DEBUG" is replaced
with "IS_ENABLED(CONFIG_DEBUG)". So a local DEBUG define is replaced with
a global one (CONFIG_DEBUG). But there is no "config DEBUG" in any Kconfig file.
So, no, that doesn't work. We can't have local CONFIG_xxx defines because that
might end up conflicting with Kconfig defines.

I would suggest to just drop the #ifdef. The added cost is marginal compared
to the cost of the bios calls, and it may be useful to be able to use debug
output without having to recompile the code.

Guenter

>>
>> -	calltime = ktime_get();
>> -#endif
>> +	if (IS_ENABLED(CONFIG_DEBUG))
>> +		calltime = ktime_get();
>>
>>   	/* SMM requires CPU 0 */
>>   	if (smp_processor_id() != 0)
>> @@ -230,13 +226,11 @@ static int i8k_smm_func(void *par)
>>   	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
>>   		rc = -EINVAL;
>>
>> -#ifdef DEBUG
>> -	rettime = ktime_get();
>> -	delta = ktime_sub(rettime, calltime);
>> -	duration = ktime_to_ns(delta) >> 10;
>> -	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lu usecs)\n", eax, ebx,
>> -		(rc ? 0xffff : regs->eax & 0xffff), duration);
>> -#endif
>> +	if (IS_ENABLED(CONFIG_DEBUG)) {
>> +		duration = ktime_us_delta(ktime_get(), calltime);
> 
> But I like this ktime_us_delta() as it fixed conversion from ns to us!
> Current conversion is incorrect (>>10 is /1024; but it should be /1000).
> 
>> +		pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lld usecs)\n", eax, ebx,
>> +			 (rc ? 0xffff : regs->eax & 0xffff), duration);
>> +	}
>>
>>   	return rc;
>>   }
>> --
>> 2.20.1
>>

