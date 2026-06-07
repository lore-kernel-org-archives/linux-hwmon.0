Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3474282F3E
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848756; cv=none; b=oztRv3DhiUazOpAYZBc2tG/ubHZHrarEASfpYvzo5J2CDEKTi5Dim/SNxmSwYJkL3i3PMAEshnY6wt2d5RNFSHELY6H3vHW5niccyBV1tp/GLqaRhaYEv3vI5U1cGLNhTkwIWQus7TRhWNVH1FmyH+x0get/NKL4QtXISBCElJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848756; c=relaxed/simple;
	bh=oLnnXMVZ1S7nDkOtG14aLaN16WDCxmMvVzHrWAx9Gng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6py4Tj/Oech9npxFw4xT8rcHOhtK8dul5k85JQc6w2S5kRTf1dUY65rdSrLESWkcuGJ8WRFwDH4sB/nm67VpduupBYzFyU2D1GAKd6boSZ9W2n6uRM5CfR438hNo+/f3FeNP8gRaAiSCCWcWo0nuthu7LimQ5LuS+13sDFZstA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEp+Ry+9; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEp+Ry+9"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13817614cd3so1925771c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780848754; x=1781453554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=C2ZVZThIhOB3wY6V3pVRt2sEbwbWeseKqBCyBL/VlfM=;
        b=iEp+Ry+9CHN9Fqquh3t1sTayZQO0v66ZDtNw5VqkZJrtqkAXrTxzcjfoW3g5KK5mWf
         OB0XMB4BV0XhYGnj3raLcNQgTdwVqg9OismRgz7X3u0ZTPBRFDAZomCnhFafpvhh/vHy
         9/xOejtC5xgQivEoT7oy/I7WOuVFNKT3SNnqaY+a9VEZ85Jw+xNVHwJT+GaJBu0dK2z5
         8PznmU/2zq7aIviz0fR1lZwM1JBzI1soj+VsRJiZzIFsriBdT5ne7hKoF/ylFpCQ3asj
         l7VBdBSHcfBBVw8i2fGZM7I15kfEGFoLw/XLn2MW3a6395dpZTp0syFx4ceyiTitTiJW
         Ss4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848754; x=1781453554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2ZVZThIhOB3wY6V3pVRt2sEbwbWeseKqBCyBL/VlfM=;
        b=qmIJlXlmPOF26hLfv0yyS+11/MVpdE22e6gx+wCw7iBaTHXGpAff79k8KU4lzO5akD
         2SOZ7T5rBxCmtSgmGZYZgqtqLObjPtFyGfW3SOscABD3zQB1tjMTcbYfGcAlobGvH2AQ
         GhcA2+Fpl2UtbXTQISvLq8x/8Usq0qCtlouBeTRV9Z/WdmJCpm+Wfo35ELYxpyJciy4A
         UX0X0SJzNleFeom5zDHUMl2INz+LTQibPRgcuVdmiwfT+/7jOQXTBADq8/q7sutETnjL
         ypfc6H96PSthrrnijp5NmMFCqcYqXbb+Y8ILJ1VGfUkHYUxZgS+AXQ18y22SSc+K43Jn
         U76Q==
X-Forwarded-Encrypted: i=1; AFNElJ+qEsxrETTP0iUFU9uvi508Z+9OC50E1CAkv9yMBTjx7z5HicorBA9zOZ7PrQJnx3KEwZot2S9cC+LuDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfOZdV47wT7jzPjtVRkk3zUlPTfJj9t/PvFIhkNeCNnMXmCWoi
	1UMFiVpHIKhM7yXOW1OtQLg+XH4vrbEKhs2fgI+nBOK5+MMKfnredOuY
X-Gm-Gg: Acq92OH0ZSIgIL+ft4Y76HmZSBE8NxIQ2z/WoYyBcj+COUz2dDQ7xoWtvNvqvsw0MGl
	iyF/eGpjZ/LZLopWKJ8EG6xlAwjq++6l9a5lMC55p5RSV1jBWjMkKw1JUVZrE+hMbHxPDwh18ow
	+kuUAEob/cQzaP6WMKiUSU7k7P8I5Uvpqc5ePphmly6ykd6o+Fat2ap75QKaDiwgj0Hx3vXRUKz
	UPmtUDwnFaOutqbQuF5A8N57XoeAmVDADhJmykSS81aKDkmnmYkPOH/NnlEnMBUVD2RDjU1CxEv
	bwrNjmg1dGe4oSUJU61BRnxD3wws9YdANhD4eIXbyjdePgi0MeKlvac6N0jwJNOIt3eMlMVkrCn
	5fcTu2fcGVXc82NecflKgbR3ELI+g5SxHd2S4X8XkjTo2G4tLZfnczGGq3/sp8M65f88H4INIY6
	416bS1w7dQFlRkBzSb6AuAyMrkJUUgQvIYbzHL0lw9xfH4vAnIoO8F1VP4iepmBGkIDPW2uAiY/
	c/RiB/Knhk=
X-Received: by 2002:a05:7300:534f:b0:304:b15:17d6 with SMTP id 5a478bee46e88-3077b357e93mr7039567eec.6.1780848753864;
        Sun, 07 Jun 2026 09:12:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm17446308eec.8.2026.06.07.09.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 09:12:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9d78023d-9a00-4bd5-839f-2a79aef4b7a8@roeck-us.net>
Date: Sun, 7 Jun 2026 09:12:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] hwmon: zero-initialization instead of memset
To: Manish Baing <manishbaing2789@gmail.com>, jdelvare@suse.com,
 nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai, bartosz.golaszewski@oss.qualcomm.com,
 linusw@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 me@brighamcampbell.com
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/26 15:13, Manish Baing wrote:
> Hi all,
> 
> This patch series cleans up memory initialization across several
> hardware monitoring (hwmon) drivers by replacing explicit memset() calls
> with empty brace initialization (= {}).
> 
> Following similar cleanups in the IIO subsystem [1], this series updates
> these drivers to stop using memset() for stack memory initialization.
> As noted in those discussions [2], using empty brace initialization (= {})
> is the preferred approach.
> 
> Beyond simple replacements, a few drivers (nct6683, nct6775-platform, it87)
> were using memset() inside a for-loop. To fix this, the variable
> declarationwas moved directly inside the loop and zero-initialized there.
> This safely resets the data on every iteration and makes the code much
> cleaner.
> 
> Testing:
> - Compiled all modified files using `make W=1` with no warnings or errors.
> 
> [1]: https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com/
> [2]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/

That discussion does not fully address a problem I had seen previously,
where {} did _not_ zero-fill all holes, causing subsequent memcmp()
failures on affected data structures. It took a lot a lot of debugging
to find and fix that problem. Given that, I am not inclined to accept
this series unless someone convinces me that it fixes an actual problem
_and_ that each and every instance of the changes is not used in a
subsequent memcmp().

Guenter

