Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E6E2C0269
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400316; cv=none; b=tBEXzQ9Ev5ugZzCHihUv0b/ZCskCD05/Tf4hjuzUX5HZ1cvgebDz3thnP/pAdoHpN4qyMa0vS4cvjUWo6OUBLSg+s3+f6Uts6An0daOux7KtWoUmTQL9ixlhjCPwa7pafcst0hnqomkOlrttpY5rLrmgArncEDJOxAkromzg36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400316; c=relaxed/simple;
	bh=Rk3ORqleX+/gCWzoRYZJTVZf6UQz9i1Hepy9mCzpdW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fI/eVH2jza/60ukdsA6/I5nytuByO5kgHwaWVx8pDftMnjFI4CnSyTTDH0TT5/bDOPniWd0L12CYr6IhYn2nYTf0gEk0sbBdpGyvSkJNwi+09zHDLIxz8+7pTIRVjib0+L4B6ENzEWKg9B5bGqWpEi6RiUwt8WMgdwv63fEG1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr+EGgjE; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr+EGgjE"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233b172f02so366988c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400314; x=1769005114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hsGqDA8X39rB3JpxEKYPszdyriDFUtOIhybr03zNb7I=;
        b=Nr+EGgjE9tj+dx5z+FCKs+H0BAQGb4BWcifAs5gMEGCuc8BDtmu7t3Tl1d12CuR8+H
         qW50J9i/S6Dr8+TIAnAGbYmFUxZ+yIAOTsqrqZ7sLLY9IixpyYA9K4hO92l+z41Gdizj
         8Js5XbbY8KSHYF5xth4gnxvVg034oNfLDLmoUv83YjM3s8SUnbGSgoVqrwSCcwUhDXnu
         xDvzTIroeuLOb8hv54DRip+tYQxuG1sWetZoZGuHr4S1KJWOLwgPO1ouxpvYgaQDuf2E
         73hot5PYPxOhuhrfyC8r0ZQGfKm05Vgclk5e5MrsFQkduDkUW+s0UqAeWifCRfWdkvX8
         AmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400314; x=1769005114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsGqDA8X39rB3JpxEKYPszdyriDFUtOIhybr03zNb7I=;
        b=aaTfYPheJqD49nhrF/0Rc8KDl95esm22gZ7DckpOsv87xpclhnJPWLcaAnSND/ZoJY
         rTCTQHite8uEdCsZMq8zH0WV3RS6Jd0d7ohhpOSrTBQa/COCKphEtsP6plGExhT4P5PY
         BSafNh5sN+IJMX2R0g9gfmeqsD0yA/OUUThZcIiCevQKDrkeMrNCp0zvt5/8Aq2XlRNA
         eqQAEwqpUvpXnNwtp8ANbKbOzhsjN/t4zxxahN6eHuaDW/2bB2/GwskxxfQV962X7CEL
         Uk2SjJ/Rar/czyDhvWM+Z3uuhPV3+yNAEGkdykRXAHDYYfXTOnmndGHHdtIEUQlbheWr
         EGKw==
X-Gm-Message-State: AOJu0YxvJjJ67UhYanA+uDDvq/gvv6WIB6L3++Ad0DLYosOFDhYGiqbR
	ZX+QLFM3687qnvCeFyVLbgtZSjLixjDm2tX2E++zMt4+yh1lXakQsf8Hkpvejw==
X-Gm-Gg: AY/fxX4MVLNykAwGT3DIijnxsZP/DmzUupIkg5rB+Um147ovHwMAO5h0jCQZLmvG0RS
	82+4dIHpeBWGXDV/OSDc2p91FJ7o639Q9jWxHq0U9JdV4QLp/yvgdQVuc86qrAiMs5fJNn71Pug
	KvL5bWSwE4adV8PGRAYWvtgBQ9FUCVuovEdH862YHwS16IxHVd8Nkh4W5fecouvOlxgFla6TdHH
	Uhz463lGTvMu4QUlLJDv3tLRnT1tuhO7p78ffGDA/6kou7SlmbWzdO6tS2fKcMfqgJlNnl7kvuN
	gEI3CQURTC4ykpRDOLq8hkHRE4FEoHUwLiV3f76zUx+gRFqjCC0mQyKj2JwDaQxk3GSJtzlExdQ
	114IoFk2IIJ1ESh6RdpIFTqY5jK1ffBCyz5J+1zY0LmyhMR4HY9ETUdKR22lu1pDaE0g09PRghD
	LcWJJc9G4RcKNZO1pRdqkIikudvVAmn1yXTpJ00p6WChqdtYDvSNpjHqZaIYWJ
X-Received: by 2002:a05:7022:660a:b0:119:e56b:989b with SMTP id a92af1059eb24-12336a0a5a1mr3120144c88.2.1768400313312;
        Wed, 14 Jan 2026 06:18:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm31044146c88.4.2026.01.14.06.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 06:18:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ef59dcf1-5a53-426b-8c17-00ddc8fe5d11@roeck-us.net>
Date: Wed, 14 Jan 2026 06:18:30 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell G15 5510 to fan control
 whitelist
To: leobannocloutier@gmail.com, pali@kernel.org
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114020108.83288-1-leobannocloutier@gmail.com>
 <20260114020108.83288-2-leobannocloutier@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260114020108.83288-2-leobannocloutier@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/26 18:00, leobannocloutier@gmail.com wrote:
> From: Leo Banno-Cloutier <leobannocloutier@gmail.com>
> 

Please consult Documentation/process/submitting-patches.rst
and Documentation/hwmon/submitting-patches.rst before submitting patches.

Where does it say that the patch description and rationale shall be
provided in a separate e-mail ?

Guenter

> ---
>   drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 6040a8940..93143cfc1 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>   		},
>   		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>   	},
> +	{
> +		.ident = "Dell G15 5510",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>   	{
>   		.ident = "Dell G15 5511",
>   		.matches = {

