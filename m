Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB536BCC3
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777670365; cv=none; b=tQiAIf/eYCuiVi9m6rItLIkS7B1Ce2iBe3fTX+izGOdMQy9JnvzNifPyBSQkc4HGpXgVCY9BvLU5dTKiTC7wArTwH5xOAjsNOvuEMfIGFnV7XtMe7Z4sCUyO8+0GxEgi1/gPU6Jc/RwygriWvtv8nHg7ZLqbNVbBcSQtQjrQfNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777670365; c=relaxed/simple;
	bh=Id6uc6ER7NqATHb7vh2ZAVqITkL3DvGRouvxvUfAxw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1NjbZWLC8+OWvA8Jz5ggvO1iv3yaFg33Lv6kUCfrUEpKCyBQn7Gy+FINGDn1K++jv2B2FO6HUUk++YwulUKAxJZAMlmBTcx+ky4Z5Z0G56xp3Fj4BGrY3r1L05ltoS3oflI449JkuIH8YB01PEI4ieoDWg5FCe14QIPKG4bUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcRlooHQ; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcRlooHQ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef84d016d9so1015946eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777670363; x=1778275163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vup8+Bo6hijoO3e3q8n0i28tjzasiLGDP6IR3h4S+mI=;
        b=DcRlooHQ4K6+bfSYmA+oViBKlFJG0FGYNyW4NzE/WwaeXckR5vLwSLrydQw6UVIzUf
         vR5etqX1V7uly6f1l2tjtfkB3lsxTC/uYA0eDsg8pR4COisV8Xb5ob9Zf00+AvHwWGkz
         mD/DDvKElDTxBJtZumXKGdawbrSVcabJUpfZbaMqzpu4c7KTXxBh/V9BIneF8wPB7/2j
         AG141XlZkFWB/0h5qepCYbcVQbimzq7Yqom/icKRL6+T/W4ezaFh0RySxYXK3PGhap84
         hPc18ryZ3EfZ5xxAlqA/Eyx+4rC7ur8nw9aanN5HV9tLWyAxsX6dniVhLYel2u8E8nGP
         +Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670363; x=1778275163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vup8+Bo6hijoO3e3q8n0i28tjzasiLGDP6IR3h4S+mI=;
        b=Dme4fwlnnqN+vBsI0U2oWn4FhAFZVWstg4XmhI1TDQXUVJw2e0GpxCi2QlQbS5SVzg
         gdg5zbOLOiQ1sa2kxb/r8IYR0RH3+uJeBwWtX+zd0z3S1DbA8O3zrafy36dHVWqXXI9M
         4EPnZMiuK4opCZ+pcj66PNLfsIkvPVMGSgn0E8RFaF8gbe0jereIh8+d/rwFNoVCk9Ho
         0C6BrzOBq5jzGP58XbgNib2t1IlU17kYI81RJFw3sVHqm9ZHBWfOqK3wsjCFau8BVOtd
         3MT0GbyvptkoBzMk08DP7U4vM7kUXNHZ9utiGQn3j2s1eVbA9OVeigdkUaZ50nKiTW6E
         Bu7w==
X-Gm-Message-State: AOJu0Yz8lVRzMQaGH7VhuJe9u3/savXYQZIoFafBrtOSj2NHDP+S8HJ9
	qF85ACKe4QcnBmUvVGH709iTvXj0IGGCHzryDuyZZc49iz9EVBuwLaFf
X-Gm-Gg: AeBDievq0G7W4+VtpEM2cNizzzs4BquV5wOnOm1jPaRCOw+A4uUyNHpNan2gdNLmXBW
	NRmOJXRGfI68RPXc8mHyRLGbGTlfVDd8mnnS4UYfFyI0pO4j/YXZlsBloS1EI8x1Ly5zyXGuHEv
	90X7Mlz7/ebSTStknIvowNykHjBcfBtU0RrMb+daC6Zu+jmP50nLGM1x+9ejTvPP8dCRtiWCRiW
	+WbjlwyQONrprtcBPCVKz3Vmsw8MAfb9dnJWX0dGLzLMxaVYFbl3mvOCxnorj5z6CO+bf+O9EPg
	MuUYvpbYJoiLeCxQNciQ6zFO5e8e4zPeLVUzvcqQYVJGwrNbIZnknxRlpO560mfhB9tq0Fl/C8w
	TKth43d2cSMB1s1gRmHyNz5ZEjoWypPBYai1xpG3ZlR1iYn+bvnBxiZmKEQ0kGTcTjr/2hHHcPX
	78fkSL3HyArgHwfRQnwb3ithbxu0Ne/89rCqu7eyhNZnVDbOPsGj5aqggP3ompCjAvFvGRS0FFd
	YLWTtoPqwk=
X-Received: by 2002:a05:7301:22af:b0:2dd:405f:89b3 with SMTP id 5a478bee46e88-2efb4c3e615mr510507eec.0.1777670362971;
        Fri, 01 May 2026 14:19:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2e0sm5906031eec.16.2026.05.01.14.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 14:19:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b325afeb-e7db-49fb-9e38-93404e075b86@roeck-us.net>
Date: Fri, 1 May 2026 14:19:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert
 polarity
To: markus.stockhausen@gmx.de, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
 <20260501124540.0C11CC2BCB4@smtp.kernel.org>
 <039601dcd973$bf191230$3d4b3690$@gmx.de>
 <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
 <b9e2db74-d2c7-4ca6-911d-0b59c68cd187@roeck-us.net>
 <022201dcd9ab$0aba9fb0$202fdf10$@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <022201dcd9ab$0aba9fb0$202fdf10$@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 13:42, markus.stockhausen@gmx.de wrote:
>> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
>> Gesendet: Freitag, 1. Mai 2026 22:14
>> Betreff: Re: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
>>   
>>> So this will need separate patches:
>>> 1) Fix set_mask and alert handling for AS6200 to be low active
>>>      and to report the alarm correctly even if it is high active
>>>      (xor config register bit 5 and 10 (translated to 2 and 13)
>>>      when reporting the alarm).
>>> 2) Fix lm75_write_config() to add set_mask to clr_mask to ensure
>>>      that the bits which are supposed to be set are actually set.
>>>
>>
>> Turns out the default value for AS6200 has more problems. It is set to
>> 0x94c0 which claims to be "8 sample/s, 4 CF, positive polarity".
>>
>> 0xc0 reflects the samples/s. So far so good. However, 0x94 is wrong.
>> It sets the single shot bit, effectively disabling the sensor, and
>> it does not set the CF bits as advertised. Please change the default
>> to 0x10c0 which reflects the intent more closely, except for the
>> negative polarity.
> 
> Understood. I still need advise about xor during alarm report.
> Do you talk about this code?
> 
>    case as6200:
>    case tmp112:
> -  *val = (regval >> 13) & 0x1;
> +  *val = ((regval >> 13) & 0x1) ^ 0x1;
> 
No, you'll need to xor bit 2 (the polarity bit) and 13 (the alert bit).

Something like
	alarm = !!(regval & BIT(13)) ^ !!(regval & BIT(2))

> Mabye totally stupid but this bug and the deep dive follow up
> hits my brain a little bit too hard.
> 
:-)

Cheers,
Guenter

