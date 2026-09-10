Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE949DB96
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052193; cv=none; b=TS8xk0Z188dsICJBQMyYLPi+yeBeN1gLy6PJzoH3VkbYMzOgF1EOsWLH+sfiKA1MCrhpQDd84yMdQebAuur1PJs32NeEMsPrZjzWHJbvihYKdo6kAaoJ1EdmdUdpfWvQ2q1ncRvkvzXSDJCbp2FGVhCX+X+vcT9ECYJy9kU3HBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052193; c=relaxed/simple;
	bh=YSFIu6CrNW5GnEAP7cV78TEE1V6V6nRvjoaUzJKag4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvgZeCSE9+8uap300v401uG+QZAv6CBoNUVQLFPv97QKAwFWAZWEyzfWdevA2n8lNvusrqf5Myo4tcaYn/ImcRsIZdzXUx+7ur9+KkIJDr8JenXQmR/GdkE+9yuzegv2vVgJJOIRLEO7wWyW9GM2MGgIirnFv0QobCvNrNAL81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYE7rbMp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYE7rbMp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b381337e1fso6921726b6e.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052190; x=1789656990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lTm0yv3jtVyAOGkqkKEQgPKn1d5nHzjUribtnIURR8=;
        b=XYE7rbMpC6Hhezfu9fpedxtbdvLtkw687pU6FtAw6lOT2xF34Bo8+AJ8hjaPrUsVol
         QcdjMJGgyG4vQWZLSFX+4lW1iIcQRdI9WG75w1vppj+gRgdAE+h2Wdn7zRkCfIMUB+J7
         I7QzGMSGjKaZwPxDES6hHk4eD79fH/DmwIpDlKyyzvUgl1VFyZrceDZIrVWlmEfIcWI0
         oQ6WfWwqhz52JxCI/C4PdCPBGxaNP/qUkrkaqTThA20OXbQ5EqzYVoiTcDsSYBqpEkNg
         nHhd8LL67qJPtTXp70zkaQrrTHx8drnIu+Emzx4wQDH0KV9Rl8oQ61DVXhswdj9Tv6r3
         Cn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052190; x=1789656990;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lTm0yv3jtVyAOGkqkKEQgPKn1d5nHzjUribtnIURR8=;
        b=DV+eGxYS31cqvZvoXrX6YMxeE6nBOB4SVh2fncIMVgRzLIJ8aOapY0dXUzhHs3mcgo
         SDmzDflx9tcB4dU6gIUHQjuujEutkbPhq5hQliZvD2tfQaL/pi74Lyz4rzZfsp+rBIgK
         2dugQgjPnq3qkphnVwrkhzcUHeIG8zQZEDfXOKF2XPSDrqGD4sNbdJGFgKMhpPghCu9+
         G8QFIHIHY0SLa7ypZI5jFVQx+RhIesOIf12b2td8DXK4YWj4AVgtYlENwR1WsMAQ5rhu
         SF91zGfwqc5Lqbl5ZRmTYNJFZyUq5sFrkzh5R1jQ49IEQIQtiV14M5sd6REgnOCcjc8t
         K8OQ==
X-Gm-Message-State: AFuF++nI+4gQ4zT+PQS6ZUqKqLNTG5VyEeUU7U2UQRvYNa4UccO6lGLP
	cahPPLUeCeAyj5PbJpOyIQsjCit6Oh9BLW/3oIS66LyFMdJeYjEI5kd+87eOFpZr
X-Gm-Gg: AYBFou0E59Pp+7J/uiFfLmYDuGQ+3YnTmC+/oCzF43UhrG/kOFYApFbA6b8CSpC8dNw
	LwUkJbVEeP9JaoRvwqwBtYaa8r32LFHEmRcbWg4eZkIGDPXPWjrKQMs+x/LzPPpah5+nkN4k0KG
	S1mJrpkXxQta0ZDeKX//JGoQcEueP+leMoriyWAnx5qBh0F+9zgL1NXAKH5NtdUTF2nAxLV6Ud3
	v6m5ymYAB6i7sF+j9bV+0XCCPkQew4PGCwbsLF1gROICcyQcxs2yqo+/X0xTsrtD17ZnaxrbrpI
	mjzFI/OILN+V7QxOkXC5++e4E2oYfgGSx4ew+fmfc+mgTy6s+UVh7WpbRv33aski/paK7RpM02B
	ZrZBmLo9m0+Ke/CYWTIRwpHuL7CuQF3/siO4ikHwgVhWnL82eQ2YozJnqstS+FxO4//z7JtvrdS
	JEncGh8yA22YLQ74Kld/4cMjrT8UbbHh2CIzBlgzLi9zmn70YSjhLKTxFYU7IV6z4zyBovFYtU7
	3kvvNfpbZS0iijBevZJLVUoJ8PShRuX7sxAHd+xsO8nV0FB3Q==
X-Received: by 2002:a05:6808:4f4b:b0:4bb:5bcf:b257 with SMTP id 5614622812f47-4bb5bcfbbfbmr18845694b6e.3.1789052190086;
        Thu, 10 Sep 2026 07:56:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c98e07sm17788638b6e.18.2026.09.10.07.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 07:56:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a69a9492-45f8-4072-8ad0-b023a5c139d0@roeck-us.net>
Date: Thu, 10 Sep 2026 07:56:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (cgbc-hwmon): Add some temperature sensors
To: sashiko-reviews@lists.linux.dev,
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-2-ef13ae2fa147@bootlin.com>
 <20260910134538.76E6F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260910134538.76E6F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 06:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch adds a 15th voltage sensor ('12V Standby Voltage', mapping to `in14_input`) to the driver's string labels and documentation, but fails to add its corresponding configuration entry to the `cgbc_hwmon_info` array. As a result, the hardware monitoring core will silently ignore the 15th channel and fail to expose it to sysfs.
> --
> 
> commit 0d30ff3c376bb1134975af10205e094badb07304
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> hwmon: (cgbc-hwmon): Add some temperature sensors
> 
> This commit adds several new temperature sensors, updating documentation and
> string labels to match the Congatec board controller documentation. It also
> modifies existing labels.
> 
>> diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
>> index 2effa0b562862..098896ec8c6f6 100644
>> --- a/drivers/hwmon/cgbc-hwmon.c
>> +++ b/drivers/hwmon/cgbc-hwmon.c
>> @@ -41,32 +41,42 @@ enum cgbc_sensor_types {
> [ ... ]
>>   static const char * const cgbc_hwmon_labels_in[] = {
>> -	"CPU Voltage",
>> +	"CPU Core Voltage",
>>   	"DC Runtime Voltage",
>>   	"DC Standby Voltage",
>>   	"CMOS Battery Voltage",
>> -	"Battery Voltage",
>> +	"Battery Supply Voltage",
>>   	"AC Voltage",
>>   	"Other Voltage",
>> -	"5V Voltage",
>> +	"5V Runtime Voltage",
>>   	"5V Standby Voltage",
>> -	"3V3 Voltage",
>> +	"3V3 Runtime Voltage",
>>   	"3V3 Standby Voltage",
>>   	"VCore A Voltage",
>>   	"VCore B Voltage",
>> -	"12V Voltage",
>> +	"12V Runtime Voltage",
>> +	"12V Standby Voltage",
>>   };
> 
> [ ... ]
> 
>> @@ -255,7 +265,12 @@ static const struct hwmon_channel_info * const cgbc_hwmon_info[] = {
>>   			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> -			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
>> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>   	HWMON_CHANNEL_INFO(in,
>>   			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
>>   			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> 
> [Severity: Medium]
> This patch adds a 15th voltage label ("12V Standby Voltage"), but is the
> corresponding configuration entry missing from the cgbc_hwmon_info array?
> 
> Looking at the 'in' channel info array here, it only has 14 configuration
> elements.
> 
> Since the hardware monitoring core iterates over the cgbc_hwmon_info
> array and stops after 14 entries for 'in', will it silently ignore the 15th
> channel and fail to expose it to sysfs?
> 
Sashiko has a point here. Maybe make the subject and description a bit more generic
("Add some sensors" or similar, document that a voltage sensor was added as well,
and add the missing channel info entry.

Thanks,
Guenter




