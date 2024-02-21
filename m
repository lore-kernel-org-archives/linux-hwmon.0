Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0D81752
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 23:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558788; cv=none; b=lV0S81zEdoMsuxTDJE+zrBEp/hsJly7af5l1F84ZzidfTW0CS5MTPS/4+s/2AgtYLvizJmmYBEVnfo3JB+JcqbmeXizblHb8wxHdRfrdVGZd8KlNv2HfOGCtEhG9SRCRKj4NJ4scZivUoSZxo8WVFaQ1yv7ZvUdetYmZuad+P6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558788; c=relaxed/simple;
	bh=M1X1PPkMjoycxaDgdh5MYjO9aX0lDF0u9V9oSPx+GZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXuK9A8g6hmIjxKpdlZyqGMrkpOOE9WfLo9HKlf4JsgIz5fRM+PSXqyzL7SesYidBpOaq0fhMCij0v2adZJbLgQ8s+adwQ+nPz56iLaNyvvolY955T+RrY4pQElREK+0Lk/K1jimftiC6HTqVcnAMFcEXlJf2PTmADu0alwpgPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMGYxBMh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMGYxBMh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-299b55f2344so2661942a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 15:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708558786; x=1709163586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OOy5+98DsWvCUh3pOLH/5aVXroV0G3rX+YPOdbsDv+Y=;
        b=eMGYxBMhplrTuF4tfmkJvLm4dNOGt5zqyf8hzebBgA9fuIyUhUBrDH09bvVdRKyqpN
         jLwuUB0kk/uD2nPf9T5JhIv0A5Jv+yzSx6fonMgZrXyK2MdSeIg8Bwo1QgFEjCTJAzjw
         vbzNhkFHRnDGe0kLaL0MRqIsYu6b9XfWELwOiwEM9lR+4fUUu5hSKiR2WlNnWoR4KZZf
         mJxkc9G/Ol0cjIQ5n7u6oTGjXi7AHRaG0HuOGyOOSFnxfxNl/l+e67ECAOL/rd4D7G15
         Pw4j9hUOdnpFqAYtAMcDT4ZmOBcZ1TrTwEpApWEHVc3VVFMfNn5DQS9Q2d3Cw6FvI7HE
         yLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558786; x=1709163586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOy5+98DsWvCUh3pOLH/5aVXroV0G3rX+YPOdbsDv+Y=;
        b=QZV0ADIAntlhD81KOX2WHpXDlXfEfdDwGdgruhZStaxoBzBn2RS+8o4tSILsBADjSp
         5YdcdhPTfAHrljCbM/b4IHU/SykkRDiHOsOONke0l80E/+lahMQPJR/EBMWn+giNXq/b
         JaHTUCLZPgl3x9pTGjQ7x13MysTw3guT/GzFgvg03z08e0uBZ0ZrK9cKjda48rdWCILA
         QwSgpviOvXF0hsBzv5VnXLgWqQPfUBVl4meWDxXj6PAyrCSMNBfNPxgdm84Dj3y+KzQA
         9M+f4naM95XpMymi0349RIHHD+sSzDkyTiJxQZ7lWvOovyrLiZR7wydm2NAt5VZC/Stp
         3zSQ==
X-Gm-Message-State: AOJu0Yyq3/GsksRTE1iFQ7/exRF4iow/0IQrYrl4/0M+pEp3sZAU9ECs
	32a9IT0wzCM1ifYU4E9S+mrqBfuWTumNi0Oh7rp3KUAaeZqTu9nx
X-Google-Smtp-Source: AGHT+IGBtX83pacETprmtktrBMt1xFYqeu9DbGihSAApeeiKk8wq2kfE+uFQWRCawS3r1jk49Nr8Lw==
X-Received: by 2002:a17:90b:1d09:b0:299:3f36:48e3 with SMTP id on9-20020a17090b1d0900b002993f3648e3mr12718298pjb.11.1708558786197;
        Wed, 21 Feb 2024 15:39:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pq11-20020a17090b3d8b00b002966a13f2e9sm2475461pjb.37.2024.02.21.15.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 15:39:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c1f83998-d7c0-4e37-85c9-e5e0e97e1595@roeck-us.net>
Date: Wed, 21 Feb 2024 15:39:44 -0800
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
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Ahmad Khalifa <ahmad@khalifa.ws>
References: <20240221141345.2231350-1-linux@roeck-us.net>
 <20240221235335.136d61e9@yea>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240221235335.136d61e9@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Erhard,

On 2/21/24 14:53, Erhard Furtner wrote:
> On Wed, 21 Feb 2024 06:13:45 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
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
>> Erhard,
>>
>> it would be great if you can test this patch on your system.
>>
>> Thanks,
>> Guenter
> 
> Applied your patch on top of 6.8-rc5 and 6.6.0.
> 
> Works fine in both cases, the KASAN hit is gone. Many thanks!
> 

Excellent. Thanks a lot for confirming!

Guenter

