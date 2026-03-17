Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E146BF
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 00:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773708905; cv=none; b=quiKoRobTi6iqXtYd3WvmY4TMudW2RGNQVXJw9kd68oc2zOodbubdN8dIazsYI3mv1yjpwM2qZ02vBZljEGBqc8HB39Q9vOLFBeusaFUiPPyVyf8HF3Nj5/lwOHNJFd3jlyvMfQTZw2Mp95NlIrPwznckph/5c32ug+Z6d/UUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773708905; c=relaxed/simple;
	bh=L0pLxMX/1baWao0B0BsyLSnNTGdGTyT3YqqY6ZFj8y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFDhGb/rN+CPibBYmKF1yodTI6xAQS7vzlVjAwmHVTYyUC2ZbnzzNXPuXr0Az9YuW7onJ/tZUXglFptZbd4tbNptzOkbsIWz/qtLoHRnWfZpaUgL5+1pE3L7s3whLGfPR2JLxUaLtNpu5G6Ar99yeVN+84HDBmiqkboVrF6+utE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCMhIEuL; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCMhIEuL"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c73a5473bbdso1991736a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773708903; x=1774313703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L0pLxMX/1baWao0B0BsyLSnNTGdGTyT3YqqY6ZFj8y8=;
        b=SCMhIEuLYwIPkZbQn50TdkSw+9DMQFqmls39LUDa50iOhrc/hPhGgiPfstXY/9Er6k
         32ViXeIo0FxrYCxrpwd+U0/16WHUxFz58x0POvw/RL/OhagtOanUFXVLoUdI68Mb5xyr
         LPAZZU4NpuKymTnyTUwhrIeVsgy8De/bfHtHj7t46dgzRQp/ZF9NSFyjcKjF0AVveLEl
         F1oZrg8u2jszs8JqpVTMkUkpH5jNr6uKXHEpXJwehp3Sg999ULNn9wdXeUNzD1bUaYs3
         5khDhjHehj54RHKcy1BfT7ytYWg3vKEk09UiixFzyTH5vTDjmcJVqCfGvr3j+jxY4vmQ
         Qprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773708903; x=1774313703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0pLxMX/1baWao0B0BsyLSnNTGdGTyT3YqqY6ZFj8y8=;
        b=c8CoxlyH+F5yL+J1+ETqxN/ulbiYpkkjiMJD7u8E1FSTlcSgeGuBsJVXTlYr3xk0vc
         uMqTCYq5PPOK7KXGXwjrQ/fIOpqU4g3rKcX3k1ELj6x6GnLwSlOwkdlZuFacexcae6Cv
         cPe6DVK6c9dgCPaRNYQm29qsHguZDhhgN288ynHzBEJ9GdpGUSzd+UNEvXnfHh928LZX
         vYKScDiRaYfxNScKjc5TfonbxktIgvlWbRBN8Uv/9pOtLkGpq2hl0JqrzwTy65gdjVO6
         4GnVT4M+/dxFSdSup96fLx+B5wXev6fdB7NtnUsS793m1fKK1LxKJNeoDraKJLacoQhg
         FiEw==
X-Gm-Message-State: AOJu0Yxad40VeeWhIrQNURrfmwozWFeSydb09ddc55hxU+A2a3iPEpMA
	md8FxZQhFRWRq8HF6iWsMEHZfJH0ja9jkNfH1cCgnDapFrk1mElNV/4S
X-Gm-Gg: ATEYQzxXNV/d5yObkS1UdloHSUqZGL5cSwVpE1t+8ED4uTueEA1kcV9BHfemICXAsJa
	x3fYDLyDInITRLOn+3erjg9rPbKLd2b00FqRmTZm2P9xh/HukIWM8PiAxJchX2UxwUgYiJP/5JU
	cCRGwo2XAO9oUUhsGP8Q/oALGbN4nGcJDscze7CyPo99w/It7IJwRXDLShf/Y9I3RIdepitx/B1
	qndEFw12NiK2yHn/WrFbwyePCDAWQmD0stIRLFvpDkaALKYKcs6CkJdou6JNlB0SGcZZQ0B54KC
	/MuCiEjuawftjPuwF2fworhBYCm+korWweJC9+Yb5z3ELQkKHRhqcZvb6jBVy00V1lRY6fHUxKe
	r6Vtw3Hky57+a7W8dkffXoN7sO8yGW7mOeJ/WArKOiHOKLgrdjvIfHdW/ch0ZaSIsV0Wpqdlajy
	GcCdtztaHlY/wCI2+rb5YUDeVhIQ1HT/Fo/Tv+GCttM9zLqaw+8ZznSHG+CrX0his5klNrBWCu5
	VAd95U+Mw0=
X-Received: by 2002:a05:6a21:1f81:b0:398:9c2b:c93c with SMTP id adf61e73a8af0-398ecb28d26mr14823816637.28.1773708902940;
        Mon, 16 Mar 2026 17:55:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb6800fsm8909017a12.16.2026.03.16.17.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 17:55:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net>
Date: Mon, 16 Mar 2026 17:55:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird Dell SMM bug since 6.18
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
 <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
 <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/16/26 13:10, Jan Claußen wrote:
> I notified the coolercontrol developers about this thread. Maybe he can
> find a solution from userspace, but a solution in kernelspace is always
> preferred of course.

The information on https://gitlab.com/coolercontrol/coolercontrol/-/work_items/557
seems to suggest that reading pwmX sometimes works and sometimes doesn't, which
is a bit suspicious.

I would suggest to add some debugging code into the kernel to determine return
values from i8k_get_fan_status() and the actual value of data->i8k_fan_max.
It might be useful to add some dev_dbg() into dell_smm_read() so we can do this
in the future without having to hack the kernel.

The described condition sounds like the returned value is >= 3 and
data->i8k_fan_max == 2. I'd suggest to monitor the returned value over time
and under varying load conditions to see if/how it changes on its own.
Then set pwmX_enable to "1" and try again.

Based on that we might be able to determine if i8k_get_fan_status()==3
means "turbo" fan speed or if it means "automatic fan control".

Either case, overloading I8K_FAN_TURBO and I8K_FAN_AUTO _is_ quite fragile.
I strongly suspect that Dell Latitude D520 (and any other system where
I8K_FAN_TURBO means a fan speed and not automatic fan control) has a problem
with the current code.

Thanks,
Guenter

