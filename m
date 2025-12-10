Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4A3265632
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Dec 2025 03:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336200; cv=none; b=s7358YstRH+xMNk3U72/rSaKnqlCbyJ/iMIQWDP/DXf3fAkRmfC1inlUE+3TNUd32TTs6xic4FMMHrT2uFYW4h+FpqM4P5+NpmQvyvtLuWAkLhhaCeD+dAL+c8ifOXhgU8QZ9hZS6sQKCFx3FFObU451fr+UqYl69hI3S0Gr0E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336200; c=relaxed/simple;
	bh=B7aH2XS4PZlfh5XVPoWygQZkq+3MH42NPTAX5DhxH0E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oV5mnHfoLCINHF1I9mSGsZHho0nzN4lX1IAl0viJy4jReKddEEKJhBJipNjuQ1whQyD0/gQuQ2ThwkzuYUQEdKdvlA7f+ShejKyom27QLpnwQKjWKX2jaO8+866s42rS44bwNObVdin7tK2bPFcHy2zXjY0y9nqB7tTS+Qc+cGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNqXwdfA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNqXwdfA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso5638366b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Dec 2025 19:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765336198; x=1765940998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ianbKooz34rImOXdwQjx9kgMyehj7gRaIoesBFCgQaQ=;
        b=kNqXwdfAO4qG/hA6UwlV6JErRlgUO3FDSWTWQRjroYeTvd9LOZNxkKHpmitTSUkgt2
         3qT9K4WEkJvnmCq+Y9vg9Eujho4x3z4NIUgwacZlhiIQ/qQQ+M4XE9iF+xfrTCCBYttA
         CA+lI1RFL5xpr2JcUyHVN5TPcg5ZtWYPSynooVhZWMU41Nl/2wPSPEI3FaqKt3bwxyCY
         DivDLmJYTKuczhOMDxKkAn/7UvzQHm4NPPJg5cBYPUxS56glhVKWhc6HgmFB3RqlI40X
         bVJjUQrbJc9GoFZia28LnQ3wnxa5UuAjd4vWc6PrI6SZPjkHcLVVwty5vSy5wmkocJ+A
         Vw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765336198; x=1765940998;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ianbKooz34rImOXdwQjx9kgMyehj7gRaIoesBFCgQaQ=;
        b=T0ujK5u3eGlni621YjYldEXI1SQS6AQoualQFpflSP7dJkFuZBPkDsqYJ3Elm6raAb
         ynUS7Kjg377wjEsOqEFpoKFjCMOf5mgRbZTTEu7XAcS8STy2Grr33Fmr/j0wiZURHnef
         q7k9gTAZF1b7P/m5N6ovzhCuzRq9ibAcaubWHsGIFjJWzgJl/+WkWFmnwX79vqig2U23
         lIPc+nw0pbpiRIn4uux9gkN+uH3RDMDyGKXfK9oPscD/tOO1aV11Q+jeUDZk9bIvE4U1
         /bPV4LSzdiihf2TG8nXuqfMZI5LfwB3lkk7dObqZTS62A5VgEp7cLqO4PxENkPuuYh00
         hl2Q==
X-Gm-Message-State: AOJu0Yyl3fqXnXbIf4VLk3/ZcB5npVO9aC/4MM2uZKzrtowWs1Uq92fo
	IgAP+ViyAkJ9/lFuZXQ9rkYJ+/fAF021Pl2OgTrYKMvDHlDaYC5FAZ6U
X-Gm-Gg: ASbGncsjyCoXiKYXdJf+Zm3fOQNvvnog3lsOoWZ3d3UkIXCNBySCkUei3p+zdMp4DdA
	BqeXqcByxPScDz/K3yEEvK95K5ggdLJgxnV4uwhNSpP046j+100LZpiy30bo72WaJITr+ZLnpNM
	gMk/3Jq12n4cOFh2JSRRRzf4ZRmBtE2UjQbtSbtXK7n+64NzJcz1Az9vCe5Xqn4RGgo9BSrW4mB
	M+O753oVqLcS4aULahN2kTSyqSs3buLxHbBK5O98QCPTAwra6ETJyidk567VdxElz2DIQ4laq0z
	L/roZDrHYnn2/o/Xf4OET3J2VijvdUqAGcOZ2EhUYXe4N12jyTis3Wa1giQNKNn3bxS50G3sbBC
	NZ13QRicLxSv8wjWLnOSzn9mjtyuf+BXUt63a00iAzrVqCa1bwlxWRAJlkVmzOLSz93wHSdKKjV
	t2xzDOnoQleLJusyvyETAejg7hdJ5CrRJHBzi5Jdn/nurQZq4OaXCWLX/uA24=
X-Google-Smtp-Source: AGHT+IHykLpwfP6+3LLZJ3743iE3q+tLbmWerWQYn3jraVb76jVa2FrQgMksBu+LhfQZgrjTiE0yAg==
X-Received: by 2002:a05:7022:69a1:b0:11b:923d:773f with SMTP id a92af1059eb24-11f296467femr842042c88.5.1765336197669;
        Tue, 09 Dec 2025 19:09:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d46f1sm5144308c88.16.2025.12.09.19.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 19:09:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d11e3cf6-3095-46df-a4f2-442d209675b1@roeck-us.net>
Date: Tue, 9 Dec 2025 19:09:55 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (sht3x) add support for SHT85
From: Guenter Roeck <linux@roeck-us.net>
To: Antoni Pokusinski <apokusinski01@gmail.com>, jdelvare@suse.com,
 corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251209175848.5739-1-apokusinski01@gmail.com>
 <2683b84f-d7d1-4445-b5d3-bed393de34a0@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2683b84f-d7d1-4445-b5d3-bed393de34a0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/25 13:19, Guenter Roeck wrote:
> On 12/9/25 09:58, Antoni Pokusinski wrote:
>> SHT85 is a temperature and humidity sensor with an interface very
>> similar to SHT3x. However, it does not feature alerts (and therefore
>> limits).
>>
> 
> The datasheet does suggest that the chip supports both temperature and
> humidity tracking alert status, which only makes sense if the chip
> supports alert limits. It does not support an alert _pin_, but that
> doesn't mean that it does not support limits. I'll want to see definite
> confirmation that the chip does not support the limit commands.
> 

Looking closer into the SHT85 datasheet, the sensor chip is actually a SHT35.
Given that, disabling limit attributes and alarms is neither necessary
nor acceptable. It isn't even necessary to add "sht85" to the device ID
table; sht3x works just fine. I don't mind if it is added, but it does
not need a new chip ID (at least until/unless interrupt support is added
to the driver).

Thanks,
Guenter

