Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7FE2574F
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552764; cv=none; b=YVnXv/LdfXQJO21U5kbj3EBvHApyB2kGchZZyEe2ve5g80fmR9ZFjNP8+A+MMzmijs65+Df/npdrQxP9UUB9LiAik/BFQCFNDYumI4WrCC1YnlNhxlbGgDqHYnOyBTz7+OoImtq/2VSPR0cqPfIh2IJoVduX2tRr7APxYTfYG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552764; c=relaxed/simple;
	bh=BWT3TTHVKqaAfQtsin4WzSg9Vrk7+08hkkWZPpMlBCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmF3I8CYfwkk+le+tVMDcS8i6xrGXlJjgM2fbfmfGej3TkVBxK0BbCbOQAj9JrIxK59XQWwQQSvzUM5P+1+KI+ICBNAqMHWyP2jGVGAo0FnRxpYFEpSM+c4z+OyC0R5yjl/zdPpT4ncGNX6mhk2/hDQO+sQwpRM7zvJbLjJJkrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfYHeGue; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfYHeGue"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e486abf3a5so1296270b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 13:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708552761; x=1709157561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UNwGHoSbKAif1SQx55n8EDmwqDW5LUDZk+dKA3s8j5M=;
        b=AfYHeGue8x4qXr+OaeHgYgzW1U8EULGoPndvAO0Wj+WlrT2k30yQE1lYJEH7IW9b1R
         gE1VqrtLv/u32K2dOWvWOc2YDLIT40pEwWUSKM/yhLLx9apNLR6dhcB25G2sBZ9oDKQv
         hdW98nyfW0EQcHJ8IFSSTFBKhliGBv2eefaQ9p+v5o5b6p7BZpkbMfLSjURTWTdlwBw3
         GrIBlTgwrFhth3omB+HSP3LErO6kVWAy7keVOxuPU4oDIP1WCUlthBN+LWhFMQsn/a96
         38AmRN2Au7fprqreLJ+yRKEtSTZzSYqYwmgg30tpkf6TKl2hWesienTJv4luzFryAiVh
         V+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552761; x=1709157561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNwGHoSbKAif1SQx55n8EDmwqDW5LUDZk+dKA3s8j5M=;
        b=w3lxyTDjRKOmZnvcaVQMSIVSFm9EZ7LjR+5IZ2p6Wwjr0NswOWURp79vhRdwPqBEHq
         jT3fSMbamLOjAK99y049UsXnZPoD6VHbxthKqgWwOOytk6Yt+l7XkEKsyo1YKAlAWuuR
         HDdiLBxfQjB758dm4xzbwxR3f0/tyL5NoNcJt6j+ptE2P0Eytw6UBQw19kCKylieBrlH
         WmApa6e7lr8sHTDWM6Hl1X3JhK6j7tKGLEm6eN+Q5atDz67CfUNJMq9ikq+fMnabYAe8
         fJk+WXDigbunnCgj7YP5IVv1zcweha3nwbWprXYGvzShyAhLsKn5lig+ZMcrTRJBwCTU
         cWLg==
X-Forwarded-Encrypted: i=1; AJvYcCUUwJscEMpKCTT8WkD12w+ClTPXZNpb4gGachm8hHJ2RtZOyyrc8Ooo5CyPtrCxQHbg/hJpyGITf/TfZqIQdWqEVWExr5zCO1om+Mc=
X-Gm-Message-State: AOJu0Yz9tmbXr1jTHAi4y8isqTIjzz5BueuC1bTMcTGB6T6FRGnXFNrQ
	Mbl9o0qlK4hM4e4T1ZkBSHZNtY+aFzoSfgh+Kggsm/AU7Teh55EQ
X-Google-Smtp-Source: AGHT+IGbcd3H5nbWzlMtiJQUKCqjwX0NidCbAlAL32AXZwoRFSjVkr6Af2ksN9MhC/LiHe+TQi3CwA==
X-Received: by 2002:a05:6a20:5a1b:b0:19f:2df0:13fd with SMTP id jz27-20020a056a205a1b00b0019f2df013fdmr11555113pzb.29.1708552761485;
        Wed, 21 Feb 2024 13:59:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h29-20020a056a00001d00b006e45bf2386asm7158852pfk.59.2024.02.21.13.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 13:59:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <934b2230-e44c-4332-99c5-71dc64f7a185@roeck-us.net>
Date: Wed, 21 Feb 2024 13:59:19 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nct6775: Fix access to temperature configuration
 registers
Content-Language: en-US
To: Ahmad Khalifa <ahmad@khalifa.ws>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Erhard Furtner <erhard_f@mailbox.org>
References: <20240221141345.2231350-1-linux@roeck-us.net>
 <bb7eab62-6f83-49af-8ac4-516a991b99bd@khalifa.ws>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <bb7eab62-6f83-49af-8ac4-516a991b99bd@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2/21/24 13:31, Ahmad Khalifa wrote:
> On 21/02/2024 14:13, Guenter Roeck wrote:
>> The number of temperature configuration registers does
>> not always match the total number of temperature registers.
>> This can result in access errors reported if KASAN is enabled.
>>
>> BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9 nct6775_core
>>
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Closes: https://lore.kernel.org/linux-hwmon/d51181d1-d26b-42b2-b002-3f5a4037721f@roeck-us.net/
>> Fixes: 578ab5f0e4b1 ("hwmon: (nct6775) Add support for NCT6791D")
>> Fixes: b7f1f7b2523a ("hwmon: (nct6775) Additional TEMP registers for nct6799")
>> Cc: Ahmad Khalifa <ahmad@khalifa.ws>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
> 
> Tested-by: Ahmad Khalifa <ahmad@khalifa.ws>
> 
> 
> Tested on nct6799D-R without KASAN - nothing to report.
> 
Thanks for testing. Note that you would only see the problem if KASAN is enabled
(otherwise the code just sets a more or less random register address). On top of
that it depends on the chip configuration.

> Tiny note, i is in the range of 0..7 on nct6798/nct6799 if I
> follow correctly? Still 8 > 2, well caught.
> 
Sorry, I don't understand your comment. Yes, i is in the range of 0..7 on
nct6798/nct6799, which triggers the failure if i >= 2 because the code uses
the NCT6779_REG_TEMP_CONFIG array to identify configuration registers,
and that array only has two entries.

Thanks,
Guenter

