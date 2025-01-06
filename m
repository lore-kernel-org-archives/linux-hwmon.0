Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D031DF98B
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182552; cv=none; b=kq/0khBJcZMWwwKhTRbRvJ5zcDIXv0ka4Jwvpaa0iz3BlxknLjCnHAzXjnziDo/eKjjbtcpehHQFYRdJF2k2znEelJZODeObQL8SlXTCNNqB4AZNoyVKcYfhTsXcRPHJtU9YH+CIAw9HYG900cIEqBDa2vXLp/k8re1wUsFWlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182552; c=relaxed/simple;
	bh=dFpxnCaQW4I7ndhZfWRWTUGi0vNJlqUh+tRBpDN8YE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvzX2pzJjA7EP4XTaZATMT+L7tzNutx8/YDrd4QDXaD9ayrdpueFjrR3WimIgYj1CFvd1uUBYTkXcYzM7kgWG9mV9bA+v4NM9c+d+ANU8aRjIC7e11cGsl4MwMlH13c7cJSeE2rZmAMdBTX55Ilpc/obbxxP9VHyiJyDlFMfPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzEi5PBL; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzEi5PBL"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso18768220a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736182549; x=1736787349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DzSN5QQZz0uNrk9D44ICtpp1tvKu+3aN+z4O5k14Kbc=;
        b=fzEi5PBLkxfzhk9dvey9engRxIhWGYUY5vWZz+KT0KHiOqgpF3aaaR7wUMJHGaBSnI
         unF5KsNsHbV6pl3sRLX1CtaF+bE4wbDbnZWVVhkDUZmXb4RJqi2REMnuYxUDxO+46k0u
         IokQdGjDaQg+2qwFOJQrczJaJpoKNEfwOJI/PaOm5HLd+bN56VDepQeyXhyZ/hyMAlIz
         iHX7/TJwA2DfcDHBqAKWThfbcACST6WBDOYVKTxBicTxOzBSP75KY0iHC33fFKlREj2B
         QLOQeRgLqqkISLz8O/fn1QdSDX+caSTH591rvRWhue7yW9NONmVRoHZH6e99xUkHZzeG
         etZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182549; x=1736787349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzSN5QQZz0uNrk9D44ICtpp1tvKu+3aN+z4O5k14Kbc=;
        b=EaW6vH7rZMDgI5haBu+QD4/k47pwonY6RXG7ywkxxLhxG8JkJe4BlWwUzyfCvS7Ce9
         U7XXywENmCzn89agGxDdinLV9Mnuu/tdJg4OK55kN1sBqZuPg62veKbKt2JLhsBGzTAB
         wET2tDkBEqY8V6HXfmdAKcnxqLdSm6G4u2pH5ezEsjxcHSiWZy2tBAy3gjlC8TnOZUqS
         DnscAs60CPUzJiV32I5E2t/VtN7q61KEQD1vJ97gk7UD4eB3wux7lYMkjNBbgylsMgqc
         WyYIJrmVgcpy/7Ww69zFo75dorUCp9mSY9HYAbWakcfmedVe6AUq/LHlfk13FQKod7UN
         Tg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPMXTaE1SbRYJnYsumry3A4IP5U4nwstt9+Dt2RfekI1AU50zOAR+AkdhgyXGzpROw8MBl515mau1etA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycs0K5rVtnVDmjPeZu0EIgmpufNjLeljQBUDIpl2BdLQBMvIt4
	/AgSVkFiNUalXE0qoUuuz31/BwtMZ12opZHxU4OsQpNCBHAyEt0m
X-Gm-Gg: ASbGncul0tV+roUtsNnmG27k/VI3v0/9vdhcp4ejpSf3dwjcaLXYIuw01VdVHwJFzZm
	dhl1cWuFaj075pFazSLg4OCeSJocBUS11l0AymvMJ4gX022bgDnfJ/JqJyAux+kPvzXE5t4MrAh
	u3y2R5sgYdLxYwIOqUymh8zsl0WL7k99EoIY0iHR0dmJO2I3kDjqWh6PQCuBeuvZnVOGA9Dg27f
	vqRRFIOuqfftHlS7vEOpuvzwO4mVUmulGYGJ0+dvDuQ944uaQanFMwTT7uP5ty05JlV9k559pcZ
	WRQm+E6DKtVkBuzKE4obxpqISGe64Q==
X-Google-Smtp-Source: AGHT+IErc1WNSO/SlMFyAHZB7QUt2Fhd9VA4g2e+PwdKcpp3N4qACplQCIiCyyB+CG3UTHO0pw5Qcw==
X-Received: by 2002:a17:90b:5245:b0:2f2:a90e:74ef with SMTP id 98e67ed59e1d1-2f53cb837b7mr24638a91.1.1736182548614;
        Mon, 06 Jan 2025 08:55:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm34273235a91.13.2025.01.06.08.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:55:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net>
Date: Mon, 6 Jan 2025 08:55:46 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
To: John <therealgraysky@proton.me>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
References: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/1/25 06:15, John wrote:
> The attached is my attempt to add support for a new MSI motherboard with a NCT6687D on board. I do not know why one of the sensors it reads gets reported at -40.0 however. Calling sensors multiple times shows that -40.0 value seems to bounce around from "Thermistor 0" and "Chipset B."
> 
> Feedback is appreciated.
> 

Documentation/process/submitting-patches.rst

describes the canonical patch format. It also includes a chapter
"No MIME, no links, no compression, no attachments.  Just plain text"
explaining why patches need to be submitted in plain text. This reply
is a perfect example: It does not include the patch itself, making
it all but impossible to provide comments on to actual code.

Please resend. The patch itself is almost ok, except I'd suggest to replace
"The value" with "The new customer ID" or similar in the patch description.
Also, please define the customer ID as "0x20d" (no leading 0) to be in line
with the other MSI customer IDs.

> For reference, I attached a sample output of sensors for the new chip with this patch applied:
>

This and the output would be useful after "---" in the actual
patch. It provides the context while avoiding sending the patch as
attachment.

Thanks,
Guenter

> nct6687-isa-0a20
> Adapter: ISA adapter
> VIN0:               1.01 V  (min =  +0.00 V, max =  +0.00 V)
> VIN1:               1.01 V  (min =  +0.00 V, max =  +0.00 V)
> VIN2:               1.30 V  (min =  +0.00 V, max =  +0.00 V)
> VIN3:             672.00 mV (min =  +0.00 V, max =  +0.00 V)
> VIN4:               1.01 V  (min =  +0.00 V, max =  +0.00 V)
> VIN5:               2.03 V  (min =  +0.00 V, max =  +0.00 V)
> VIN6:             464.00 mV (min =  +0.00 V, max =  +0.00 V)
> VIN7:               1.52 V  (min =  +0.00 V, max =  +0.00 V)
> VCC:                3.28 V  (min =  +0.00 V, max =  +0.00 V)
> VSB:                3.33 V  (min =  +0.00 V, max =  +0.00 V)
> AVSB:               3.33 V  (min =  +0.00 V, max =  +0.00 V)
> VTT:                2.03 V  (min =  +0.00 V, max =  +0.00 V)
> VBAT:               3.18 V  (min =  +0.00 V, max =  +0.00 V)
> VREF:               1.79 V  (min =  +0.00 V, max =  +0.00 V)
> fan1:              747 RPM  (min =    0 RPM)
> fan2:              745 RPM  (min =    0 RPM)
> fan3:                0 RPM  (min =    0 RPM)
> fan4:                0 RPM  (min =    0 RPM)
> fan12:               0 RPM  (min =    0 RPM)
> fan13:               0 RPM  (min =    0 RPM)
> fan14:               0 RPM  (min =    0 RPM)
> fan15:               0 RPM  (min =    0 RPM)
> fan16:               0 RPM  (min =    0 RPM)
> AMD TSI Addr 98h:  +49.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)  sensor = AMD AMDSI
> Diode 0 (curr):    +56.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)  sensor = thermal diode
> Thermistor 15:     +52.0°C  (low  =  +0.0°C)
>                              (high = +124.0°C, hyst = +34.0°C)
>                              (crit =  +0.0°C)  sensor = thermistor
> SMBus 0:           +56.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)
> SMBus 1:           +56.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)
> Thermistor 0:      -40.0°C  (low  =  +0.0°C)
>                              (high =  +0.0°C, hyst =  +0.0°C)
>                              (crit =  +0.0°C)  sensor = thermistor
> Thermistor 15:     +52.0°C  (low  =  +0.0°C)
>                              (high = +124.0°C, hyst = +34.0°C)
>                              (crit =  +0.0°C)  sensor = thermistor
> intrusion0:       ALARM
> beep_enable:      disabled

