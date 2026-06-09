Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334DB421880
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010263; cv=none; b=YdMCIvlJlcL0zsJD5hJ7SzagknSEzxQdJ4INzqq5Vy9f7QN2RWkw7oO0JOx5auXP1GQPLkprJ1Vwry6w3cVuWBvK8nsmcXdsfzkzzRBZUYlwcqKYrasbl/qBYUYnbdFeYrCbJL/5pcZGeUYHcSHb5WDMiiz5T1tztkBumkSW4UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010263; c=relaxed/simple;
	bh=j6bMKHmag/NjfkCjzMD375pS3+9k/1A+z/l1a1FBrTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oz2GSYuCw0HSYKsLqMy2oFmj7ImUqsw1X+UijDDlzpBfbnAGI6c21s17WHRBNlCl4IDdp377hjpcE0uEsOzWredaoAQmrc+IHIvSYyoShflprOy9G0y4l5b55S75k/aJO/rAX6awuvPCY/nxFJphX0YiljlRXhI0mORm4mIc/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RysMlNtX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RysMlNtX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso41763375ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010261; x=1781615061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AFSRA57sXKLlEMGOh13mH9O3WdT4M5EIVdDK4eMznIU=;
        b=RysMlNtXGKWSJ8zkAqM+XcUafqNHi13NgG1/uUHB3BzsvbHIvd6nb0xmUaU6wpJrnz
         smxOvVoz0lzgxmcS8NYQC1DMIWdiU80xoPLWYPe0uxhYalvg2fp2ONunGWd0R3xq6Wn8
         a3VO2tNWmUFDSKavIJj+OVqv5KPPYcoKMfEJJvKpZhgtzMBuP4acdHXlLC8UVZkHDhmK
         sJXI+woG+7ssqM8aEdYN0pj4pMJtCCy659DIYRUCvLqZbYmKAPqQlObP1fh2NY2LFDYu
         9O+Eb1YMHab/yxmcOYlEOiD3hT1eQtHvJn69Rli8zSydNfA3yYdcA7IvIoHTaoTJlz5X
         UxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010261; x=1781615061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFSRA57sXKLlEMGOh13mH9O3WdT4M5EIVdDK4eMznIU=;
        b=bvGbRKAGSjIOHx046F4XOVXDKTyRHW0SS2gRHtHXE41DGTMTddhjjzEbbULyILid6H
         GpORV22dHGi8J7X5g1rRgrO7/zZpUb8EYEE0UPHxkMHGXPYY32vTdenIVR18C0m3bG/W
         fxGGy97isZf4KyTewySRnbEpmkFrK3V92IA7RRfqcmNCcIfWFoy4OYKecXwN63daeoV8
         ZNs9ffMoX25mnJ/BO7dMC7LCtU1ZEaxiQ13bsZ40eqY6H4nLOmVhhYDoFwiaecEIGCTS
         JF5jy7Ak+u0axNFCgl9EBg4p9m7yrUn9TovrHkUGEahRqpmCDo+L3gXP8ttRU+7W9oQH
         YuHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wusaHdeyMmxfysjt6Fs90KNGDBjQBEL67Bk4UZsf/ldLJQjZBBM9ViuQ/3WPIjBW9KLUQUIhDb93S+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWS5F0tFEG3zJLQZtQipYhYVnnOrePnxPv0H+cwOlSUJ2l4gtr
	tsEInZF0mHhiGRcUXZP9JeT9N3BCsAuegaWq5ZVN2QFP/eNem3KvfV5UB1zEnGjx
X-Gm-Gg: Acq92OEEnapbd3zL3183XnYSEHEF3zMkYfiSDQQFZTauOVNPvV2FcJysGZ7qyD50Jgd
	iUQzLh2Y635ankQc2srLrdQoYaaJ6c0eLHN6OuSkd6lYIwv8cZ9tbgsAFfNDjjXKTWjWFqGL5b3
	BytJ+1nR3p8T7U89XLUOSYrP8Z7PRz6y5ALkNtD7HY3U3P1+H3XczCmjAS/xAshXFHEl9daFZW0
	rzOudKAx7RU8mxD3vBlP8jm0AFQMvngAvUvMZhqyGTkhhOi5/Td6eNp/ZegHbbfmAnopNp9A9eZ
	VjZaN6ED5tK/3uQmRSsSOemgULfBSf59PiA+bUhRZIUYr5mmHQcHYPvdd1SbiljJ+Zt9N+/mLty
	yBGj5q75dyCXq7BUyMppb2tXvIUByq7WrazITVmuuKwTqrFS7928SuzuqqFSYFcPZnptjGyRHKj
	0BZFfDtpMyI+5skX4TpwkVEp7XTKIAmIo+DYXIFawNkLsIP2igd3KP1dPPWK8rC8ceO68yyzbVR
	GFjj+ub4UU=
X-Received: by 2002:a17:903:46c3:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c1e7f922a9mr214749825ad.20.1781010261352;
        Tue, 09 Jun 2026 06:04:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm212949015ad.75.2026.06.09.06.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:04:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e10eb414-082e-4747-8083-77b1a3b8c934@roeck-us.net>
Date: Tue, 9 Jun 2026 06:04:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] hwmon: (gpd-fan): drop global driver data and use
 per-device allocation
To: xiaopeitux@foxmail.com, cryolitia@uniontech.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
References: <cover.1780880972.git.xiaopei01@kylinos.cn>
 <tencent_E4CE09DC1CB1AB4C0411F71B9507E4A49706@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_E4CE09DC1CB1AB4C0411F71B9507E4A49706@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/26 18:40, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> replace the global state gpd_driver_priv with per-device private data
> (struct gpd_fan_data) allocated in probe. This allows the driver to
> support multiple instances in the future and aligns with kernel best
> practices.
> 
> No functional change intended.
> ---

I got:

Commit

   beb0e2d1add1e2 ("hwmon: (gpd-fan): drop global driver data and use per-device allocation")

is missing a Signed-off-by from its author

Since it is the first patch of the series I had to drop the entire series.
Please resend with proper tags.

Guenter

