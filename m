Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64B2423EB4
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169301; cv=none; b=QsC0oss/NC2lcK6EgbXvmAE/ejbssUJKtjniDetbQHO01ZWJZF0qBDEbq2kb7kzj2D1IMWVRonm2pI55+1p316AWh8IUIIeT5umGCElKDt99jz0x7+cxYC3NnxBdcGaUr5vg5PE1lDnON7dtkKE1fA5wj677F4fy7rWqPQZ3p8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169301; c=relaxed/simple;
	bh=9m8xXJO8c9lyuGAU8MN4aVzhhq7E5Quy+h3Sqf/Jxvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hQ6SLshHWvBPY98Je5n7Q9RkiCfI1zmivluDlV0jctW3d6xKrShPOuxYPhR3tdmYv1/SSYkbBqszNzjCYbSf758h90x7iQBXrePxrv6zzdo5vokq1qJ6VVcoywfFqXazQK4zQdd+t1ii+wJ5tF3X/4E+UUiOiScXzXn/bYakPrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2vgtNcD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2vgtNcD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf50c6f235so35094765ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169299; x=1785774099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2VHX9L0sTzVvO3MJg20Nh0+sy0DEaF3M1cbrGrcCUo=;
        b=p2vgtNcDFYhLwkYrPmn6eoIpCFzeXw/4eZCcK2XkFQZmURik75FB0G263YVnhlgdwR
         c73roEzUGlOq0XWjoJhyZhsjVhTk+2xiPrC7SjPx2cElx/DR0sp5PWZYMsTQEgiIkiVu
         LvyxRaianWSMQLpRhNeAcTafgP3Xnycgnx2b03ehnWwgsxCCPB3XsBWcBNb/e4qWeyWO
         sJn9Thx6mFLICw5rR//OaCTc0Cv0iNf8otdtRv11Znl0ZQbIh+Fg5o4jCfAhmvzphOh6
         lMPUlV2Fp4XPqtp1J/8mBB8Kzrd9PaR/x77/AWnjeX2mEZnUMaafYIjCmiI4DzSNzdrX
         zPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169299; x=1785774099;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a2VHX9L0sTzVvO3MJg20Nh0+sy0DEaF3M1cbrGrcCUo=;
        b=PHjVLXBv0WKjeo/HMWXWbsF1wh/lzv5LvGI//9YErJRSs69VQ9fr/aE0ECiGsXO+x7
         ssIWW3qkDQq8Gn8OQvlt5yl5y6z8HtPe9n2SfjO/hGwgSFcviT4HvQQn13E8aFZn/R5F
         PcM3qvx0ISxGqyNbLlgjlqW/GWTGYKCq+MIOoGslLPUDTp+cKDmnO4+M9GqtpSFiG842
         +IQHuwt6sk6fvFD6kiNMcvBphBJJBLup1RpaHNU37n0pKq/BUH0ojMjZqIQUBzF6gdIq
         nMFrtRYGRLNxGQwsTIRVDY5Y44oE0wRtV6i2cpmENTPhk+IK+ozmCaH7grXaSlF4tnQP
         nAbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rom6VvWhhrW6FmD7PTlJRWYsxAkyOMCW7wvgx4Y5rkHja43EoFbfm68F8lY7ol5rCbub+dNSbtW4fPs5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEB+CVUmkjhluVHB5rbjgjL/tyC3UN9uA+DQSizBq6kPzzfgF
	/FEnP4VogHtlcjTRvljFfFy1atzhWsdX8xvzZnHiYHFcsIT0kGWprEIe
X-Gm-Gg: AR+sD1354EsczMoM2LDwtVauvi8AhEeFckGmzj9nOfOikko9dvV7inyyvyGCJyv7qLh
	yn2UIWWlRAIgrVKZx625B+u1R9D+n/ukn9yBoMqsnvywdCPH6aFGLeyaeSEhU9rrRgqTfKrDIiU
	gyGNMEvvuvlA7kHKosdd1R3OR4tQWRul1PytELKyu/wqEDOqMLwu4Bn6UviZiaj6/djB6fQWF74
	RpWgSl2F+mkwU47swLaktXgpxUy+8zrwEbiu8b5ZDuKPi/dgLQHCMuVHQEzjKYm88rBQxD9z7BY
	XTBPKv58XTCRKnNtIuJkydWle3m8ciCJFVhX6va9Sk1DrOJo0E/bMCOpiyVDKm5dQkcliBkveFg
	TKTQdhkfp+qCB8LJUKPuj5ReYSZb2bWb9VZrMZ2Qw3Mc6erSwExTojOguWIAMIqnwJSOJ8//gS4
	HPGjx04UH4cEh/heeM2Gik30bkl/o7HZQutlsc36bk/HQrP/jZ5DxHVpanBrcwZQ==
X-Received: by 2002:a17:903:2b0f:b0:2cc:5fae:cc56 with SMTP id d9443c01a7336-2d008b20c1dmr13621465ad.27.1785169299011;
        Mon, 27 Jul 2026 09:21:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d7b87sm38486295ad.57.2026.07.27.09.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:21:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2540913f-9849-4ac8-ad08-b19c24e8ed41@roeck-us.net>
Date: Mon, 27 Jul 2026 09:21:37 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
To: "NG, TZE YEE" <tze.yee.ng@altera.com>, Dinh Nguyen <dinguyen@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
 <20260723061418.423A81F000E9@smtp.kernel.org>
 <3350cd23-6a0c-4f8e-8de8-d6e26aa82d7d@altera.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <3350cd23-6a0c-4f8e-8de8-d6e26aa82d7d@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/26/26 23:42, NG, TZE YEE wrote:
> On 23/7/2026 2:14 pm, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> New issues:
>> - [Medium] Hardware monitoring functionality is improperly registered as a platform device instead of an auxiliary device.
>>
> 
> I'll keep the platform device registration for this series. I’m
> happy to look at converting socfpga-hwmon to an auxiliary device in a
> follow-up if preferred.
> 

Agreed. Just ignore this report for this series.

Thanks,
Guenter

