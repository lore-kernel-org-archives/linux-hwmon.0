Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CA737C922
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123136; cv=none; b=tXYrXAMI9NDuXh2GDrr51sZOfbbmUShWpsiVJetF5kkaUw5iXac3IvljwuofOn/3/UixLZW213t0lVU4/TZ9Ps86PmnNhhjAmcfaPsmZgxI0vtgt81G25jvbHCaB/4BPg4jyR5Bsq1SNGPHWFazl0ERJ8OLwMCMp2qDWdhgrz8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123136; c=relaxed/simple;
	bh=judn3Cd+rz3kGlRNt5SjZc2dLBHJpEoLTp2lR/BSOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgemOst8fZKY/AkVQ7c8sxAQ7bZrJt2w/DRAniR0X75ndnrdZODJzJqIrdR9otw3bN/6XqhzJxT70Iz33NuvKHZVj5e51yeqzqtiI/4XvT4QnkIuFSXI0l9fwM5kTrDYlmDIBtU5Fetly3ajzxl+90O/hlUZxGQw1ejVUqbKXHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKOj8JB9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKOj8JB9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so48118655ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781123134; x=1781727934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=c4JNV+3X7+J6HStf66DvHAY47fJPwawr2RdjKYOe7aY=;
        b=hKOj8JB9xIoeR23hxjnIbvG+v/15tS/C06Fht0rfQyMicsU3QZiaFxvhjHADQDqeBV
         FvOQb9C8Ti10uZneCpzYU+D3yUjSv+8Aa5Fxgn92JYfA6Fvdm3J39dASxJWDqYHb+pFP
         g3k3XSuSvQfEWjCJYY6SfZxNxcb4OLniYiReS9smiWMGX6NiVWyNnmFiMTDj3Wce64kp
         GYDk4H7L07WT0D5XrEOtIquPs15lOxf759AgpoSXZYtCdwFWMwFYhJ8q4d04n+l9ybp+
         Ts4xYL60nenlu1/UL5NkiAX0fZrESP0miUpNOFg2//jqqCJXV0x4sL2+3cFJRnSTeu2k
         GpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123134; x=1781727934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4JNV+3X7+J6HStf66DvHAY47fJPwawr2RdjKYOe7aY=;
        b=YY33vabc06/DA48LVEVBXO3ZNe8g+8RLbSItEIDcZgzE8doZ5Pxa8Qn93PBUXUBMu6
         CnT2wPHgzh36+buSff0mn8sotOEKtnRfvTMJvOehwEfofZDQ2YaDQCIiusvD+btWLj77
         8XUcB1OIJPL7qqHZYtNY/2rcwMS1SsksVrNv7H71kTUBMi8/x7oILp22UtuB2uW9OSPf
         XmWL/uHXwAb2twYMzpqOVdbMZ5dJrmQqLZGgjKQ9Eio5EN0e4QRrCRO3LFdAVDmmzuBq
         eOr1cY+FsSO38M2Gz8OJppZNZbSwB7N/6dic5LK55JU51ydIjbFHtQ3cDmDye+ZQ8wkI
         xDvA==
X-Gm-Message-State: AOJu0Yx4QWhP57M8wq+V6WFX10XxBk7h+wciVi37VprQw1L82tWGzppc
	fWwizvMtd39WyMXOdxj0xg+fvNGiQRvOB3Zrmjv6hjc9lHJWPesizMTt
X-Gm-Gg: Acq92OE/vxSxD/8coaSaXG8ATnprN1YfdXtJmeb9Y2pbe3G/lv+22P4UAoV5wQWtzaC
	1o+w1MoUHQou6lw9Em/3S383JrbyfB+Yyr7zwqID9u5vrYT6Zt06Xmg4RGsMdiwl2cGQ3TNQeaA
	lmS26CBr7Gw5EoefmTSCNQ10HarTU/KX0lZcF+AFRpXYSWONY2RC4pyBNJyTlDzUb4tpXAtN2L1
	T/MYL3ZnkfvzwFzpeZZ1+k7VptkJGmOZFX7AppiFdQsvoK6QhNbWpI5LeKh1Z1r4TATNaKp9jkv
	kxSTdN0ah6WJcqsJZpdzITgE2UEuBc12cMODzTdAzlM4ghqOUwElyWRRF+FtrQxEYe7WNC83R8B
	H974VdQadnj0hxXgqXupjO8u5Z+pxtd0UfGj6p+a3qTbbBGeXb5Ywfd8lrV3Y5HNwZ12AjxPWzb
	7aC86//u4JJZOkOHqoWYdKkOw7Ac+amXoi/RbsrjuOg2G52m6rCM/LqgtrxxOB3Xi5+0K48Sjek
	7rD6BXBeOE=
X-Received: by 2002:a17:902:c40e:b0:2c1:e9f8:758d with SMTP id d9443c01a7336-2c2a1c65e95mr111057625ad.22.1781123134362;
        Wed, 10 Jun 2026 13:25:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm343816865ad.17.2026.06.10.13.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 13:25:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b03de072-aa84-4e65-80cf-c8ccea0a398c@roeck-us.net>
Date: Wed, 10 Jun 2026 13:25:32 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Fix coefficients and overcurrent
 limit selection
To: Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>,
 Potin Lai <potin.lai@quantatw.com>
References: <20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260610-lm25066-driver-fix-v1-1-ff9b39961a2a@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 06:31, Potin Lai wrote:
> Swap high setting and low setting coefficients in the lm25066_coeff
> table for LM25056, LM25066, LM5064, LM5066, and LM5066i. The
> coefficients were previously mapped incorrectly, resulting in inverted
> current and power scaling.
> 
> Also, correct the overcurrent limit selection logic in probe.
> Bit 4 of the DEVICE_SETUP register (LM25066_DEV_SETUP_CL) selects the
> current limit range, but its active state differs depending on the
> chip family:
> - For lm5064, lm5066, and lm5066i, a set bit selects the low setting.
> - For lm25056 and lm25066, a cleared bit selects the low setting.
> The logic previously treated all chips the same, inverting the flag
> status for lm25056 and lm25066.
> 
> Finally, dynamically assign the exponent (R) registers inside the
> probe's low setting branches. This ensures that the proper exponent is
> applied (e.g., for lm25056, high setting power exponent is -3, but
> low setting power exponent is -4).
> 

"_L" was meant to indicate "LM25066_DEV_SETUP_CL is set", not
"The low limit is active". That means only some of the coefficients
are wrong, and introducing "low_limit" in the probe function is not
necessary. Swapping the ranges for LM5064, LM5066, and LM5066i should
do the trick without the need to introduce a secondary indirection.

Thanks,
Guenter

> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>   drivers/hwmon/pmbus/lm25066.c | 96 +++++++++++++++++++++++--------------------
>   1 file changed, 52 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index dd7275a67a0a..6b08f93801b9 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -60,25 +60,25 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN] = {
> -			.m = 13797,
> -			.b = -1833,
> +			.m = 6726,
> +			.b = -537,
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN_L] = {
> -			.m = 6726,
> -			.b = -537,
> +			.m = 13797,
> +			.b = -1833,
>   			.R = -2,
>   		},
>   		[PSC_POWER] = {
> -			.m = 5501,
> -			.b = -2908,
> -			.R = -3,
> -		},
> -		[PSC_POWER_L] = {
>   			.m = 26882,
>   			.b = -5646,
>   			.R = -4,
>   		},
> +		[PSC_POWER_L] = {
> +			.m = 5501,
> +			.b = -2908,
> +			.R = -3,
> +		},
>   		[PSC_TEMPERATURE] = {
>   			.m = 1580,
>   			.b = -14500,
> @@ -97,23 +97,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN] = {
> -			.m = 13661,
> -			.b = -5200,
> +			.m = 6854,
> +			.b = -3100,
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN_L] = {
> -			.m = 6854,
> -			.b = -3100,
> +			.m = 13661,
> +			.b = -5200,
>   			.R = -2,
>   		},
>   		[PSC_POWER] = {
> -			.m = 736,
> -			.b = -3300,
> +			.m = 369,
> +			.b = -1900,
>   			.R = -2,
>   		},
>   		[PSC_POWER_L] = {
> -			.m = 369,
> -			.b = -1900,
> +			.m = 736,
> +			.b = -3300,
>   			.R = -2,
>   		},
>   		[PSC_TEMPERATURE] = {
> @@ -132,23 +132,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN] = {
> -			.m = 10742,
> -			.b = 1552,
> +			.m = 5456,
> +			.b = 2118,
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN_L] = {
> -			.m = 5456,
> -			.b = 2118,
> +			.m = 10742,
> +			.b = 1552,
>   			.R = -2,
>   		},
>   		[PSC_POWER] = {
> -			.m = 1204,
> -			.b = 8524,
> +			.m = 612,
> +			.b = 11202,
>   			.R = -3,
>   		},
>   		[PSC_POWER_L] = {
> -			.m = 612,
> -			.b = 11202,
> +			.m = 1204,
> +			.b = 8524,
>   			.R = -3,
>   		},
>   		[PSC_TEMPERATURE] = {
> @@ -167,23 +167,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN] = {
> -			.m = 10753,
> -			.b = -1200,
> +			.m = 5405,
> +			.b = -600,
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN_L] = {
> -			.m = 5405,
> -			.b = -600,
> +			.m = 10753,
> +			.b = -1200,
>   			.R = -2,
>   		},
>   		[PSC_POWER] = {
> -			.m = 1204,
> -			.b = -6000,
> +			.m = 605,
> +			.b = -8000,
>   			.R = -3,
>   		},
>   		[PSC_POWER_L] = {
> -			.m = 605,
> -			.b = -8000,
> +			.m = 1204,
> +			.b = -6000,
>   			.R = -3,
>   		},
>   		[PSC_TEMPERATURE] = {
> @@ -202,23 +202,23 @@ static const struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN] = {
> -			.m = 15076,
> -			.b = -504,
> +			.m = 7645,
> +			.b = 100,
>   			.R = -2,
>   		},
>   		[PSC_CURRENT_IN_L] = {
> -			.m = 7645,
> -			.b = 100,
> +			.m = 15076,
> +			.b = -504,
>   			.R = -2,
>   		},
>   		[PSC_POWER] = {
> -			.m = 1701,
> -			.b = -4000,
> +			.m = 861,
> +			.b = -965,
>   			.R = -3,
>   		},
>   		[PSC_POWER_L] = {
> -			.m = 861,
> -			.b = -965,
> +			.m = 1701,
> +			.b = -4000,
>   			.R = -3,
>   		},
>   		[PSC_TEMPERATURE] = {
> @@ -468,6 +468,7 @@ static int lm25066_probe(struct i2c_client *client)
>   	struct lm25066_data *data;
>   	struct pmbus_driver_info *info;
>   	const struct __coeff *coeff;
> +	bool low_limit;
>   
>   	if (!i2c_check_functionality(client->adapter,
>   				     I2C_FUNC_SMBUS_READ_BYTE_DATA))
> @@ -519,18 +520,25 @@ static int lm25066_probe(struct i2c_client *client)
>   	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
>   	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
>   	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
> -	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
> -	info->R[PSC_POWER] = coeff[PSC_POWER].R;
> -	if (config & LM25066_DEV_SETUP_CL) {
> +	if (data->id == lm5064 || data->id == lm5066 || data->id == lm5066i)
> +		low_limit = config & LM25066_DEV_SETUP_CL;
> +	else
> +		low_limit = !(config & LM25066_DEV_SETUP_CL);
> +
> +	if (low_limit) {
>   		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
>   		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
> +		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].R;
>   		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
>   		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
> +		info->R[PSC_POWER] = coeff[PSC_POWER_L].R;
>   	} else {
>   		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
>   		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
> +		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
>   		info->m[PSC_POWER] = coeff[PSC_POWER].m;
>   		info->b[PSC_POWER] = coeff[PSC_POWER].b;
> +		info->R[PSC_POWER] = coeff[PSC_POWER].R;
>   	}
>   
>   	/*
> 
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260610-lm25066-driver-fix-ae435577fce1
> 
> Best regards,
> --
> Potin Lai <potin.lai@quantatw.com>
> 
> 

