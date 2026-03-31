Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D83D7D70
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991463; cv=none; b=O70jQ6N/M8cDMHTDfuI0dA9ARZ96ek5/WQhYLhqKc7SkDNfp9MagkRF1KiCiONn+MNFGNT69QFhzoF5jPcvMmbKILZD+aTIMJIyny1r3mNE9dqL0XQ4MEoE/slEwQ330yWxteq7iNIZRgqHS1oXBT6QeOCpoHyWoiUvRtIEdatc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991463; c=relaxed/simple;
	bh=Bl6sR5XGs0FaXCQ3DtjWV6I3c7K6Mc9g2segTADwbKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qH91ke81M2I4bKNIRifWVFJYtw2u/QUDxY/Lt1DA5J9BTYtcxkYn5o6ksFZcLrqfAi8fGb/aqeT41O15ovmRg03X3pfYX1ES5B9k8t57uAdRXrntOZXWB7WEB8LmWMAjGEWrhVXCDw4dSKEUKF3M4/re7W9VrpxDL38GvuB8zdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe0BZHH9; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe0BZHH9"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a74039dc6so4998929c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991460; x=1775596260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7iguHOdxDk9w7ZD5hN/a0xi3GQ1KsOxVHLh6zpk0sTA=;
        b=Oe0BZHH9ti37L6ysqQ+ay9TnwDyZJ4c1q+AvaxKGrq/ALL+irviNEhu0vwSh0k+k8i
         ZrRrIfee1gbt+mgu1iSzKzjdqPzYnsOWZIEBj3VorMm//4mq7Tx1ga+Ze3K1mXy0l08M
         n9iYr4dQF69cIgc3vsdzxRcYY//TUPClR42aaf8fbLb1WtaA6TkG+Ce35qHxHzcWDWTe
         JzG8YPo39EN/L3eLCdeDgT7CFdoYun5xajPo621GA5OXweJ+104s2fWCCasjPiM8Pf/b
         CIpTCjXiXLYmOYW9AItdyKdMdi4KePGf8BfTV12o9rRqe5rXgFflDVMv1EsJQSeoCYqC
         QrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991460; x=1775596260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7iguHOdxDk9w7ZD5hN/a0xi3GQ1KsOxVHLh6zpk0sTA=;
        b=pbRcrnDx26QBrCpa2Ef/Con2dkwVqH667GWPu65/p4Jaif+Qrysj0m/vReZERNw7cz
         jO2s48gntgBfnzJS3how+yJFmwXbGD0WTQ9AwIYGuFFl9ZtFh59YFmElnBoNgqxP3fhk
         gZRTW9Vr/SYOlGuYGmjRncK9BBkSt4RM2ne5SSrTdnjCHFLoId9ZKDP5l5uQ/knLvg43
         ySIAF0+p8MvnBW7GS/hPcRkhR65Ipb8c5y/Uw1qn3l04nLF5/QtmPUfOvCqA6JOu3Gjt
         1IBzAqk7X8wXuvywOGjVxtRuRLUdE+PgpNDquOdKsi+icTJAD20JSyLvav1XCoE6dDds
         NJhw==
X-Forwarded-Encrypted: i=1; AJvYcCX01/MzLfAg256Hcr5cadDogHZj1oYuKiTc3LkLilRTf8DgvasWm7cC+hMdpUG3uAwNXHCfjNrDhucV4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUC3ABGpy/Rk/gqvrmUKKWgMZbJqCHsdyPxUBK/yH3LC7otMlT
	eIPm4S3vrxd9NQ86SlCE88zi0oY/TfoIj0AwF4mqhTYR6pEARd1rbwSw31YOlA==
X-Gm-Gg: ATEYQzxNF2/Kdtp+C72eG6tN+3soVFhMOHpSPr2cIppDIqHcNju3d+Ln74F1MaAF18X
	fYrN8HW3+rngeJeaCfZV0wn6cb4BBJjP6g5MTSXAxD7tq0zMVk/ozedRz5Pj3pwItW1bkRVqZIc
	xLY5AtiyOxcBLsh3JtJY2HngykCUxZSECKwC0PSQfVsn83kWdA3xCkW8NscPYsOXUJmGT3PHcHb
	hX+w6fUTf2Ehbsmx+XwAzJPfAC6vYAggG2Rw8RFCjpixYQbTBZ7B2IPL6DiGpuSimPn5WyEOASW
	PScse9efWVX5Eod0POi5I+fNrInL1rkEySJkoTF19xXaNfaLRZMBQDhgWBFkVBcJ4RODLXEn5os
	0QY0bEE85GB//KZ0CaBNeC5W5zbscwtepAldm5GdJsCSiIAFCAyWOaZXhS5zAS9csn0SaVP0D0/
	XzwUVBFBrqCRGAEIg2AxTXM2bpufTaDR3CTSAIlN0mVfDSrVgse4P/5VS64Az4wGV35mkPpbzq
X-Received: by 2002:a05:7022:4398:b0:128:cf75:42a3 with SMTP id a92af1059eb24-12be655d406mr550981c88.21.1774991460244;
        Tue, 31 Mar 2026 14:11:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac09e3872sm14258021c88.13.2026.03.31.14.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:10:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a8d30122-1d3e-43b1-9453-322d87db920e@roeck-us.net>
Date: Tue, 31 Mar 2026 14:10:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Corey Hickey <bugfood-ml@fatooh.org>,
 Eugene Shalygin <eugene.shalygin@gmail.com>, linux-hwmon@vger.kernel.org
References: <20260331175245.354188-1-bugfood-ml@fatooh.org>
 <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
 <5c69b240-a96a-4e13-8a38-6e7738f6993b@fatooh.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5c69b240-a96a-4e13-8a38-6e7738f6993b@fatooh.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/31/26 11:50, Corey Hickey wrote:
> On 2026-03-31 11:08, Guenter Roeck wrote:
>> Guess I don't pay close enough attention. Sorry for that.
>>
>> The above text is appropriate for comments after "---", but it is not
>> appropriate for a patch description. Please see "The canonical patch format"
>> in Documentation/process/submitting-patches.rst for information
>> on how to write a patch description.
> 
> No worries, I don't mind iterating. I'm a bit unclear about what you need me to change, though.
> 

Asking Google AI: "Convert the following Linux kernel patch description into one that matches the expected format of a patch description."

and passing in your description yields the following:

hwmon: (asus-ec-sensors) Fix T_Sensor address for PRIME X670E-PRO WIFI

The PRIME X670E-PRO WIFI reports a constant zero value for the T_Sensor
because the defined register address is off by one. Experimentation
confirms that the correct address for this board is 0x37:

Sensor disconnected: -62.0°C
Ambient temperature: +22.0°C
Finger touch test: +30.0°C

These values match independent measurements from a digital multimeter.
The current address (0x36) was introduced in commit f7ac3020036b
("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene."). To avoid a
regression on the Crosshair Gene while fixing the PRIME X670E-PRO,
introduce SENSOR_TEMP_T_SENSOR_ALT1 at address 0x37.

Update the board definition for the PRIME X670E-PRO WIFI to use the
alternate address.

Fixes: f7ac3020036b ("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.")
Signed-off-by: Your Name your.email@example.com

This would be perfectly acceptable.

Thanks,
Guenter

