Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A294DDDC;
	Thu,  9 Jan 2025 03:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736391867; cv=none; b=B5llVd0Qk+ZEMYL/HivClqU6ci+Ko9IoKBF5kr2vdlw6KTiKigeXgk49mbV0uZg8fA4tpNuT0IvQHMKV5SEacHN5fcje/3m9B6hCsvsvW5r3tAIwMZaGnSSLoV+0ueXZ8VbnfxUUfJLgZ+L/PfF3iuC1dWbc4wAbeHe2YSfuvbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736391867; c=relaxed/simple;
	bh=H+efbh5BGCH2wkrZmg9BbCvhr2NcFys/9Aemx96z4qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jO9JQDXUsijs9Sl2aSzOhIMC1kBrB2cxGUwg5RFAqgxZQRMfrLuuI3INl9ZyrRKrIIqDsT+Okcoeve9bEvCP1CuUJ4GOlZh02iQDkUokK0ev+huBb0PFsrDcKHYu/Yuy0ld+6xBqem44/IOYMZ3w3vQHriBMYGEL68GXukpuSQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RV4MVTmc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RV4MVTmc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so5962105ad.1;
        Wed, 08 Jan 2025 19:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736391865; x=1736996665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TbVa9AGOBMOZjVwfIhOO8Ux0mTrqTFTDIDsrP0opqQg=;
        b=RV4MVTmcLIr1HsnSUm6PFYGdyNJbHDxdRaKeSW1npEZsV9g5O9qu07HJGGVZ98gDIg
         kBq+xd8Py3tg7Ba9B6do7ir7CzoWNg5GzYSuxjk/7eICZ8eTQk4TrK8TyY8JSLYUTtMR
         dvTr3mM4bjOhD6HCDRD34VLownk01awYKZkuk1CrivE/WaFgFrp5gdz99hVAs+xKuEZc
         vONUZ+2nsh54RMPYeOMic0U5pELUujDnlNL1qXv9C6kbKWreuulVmkYkwIu+SfF7y0UU
         +49jpjI5tjR7+OZSUaqGo9i2EUiNh+J6+5gxQIewht0xu30NpvHA75rqr7f2frcwkqH6
         CtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736391865; x=1736996665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbVa9AGOBMOZjVwfIhOO8Ux0mTrqTFTDIDsrP0opqQg=;
        b=HQ7tVv7eNyoF/ovci/Y0hXjGyX4VnSiRaljXp7Ab1S2dNkJR4HLiMBBa/MKKR4Dvqr
         Eg53mbtWaA0UaASBqLOE9FI+fpKdtThTTVpsXSwxDoQ4/ySKC1wZ7QRF3HPfVFqBn4Zt
         0GPAgA3M3VjhiWroR4JAkM10qwXK28/dqsaG3+/OyJlpeVhthNfY5a12hRNSZw2WsDwD
         qv2CfRH3Lm69cnBLKMJT0YjDOqCRFlgJVgpsM3Q1LX6JKUusBur0OWrV8/K2PFpzo21k
         AHmKUZ6SQhRge0VQER92iG+Z+GjBfLulTlE4QM+1tq18fovGB3py3rFjNaEsDYQ5rouD
         B1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUrF9FRUvXiaSfL5amZJFKZQEmRcqi4C4q8dAOzWgXt9xQSWX9u51Ign9oMazZ99257Q9ROEgnD7FXP@vger.kernel.org, AJvYcCVBVoMpYzPkZPhbjF4UQ9K7Zv2xdWtEtsI6iOUGlRV2BsK5KhUqgGitFFJfAHNID9/yMfD2WQOPmA5/HijK@vger.kernel.org, AJvYcCXHJQEj+4mZkQ9hgeeQ1fghO+uaYyTc98XnkRxg85bwZnE0Zvl/ABWru1guOVts7FYtBH13tiBWTNLV@vger.kernel.org, AJvYcCXJizVmpCVxMJirJdwfx5EpAR0Nl9USrn8R9nOQ0OfY9Q4k6lxMujj808otzBFxJVIOY7B0Y/rpmYbfGSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwgth2O3gqSq6iDKw5gmIl5jGsj06Da/Y5bx7zzg3Ck3k9xfwj
	XDvc3vZ78c0Asd66eqrKc4bFoANdhXQLHo6TqJSJMSvBMUnRsTAM
X-Gm-Gg: ASbGncvYNdHdbj42J10daDCIv7+Atxvk/715WIRKytu+dOIJP9pnhvPR4kgoVWuX6vr
	o2Yqw/DMaGYNMaOLG7YtGIJpLLNd2Cr8fdJLYhnDnPD+XAZiM+KXw6V6HAm9d4Os2OkJmWiqCJ7
	LG4eTpRfsspYVL5YqimY/gqazhztPZahfm5yyffKbNWnjzPEzycsUSiK+29JHnf9dA8yHBHNmRa
	BfTjRjVuox/VhwrVkuzRuvBNeorBMPMN/ZuiF1vl51LknP6YmrrtUoP5NJ1TXg+QrdlgvIIUsFi
	IETEO8iBMwXvAbHyhIOE+DU2foQhNQ==
X-Google-Smtp-Source: AGHT+IHr3XalJCgdndpm2YtOGGTwzIlMq7ZeKDnaqt2kyfSXPCVMC1duy7eDXmCgpopHUkAA4n3oIg==
X-Received: by 2002:a17:902:f68b:b0:216:2a5a:89d3 with SMTP id d9443c01a7336-21a83f70d13mr72465125ad.25.1736391864688;
        Wed, 08 Jan 2025 19:04:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07d050sm213759a12.15.2025.01.08.19.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 19:04:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1e16043-4841-411c-8feb-435b59d7f65a@roeck-us.net>
Date: Wed, 8 Jan 2025 19:04:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>
Cc: jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
 Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-3-Leo-Yang@quantatw.com>
 <b2a336dc-c029-4a95-9807-8e8b82f75ec9@roeck-us.net>
 <CAAfUjZE2x_Fafogna2yhnnohZrGmtW5G3Q64AVhYwVEXuGoaBw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAAfUjZE2x_Fafogna2yhnnohZrGmtW5G3Q64AVhYwVEXuGoaBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/8/25 16:50, Leo Yang wrote:
> Hi Guenter,
> 
> On Mon, Jan 6, 2025 at 11:31 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Besides, while I did point out a number of problems, but I did not suggest
>> to "rewrite the driver".
>>
>> Since this is v2 of this driver, the submission should have been versioned,
>> and a change log should have been provided.
>>
> 
> Sorry this is my first v2 patch,
> I should have been more aware of this problem, thank you.
> 
>>
>> Why not just pass the power coefficient directly as parameter ?
>>
>>> +     if (1000000 % *m) {
>>
>> I fail to understand the logic here. Why scale if and only if m is a clean
>> multiple of 1000000 ? Scale if m == 1000001 but not if m == 1000000 ?
>> Please explain.
>>
>>> +             /* Default value, Scaling to keep integer precision,
>>> +              * Change it if you need
>>
>> This comment does not provide any actual information and thus does not
>> add any value. Change to what ? Why ? And, again, why not scale if
>> m is a multiple of 1000000, no matter how large or small it is ?
>>
> 
> When we calculate the Telemetry and Warning Conversion Coefficients,
> the m-value of the current needs to be calculated via Equation:
> 1(A)/Current_LSB(A).
> 
> The number 1000000 comes from A->uA to match the unit uA of Current_LSB.
> Try to prevent the loss of fractional precision in integer.
> 
> But this is not enough,
> according to spec 7.5.4 Reading Telemetry Data and Warning Thresholds
> If there is decimal information in m, we should try to move the decimal point
> so that the value of m is between -32768 and 32767 and maximize it as much
> as possible to minimize rounding errors.
> 
> Therefore, if m does not have decimal information, even if the value of m is
> scaled up, it is not possible to minimize rounding errors.
> 
> But my comments are not clear enough, I'll fix it.
> 
>>> +
>>> +     /* Maximize while keeping it bounded.*/
>>> +     while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
>>> +             scaled_m /= 10;
>>
>> This looks wrong. If scaled_m < MIN_M_VAL it doesn't make sense
>> to decrease it even more.
>>
> 
> In this part, I try to move the decimal point so that the value of m is between
> -32768 and 32767.
> Assuming scaled_m = -40001, I can scale it to m = -4000 and adjust it by R++
> 
Sorry, I missed that MIN_M_VAL is negative.

Guenter

>>> +             scale_factor++;
>>> +     }
>>> +     /* Scale up only if fractional part exists. */
>>> +     while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {
>>
>> This looks just as wrong. If scaled_m > 10 * MIN_M_VAL, why increase it even more ?
>>
> 
> I think the purpose of spec is to keep as many integers as possible in m, and
> then save the information in decimals via R to minimize rounding errors.
> So here I keep the positive numbers as close to 32767 as possible, and the
> negative numbers as close to -32768 as possible.
> 
> And thank you for the suggestions, they are very helpful and I will
> try to fix them.
> 
> 
> Best Regards,
> 
> Leo Yang

