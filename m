Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB0BC38142
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Jan 2023 03:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjAaDkb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Jan 2023 22:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjAaDka (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Jan 2023 22:40:30 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146D110405
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 19:40:29 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id g21-20020a9d6495000000b0068bb336141dso3266451otl.11
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 19:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AGr6ahgbIpVTW7GH8dpPjQg/qPyn1VHiB11mgOoP2YE=;
        b=YfFGWtEVkzTiqM29BKjVOMQMwDSmzIIhen+PtjdzrRPJtX10bHdriXou4cGsiR4cYc
         5muHzlM108r3aP2wDH6tANdjpgHbmZYgV4j5+B0bUT21sQbSphlsJvAWY4Gw94sGJalA
         GkPK1NCsZXUkiB4Al/mUZVWAwidp0ZVxP9UVNfCJtQuqig3VXU4AOKnUQ0jchJf8MpkE
         tfYR/RwwRUp1TOyFMeKZfU8WcnQcDfZJD+QoIJrZ12+0NFsLCfySVqxGeUp1vB9li1LF
         C5RnUOuPSjBvb8ohtyxXB9rGD4WE9xQPi02Wa1FYKNeswux61+qxomVSUuoY6bo5WcNw
         2dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGr6ahgbIpVTW7GH8dpPjQg/qPyn1VHiB11mgOoP2YE=;
        b=iIOKlu9obHqUvtP5dTDsOCZkABkz+ebNWOKpQLaxYzQrcGYBMrN/WR+fOFjjlG+29M
         BqvvfaWYOaW/koaBUVOOYSebIlIUoi09RjBub9PXa3qCEzHT71z9xvw3NLhPORwo5z7M
         XIhyUqWrn4xS9mfhSNR9jbDDKtgPxdB2W8cL8TcnyVKf6xuKH6e8Xc6Dl84+a3uZJKbd
         n3IytSUGlYO8z5vAIcklKbAaFcgkkSFmLHcYCxlmxZADw7zKlZPScYnkpX0xmb8ec+/u
         sIxdRqcuWRVRkgMyrjRYE+vO8BAo/uoevXkLmK7Vw8ywBOhS8BmjtxQFkGI7+x+w4tLX
         1w1A==
X-Gm-Message-State: AO0yUKXx4QY9EL8DZ5+4O7lFhNZJH0Xtqzhv+BB9c+PvtQTSgPR9j+5c
        vZnPJMr7afyoFCAMGfKLo/g=
X-Google-Smtp-Source: AK7set/1o3oTIUgDSkpz7CE0umG+DBHk8E1IrWZOTqq2RbOZAn+snFznK1Zt+aFSzpAKuylGJqsF8A==
X-Received: by 2002:a05:6830:34a0:b0:68b:cd70:56f7 with SMTP id c32-20020a05683034a000b0068bcd7056f7mr5129777otu.21.1675136428313;
        Mon, 30 Jan 2023 19:40:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x8-20020a9d6288000000b0068be2cce678sm98284otk.4.2023.01.30.19.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 19:40:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad15da89-00be-b592-f26b-3bd4836da0b2@roeck-us.net>
Date:   Mon, 30 Jan 2023 19:40:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/7] hwmon: (it87) Allow disabling exiting of
 configuration mode
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
 <20230128060308.1549707-2-frank@crawford.emu.id.au>
 <20230129205647.GA1951466@roeck-us.net>
 <1d51e281-15a9-7997-acbd-6ea1518ef596@roeck-us.net>
 <781a5ba5a5c96d289e96e2697204664120fc5477.camel@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <781a5ba5a5c96d289e96e2697204664120fc5477.camel@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/30/23 14:19, Frank Crawford wrote:
> On Mon, 2023-01-30 at 10:42 -0800, Guenter Roeck wrote:
>> On 1/29/23 12:56, Guenter Roeck wrote:
>>> On Sat, Jan 28, 2023 at 05:03:02PM +1100, Frank Crawford wrote:
>>>> Disabling configuration mode on some chips can result in system
>>>> hang-ups and access failures to the Super-IO chip at the
>>>> second SIO address. Never exit configuration mode on these
>>>> chips to avoid the problem.
>>>>
>>>> This patch should be applied in conjunction with a previous one
>>>> to
>>>> initialise the second chip for certain mother boards.
>>>>
>>>> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
>>>> ---
>>>>
>>>> v3:
>>>>    * Correct possible uninitialised pointer issue.
>>>>
>>>> v2:
>>>>    * Convert to use feature flag and related macros rather than a
>>>> separate
>>>>      field, as suggested in review.
>>>>    * Reverse sense of flag in superio_exit to simplify feature
>>>> macro.
>>>>
>>>> ---
>>>>    drivers/hwmon/it87.c | 26 ++++++++++++++++++--------
>>>>    1 file changed, 18 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
>>>> index a8a6a0ffee82..923a9563be92 100644
>>>> --- a/drivers/hwmon/it87.c
>>>> +++ b/drivers/hwmon/it87.c
>>>> @@ -128,10 +128,12 @@ static inline int superio_enter(int ioreg)
>>>>          return 0;
>>>>    }
>>>>    
>>>> -static inline void superio_exit(int ioreg)
>>>> +static inline void superio_exit(int ioreg, bool noexit)
>>>>    {
>>>> -       outb(0x02, ioreg);
>>>> -       outb(0x02, ioreg + 1);
>>>> +       if (!noexit) {
>>>> +               outb(0x02, ioreg);
>>>> +               outb(0x02, ioreg + 1);
>>>> +       }
>>>>          release_region(ioreg, 2);
>>>>    }
>>>>    
>>>> @@ -300,6 +302,13 @@ struct it87_devices {
>>>>    #define FEAT_PWM_FREQ2                BIT(16) /* Separate pwm
>>>> freq 2 */
>>>>    #define FEAT_SIX_TEMP         BIT(17) /* Up to 6 temp sensors
>>>> */
>>>>    #define FEAT_VIN3_5V          BIT(18) /* VIN3 connected to +5V
>>>> */
>>>> +/*
>>>> + * Disabling configuration mode on some chips can result in
>>>> system
>>>> + * hang-ups and access failures to the Super-IO chip at the
>>>> + * second SIO address. Never exit configuration mode on these
>>>> + * chips to avoid the problem.
>>>> + */
>>>> +#define FEAT_CONF_NOEXIT       BIT(28) /* Chip should not exit
>>>> conf mode */
>>>
>>> Feature bits are supposed to be numbered sequentially, not randomly
>>> assigned. Please use bit 19.
>>>
>>
>> Given that the commit window is coming up, and since I don't have
>> other issues with your series, I am inclined to apply it with the
>> bit changed. Please let me know in the next day or two if this is
>> acceptable for you. If not, the series will have to wait until v6.4.
>>
> 
> Yes, I'm okay with that.
> 
> I was planning to submit an update with the only changes being both of
> your changes in your previous comment, but the second one can wait for
> a later group if you are happy with that.
> 

The other change request was a minor optimization. Just leave it alone.

Series applied to hwmon-next, with bit changed from 28 to 19.

Guenter

