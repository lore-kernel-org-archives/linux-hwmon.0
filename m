Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7F2C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 14:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8DD16124C
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 14:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbhDLOZw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Apr 2021 10:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240862AbhDLOZv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 10:25:51 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D083C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Apr 2021 07:25:33 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id x2so13592739oiv.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Apr 2021 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WWYs605FCLBh/xRIQaai5smH5K0JvcYdkUPmOJH74wo=;
        b=E7whVlLglWR/XnVTCn8PgWCR75iUC3NiK5fErN1PNUQ6xxq4Mycy+P56uiZKs/e9CT
         DZ+TBFq2sPeVfkkKhreo9j+Ypcq4TeAflXlbfRrKRnnYclH657QdxqDlL/ABK/yuxRXU
         WntI2dgpWiRf0PBxCLLL8qeqT6LDdwGRxCCELK/EvKZtvsEDKR89MRMHHLXUMbTkx6CS
         eam9oZj7FKEtIU7g/JySmHnKTbulwGaSyfCJg4qc8ktKjfUxIBu0FNAD1OTakb5wNmnb
         naBe1lfekDDTjyFJ2YjyMerk1AhC/pgAAudu4ti6Uv9bwer2ou3sPuC4qQCPVTvteF4O
         RF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WWYs605FCLBh/xRIQaai5smH5K0JvcYdkUPmOJH74wo=;
        b=Y4xhyWsejbG1j8RCKo4HLIWVzllvn0uY4NRtEzeKVjbFTISaHA3DE9YERLCYw3vWD+
         MZ+O6X69ogU1z7isFopzcCrcPSayUdfh5siV9lKWpf/ys5Syh1ZEl4D7qCbB7zcdFvg6
         MRgr1Am5OwhsAP8rhKdaZBCCA7JsmEF55+sJffR3yONOBgzNXEMESwz8yFJazodJwu6Y
         wZR7qOiZePixz0lOvKsuo//2etsbRqJacU/Q5FA5MkbPXFpICC57LvkZYyspy+iuc/9D
         zzo3J5JhShG6r9ZDy7YsJsU1MLJf/UoQx4dyMnrFfjTgiNQJmPTR43YNYlggZyIQrpXQ
         Zmzw==
X-Gm-Message-State: AOAM533fJY50/SjS8GD67qpxkNLXl1t6B3KblEPRkiMGK7iessz8lqPW
        z8GDRE9NTCgVjxSsI+oTfsKZwPFbjN0=
X-Google-Smtp-Source: ABdhPJybuA1reHyzYwZvufZ6VbJJ3OgrU/Pjr1XUsolJ5muLTB6AAVr0eW+GBRkr/JabSIA1rSBFcg==
X-Received: by 2002:aca:cf91:: with SMTP id f139mr13620713oig.39.1618237532997;
        Mon, 12 Apr 2021 07:25:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13sm90732otg.57.2021.04.12.07.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 07:25:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (amd_energy) Restore visibility of energy
 counters
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210409174852.4585-1-linux@roeck-us.net>
 <20210409174852.4585-2-linux@roeck-us.net> <20210412142744.54c55d06@endymion>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <797392a6-2d45-2755-7de6-b58ed26c5a50@roeck-us.net>
Date:   Mon, 12 Apr 2021 07:25:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412142744.54c55d06@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/12/21 5:27 AM, Jean Delvare wrote:
> On Fri,  9 Apr 2021 10:48:52 -0700, Guenter Roeck wrote:
>> Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of
>> the counters") restricted visibility of AMD energy counters to work
>> around a side-channel attack using energy data to determine which
>> instructions are executed. The attack is described in 'PLATYPUS:
>> Software-based Power Side-Channel Attacks on x86'. It relies on quick
>> and accurate energy readings.
>>
>> Limiting energy readings to privileged users is annoying. A much better
>> solution is to make energy readings unusable for attacks by randomizing
>> the time between updates. We can do that by caching energy values for
>> a short and randomized period of time.
>>
>> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Simplified code by using unified function to accumulate energy data
>>
>>  drivers/hwmon/amd_energy.c | 29 +++++++++++++++++++++--------
>>  1 file changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
>> index 93bad64039f1..1bf0afc2740c 100644
>> --- a/drivers/hwmon/amd_energy.c
>> +++ b/drivers/hwmon/amd_energy.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/processor.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/random.h>
>>  #include <linux/sched.h>
>>  #include <linux/slab.h>
>>  #include <linux/topology.h>
>> @@ -35,6 +36,7 @@
>>  struct sensor_accumulator {
>>  	u64 energy_ctr;
>>  	u64 prev_value;
>> +	unsigned long cache_timeout;
>>  };
>>  
>>  struct amd_energy_data {
>> @@ -74,17 +76,14 @@ static void get_energy_units(struct amd_energy_data *data)
>>  	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
>>  }
>>  
> 
> Add a comment stating that this function must be called with accum's
> &data->lock held?
> 
>> -static void accumulate_delta(struct amd_energy_data *data,
>> -			     int channel, int cpu, u32 reg)
>> +static void __accumulate_delta(struct sensor_accumulator *accum,
>> +			       int cpu, u32 reg)
>>  {
>> -	struct sensor_accumulator *accum;
>>  	u64 input;
>>  
>> -	mutex_lock(&data->lock);
>>  	rdmsrl_safe_on_cpu(cpu, reg, &input);
>>  	input &= AMD_ENERGY_MASK;
>>  
>> -	accum = &data->accums[channel];
>>  	if (input >= accum->prev_value)
>>  		accum->energy_ctr +=
>>  			input - accum->prev_value;
>> @@ -93,6 +92,14 @@ static void accumulate_delta(struct amd_energy_data *data,
>>  			accum->prev_value + input;
>>  
>>  	accum->prev_value = input;
>> +	accum->cache_timeout = jiffies + HZ + get_random_int() % HZ;
> 
> Needs #include <linux/jiffies.h> maybe?
> 
>> +}
>> +
>> +static void accumulate_delta(struct amd_energy_data *data,
>> +			     int channel, int cpu, u32 reg)
>> +{
>> +	mutex_lock(&data->lock);
>> +	__accumulate_delta(&data->accums[channel], cpu, reg);
>>  	mutex_unlock(&data->lock);
>>  }
>>  
>> @@ -124,6 +131,7 @@ static int amd_energy_read(struct device *dev,
>>  {
>>  	struct amd_energy_data *data = dev_get_drvdata(dev);
>>  	struct sensor_accumulator *accum;
>> +	u64 energy;
>>  	u32 reg;
>>  	int cpu;
>>  
>> @@ -140,10 +148,15 @@ static int amd_energy_read(struct device *dev,
>>  		reg = ENERGY_CORE_MSR;
>>  	}
>>  
>> -	accumulate_delta(data, channel, cpu, reg);
>>  	accum = &data->accums[channel];
>>  
>> -	*val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));
>> +	mutex_lock(&data->lock);
>> +	if (!accum->energy_ctr || time_after(jiffies, accum->cache_timeout))
>> +		__accumulate_delta(accum, cpu, reg);
>> +	energy = accum->energy_ctr;
>> +	mutex_unlock(&data->lock);
>> +
>> +	*val = div64_ul(energy * 1000000UL, BIT(data->energy_units));
>>  
>>  	return 0;
>>  }
>> @@ -152,7 +165,7 @@ static umode_t amd_energy_is_visible(const void *_data,
>>  				     enum hwmon_sensor_types type,
>>  				     u32 attr, int channel)
>>  {
>> -	return 0440;
>> +	return 0444;
>>  }
>>  
>>  static int energy_accumulator(void *p)
> 
> Very nice. This will make the driver useful again :-)
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
I made the suggested changes.

Thanks a lot for the review!

Guenter
