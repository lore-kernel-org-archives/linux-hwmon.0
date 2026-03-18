Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691137107C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867554; cv=none; b=filh7MEGzJzK56XXbsG6l7O9P8hYSt/DDIyPV3WiD2axU58TaQ6xEpsjx0j7iH2vq17VQ0VjEyS1Hq+cAWo/Qf8rmuKkDNxMv2BxalnOXPNtFow0Axl1jCs8CVPe7dELQ6k1+0drar1n3d3ZOTBo5TGfqQN5iBTGAjMUDNx1P+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867554; c=relaxed/simple;
	bh=cJWzYAjyoBL4GOzfvAlz65oUZNwjJAArmwntnjEoNH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7RINRY1Jaax/PcvyFsSHuIzFuKh8OWBOj4zgRDmUukG6WdOaxWpboUlExZPREfNpYiUkuLgH2EgqkrZRuTis0XpFmxpblghpFB1JEWrYVK2+kVLjn7CiM69/rOI/TtUyUc0wXNzn5BHqlEVGSPR95bul15Oy4/eH87AJeURQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbopzgM2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbopzgM2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82a15b44c3cso221012b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773867552; x=1774472352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mqu4xVf1YdbA8AJaMa0q/oDWwwC3EBtlmRCnbS4Hd+I=;
        b=TbopzgM2yKcw8JwX3nkgE0o1kiT85aVAG/WS5+jTl3Rh9eMp/on07KMtNxtRXEQpJL
         U7DBcsbTEIlaY/5HpVZgi7M2w5VwcOFhVgu0g6VXx3/tmPiyvR1J5bEJSZDk26c0e8d8
         /zq1fATjGNho4vI965HtYEZ1BLEUbsJxKB5pfj1ZjlMhgMbc07mN/tZl1rc1rBondKDa
         DPwaKtDNLFkTMv+cuI52KuEE6L2yOC9Hv3kjeMn4w58arjysszuP5sdq34BSqbQ8XGv8
         tvuzAVCMPg0jLpiZkweFiOfIpYH50Yhv3cXEw+WdqtbswlBMbinnEKFp+qDbZYAA4Oht
         ePNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773867552; x=1774472352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqu4xVf1YdbA8AJaMa0q/oDWwwC3EBtlmRCnbS4Hd+I=;
        b=ijqdviCbhYDtvUPilpoAK1rulQ07sbUuL/hugePeWFRM6St7/uy+o3SfPp9b+9hHdt
         DAnf8gv0K0hH9lgsLHwtBe+XNJpi8kw3YF7/4NHatXIs/pTW3TLlDvXcP1AlmX+NcKQa
         TAwdPshJBhjuuBTioZZbBw8x2QLfNqVy61lF6XtGl6fOJgCX8Y05k0pjEJefX4Go/eU7
         56C0HSHXAUC7wp9cYoV4GPHV75tmgrnj1TME0cTYU4n4EGOiB42R/w+lx6arhLGRtB3F
         5rV8J75EkArneS7FJNC8oa74Lm7vrggsDd7QEXIHF9jZ8i+USm2Rs/4vOEzcYMJQlulH
         R6Og==
X-Forwarded-Encrypted: i=1; AJvYcCUtARMwf0A+ppBjVSdk4ZJm8xRPzTERKaQdH9Ic867GbIksQCUhBSjaXNxjVsyy5OwktwrcGoBOdFpFqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RkOEk34pcCLdvszKPTAbm7UdQL3CVMT5qRqUh2h1BiAZeXA9
	SqHutluJ7paMs+DIhIxalayxtaiWuPLBnVQnREY0b03/Mcj54SLfjuz9
X-Gm-Gg: ATEYQzy5GZUX/o9k+SVHf4yXYVeEFZvQoJte/PBW73jySw/w4XkOodGpbck+74oyyAa
	CvUekwk4XBgI/2lVN5PICfX1QNoEQF589qyqcgsvtpvdEi8qmBon4rgZXo4y/XuViE+HUEaKfzG
	Kr2LM/qAL+Zpk/+cBqIzIbRKHYvHsWTbWDFZzG2CAKCoyJc0XNa4HUhRHnCPuo+2VRlaJ9GsJUd
	v3pUi86cStsiAaJkkjAQVqFIU+glxkOp2aZ/5t8lN8e8rV16bUyIILTUMKY7EFxAnUlKqQY1WZO
	Suy/6863FI3YZGLDTYaC6kPB9UOBhG9EBV5kDWIJqDML4ouMyTpXwCpTLPUrru42UzbiEHSxRzs
	7w5+2MluT7+mYZauNpK59th8wcbH5asjc67JZsvIeBS2WZxkFQnMbzZzmPjAs+DWfBroeHzygA6
	Xovw5un6FipDlbyhXqniwC6qv+o2SgYja3cACjptWNWvTThqtGGifX4F1ddLVKyioKouer+u8j
X-Received: by 2002:aa7:8896:0:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-82a6aed7753mr4734501b3a.38.1773867552348;
        Wed, 18 Mar 2026 13:59:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b541cafsm3803925b3a.12.2026.03.18.13.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 13:59:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f8fb6c22-1841-432c-bc57-f1f9f7d5b8b6@roeck-us.net>
Date: Wed, 18 Mar 2026 13:59:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] hwmon: (pmbus) Follow-up fixes for isl68137 and
 ina233
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260318193952.47908-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318193952.47908-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 12:40, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> This series provides follow-up fixes for the PMBus error handling series.
> 
> Patch 1 is a revised version of the previous isl68137 patch. It restores
> the original bitmask logic for AVS enable reporting while retaining the
> modernization to sysfs_emit() and the new error check.
> 
> Patch 2 is an incremental fix for the ina233 driver. It ensures that
> negative shunt voltages read from MFR_READ_VSHUNT are correctly
> sign-extended before being scaled, addressing a data integrity issue
> identified during the previous review.
> 

I applied the first patch of the series, but Sashiko found more problems.
Please have a look at
https://sashiko.dev/#/patchset/20260318193952.47908-1-sanman.pradhan%40hpe.com

It looks like we'll need to add locking for the non-standard attributes
in the driver.

Thanks,
Guenter

> v2:
> - isl68137: Reverted Boolean logic to (val & MASK) == MASK
> - ina233: Added (s16) cast for proper two's complement handling
> 
> Sanman Pradhan (2):
>    hwmon: (pmbus/isl68137) Fix unchecked return value and use
>      sysfs_emit()
>    hwmon: (pmbus/ina233) Handle sign extension for negative shunt voltage
> 
>   drivers/hwmon/pmbus/ina233.c   | 2 +-
>   drivers/hwmon/pmbus/isl68137.c | 7 +++++--
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 

