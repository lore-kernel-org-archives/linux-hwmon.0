Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEB36AB50
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865241; cv=none; b=NdKJcQ30cJs22jzD+OnCNXTPFUZpsYDkC0Xjyiew2Nb9Hb5HENYMXUqXs4DJq8qsb9p+/0k2Lqv2AZAcx3Sx/+1nFa7FHTEATl0aV3VLaW3DlR+ScAnEe0OFdoa5q8IT/s3UQxXGzul8uIoSPp5vXVY04plxEZFvGficDjO1+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865241; c=relaxed/simple;
	bh=p12yy0f4g8Mtf3zJ6FM5DG5zprWTPjAYHz209DX9/T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aw5CSph02qtyCeUPe/D9zibOEuVO3IsXVXBIExaxzIdBnN4KuA+bfaBXNZe2ZOZTlHWo3vZRHcFxgzOu7IJ8uwww2qjAJ5k+L5EMjNqBFf/gCf2J08b+2IhDT2bY58uf1y8hbAbCzmUJjJs867nXf5CQ1yHDf05xLpHQajVBswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaWt2gnC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaWt2gnC"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so350934a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773865239; x=1774470039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CW70/xxfLi68rSnAskwg4XChX2bmrTWuZZHh8hh8PjU=;
        b=UaWt2gnC7TPLYUl0FW1H5OJEG7i8VlGyA1/5F6rBF5sGANNRNOxyDJYaUEIIkuwtor
         g1ku27h8zdkiDQyzOXUyQWie+e2faBJQkP5cAk9qFDOqM7W22srxGt6egGiGy7h2aSkc
         urSArp/3fxK+jfcvyyq9P2/R2TUkodiW0IhfaTEhASNnnlRsEZvibkkwr/kBJZs88SVF
         mGco/wlY07V/uV7kDtqIBwt10Vf6mOc5yMjTF2GsYN7VRc0sfeJ+C3jgPr8Nink7VVQ4
         uHPC7YPDzmNMB99OnObhhdu5WPFv9iEuf9NZ9Se7AIpn9qsZieU1GM5Pf853e/uoU9Wt
         mpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865239; x=1774470039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CW70/xxfLi68rSnAskwg4XChX2bmrTWuZZHh8hh8PjU=;
        b=aJ2ZUBndS16CakuqayPEDAfStrf86HvPLSEThLqCijtcFXVHcE6ryQ8cB76C/U9Epa
         O0LHhV77Fq25TH+l/lMXxK5pxRcRspXRDr37G2tRHwBS+gyDgiPUbLeziXJclljRJ+VJ
         Gb8/49CNvcOvSAy0M6P61TarNb8QNEvHeAD6Bu9OStXO2mfk7TXPibPhka86grUefmGZ
         dDJ1NumG/hP07n6s9QG+87LJQEbDXrO0TohL4WhnD3rzUXxWRoAYdl4nQ+t+RnscJHY9
         feG0t2lChZVR99cfw3VjXY118eIDjujRq8vjJPAo3JZqX0qNRl53qDQnZAC+F+HKHZp2
         6Orw==
X-Forwarded-Encrypted: i=1; AJvYcCVIA4vI9oNVE6uh+BKbqa5z0YWZ0q9Us5w1GJTrm96A1iEVsmOwjfMpDqctQnSM8XL90RER6Wb0bSdKFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylM9eWENLNM/Yx6X4XgbveveEAdOl7eeAR+UDwnbNgu7J99xMK
	luajJp0Eb1EERlsj0bkbLb4Vve1e+4zTeG/nEbntABfGAHmvVAGSyIiV
X-Gm-Gg: ATEYQzz6zWnlQQCXOb6hzZ+cPHOHRAKmCsu1OYRSPmwF9ri5vXlp8kfC9AdcoM/ukyN
	m/EOW6mTRJ0Mbip8rY7cPiebizJwHxLg955+g0E5AIBAtv1k1Uofny7//372tB5oOmM/hCq21YO
	nstND5mxGQEco/jf4QPHlrzT0nYplE7UKwtjWMVQbWbX2StGXOnz1Uwv1Zi2xxgCtZmuTz+0DMY
	hXFm7mSDh+CwpZMAmF8sPqAFmfdX8EGNxZ1Utqs7f435NNHhFZVGOWx3dcEk3Fm9zrMndWzuJvc
	C93NUIWRHzurnqJvKbJ5FcGqnQ6zkvD8ygsWZQM1rrHWLKU2cptPtq1v82MmquAUS6U1Ce44VxS
	HwrxgOv2jA8THviV9LS6myVfVDZGC1diI7+0DpECHX5z2Bnain0heg/cEbaKl/G4kqKujVeZAOg
	NltCLhBTV++5ZhP/UWY332wfBZvL52EPfGQc4m6arHJ5E7hwF1KA2nCc5m11dcugm6uaj3wA5e
X-Received: by 2002:a17:90b:35cb:b0:35b:a44f:b82 with SMTP id 98e67ed59e1d1-35bb9e51084mr4491544a91.11.1773865239052;
        Wed, 18 Mar 2026 13:20:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bbae5e139sm1127992a91.8.2026.03.18.13.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 13:20:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a3f02648-9e6c-4a14-922f-13fb27f87354@roeck-us.net>
Date: Wed, 18 Mar 2026 13:20:37 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/ina233) Handle sign extension for
 negative shunt voltage
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260318193952.47908-1-sanman.pradhan@hpe.com>
 <20260318193952.47908-3-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318193952.47908-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 12:40, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> ina233_read_word_data() reads MFR_READ_VSHUNT, which is a 16-bit
> two's complement value. Because pmbus_read_word_data() returns an
> integer, negative voltages (values > 32767) are currently treated as
> large positive values, leading to incorrect scaling in DIV_ROUND_CLOSEST().
> 
> Add a cast to (s16) to ensure negative shunt voltages are correctly
> sign-extended before the scaling calculation is performed.
> 
> Fixes: b64b6cb163f16 ("hwmon: Add driver for TI INA233 Current and Power Monitor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v2:
>    - Added (s16) cast to fix sign-extension for negative shunt voltages,
>      complementing the error check fix applied in v1
> ---
>   drivers/hwmon/pmbus/ina233.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
> index dde1e16783943..819f4e8aeab61 100644
> --- a/drivers/hwmon/pmbus/ina233.c
> +++ b/drivers/hwmon/pmbus/ina233.c
> @@ -70,7 +70,7 @@ static int ina233_read_word_data(struct i2c_client *client, int page,
>   
>   		/* Adjust returned value to match VIN coefficients */
>   		/* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
> -		ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
> +		ret = DIV_ROUND_CLOSEST((s16)ret * 25, 12500);

This may end up reporting a negative error value to the caller.
Should the result be masked against 0xffff ?

Thanks,
Guenter

