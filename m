Return-Path: <SRS0=YDtn=YA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04394C47404
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 12:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B87E921721
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 12:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEkv2d+d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfJGMo5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Oct 2019 08:44:57 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36854 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfJGMo5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Oct 2019 08:44:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id j11so6834218plk.3;
        Mon, 07 Oct 2019 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gXoV93dJN6FWAU+HCAlzexsaWI0qwg9mAdoc/ZHqU/A=;
        b=OEkv2d+ddt+DODu0Am0MIBX5BM2+xdh07Ks2Coieicd3JTB6obRY0PgYpVoizlkTxm
         vya52yiJY027YuHHS/HvD5kbdsgaSh7Tc8d3z9kwj4BxpNHFXx9DVYvB0+GCg+VNAL/F
         h8hvmWM8vheQi5ZuQwyu4nE137Rh/lsLrN3rCsAtPhMV1Ofv0BqOhMwrwNzsPpQUEvWX
         rQ5olYTGYUu9kY4P4R6bZ44v28GFOjSwwFzP/hJ64gTe15vgPJQfq2RfpmJJ/iEJE4s/
         zh7seawwZGmY/UidtDNPudk06Mc964j1RNeI4ODOQ3xMKBmZNvppck+UGF1Ga7Z1qY/U
         GR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gXoV93dJN6FWAU+HCAlzexsaWI0qwg9mAdoc/ZHqU/A=;
        b=KRG7sBYLBxXehBiCcAQq9YEbhhQYYQBOO+8lJNsFUnTToVp7ZplaviTi4rxRmNqi67
         T57+mIRiU9h7jS7Z8Zp+b+Gzob9nbNchBkudb2bhWNbdaU+q+DbfN5p9zown2Hno+Y1U
         xGEjUYBK5y7RamjwyV310RMRiA6/nIyX1jj/GufJUITak86Z/f695JQGwnUAWD7WssXk
         pVLL+ElmEIDNZSg94m42EpZgQWlqtNMnXgP+XKZ/TCIeXuLhu+rQyQnFUj3ZdTN89jWc
         +pUcXCP/PtSNu8PkD8yTQLZwN6EH5wPRt3xwl1QfpqeNbA5cwOptAfrObnu6indcw1aY
         B9Bg==
X-Gm-Message-State: APjAAAUofr0uvq2LG5tcAMP025ec4XPPbbuDy6ktg8ekOvLYfL4K6/8/
        rRp9j0h9m2mBctVwJwUaLmU=
X-Google-Smtp-Source: APXvYqzp4fHsPdG2WsZ8cEDTEFN/RvPhBzMJnfl6cn4TIAilyjc2NckxUuSBzg+JrC4wFLfL/+G+qg==
X-Received: by 2002:a17:902:930b:: with SMTP id bc11mr29604193plb.284.1570452295775;
        Mon, 07 Oct 2019 05:44:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11sm14039962pfo.165.2019.10.07.05.44.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:44:54 -0700 (PDT)
Subject: Re: [PATCH 2/3] hwmon: Add support for ltc2947
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20190924124945.491326-1-nuno.sa@analog.com>
 <20190924124945.491326-3-nuno.sa@analog.com>
 <20191003041446.GA2332@roeck-us.net>
 <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
 <20191004150623.GA28287@roeck-us.net>
 <7d4ca133201f8c75855de6777f6018567701e16a.camel@analog.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <94cf417f-90fa-50b8-9d4a-d7e4c9dd3d8d@roeck-us.net>
Date:   Mon, 7 Oct 2019 05:44:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7d4ca133201f8c75855de6777f6018567701e16a.camel@analog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/7/19 5:25 AM, Sa, Nuno wrote:
> On Fri, 2019-10-04 at 08:06 -0700, Guenter Roeck wrote:
>>
>> On Fri, Oct 04, 2019 at 07:45:07AM +0000, Sa, Nuno wrote:
>> [ ... ]
>>>>> +static int ltc2947_val_read(struct ltc2947_data *st, const u8
>>>>> reg,
>>>>> +			    const u8 page, const size_t size,
>>>>> s64 *val)
>>>>> +{
>>>>> +	int ret;
>>>>> +	u64 __val = 0;
>>>>> +
>>>>> +	mutex_lock(&st->lock);
>>>>> +
>>
>> On a side note, suspend code is supposed to be atomic,
>> If this lock is held, the process or thread holding it
>> will likely stall suspend since it won't run.
>> At the very least, this would have to be a trylock,
>> with suspend failing if the lock can not be acquired.
> 
> Got it. Even more, Now I don't see the point of having the mutex in the
> PM callbacks (though I saw other drivers doing this). As you said, at
> the very least the trylock should be used since a frozen task might
> have the mutex locked. Either way, I will drop both the flag and the
> call to mutex_* functions is suspend()/resume().
> 
>>>>> +	if (st->reset) {
>>>>> +		mutex_unlock(&st->lock);
>>>>> +		return -EPERM;
>>>>
>>>> Not sure what the error here should be, but EPERM is not correct.
>>>>
>>>> Under which conditions would this function be called while in
>>>> suspend ?
>>>
>>> Honestly, this is more like a sanity check. I'm not sure if we can
>>> get
>>> here in suspend mode. Don't userland apps can still run in suspend?
>>> I
>>> guess so but I'm not 100% sure on this. Do you have any
>>> recommendation
>>> for the error here?
>>>
>> Sorry, I won't accept "just in case" code.
>>
>> Having said that, please inform yourself how suspend works. Userland
>> code
>> has to be stopped before any hardware can be disabled. Similar,
>> hardware
>> has to be re-enabled before userland code can resume.
>> Otherwise the kernel would crash all over the place. In many cases,
>> disabling the hardware means that trying to access hardware registers
>> will cause an acess fault.
> 
> Yes, you are right. I did checked the suspend code and all userland
> tasks and kthreads are stopped before the suspend() callback is called
> for the HW devices.
> 
>> [...]
>>
>>>>> +
>>>>> +static struct attribute *ltc2947_attrs[] = {
>>>>> +	&sensor_dev_attr_in0_fault.dev_attr.attr,
>>>>> +	&sensor_dev_attr_in1_fault.dev_attr.attr,
>>>>> +	&sensor_dev_attr_curr1_fault.dev_attr.attr,
>>>>> +	&sensor_dev_attr_temp1_fault.dev_attr.attr,
>>>>> +	&sensor_dev_attr_power1_input.dev_attr.attr,
>>>>> +	&sensor_dev_attr_power1_max.dev_attr.attr,
>>>>> +	&sensor_dev_attr_power1_min.dev_attr.attr,
>>>>> +	&sensor_dev_attr_power1_input_highest.dev_attr.attr,
>>>>> +	&sensor_dev_attr_power1_input_lowest.dev_attr.attr,
>>>>> +	&sensor_dev_attr_power1_fault.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy1_input.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy1_max.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy1_min.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy1_max_alarm.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy1_min_alarm.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_input.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_max.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_min.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_max_alarm.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_min_alarm.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy1_overflow_alarm.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_overflow_alarm.dev_attr.attr,
>>>
>>> These overflow attributes are kind of an alarm for the energy ones.
>>> It
>>> tells that the energy registers are about to overflow. I guess that
>>> some application can easily find out the maximum values supported
>>> on
>>> these registers and implement whatever logic they want in the app
>>> itself. So, if you prefer I can just drop this ones?
>>>
>> I understand the overflow use case. However, the mere presence
>> of min/max attributes for energy attributes suggests that this
>> is not the min/max use case for hwmon attributes. There is no
>> "minimum"
>> or "maximum" energy for an accumulating value. Such attributes
>> only make sense in an application abler to measure available
>> energy (eg a battery controller). I'll have to read the chip
>> specification to understand the intended use case.
> 
> Should I just drop the overflow attributes? I think the part can be
> used to check battery charging efficiency for example (though I guess
> we would need to also support the Charge register's).
> 

If chip is (or can be) used as charger, it should register as such.
Note my question was the energy limit attributes, not the overflow
attributes.

>>>>> +	&sensor_dev_attr_energy1_fault.dev_attr.attr,
>>>>> +	&sensor_dev_attr_energy2_fault.dev_attr.attr,
>>>>
>>>> Some of those are non-standard attributes. You'll have
>>>> to explain each in detail, especially why it makes sense
>>>> to provide such attributes to the user and why you can't
>>>> use standard attributes instead. Also, for the _fault
>>>> attributes, I don't entirely see the point. If the fault bit
>>>> is set, ADC readings are not valid because supply voltage
>>>> is low. This means that ADC register reads will be invalid.
>>>> What is the point of having a non-standard attribute - which
>>>> likely will be ignored - instead of returning an error when
>>>> an attempt is made to read an ADC value ?
>>>
>>> I was also not sure on this *_fault attributes. They are there to
>>> tell
>>> that the readings are invalid. Now that I think about it, I'm not
>>> sure
>>> if it even makes sense to return error if this bit is set. The part
>>> is
>>> in continuous mode so, it might happen that we have the fault bit
>>> set
>>> for a short time but afterwards things go normal and the bit will
>>> still
>>> be set until we read it. So my point is, we might be returning
>>> error
>>> for a conversion that happened way before our current reading. Any
>>> suggestion here? Would you be fine if I just drop this attributes?
>>>    
>>
>> It sounds like "fault" means something like "one of the past readings
>> was wrong, but I don't know which one and I don't know if the wrong
>> value was ever read by user space". Sorry, I fail to see what value
>> those attributes are supposed to have for the user. At best it could
>> mean "please re-read the associated attrribute", but that could as
>> well
>> be accomplished without userspace action if it is really needed.
>> Also, per datasheet, it looks like the fault bit is set of the chip
>> voltage is too low. If that happens, the system has a severe problem
>> which can not be resolved with an attribute visible to userspace.
> 
> I will drop the fault attributes.
> 
>>>> Others, like energy1_input, or most of the power attributes,
>>>> are standard attributes. Please explain the reasoning for
>>>> not using the standard API for those.
>>>
>>> This ones were because we need 64bit variables. For energy, the
>>> part
>>> also supports the alarms, max and min attributes so I included
>>> them.
>>>   
>> I can to some degree the logic for energy attributes, but do you
>> really
>> have an application where the chip is used on a 32-bit system and
>> monitors power larger than 2kW ?
> 
> Hmm, I looked again at the chip specification and unless I'm missing
> something obvious the part can only measure +/- 30A and 0-15V giving us
> +/- 450W which definitely fits in a long variable. The only thing that
> will be truncated is the min/max values. The part, by default, has this
> value to 0x7fff and 0x8000 which times 200000uW (part scale) will be
> truncated. Now, we can argue that this max/min values are not real and
> the user is expected to write this attributes with some meaningful
> values? How do you suggest to proceed? Should I just use standard
> attributes for power?
>   
How about detecting the overflow on read and just report the maximum
supported value ? Or, alternatively, initialize the register with the
maximum supported value.

Guenter
