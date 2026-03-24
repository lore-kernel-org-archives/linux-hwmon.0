Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BA21D3F3
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383969; cv=none; b=aXl765sdFm4egLGglJtcl4F2vcchLg19bx1pSv9GjJkQrMEg9g7JcUFcES9BnC2uD1IsReTQICIz7W07dDvCMPGB26nxaBYeKO8KpYLETSVYjzw+JziQ547jyFQdtClXhWJfXhGd+sLfhABcWGsO6wfezBgNDFX6ZjlZblKk9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383969; c=relaxed/simple;
	bh=QJx02e1esUy9gJW1YQNb77kDlTkRfUM83i4CUvzs190=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ+vGBW7W3IQYj05uNzTzltlagqLnFwysJ00y7cOVxMMg6Sottxvw6WyU4aSv8rSk+RsYxlsn6F/TW05fs9vVvDBSZVm+uk5XZxsWMvKoAR4pX/fGvvjFD3g9rYE7tMEb54/58mswWwjVlh7Csmh38iWkSTXok1eDP98sEECGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTPbyy3h; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTPbyy3h"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bb213b16so10288095eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 13:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774383966; x=1774988766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ1Wxr3sJYREjr6ST7LnsI75t/e9jYqLAQDnIMgncm0=;
        b=KTPbyy3hI/GzMj7DZFx9uw2uvWs5Fm2EaKnmN8dKuvMIUDjgc6Cx84ivU7gxC0FEyD
         dLyvKf9nHp7ot0arRfxm3lUNrnUtJRks42TGhV75HjMETORdAbfEV4CUeZxvMpS38ZVF
         E7ruskakYLyuW2se7lWHDDaIw+npsuzRla2JslyFKBrNfr9lck4dV83WmS72utjCevVb
         MnlDtASQKWNzYD4B9jvWwjoJyt6Y88A9wVlmCwDig1ZlxECSPCpTZsBxKJ5XzFDGEVa/
         +NR/j62z363ydQ5Eoy6IU3q0bhqf+zvLNsQlpTab5FbykiP58eGrqSVGy3JXuO2jAgWM
         0QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774383966; x=1774988766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZ1Wxr3sJYREjr6ST7LnsI75t/e9jYqLAQDnIMgncm0=;
        b=MWpr9VhYoRqngiI1llukSqN3QzXJwYpTcZ/k15/fw4+LF2wMA580/s0854XF12tHRi
         euZ/PYuJkPpxOj/ZJ0Ai41+UEmmK2aFh1QBACY56B+4lgn8RUo2rSRSp8kzGrwGXf8sE
         WiI/P7sZlsjJPWSBqN7MIr20vzSHg1VkJQREf7h/H6kLQyFSIhQq4wvXD/Xqqwh4+RZV
         cORKEflBVfUEikHO0S0UKL5gntk0Wsl/e07hY42D1C1NDVb+QaaW4ZktSH9IpiV3oyQ3
         0U6ztDy4j0mYIAwFraDgEiWsl+fWJtYZSqOpyHcXwRfTddzsSphxo9nbA7yaOd/5PyJe
         MOEg==
X-Forwarded-Encrypted: i=1; AJvYcCXuFZ8DZllG2vcDq+qgHfpe+iXuWza/ibYDzXNfKX4RSA44llz2zdOAtVTG7B4o1fRZxakUBdtTxDN9hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwxQo9jIVaiLEo4kMrIrS4MTjV/O95kY3FIrZa7kAI7OlyacOa
	L0dKF63jb9xAD7TTjGGbXLzvOiCguTyy49TcoU9U0eSv2ujR6ijCaby6
X-Gm-Gg: ATEYQzzhwkfoYs9I9fmlJ5OVIB6P2WkNPOwbQf7BX0Ydvn+lM9KCoHnjhY5X4uvYq0J
	hTX/BqGw4CyU+J3DGr6loDx3pw/bWoPMj2g3eCXj+dbGfNYeUL23iAshwVidmj6pjJd2sTEvxae
	i3rmrrffyH/U39oQ1F0SalHpayPFXcANcpnw6N/ciCf2z3wwto8zg84cvOO7/3n0GkPMEh20UU0
	PmC5TjYSq1ILoRN148eupS4pEFZuyhXha35PJx9D16bCO5WZLvt0aNVJeV18CE1DEulvTAfPMqx
	u6SN7EfKV5e9bkJm8wYo5ZqCd2th2aBHmHi034kBIoSaVDFdCP4mc53Fwd8lFUySZpJJmkGqBBl
	e7V1FMOcR15NVmKlgRPx7v2GSQZGw0vZ87iw/kJE7iby4d68OaT68PxdGSWyVNwozIYklafRzxt
	c16apRAq67bU9TdKQ3s6KiBpKM2QOBK4nMgUoOkYyIT8WJH9IfTOnWKoklIKrwglRwPbhjEML/2
	6hopTzKOTI=
X-Received: by 2002:a05:7300:cd46:b0:2c1:4a7b:9aea with SMTP id 5a478bee46e88-2c15d3c9644mr417269eec.25.1774383965975;
        Tue, 24 Mar 2026 13:26:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm19451142eec.3.2026.03.24.13.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 13:26:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <78c0defa-a600-45ef-ba8c-741c1e1dbebe@roeck-us.net>
Date: Tue, 24 Mar 2026 13:26:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: adm1177: fix sysfs ABI violation and current unit
 conversion
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "beniamin.bia@analog.com" <beniamin.bia@analog.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260324182231.228195-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260324182231.228195-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 11:22, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The adm1177 driver exposes the current alert threshold using
> hwmon_curr_max_alarm. Per the hwmon sysfs ABI, *_alarm attributes
> are read-only status flags; the writable threshold should use
> hwmon_curr_max instead.
> 
> Additionally, the threshold is stored internally in microamps
> (alert_threshold_ua) but the ABI requires milliamps for currN_max.
> Convert appropriately on both the read and write paths, and
> propagate the return value of adm1177_write_alert_thr() which was
> previously discarded.
> 
> Clamp write values to the range the hardware can represent rather
> than rejecting out-of-range input, and use DIV_ROUND_CLOSEST on the
> read path to minimise rounding error during the uA-to-mA conversion.
> 
> Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor driver")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

AI: https://sashiko.dev/#/patchset/20260324182231.228195-1-sanman.pradhan%40hpe.com

Various possible under/overflows.

Thanks,
Guenter

> ---
>   drivers/hwmon/adm1177.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
> index 8b2c965480e3f..8742b8b5314b6 100644
> --- a/drivers/hwmon/adm1177.c
> +++ b/drivers/hwmon/adm1177.c
> @@ -10,6 +10,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/i2c.h>
>   #include <linux/init.h>
> +#include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/regulator/consumer.h>
>   
> @@ -91,8 +92,8 @@ static int adm1177_read(struct device *dev, enum hwmon_sensor_types type,
>   			*val = div_u64((105840000ull * dummy),
>   				       4096 * st->r_sense_uohm);
>   			return 0;
> -		case hwmon_curr_max_alarm:
> -			*val = st->alert_threshold_ua;
> +		case hwmon_curr_max:
> +			*val = DIV_ROUND_CLOSEST(st->alert_threshold_ua, 1000);
>   			return 0;
>   		default:
>   			return -EOPNOTSUPP;
> @@ -126,9 +127,10 @@ static int adm1177_write(struct device *dev, enum hwmon_sensor_types type,
>   	switch (type) {
>   	case hwmon_curr:
>   		switch (attr) {
> -		case hwmon_curr_max_alarm:
> -			adm1177_write_alert_thr(st, val);
> -			return 0;
> +		case hwmon_curr_max:
> +			val = clamp_val(val, 0,
> +					div_u64(105840000ULL, st->r_sense_uohm));
> +			return adm1177_write_alert_thr(st, val * 1000);
>   		default:
>   			return -EOPNOTSUPP;
>   		}
> @@ -156,7 +158,7 @@ static umode_t adm1177_is_visible(const void *data,
>   			if (st->r_sense_uohm)
>   				return 0444;
>   			return 0;
> -		case hwmon_curr_max_alarm:
> +		case hwmon_curr_max:
>   			if (st->r_sense_uohm)
>   				return 0644;
>   			return 0;
> @@ -170,7 +172,7 @@ static umode_t adm1177_is_visible(const void *data,
>   
>   static const struct hwmon_channel_info * const adm1177_info[] = {
>   	HWMON_CHANNEL_INFO(curr,
> -			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),
> +			   HWMON_C_INPUT | HWMON_C_MAX),
>   	HWMON_CHANNEL_INFO(in,
>   			   HWMON_I_INPUT),
>   	NULL

