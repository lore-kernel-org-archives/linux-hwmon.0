Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0E9ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 21:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiIVVxq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 17:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiIVVxp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 17:53:45 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0D3FF3F7
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 14:53:44 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 78so10461688pgb.13
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 14:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=OpaSCLmVtKHQCxJpNi7A2keVyo5UOlgld/XbshODDic=;
        b=MmAxOG0r5i75Iw57AlKPfNt7Y2t37OMrZdcitqwi8Z8Nd2UMHupaJgI/ytbG0Fgedy
         NkfGDfijh53xdjc7ijkLeWCdA4Mpst3RXnM/lYrkSF52sOqN+WCfTNDVQbHqJjvLn5BP
         DKDS8r4Ur3L9L4wnFw5hlDtbSxUGrUbRpTrr0OLT45nT3K76uigCt0MtNX4UCRbV3L6/
         YJioz9V9jWKeAKixqWJh3eULH/4x6UY2jGWRdSjftWBeZQGxuxve+9uKCjZIBeGOecNE
         KsMwpWjaYO41z79BO01dv/mg0uFisDN/jklohfSqKVeZHwQFGH9lnrula5PFJ4cI97Zi
         77KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OpaSCLmVtKHQCxJpNi7A2keVyo5UOlgld/XbshODDic=;
        b=quD7+4Yregq2GQD7f9EIHg7NIzraNL6dEtDOIYOm0wrhClDq2evUlN31PuC9PXFVoU
         0LfKLk5Cv5C3gZk/KHFiqo4iIx+Pst9UbHtz0vppkppKZzKhQDQcrfQsDsqZcZ9R/DzI
         N7gbFQblpxkxklrcbFY6dwChbTlb/ZAMAGZWjsPBGKD+EX5fHvRCMSXJTguvUkzMv2uB
         /WMyL5S6I+V3qFSZ9nyOL+KQxrf6cnuLx6Zv0WoQTFj/ZLwIiJKger+mPZPphJapcixb
         QJLgDG7CVFh9Nq3IPSCvdhaI/JIIY5s4XrCwxOakVdBXhhv/05/ecIePuAasLM3GsDDc
         Ew5g==
X-Gm-Message-State: ACrzQf1pUfx9RMovbGuGS85FldaleITfjNklriBrTlGA6TXZzpEWx8nS
        i2LZ9mK6nUi+8L5uAc8sCwPA420OFpxdWQ==
X-Google-Smtp-Source: AMsMyM65SNyH7pZZmjldB2dgc/DN25F59qBNZS10/rwy21dmBEc/KSf+o4UYqAKpD61LKl7eTyJBEQ==
X-Received: by 2002:a05:6a00:174f:b0:537:6845:8b1a with SMTP id j15-20020a056a00174f00b0053768458b1amr5859556pfc.68.1663883623926;
        Thu, 22 Sep 2022 14:53:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h32-20020a635760000000b004340d105fd4sm4382179pgm.21.2022.09.22.14.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 14:53:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1420a755-6f8c-e1e2-2a34-dcb535730f7a@roeck-us.net>
Date:   Thu, 22 Sep 2022 14:53:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Li Zhong <floridsleeves@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <20220921233109.1672345-1-floridsleeves@gmail.com>
 <99ea1416-46dc-9712-271a-9e3daaa43e05@roeck-us.net>
 <CAMEuxRprFMU8RZmZw8A53ND3iLkgcgGUWg4D77ii8EWnm3kvnA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [BUG] drivers: adm9240: possible data race bug in
 adm9240_fan_read()
In-Reply-To: <CAMEuxRprFMU8RZmZw8A53ND3iLkgcgGUWg4D77ii8EWnm3kvnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/22/22 13:37, Li Zhong wrote:
> On Wed, Sep 21, 2022 at 8:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 9/21/22 16:31, Li Zhong wrote:
>>> Hello,
>>>
>>> My static analysis tool reports a possible bug in the adm9240 driver in Linux
>>> v6.0:
>>>
>>> drivers/hwmon/adm9240.c:
>>>
>>> adm9240_read()
>>>       adm9240_fan_read() --> Line 509
>>>           adm9240_write_fan_div()
>>>
>>> adm9240_write_fan_div() says 'callers must hold
>>> data->update_lock'. However, it seems like the context does
>>> not hold the lock it requires. So it may cause data race when
>>> setting new fan div.
>>>
>>> I am not quite sure whether this is a real bug. Any feedback would be
>>> appreciated!
>>>
>>
>> You are correct, the code in adm9240_fan_read() should acquire
>> the mutex before calling adm9240_write_fan_div() and while
>> manipulating data->fan_div[channel].
>>
>> Guenter
> 
> Thanks for your patient reply! Can I submit a patch on this? The draft will
> be something like:
> 
> +  mutex_lock(&data->update_lock)
>      err = adm9240_write_fan_div(data, channel, ++data->fan_div[channel]);
>      if (err)
>          return err;
> +  mutex_unlock(&data->update_lock);
> 
> Let me know if you have any suggestions!

That would leave the mutex in locked state after an error, and it does not
take into account that data->fan_div[channel] might still change after being
checked but before being used. The lock has to be around the if() statement,
and the lock must be released after an error was observed.

At the very least, the code has to be something like

	...
	mutex_lock(&data->update_lock);
         if (regval == 255 && data->fan_div[channel] < 3) {
                 /* adjust fan clock divider on overflow */
                 err = adm9240_write_fan_div(data, channel,
                                             ++data->fan_div[channel]);
                 if (err) {
			mutex_unlock(&data->update_lock);
                         return err;
		}
         }
	mutex_unlock(&data->update_lock);
	...

However, that isn't perfect since the fan divisor and the fan speed
register value are not in sync. Technically it needs to be something like

	u8 fan_div;
	...

	mutex_lock(&data->update_lock);
	err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
	if (err) {
		mutex_unlock(&data->update_lock);
		return err;
	}
	fan_div = data->fan_div[channel];
	if (regval == 255 && fan_div < 3) {
		err = adm9240_write_fan_div(data, channel, fan_div + 1);
		if (err) {
			mutex_unlock(&data->update_lock);
			return err;
		}
		data->fan_div[channel] = fan_div + 1;
	}
	mutex_unlock(&data->update_lock);
	*val = FAN_FROM_REG(regval, BIT(fan_div));
	break;

Thanks,
Guenter
