Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AB1EF0A5
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 16:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538916; cv=none; b=hQldE1+AbZziKWXqua3+G4gnB3tickvxJRF3UPoPUip7nogtcm3PF/S0gZU943/aDIRjGxlZpIwTYWt1GQ6Tu9Wxi2JCMwye55JbrhVaLzSQpbHhN74GjmiYisnG2f8JexE242A1esD7uAhKookaa+wrTKQTmynLDBaubunkvEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538916; c=relaxed/simple;
	bh=98MUNp1B0hTWd2tuKSIUIMhOrNxljkpCSg0sSgQVn7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kiePgLe+lsM94xzB39ZfLcw2VsoA9LHPHBZIIdVGKHGHVqP6lzMEa6rZj5uH8I3TMYdbQqkLl9rfWjysW4uwmB8by1k46Ko4mJ6XTvqifl8axhHV4NitCgY0rMqKhtiAa9dQXRMJQC8zT/xFQhz8Yn9Z8IrZbHUVBkx90Hl5HKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDNi1jY3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDNi1jY3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165448243fso66013885ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734538914; x=1735143714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XvYg7pX1UE1uGThNa/job+QAdwSK8+VIqojInuTTqrY=;
        b=MDNi1jY3gTBHegqEAsfzEg/7zykC8Z/fHP2R8PRjprbChVYNdLrYmPcYXmuy5zOjJh
         WwD5foxlC4/GR7acyol79hv0LSLcg9tNgXizJtqlE3kbr63hz6OUoIKciFHchpQsXy93
         dCPMw+RxJV/HnVJFnq+Cw6b/vGhV/Hfo0/cCss6J8PHV+cXldf0IglABXBILfrR46viu
         bHPCCpxZ1kovgDIs5I6txLdLCHPXK0JYPx+0sOgjPxQ07nACBl3oV6cPrHwQP4Ofpmkw
         ACMoZocRl6a0hOc3bXpS/hJzsCX8jNOrmM24kV30odqWsHirRLkBukTvrBVKb2N74+q3
         grqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538914; x=1735143714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvYg7pX1UE1uGThNa/job+QAdwSK8+VIqojInuTTqrY=;
        b=ZD0t+dQ+NN8RYlV41rhQGUI7IGmcP9skWgBDcCypeTfYwTCt7H3CxwaSR5PTSWBd/e
         INF5xo8i8OCQoeXsi0yxlrTItuepNdH5TTt3OaPFaqTblBHWEMhAuvKt44fuu4a1Alcz
         BYt8LofZ4m6x/Wthe8FnfnnEeu2e6edFn/mJjSb5CHFddEajvnlStXudO0n6AEK/ezug
         PrgzgL0VZi5UJ4tr5dzacMvXEhvLCAR3sAGI9NktmL2CIDjEJQB29n2sdy4y4pZbSv/7
         DjOZ1dmyfI3IGxswnbnKXHY4spdurj+ATRAmpuZjCLgvkGmiGVoXRatpuutV6uwXEM1N
         ZwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrIOQw/MXOT7iPbEn+LXYznQrzhdLTF6+nDV5IUy2+vbkwASQGwTYZpcXf9+5qnoPotgYv6rPDCikm5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbm2seFSr1J3wT9ONRCElZz6LZLnF6DhubR5URqqRuDbHwtGI
	OULlizO4j6+1WuioP4AQ4/NRpq4ZELzfXL0VZhGSrYNNWAr5Gd43dbD7rw==
X-Gm-Gg: ASbGnctZlbik4EfeDnayQIsurlGK9JbkEm57O/vjMCMWY5J4pnnxnTwXTZIvzY4rLdO
	xOkuqK5lZsmhZbhA/W2YxpuiM56QIymgqcEwdCM3NQ4KVnwOyha6leTwknIgTsv7jLfMV+fwZ+c
	WZkf2Kqba+AlqXv0FgzPsSzVw+DU7hfqbUWtD/Xn1FroIs3a3GZdou25iyapg4XnF8vr87WwIdg
	53OigBAXlIeLbbSElEVnVZCGDPTohRnPYzPkw1PJ1jhasaBNAohObcW2SFFVtzURAXL6wkx3ZZN
	6FlFbCgyAA0SfBXO4Kc8kqP3yjRraQ==
X-Google-Smtp-Source: AGHT+IE1U3VVnX2lEUOt2d7ZvMkPfqUjhQw9UMgz3V8wMOWHyFb7X3HEdHD/nygcFVVWSl1dR/rh2A==
X-Received: by 2002:a17:902:d510:b0:216:59ed:1a9c with SMTP id d9443c01a7336-218d726d7f9mr40761195ad.55.1734538913683;
        Wed, 18 Dec 2024 08:21:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e652bfsm77791655ad.243.2024.12.18.08.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 08:21:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>
Date: Wed, 18 Dec 2024 08:21:51 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
 <Z2LzPeqyxqJz06dZ@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2LzPeqyxqJz06dZ@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 12/18/24 08:07, Wolfram Sang wrote:
> Hi Guenter,
> 
> quick response, will test your new patch later.
> 
>> ---
>> v2: Fix accesses to 16-bit configuration register.
> 
> Great, thanks, I missed that more fixing is needed.
> 
>>      Use regmap access functions for all operations on config register.
>>      Declare regmap bus and use devm_regmap_init().
> 
> The regmap_bus solution is really nice! Didn't know about it.
> 

Yes, it comes quite handy for hiding register access oddities (such as a mix
of 16-bit and 8-bit registers, or different read/write register addresses)
from the actual driver.

>>      Drop local configuration register copy; let regmap handle bit updates.
> 
> And one patch is gone from my queue. I had this as well :)
> 
>>      Note: The driver could use additional cleanup, such as using bit macros
>>      and using devm_regulator_get_enable(). That is left for another day.
> 
> I didn't do BIT yet (although tempted), but I have the regulator cleanup
> already. Also, 'client' can go from the priv struct with just a little
> bit of reordering. I hope I can send all the stuff tomorrow.
> 

Ah yes, 'client' can be passed as bus context, and isn't used elsewhere.
The access functions need lm75_data, but they can get the pointer to it
from drvdata.

Maybe that should be part of this patch. I assume you'll take it over - do you
want to make that change or should I send another version ? Handling it in a
separate patch is fine with me as well if you prefer to do that.

Thanks,
Guenter

