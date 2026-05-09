Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD533624B8
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778335768; cv=none; b=NKjATnEMtGpcKDhr1FdNPgAR1rZDaxai+P71oDgAJ0VoJG6p7LrWx++snQa8Wspk3e2pkW4UEHnPg/ghR2LZRjBz6Blr1R+Whwe+osHrOKI6jkROujGzGZleZlVpJ/6hYmfqni/QH95hgUAeKcNNrLjgDCGFgGtai0hXLnjIrdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778335768; c=relaxed/simple;
	bh=oYAxhIvZeCn40YN8KpNAi05K6/LRmfEEo+SxmVkk/S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnZxJ0A+Z2T1JEmYI6BADiTJic+CMa5dFVgVXQsoYCq4JH4631XkrQyM8B8/pu3g+MkXzwYXhNOvrjJWd7a88Ujf6dvNz4nE4+2gGDngqtSmWpSv1ksc1qHFO2YYhlC3im48yR9B/Kon0zrUJW9CHcu6SmXh9xa0A79moSQKW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCU0B+uj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCU0B+uj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so1557670b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778335766; x=1778940566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AlxQP7KD0OIWwE/rLNzbrt4glxGsF3le5hqNR/dWpjA=;
        b=HCU0B+ujUtS0kmOtV4fgiM41hY9na/2nKvLBZs5ciMdlfLCP85eL9bLpBqLFve2DGi
         bbdhrKOLB74fdeo39anKA759nrE3NG+CvOI+oQtQLL8hS/2G2X9IeX/IRKHtLegPMbRP
         ed8gXIe/VNlHa1YgpywB/QEvgh5+FFIEfWBCS/wezMX0x5zO9Z/txCYdRQYMRqyFpuYs
         k7Sob3Rgil5FGYgeAOqosydlz08AHiLCk7hWWlnBfSKlvoEHtC1nxa80TsFnoeNUEHww
         eyeD5OEb/IrSkh9WSsscttNzfD2d9hULhZXl+zXNdbiRj/96HIedn9LgP1tIDHns7xxE
         nRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778335766; x=1778940566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlxQP7KD0OIWwE/rLNzbrt4glxGsF3le5hqNR/dWpjA=;
        b=AvISXe1mYHQiLd4du5KcdGRvOqsCcfepXn5NCECs83nVw3BpK8Aip0Wuc7OvTjBoSE
         v1UiZxn+Pp/7Jioa/svjWuCNR3Q3u1Eo0iul8fGWgaTp6oTz+K+a1gN35DrdL+caUdmT
         ea7eGIjdKtH1RWP2gPLoVFTRfH4rLMUIneuWDxsLny0xVRTB0Os6IfEDF062T+9p2oRP
         bgi/4GsRlVS/0+SMgxnJMPqsuIgEUQK90I0TFfcPcniQcpPiy3uJy6nUEY+tr90NUmG0
         zJB+J3KK4T5gfm30qAo+5ttPPv1hch+g92ZHA/9LXLUZv69Ppr8eMvS/ZBVKXvMPZgKf
         /2CQ==
X-Gm-Message-State: AOJu0Yyha2e9RIqgu68cS6q+/RRovayPi2WP/FBuyqN+ZfSebh8/YdYu
	qZGP0gzqzZuXJTZmwjrmwhyTbnaQaJzY1udnAE/xBQZMCdhcYd7y8q5O
X-Gm-Gg: Acq92OF1hSANkkOmpNGTZYjK/OX34/3R967MLD9pZV5Di7CTwV6vI3tH4dqGx9MLRpk
	y12Ossekd0/1cU/KNVyq2vC6QCyKx7TIwMZ5I/GA+0CIp5280bfMjZxDgsmsi3Y804/iigeR847
	H93mo/PTRXAusE/s8qfei/wYCLbX3NHgcZdVQVBiGuu3lzdBdcWiLysqD15eXufnXBr5OkFVaaY
	4DPnGWW4ZZkKWtRya3L0FJFEozbR2+y4HFBIp5daLgEcqP1B1+eR7WbhpzdINjyeutLcUUCwmWz
	q4W7GPw+MjplEsnLynvORLzkWqcBBCsNxW8AcgivBh2/EGV0ll5S85nqpuLwTsM/iumMREjD2rU
	FeuE0T2kNVHtwmJJZCU6AchRxgYqo5uLurw5uxfhYRqewyYPkR5jVtmn5jhtHxqSEKBbVdxZIZR
	/eZ38PzPmEAx0ggwyEVe3B0YCQn2RYG9xzg+3nNTjLwr5ZVWT7lguOdibz4rLyfx90rZ99oyXW
X-Received: by 2002:a05:6a00:1ace:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-83a5e35b57fmr16736492b3a.47.1778335765975;
        Sat, 09 May 2026 07:09:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659487afsm14500715b3a.18.2026.05.09.07.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 07:09:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <91b3bd35-2988-42eb-ab71-18e936c4e8f0@roeck-us.net>
Date: Sat, 9 May 2026 07:09:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (tmp102) Use device_property_read_string API
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260509121511.60601-1-flaviu.nistor@gmail.com>
 <20260509122803.1FDD0C2BCB2@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260509122803.1FDD0C2BCB2@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/26 05:28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch introduces an implicit header dependency and leaves cross-firmware compatibility incomplete by retaining the `of_match_ptr()` macro.
> --
> 
> commit 8699d5dea7c2614372ba1cab8f6b99f73ebebe1e
> Author: Flaviu Nistor <flaviu.nistor@gmail.com>
> Subject: hwmon: (tmp102) Use device_property_read_string API
> 
> This patch replaces of_property_read_string() with
> device_property_read_string() for reading the device label. It aims to
> improve compatibility since the new method is not limited to Device Tree.
> 
>> improving the driver
>> compatibility since this method is not limited to
>> Device Tree only.
> 
> If the goal is to improve non-Device Tree compatibility, shouldn't
> of_match_ptr() also be removed from the i2c_driver struct?
> 
> When CONFIG_OF is disabled on ACPI-only platforms, of_match_ptr()
> evaluates to NULL. This prevents the standard PRP0001 mechanism from
> matching the driver via compatible strings.
> 
>> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
>> index 3aa1a3fbeaa92..79578b28a91d3 100644
>> --- a/drivers/hwmon/tmp102.c
>> +++ b/drivers/hwmon/tmp102.c
>> @@ -15,7 +15,8 @@
>>   #include <linux/jiffies.h>
>>   #include <linux/regmap.h>
>>   #include <linux/regulator/consumer.h>
>> -#include <linux/of.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/property.h>
> 
> Does removing this include create an implicit header dependency?
> 
> The code still uses of_match_ptr() further down in the file:
> 
> drivers/hwmon/tmp102.c:
> static struct i2c_driver tmp102_driver = {
> 	.driver.name	= DRIVER_NAME,
> 	.driver.of_match_table = of_match_ptr(tmp102_of_match),
> 	...
> };
> 
> Since of_match_ptr() is defined in linux/of.h, the file now relies on
> another header to implicitly include it. Dropping the of_match_ptr()
> macro entirely would safely resolve this implicit dependency and fully
> support the cross-firmware compatibility goal.
> 

Please listen. Sashiko told you that you should drop of_match_ptr() already
in its feedback to v1.

Guenter

