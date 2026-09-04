Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124983F20FA
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534424; cv=none; b=HPsymchoH2gqzfu/knJClCDSYwFc/oscOoeqQ6WE/ur4pJRAzJ+O8aKTKbKPhbcBB/ThbnPuyoyQpaLEOBsCv6d4seW2lqoDatAiHCeFn8WHkw9NpgbwF4tzrMwdPQZ/wTlwVK4rlo/YZfQUV2Sh+R1zBm3u1P17zUVxU0cBqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534424; c=relaxed/simple;
	bh=Ott9U2hb4Hi4viuIaAguynnm0K0RD5lCpDpLZlXQGbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/vboaL+AedDc2Cb2lW3KZl3PxOQk4EpI+fy69VlAaC4pMclTuc09iowRr7b8KDEyFU1dV68ne27LZhHYKlyNMktM0+S/nGq7iJsF7Qjqn/FFez/4bCmyMRm3q9iC8E85yfg1Bf9HTBhq7tCUlzq/0sP8G2U/KYTlqxLrw9Jh6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrr6bu3m; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrr6bu3m"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1282454a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Sep 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788534418; x=1789139218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6GOw+scLq5i6j/FXIclHCa3fA7Hy3H193BHaaw+L/g=;
        b=nrr6bu3m6k0EL+ggctC6Exq+4woawHFrkJztB+9kcOpHnLNCAxw9ro2jXve7GqIk7M
         taWQLHbj3V6+c2ezVJcIjzZQgIfRHCojh5Ca+bvauGKb14gxAKx/LvLzAzER+OWStCUI
         ogjzhDHMzHcxTyzo0aa6c4ro5Wt+5OiJEwXmMM6L7LF+zlNVVlVFik2gxgm1X+UtSxaI
         v55XlsKmcVNsyN5im41+bYAEsHuwCgizbcHMIS36CN6oErEG0+fy1U1+0Og7WfZdI1ZN
         21nbNlxW+nv5h1+ULWh/9uPdX9jwhQJcgbeRda60ZvK5GJPWhOQZ6mIcwEHBbXkPUX/t
         lG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534418; x=1789139218;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D6GOw+scLq5i6j/FXIclHCa3fA7Hy3H193BHaaw+L/g=;
        b=GgnpbtpelA9DJObko+lfTFZCEBoK7drSggFfWRAdhgiWzIxxZMmX/ixuCXXIYSAc8I
         FaSWOXceecauGWwft4sfch4apMN7XKjdzxWjaWvnYXuZIif96nTh6V3mAzv6c3+Jl3ax
         PlbKuBKAOl4Oy+SS4zDGrLSuaEAmmF9X1+HeX5fGFUHyWfG0t6ew5QaAgTCarrWgbGjB
         pMIso1/EmIWRDh/8jPCn2uHFQf/SuVXAPxZElMCtlYzzdxMw822pH05qkS5riV9XQCP1
         K5hnYWIJeLhBQvEL2R4EjoM8wxJF2enu/f2g0Q5Elpk+7vtNSjsHUqaeTDrHdqcKH3SS
         iiKw==
X-Gm-Message-State: AFuF++l5fwDhEQQUoiDyVP8++ops9I3P0437EixyJlvx9DGLjda9MmuC
	mdWyoCbGVpSR9VPmsem6rucTEW8ucvpLlCMaWorK6pQwP4b2UtG6Mun232OTLw==
X-Gm-Gg: AYBFou1B5ewW3vPLXQ2e7g2EFq3zgkIi6Kwjo9z0CHnYVxkRHYNHJ1ptuKuNgHxBwjn
	uokrR1dbGwipt7Ix138hrckmYMNYcW4/mgHexUGvyQnMxKLA/hCzQQT4njKykRsfwDXlVe5zv3i
	qTevr0NrwCktLDCuD/JZUD5QcXYu0YLHeWK4rNZQV8Qf2IXvjSM6oaYzoEh7RfmG3Kc1C4LYgXZ
	8z6+Yjr0jLgwgTXYFwh/lwNKxVFfn3nxhFqEs7g+Xkvy2W7fuQFfctFEi/rTBkAepyTTUSE+YEi
	HISenO7KX0HesaKiDoVszpc2J/ffI0gCnZwmu26SRwzwOGax12IDpkIymMo56wMv3Xj5kMvnkB8
	w9KO3bHgQjieuN2+0Mw7l9XIOJr3gkK80mz+oWZRC6/Q13Mkk5T/hayW2lQovOOQCvGlvGlmdxI
	HCJcE/HfYyRsKAuKJ1vlPEzCP7VCVB2XpAX9eXMBowhNaGd9v0cW9RKf2/Y7XQ2+givMBCoD7OK
	mbE/txpTh5gRNGtUBBkwJ7NA5hD8g9qKLMQgg==
X-Received: by 2002:a17:90b:280a:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39b076add5fmr16354143a91.0.1788534418387;
        Fri, 04 Sep 2026 08:06:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm5423868eec.17.2026.09.04.08.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:06:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0d666fd1-e8be-40a6-8d1a-f550b3095e15@roeck-us.net>
Date: Fri, 4 Sep 2026 08:06:55 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 1/2] hwmon: pmbus: Fix vout_mode parsing
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
 <20260904005351.2136374-2-aryan.srivastava@alliedtelesis.co.nz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260904005351.2136374-2-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 17:53, Aryan Srivastava wrote:
> Currently this parsing assumes the top-most bit of the register is
> unset, allowing it to match against all 2bit numbers. In the case where
> the top bit is set, the parsing fails as the extracted value is always a
> 3 bit number.
> 
> AND the read value after the bit shift to ensure only 2 bits are being
> parsed out.
> 

Another note: Why "v0" ? What is this supposed to mean ?

Guenter

> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
> ---
>   drivers/hwmon/pmbus/pmbus.c      | 2 +-
>   drivers/hwmon/pmbus/pmbus_core.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 7a7eac90d62e..b629acbffbfb 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
>   
>   		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
>   		if (vout_mode >= 0 && vout_mode != 0xff) {
> -			switch (vout_mode >> 5) {
> +			switch ((vout_mode >> 5) & 0x3) {
>   			case 0:
>   				break;
>   			case 1:
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 5f69c1420b4e..55391db5b414 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2753,7 +2753,7 @@ static int pmbus_identify_common(struct i2c_client *client,
>   		 * Not all chips support the VOUT_MODE command,
>   		 * so a failure to read it is not an error.
>   		 */
> -		switch (vout_mode >> 5) {
> +		switch ((vout_mode >> 5) & 0x3) {
>   		case 0:	/* linear mode      */
>   			if (data->info->format[PSC_VOLTAGE_OUT] != linear)
>   				return -ENODEV;

