Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025138C2D0
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943727; cv=none; b=KyD3P8mhbBkkPv7pG7sgS+prMVSgkuBPAUBURg0ue1QXcAWlQqqe3lxOJ0TmQ8fbGQ4b2rOJGzUpfP1xwSIKgb3ZaYcYF+M1gOQ8c7q6TF8uinyxwGiTZeTN5Z0XtGnaSGOpDCarSHboX9RfDLEUT6Vim/VmR0YGqr3+SDjfDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943727; c=relaxed/simple;
	bh=oH2c8xWhA5Y/hqX4HJqULRl3t01Uj0jNPXPaDNXdyuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdZhE0Usqto2qPfy9HWl9oOqwM1UFyUCCMkObV3YoSC9zTfpKby0oIJXV6GqhUoVVEd8lqmIem2hDLxeJU4Xn+w7sDRyJcQNmDaDLYPTUD+/ozFd/GwnJFC8dXFKO+zTr/KXqSXzuIY8z0Vn5kZrc2iGN1fQOZnJi9NOOSSZVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZfdeFy6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZfdeFy6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1244098a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785943718; x=1786548518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euAjj5v9spvVbU87SbKkRLVKZRVH/7mzRMaCk1Nylks=;
        b=LZfdeFy6e9ND3qJKbIIkYw0YGvae7xSh4uVjpBGp0vFfxWV/KEXZ+iztIuEwbhBwf/
         4FFSnY3P8dj9fOyhMQV6NCHLX/dD6j+MZqpX5vt33cIkFYMVtBuckg3FJW8U268pzRnl
         JuymIi2QykgTao4hza5orlEu1GN09MdM4RAhSXdxVkxJQwqwPeAd9AO6T4SvfVHPYPFj
         jmEAnD5uAy0NDF2sd5Z1Aq9+LKSKMCXuNBH5PQfE3AZlbTaq58ar0W+hTfFNLOiSoMH0
         XvLUL3VJQXR+PQVFuSvCa3/aS/3t1uSzf+xz75a5nv3+Ze7VHWnmTlaSLGdWxjQUXG0+
         Wbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943718; x=1786548518;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=euAjj5v9spvVbU87SbKkRLVKZRVH/7mzRMaCk1Nylks=;
        b=fXOtaBipdUmFlRhSEuljObq79+/6jzdQPdBYr1VgmJbyB840WNJ9la0lFkYWPJPOfM
         rh9OBHEDClOsPcPspRQEgV9dWlXrXTSCPejjlTfkeeRpGe8PpoQrrelXxHvnWHxqBztE
         VtX06VBGtwC1N4arYYzSbNWGSNnMtGJ7ZQsG3vcSnecYHvYPyq1q/YZatzcCzVgYWsOk
         cfKRuGoCjmPuecK5XAZ4HzAsTXihvfZvfNaieVQ5xjPX3f/Feg91V4Ue6tKM2lvIQL4K
         Yf7XK9homfmnUSi0w4GPaBsATx+uazz9aPMynQmkGXcFgUEvUM+eMACkxA9zTcGKwIa5
         TKbQ==
X-Gm-Message-State: AOJu0YwxmrwonsQ0CdY/CQpOTp8//gwEnkXPhV5CAL1i+uX7f6HHJwUm
	60JsUi0xQqmFGeIYqsFxrqGMwHFUTbsVGhy/+6TIeCRuXStIiOcOUX2o
X-Gm-Gg: AR+sD13L/im6T0rcx3ppdLjLXxwbzAWSY95oWnMVFCWI9oUpglZzDAp3YO+rJd2T0R2
	Ng8Y8PJ6bOCV28u5MBz7YZ+P8ToFfqxNtivZ7RngriqVD+u5iBv/Ocs1+pgCSXwQC+LlrKZ63Wy
	fLqob+vQi+m/MDRir6nzSSPRrxnwMfLFoMIORC8qHS/xrCKlAcZ1E645Ld4NmUQVR2y6IyzKlb+
	ivh22mWPV0cNjtgWJ5/76+S71G+VENChn0Lczec9sKyGsma2jZ2YB7UTvTPdu5h7fvCeTCBv5+D
	LRxtVTrwn/OoWh90+Yie/ZwNqhnZwPATP8uvY+EpBrUnbM6aaSo1T33P3qHkj1h+oOqmltwhf0c
	Oh3dF5hSMUqBmT6JLFc1y2bWtIhxNq90acCv8buKJHUwqL0/YD/OM9dEt/XXnUKbf9U8et2kUlR
	2D5rBuoQ056aL8CJgWb4DGRLlK7ePTOouNCkaieJ1hMHfvA2HyTYqha8Ddwdjl+HRtvRsvA2V1v
	yB9qXFUj1+n7qNzeczR0NLAV9ZLAmZJG1Oq6Q==
X-Received: by 2002:a17:90b:274d:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3903c534d46mr9263643a91.4.1785943717871;
        Wed, 05 Aug 2026 08:28:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5ab7a4sm2000388a91.2.2026.08.05.08.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:28:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23453025-34e6-4e8e-804a-7e0a36a32abd@roeck-us.net>
Date: Wed, 5 Aug 2026 08:28:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
To: sashiko-reviews@lists.linux.dev, Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
 <20260805090400.2059006-4-sbogdanov@baylibre.com>
 <20260805092026.A43961F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260805092026.A43961F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/26 02:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Incorrect scaling, missing boundary clamping, and unsigned wrap-around for TPS1689 PMBUS_VIN_OV_FAULT_LIMIT cause severely corrupted limits and bitfield overflows.
> - [High] The shared 8-bit warning limit write paths treat PMBus direct values as unsigned, breaking all warning limits for TPS1689.
> - [Medium] Missing scale adaptation for PSC_CURRENT_OUT in tps25990_probe leads to output current readings being off by a factor of 1000.
> - [Low] The intermediate expression in the read path for PMBUS_VIN_OV_FAULT_LIMIT unconditionally underflows in unsigned arithmetic, violating subsystem guidelines.
> 

Please address these issues.

Thanks,
Guenter

