Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8213B388E
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980501; cv=none; b=Roz1rXLXvS/Gfj2HibC4TDeqe4md/A4OFp/BzJR51qzPZUFAtrp/jAcvm2Q3L4Q1xPXX9j4V17G4OMZNqGc0I0FmmnsAs7LVp37uw6FWgIyun6dyNeMqnGwWtFNbI5f5Ii/isHEye0iUj1sbilTS570k1hVtGRuQOtOpeWeWQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980501; c=relaxed/simple;
	bh=3NueaIkd4GFrv5Iv7cGpb6nB5/jWD+x+7EOUIShQv6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AZN8KErCUWApKOkDLdNTWfWazHpknFMg+DFPI62TndHgOXc2cqwQPibnEIkAoJOLzaY/ovAp/+bR8s1hcTxSvx4ZK7rK5ZvE6AAm2XYmIWmAwrNyFJTuuZ4/r6z9QLtBMOqM4PwG9z6HWgyPj6JzJ09muha4qyngcqEE0CtCbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsBUDVQm; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsBUDVQm"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso6466654eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980498; x=1775585298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jTPp+MRxCbsO5aSD++R4F7zTNxdQRKzYw9JSDMUqktw=;
        b=gsBUDVQmQ3m5/nJPUY/O7L1qCusJMwO5/LpByE1cXNYrUR4BAGvj7LbzIxpl/h2Qje
         VjSkpwBsVq7Oq39436fjI3J3Dz3SXuM3klzqNNrXfEttMorfkPVIAdZzKR2MBVeA7PC3
         FsWO8ncVIQtzi7endrzcNOG46MIGA1sC1BcjdiD1z9mtHUtuA/vGvQPncwah6kp0kGRG
         0Lr9zmBWkRjiD0zthKBBLcmyP9M7pAL80ji0EhjP0ztdOEx1BE++KmQE+Nq0bHFuvxDP
         6Ek6pc1CSCe5XIa9d8jSqcWj491jpO/l0fU22SGtKwo3Nnub9RmVwWzPn7b25XskQwEr
         vnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980498; x=1775585298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jTPp+MRxCbsO5aSD++R4F7zTNxdQRKzYw9JSDMUqktw=;
        b=Rvj3miCBjmJZOG8gOpmVo5vCoMFDY6AAY+BSZwJysR00jZA3Fw6ZKzqObWyW83DkUg
         1sqIFmGKceEoZU9Ov1o0qu0iH9MfZyi5WKmVEWIeNl5PGinipTpefn48X1YZwS/gwV1P
         gEkUU3gdkVBg5LRJ7sMblC2+fOHC8X8crhuNCbi0YK+pDxdvRlzs/uasLzObu0c2p+FZ
         ud7TP1SaeijHnF26CEZdhzB8eDz5xelEDgmn/8S1jQnynprKQ19z/nHmMo+7Ft10AsLt
         97PC/TkVmHF2jQrBedMqRf+q5jRL6mPFtz6ikL7Xzbi3JQvTseluxBH8nFlWIcUsHSKI
         w2WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOq7yRe0gswEDOwM2Y70drDZTlL0FgXAr+xrgjl69zz5Yvcp1hSeezD8st0HvRCbDwJFD40MKF/+4/yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjO4MvTE8yOafT/vl49rRCFjdFJWMJe4okFJsvfcXR0RzpU7Iu
	6uNNxJq+OrWebqVzZnlwwDwn9szZKNLW4y6bb4Y29P9YHNcapZW4L/SMbPuANA==
X-Gm-Gg: ATEYQzwAaE+VvxkMRkd9KrcCV0dB5oZx7IfWXyU4B4QZ6oE1WyOZ46Z2ZfZlkI+zyuw
	DbsJB9r3sj4BN2Q3s7RQOy+G5iY0XmWoZKT2ITK4uY+sS9vAhz59f7Z0ovVMQfI8V2Oapr2lG4q
	NDi6c1PdVe5ePnCnccngyHv44KAwbplF/F02HQXitYtQBAhai1P2hIrF16zB2wVRriwyczrtkvz
	WYm/wdiEazdz32uO5zRKKMEpOaOTJ+LNTRoyXhT0kquHuBGPkDG8JAsObu+8KGsi8xjY/GOQU6+
	KcCs31Vqt2b+T3uMIfFtKg+rezvNYsy8M6/YIwQqLY6xtKPUIotFZY9xerMOhlsD7ktQtUHso+u
	ABJGafgayh0IHNw075yKzSrnlvIrrQIwTXPQJhWBIrB1SdkkQIVfgLsjurV461jvpiuBlGCx22w
	D6wcJoxXVXryuaqBwo25Dp9j/833fFchD9eTZRa7diNS6v97MFddQb12o0wSdiiRMku0L79+l17
	Wp1+gpUTjU=
X-Received: by 2002:a05:7301:fa0d:b0:2c4:a862:2372 with SMTP id 5a478bee46e88-2c931165e5fmr146529eec.9.1774980498455;
        Tue, 31 Mar 2026 11:08:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4cbbc1fsm10300250eec.13.2026.03.31.11.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:08:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
Date: Tue, 31 Mar 2026 11:08:16 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260331175245.354188-1-bugfood-ml@fatooh.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/31/26 10:52, Corey Hickey wrote:
> From: Corey Hickey <bugfood-c@fatooh.org>
> 
> I have attached a temperature sensor (10k thermistor) to my motherboard,
> and the temperature monitoring in the BIOS reports a value for the
> sensor, but the Linux driver reports a constant zero value.
> 
>      $ sensors asusec-isa-000a | grep T_Sensor
>      T_Sensor:      +0.0°C
> 
> By experimentation, I have found that the address in the driver is off
> by one. Some basic checks seem to confirm correct sensor operation at
> address 0x37:
> * sensor disconnected: -62.0°C
> * sensor plugged in, ambient temperature: +22.0°C
> * sensor plugged in, held between my fingers: +30.0°C
> The latter two values match those measured independently via my DMM's
> temperature probe (with a precision of 1°C).
> 
> The existing address was added in commit f7ac3020036b ("hwmon:
> (asus-ec-sensors) add ROG Crosshair X670E Gene."). The commit message
> specifically mentions T_Sensor validation; assuming that commit was
> indeed correct, then 600-series motherboards are inconsistent in what
> address they use.
> 
> To fix the "PRIME X670E-PRO WIFI" (0x37) without breaking the "ROG
> Crosshair X670E Gene" (0x36), define an alternate T_SENSOR. The "PRIME
> X670E-PRO WIFI" only has one T_SENSOR documented, so replace the
> original T_SENSOR in the driver rather than specifying an additional
> one.
> * If there are any other boards using 0x37, those can be changed to use
>    SENSOR_TEMP_T_SENSOR_ALT1 instead.
> * If there are any other boards using an entirely different address, an
>    additional alternate T_SENSOR can be defined without altering the
>    naming scheme.
> 
> For reference, the sensor used is "XSPC Wire Sensor 10k", purchased from
> Amazon.
> 
> Link: https://www.amazon.com/dp/B0CR8Q24TK
> Link: https://rog.asus.com/motherboards/rog-crosshair/rog-crosshair-x670e-hero-model/helpdesk_manual/
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>

Guess I don't pay close enough attention. Sorry for that.

The above text is appropriate for comments after "---", but it is not
appropriate for a patch description. Please see "The canonical patch format"
in Documentation/process/submitting-patches.rst for information
on how to write a patch description.

Thanks,
Guenter

