Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDFC3F54AA
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468158; cv=none; b=iNoin2auT09G5ZPqppEW76EtIlPUTYMVSYpliaWjWYN7ewhYgq3nNstZd0DuxvTUDU36Ne0xYDuO8hoSaHsG1mJXbA8WUzOK7zzDb2WY1lvaS63f9vtZzI+uiaegsjDrcoVnc4dHwH6cWR7JJg4PRmkRoW96pWTGxpzsDyguTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468158; c=relaxed/simple;
	bh=TGSRX0O4HK2i3GKyhh4JbiC5JFHd+RPlzBm4YlHuSKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJtSjxQzXkLSbuSB/DIp4sGyAi3Ov20u669jYI/ywXXX/SUPXv/5lTv9uKdwq19dCxxwHG19CeENt4NAXNMTH/Drv9Hs/7hySrPMtg/O93aqKZIZ2cwCcle8+QJ/N7VqnBA6jndkX0uOQLgUfHMa+fxQg3QB1/MRWBMjH5vUU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7qy/VPh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7qy/VPh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso11102502a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468155; x=1778072955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o7zgiDqP9WZyPRuKCL775pJWkeBRncXZro0PxBJG3T4=;
        b=Q7qy/VPhfyjSrY8Dk4OTwy67d8nN4/O35PFLIhM6bgK57HiBeMAZ+jBWRRx+DB447P
         jJHSyd9JziseU4B8TPvwTCAI4aCQDF/6CAOqCGLKnqJiHrVokDNzY5Wn7K+VcS2Ii19b
         dDrVOvXemUkSPwBghnrbAhuybQV0CWPnazr/a/xb2AyNROmiPIbAYLgsrumrpAkw6md3
         wAvUhEOPh99bkzAVe1cxjUuKb/VbnDxmn7apZzNLGuE7p2sPdTwWwwUuY+11VLbeqcGa
         uUEkN6YmNxnIxKWakGNwnQC/IW/n69sBQYcTHXwTnqb8Lfqf9k4SndpBP/tA56dxO3NR
         GNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468155; x=1778072955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7zgiDqP9WZyPRuKCL775pJWkeBRncXZro0PxBJG3T4=;
        b=OrhkxoFr++fMyELbrVyHtpn6hY6Ow1ZoVT37oFhNJtuXB2PxO0TyVxfVVL8FwQaPMp
         zE8LujorrESWuJFodjGeqnd/ZyCgo/1LfouBCj20GDYF/9UDG2pXMuDmdtdc1OEviUBc
         GDVTd7dyngQdJlC3Z48vomHBFdFOuH/LQoRGtsLuandjbHs7G63+uMvUY0XP0yPjSweW
         gpljfFDfbzGis3EmRWCVHyLurE1d5GKBCQTeSIulqMMKTLAsKZTX6XvYqY1ZV3Go6edX
         3i3n+SSUU3gjjZjD/HHNXpAzPsDCHn+ueiU0w7YOh+y2uatbq1eBz0sl+lONnATAzuJF
         /Hdw==
X-Forwarded-Encrypted: i=1; AFNElJ/r5OfWcmSjHwOjSe9MRbXYDg/6uPmf4PqIL9KByeWFLV1Hqr3ykDN14nzcMtcAnc6DZ7H50Kv0zZ9Myw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50C3DaAt5t5v2PUL8q449q8MQWBe3cpD4ea53E55Oru6pN/HK
	aGr4id39i9umjWQ/P74Ce7Mc9M4EDTTITAmhLmwhDQ6nbBQ9lJsrQLGx
X-Gm-Gg: AeBDiesqhU3Vim2fDphtV8brqPzTBhOG7TIgxsbXLC31pR+3vKb2XrJ9C8991NKrST0
	lH6Ift3oXaPc2zCwqQ+OM3BlQnDKBsYI7nNHLwy9JQofARLSuNux3eg7hpqrSW7JrdvQKwaBN0y
	FDOpmoyJLmCyQGzV6PohXzDh1IKsqH+S8/BKZbw20zwOMYHKYRqH5NIXm5q1FSGqm88f0i7NLlE
	3zRqpfRedtKc7Xk2C1bfRAN2/2fH0gJCfrdQgq/evBvJEUGEL6dO9yJvMWAcAtx//UNwVaR7sWe
	pJaz4xDe/g1GY/q/R0zrq6NmBvXDtMsuWVV9Rf1C75SPqnJRcfYHPA+J6YuRBiQ54XMJq0dBu8I
	5PpJvC3Vr43znxViQXIeFxHdKmm/FpJ2YH4jWqthSlsNrF/c+S/fzvQk1pQ9Cw7lL2a3Bxi3kFF
	9Zv/1+5WrwLngUW+00uEKQVBVNy3fkEnZPbnRISrxrWTqIk6858FlwmG0ctRxJkpcjGjBa9VvFm
	Yth5/g9njY=
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr8286288a91.21.1777468154775;
        Wed, 29 Apr 2026 06:09:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a43938e0sm3092915a91.11.2026.04.29.06.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 06:09:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <539cccd8-3955-48d7-ab15-14e05e738228@roeck-us.net>
Date: Wed, 29 Apr 2026 06:09:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260428-ltc4283-support-v10-0-4f26f46491c3@analog.com>
 <20260428-ltc4283-support-v10-2-4f26f46491c3@analog.com>
 <afH6AuIGm0sa_wur@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <afH6AuIGm0sa_wur@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/29/26 05:33, Nuno Sá wrote:
> On Tue, Apr 28, 2026 at 05:07:27PM +0100, Nuno Sá via B4 Relay wrote:
>> From: Nuno Sá <nuno.sa@analog.com>
>>
>> Support the LTC4283 Hot Swap Controller. The device features programmable
>> current limit with foldback and independently adjustable inrush current to
>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>> temperature rise for reliable protection against overstresses.
>>
>> An I2C interface and onboard ADC allow monitoring of board current,
>> voltage, power, energy, and fault status.
>>
>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>> ---
> 
> Alright,
> 
> Guenter, from the bot review I would say only the LTC4283_VPWR typo in
> ltc4283_read_in_alarm() is critical. If you agree and don't see anything
> else critical, I'll fix and re-spin.
> 

Agreed.

Guenter

