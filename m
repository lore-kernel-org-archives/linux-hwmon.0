Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9411BC433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 14:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7109861025
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 14:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240981AbhDLOSB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Apr 2021 10:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238980AbhDLOR7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 10:17:59 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A147C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Apr 2021 07:17:41 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so12951195oto.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Apr 2021 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7gwvPX65cmqoxo50aK/Cfbj4LUq6GahpemGJgWZl+10=;
        b=lfgPHHpfsMiT27ctEXb/5dArKNDSb2dfzCxs957iY18G6PEO2vnEi1O0snlVRK3hpu
         JTMB+LdSGeVH2gFy55ccDAZOk375lRtctilSSOUOjKQacj1mBD3jxjsHUQvLfgvOOIvf
         S/N3Ko0b8J5JJOWZluE/FjfBfRxf497ZcXHevafLa4YFZki7N+40oN4vOlJh/UO5qkpp
         +y/lQLJewaPn+UHqk2Ed4BrkhHIlsA5lcTMqhVVSbi0KyaaWAsDU2C81mhTfqwgwiMxf
         RFZJbz8NHjRQtWLfeuh0hFiQ+JfCjkgIYIxcj0O+MTzedEo+xrRGXPoZljxPlB16HwIA
         zIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7gwvPX65cmqoxo50aK/Cfbj4LUq6GahpemGJgWZl+10=;
        b=i0kc+eTyOeX/F5UDTUINDdmWMB0KDeRTckmtDMtYvJf3/jbTfvwguSQVWja59U6sZh
         AH+AiEVdURiZh4IfIzehkAhE1u+qPnavDQqp+PSqOcEI5pF2MMR+WDBlzAneUCfRMmwN
         4j+sKeqvSbbI1b4DvSCuvsBSAIFEGjofow1J2J0CAeH5nOt7WAsNRqKv5nBN+OsIruDH
         J0B+yHerSf23VuxMpKHYVFly1tYFATPesrQFshTGaM3XVVLPlvnrvesxBChjPofemYEd
         GCcNAI4eJRT9mfhZaYZTCKJ+tMFeO2qk2zb7sGmyNGmE/9il/SW3a0ZQMFtVQuSsdyT6
         mF7g==
X-Gm-Message-State: AOAM533OCiaw17LsfNMMI0XyUWUnRBbgDldh99axWW1PE3D6fOZ/pKhY
        1d72bzRS01Xf6KrOiY1sGSs=
X-Google-Smtp-Source: ABdhPJyYsEJCjiD+fY6XjOM9o0lvXjk05pBPbyb7ENgIfxFL4VvlZQica/M5iqJPJ/JPy9k+wwtfJA==
X-Received: by 2002:a9d:663:: with SMTP id 90mr24277891otn.311.1618237060636;
        Mon, 12 Apr 2021 07:17:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 24sm2189479oij.58.2021.04.12.07.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 07:17:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (amd_energy) Use unified function to read
 energy data
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210409174852.4585-1-linux@roeck-us.net>
 <20210412141430.64f20061@endymion>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a6baff03-5c7d-85d2-96f5-d426e421f9d7@roeck-us.net>
Date:   Mon, 12 Apr 2021 07:17:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412141430.64f20061@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/12/21 5:14 AM, Jean Delvare wrote:
> Hi Guenter,
> 
> On Fri,  9 Apr 2021 10:48:51 -0700, Guenter Roeck wrote:
>> The driver implements two separate functions to read and update
>> energy values. One function is called periodically and updates
>> cached enery information to avoid loss of data, the other reads
>> energy data on demand to report it to userspace. The second
>> function reads current energy data, adds the difference to the
>> data previously obtained by the first function, and then discards
>> the updated data.
>>
>> Simplify the code and always call the first function, then report
>> the energy data obtained by this function to userspace.
> 
> I like the idea.
> 
>> Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Added patch, simplification
>>
>>  drivers/hwmon/amd_energy.c | 31 ++++++-------------------------
>>  1 file changed, 6 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
>> index a86cc8d6d93d..93bad64039f1 100644
>> --- a/drivers/hwmon/amd_energy.c
>> +++ b/drivers/hwmon/amd_energy.c
>> @@ -118,35 +118,12 @@ static void read_accumulate(struct amd_energy_data *data)
>>  	data->core_id++;
>>  }
>>  
>> -static void amd_add_delta(struct amd_energy_data *data, int ch,
>> -			  int cpu, long *val, u32 reg)
>> -{
>> -	struct sensor_accumulator *accum;
>> -	u64 input;
>> -
>> -	mutex_lock(&data->lock);
>> -	rdmsrl_safe_on_cpu(cpu, reg, &input);
>> -	input &= AMD_ENERGY_MASK;
>> -
>> -	accum = &data->accums[ch];
>> -	if (input >= accum->prev_value)
>> -		input += accum->energy_ctr -
>> -				accum->prev_value;
>> -	else
>> -		input += UINT_MAX - accum->prev_value +
>> -				accum->energy_ctr;
>> -
>> -	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
>> -	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
>> -
>> -	mutex_unlock(&data->lock);
>> -}
>> -
>>  static int amd_energy_read(struct device *dev,
>>  			   enum hwmon_sensor_types type,
>>  			   u32 attr, int channel, long *val)
>>  {
>>  	struct amd_energy_data *data = dev_get_drvdata(dev);
>> +	struct sensor_accumulator *accum;
>>  	u32 reg;
>>  	int cpu;
>>  
>> @@ -162,7 +139,11 @@ static int amd_energy_read(struct device *dev,
>>  
>>  		reg = ENERGY_CORE_MSR;
>>  	}
>> -	amd_add_delta(data, channel, cpu, val, reg);
>> +
>> +	accumulate_delta(data, channel, cpu, reg);
>> +	accum = &data->accums[channel];
>> +
>> +	*val = div64_ul(accum->energy_ctr * 1000000UL, BIT(data->energy_units));
> 
> Is it considered safe to read accum->energy_ctr while not holding
> data->lock?
> 

You mean because it is a 64-bit value ? Good question; it might not be if compiled
on a 32-bit system. Good news is that I moved reading accum->energy_ctr under the lock
in the next patch, so we should be good.

>>  
>>  	return 0;
>>  }
> 
> If the answer to the question above is "yes" then:
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
Thanks!

Guenter
