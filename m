Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57D1E515
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777030; cv=none; b=clDgIZO3gyqT8TphTj9ikqpNPJQnZIj1nSTmtKKJqos6cJVRJa5K1kXlk60SBY6JcJHcgiugMv2LIOsQ/UQArWct2dpseC/QpjvS2VMBTG/3R5JTeCGR+sbk9MRUuXyg62FzX1wQJkZv7+3fh6Imrl6eyEn6FLF1bcQ4naLHseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777030; c=relaxed/simple;
	bh=MU/Xm9EEW0Pdtkvgtb1SacEvfQeVa0OV6Ug0FtIi/zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sf1wp42UuCbePpB1Puczs2CfWfygdlAEzDd0QlFwVFrPDQF86+ShBzhaazpHycw27loBttXp2zqJHrz66GKYzk44UBxJccDzKczMBXgTSqB3GRiauAF2jfFqWhR3XG57JtQLzxOcHCN8m2GvaoQcZfEnZDwoc62C75SMFGZyIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU1uJMjH; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU1uJMjH"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c739e680bebso45858a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Mar 2026 22:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772777028; x=1773381828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iqAiaroUgLrtc5fiMz8APylbS+Fj/T81fB3jZkdY2x4=;
        b=eU1uJMjHSlB0mTPxYH26INvr1770t8YPaySQU38Jau3KQVBkaZFvMviyNo3mIeY38R
         /qIUefhdNUdJmz6iDjXFPi0Yib1au6GSfdCcFZVQO/4Rxa/CVdBHTq11pdSovvTCz52s
         0XQpa0NyoYlDQKKdUGCFGBmLewMnfrahqaFCj4D6Wpwb7Sgg+Fe0O8X2XilCfkCryXHH
         LhIYOr9SRajNBC516m3EcIMmwNTd2h9q8X8whugNRgysjQww10hQ+3YOhoIpW9MCcIFp
         2b8SSBSfDpJPOO2dpjm8hbOuwMK3ZM2fzbW4R4NhwcbKsV4r23yYE4mG94ZcDNcZG3T5
         GRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777028; x=1773381828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqAiaroUgLrtc5fiMz8APylbS+Fj/T81fB3jZkdY2x4=;
        b=PZP1FHTd8jTM2uxiT3IBIdGGu4aU6pjsMINy8YQ2LzG8hAm2q3vGPCGWqnfT3QSavS
         8hiRbElJOLRlB2aNEQvHgbcdmGYYf8FeUhaGe/vsnwSXytqV4mN7YUAetyK93BLqmIBZ
         wPE9lU6NgBPXciAIFXz3EQm57ZKvHXiWORIcLgJHAW0c/m5j67Hqg0W6bpquwHVTjB16
         uqvxVLiIJ1BgKrVMC9cbdIwlSBNQBBFP18uXXipOqv8HROh2bq2xFlAzBH3ERB1D6C1u
         28bOa7LS2eqtAkyc/c2WC7d677OwTFH9Lkqz3p1KKueqfwCOVhbPs0DFWXZz/AKzpYp4
         WOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVewZh8fA2lcFfMvvh0sXEYBBWqktn4WRqUu1BrCjFVBWfBdys8Ls1crOVc0fo4J+SBg1ojuyMRRMVf6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxarjzGM4+Mr3sZE8jcx1Ys1StHpBcvy1AnJaAS1o56dHqbUYtF
	n+p5HDt03yqbtE6mzDLGQg56kQSq/N8TjnQiU+7z+B4cyodKJZJ5VdvzsepcC9j9
X-Gm-Gg: ATEYQzwYEto+j41LYB8VeGOBuIo/GNS0cHIEG/U+HohXM+7W9xmmejv2QVBl64UrQxt
	aGrowYGMXBiWdeWMyFvJFEm14f3bENrhfhpPJY1RtkHLQm3Qae3/XWJnAglplLpxJTuvdJA0Wcx
	NPPjQTjgTKj5Iz4MDex19e5YVvcn0GLUQBGT5B9plJpkTNMKc97IivzT3vQC6t3CDAl46w4tkFk
	adJcFaz9Qa0j1bigbMRoazt17abUStQKeFm3oj2/kLl4ZOEX5Zm0YZ51Q5Lky1SP229iO46KXo4
	HyN02zX1/veJscGGUg3PhLzzKUXtEe0hHbGMRDXdqsDTg7GTBoh07xeVCjtohlGR7VH28v9fa5C
	Jn8RBfL+6ZFQ5YjQtSth2qG3OFiz8jW7qar2Bun0uHL2RO4P7K8ycDS1C0bxOr8nYwNyd6oK1gH
	BTndeBLt9Cy98iTzx5ORzM7xoQ/9kvX4nZjOAC6qRwE2R9XaDdFAecBstVlIo6BK895MoMB9Uk
X-Received: by 2002:a05:6a21:468a:b0:394:62e0:1b98 with SMTP id adf61e73a8af0-3985a686780mr1115914637.9.1772777028147;
        Thu, 05 Mar 2026 22:03:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm460600a12.31.2026.03.05.22.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 22:03:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
Date: Thu, 5 Mar 2026 22:03:45 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: add driver for ARCTIC Fan Controller
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Aureo Serrano <aureo.serrano@arctic.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <FR6P281MB590006F97DAC7A5C224D957BEF7FA@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
 <51d91216-8949-44a9-93d9-646d3f3563b1@t-8ch.de>
 <8dd3367b-4a7c-414b-a4f4-41dc54578e2b@roeck-us.net>
 <d1d27763-c49d-4d02-9157-ec798bd10604@t-8ch.de>
 <72010133-5acc-43ac-8372-d0d830291ef0@roeck-us.net>
 <02626fba-6b7a-429d-9719-46862f175b4d@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <02626fba-6b7a-429d-9719-46862f175b4d@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/3/26 13:34, Thomas Weißschuh wrote:
> On 2026-03-03 12:42:13-0800, Guenter Roeck wrote:
>> On 3/3/26 11:30, Thomas Weißschuh wrote:
>>> On 2026-03-03 11:00:25-0800, Guenter Roeck wrote:
> (...)
> 
>>>>>> +     } else {
>>>>>> +           spin_unlock_irqrestore(&priv->lock, flags);
>>>>>
>>>>> You can use the new guard() syntax from cleanup.h to avoid manual
>>>>> unlocks on error paths.
>>>>>
>>>>
>>>> Why would this code need interrupt disabled spinlocks in the first place ?
>>>
>>> I *suspect* that it tries to be compatible with some semaphores in the
>>> HID core.
>>>
>>>> It reads individual entries from priv, but even if those are updated
>>>> in parallel I don't see why that would warrant disabling interrupts,
>>>> both here and in arctic_fan_parse_report().
>>>>
>>>> The hwmon core already serializes read and write operations, so
>>>> the locks (much less interrupt disabling spinlocks) are not needed
>>>> for that either.
>>>
>>> The HID callbacks can be fired at any time from the HID core,
>>> concurrently to hwmon core logic. But I also dislike the spinlocks.
>>> Maybe a mutex works, too?
>>>
>>
>> Ah yes, I can see that arctic_fan_parse_report() reads all pwm values and
>> arctic_fan_write() writes them to the controller. That does not explain
>> why it would be necessary to disable interrupts, though, and even doing
>> that is still not safe.
>>
>> Example: arctic_fan_write() updates the pwm value for channel 1,
>> writes the new value into priv->pwm_duty[1], and creates an output
>> buffer with pwm values for all channels. After preparing the message,
>> it releases the spinlock. The raw event handler receives and handles
>> updated pwm values which are completely different. Then the old,
>> now obsolete, values are sent to the controller (and, worse, the
>> new cached value in priv->pwm_duty[1] would no longer match the value
>> that was just sent to the controller).
>>
>> That can never be made safe if the controller updates pwm values
>> autonomously, no matter if spinlocks are involved or not. That would only
>> work if fan control is manual, and in that case it would not be necessary
>> to re-read pwm values from each raw event. The current code isn't safe
>> even if fan control is manual, since reports from the controller will
>> overwrite cached values and requests to change a value can overlap with
>> reports returning the old value.
>>
>> In this context ...
>>
>> Other drivers also use complete() from raw events and wait_for_completion()
>> variants after writing a command, so the code sequence in arctic_fan_send_report()
>> will require closer scrutiny. It is not obvious to me why the loop and the
>> msleep() calls would be needed for this driver but not for others.
> 
> Ack.
> 
>>> (...)
>>>
>>>>>> +static int arctic_fan_probe(struct hid_device *hdev,
>>>>>> +                     const struct hid_device_id *id)
>>>>>> +{
>>>>>> +     struct arctic_fan_data *priv;
>>>>>> +     struct device *hwmon_dev;
>>>>>> +     int ret;
>>>>>> +
>>>>>> +     ret = hid_parse(hdev);
>>>>>> +     if (ret)
>>>>>> +           return ret;
>>>>>> +
>>>>>> +     priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>>>>>> +     if (!priv)
>>>>>> +           return -ENOMEM;
>>>>>> +
>>>>>> +     priv->out_buf = devm_kmalloc(&hdev->dev, ARCTIC_REPORT_LEN, GFP_KERNEL);
>>>>>> +     if (!priv->out_buf)
>>>>>> +           return -ENOMEM;
>>>>>
>>>>> The 32 byte buffer could be on the stack, saving this allocation and
>>>>> avoiding a shared resource.
>>>>
>>>> It might need to be cache aligned, but even then it could be part of
>>>> struct arctic_fan_data.
>>>
>>> What would be the advantage of that over an on-stack placement?
>>>
>>
>> Sorry, I should have said "cache line aligned", not just "cache aligned".
>> Data on the stack won't be cache line aligned. I don't know if that is needed
>> here, but some USB transactions require it (which is why USB drivers often
>> allocate buffers separately).
> 
> We can use __aligned() for stack variables I think.
> But with a quick search I didn't find any alignment requirements from
> the HID subsystem. So IMO it shouldn't matter much for now.
> 
Google's experimental code review agent has a different opinion.

Here is what it has to say about a similar change suggested
for the Gigabyte Waterforce controller.

   Does this change violate the DMA API?
   The `buffer` is passed to `hid_hw_output_report()`, which for USB HID devices
   will map the buffer for DMA.
   Because `buffer` is embedded within `struct waterforce_data` without an explicit
   cache-line alignment attribute (like `____cacheline_aligned`), it may share a
   cache line with the preceding fields, such as `updated`.
   Since `updated` is modified in `waterforce_raw_event()` upon receiving input
   reports, concurrently accessing it while an output report DMA transfer is
   in progress can cause cache coherency issues and memory corruption on
   non-cache-coherent architectures.

I didn't verify this, but it matches my memory. Of course, both my memory
and the AI may be wrong, but at this point I'd like for someone to prove
that it is wrong.

Thanks,
Guenter

