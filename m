Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45C4A33FA
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334936; cv=none; b=LgJp5LsdOazYhygWL5oILJ/QLSUn687mtwpwxE1u7qc3+24ySx1xLgwiDdiEYw94qPkNMuiJRxdWpL4GdZeGKokqJqek6AlUAaymCwnT5pC+GcJnK/NNclV9tUd9xIRO6gbomjz+yRmRcB1buUbW2xTnAGNG6vzRtrLhfh5y6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334936; c=relaxed/simple;
	bh=wfthrTkDQg+zXZkKyFIKQ1Q32bcyZi6WCgNCplThDEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDGeS/FaWY5bdNU/UTUtgviZY7cdGABX+8Zjgk8Xata8tv2TgGZMvw9gddm0vza0wQ7oh2KM3Wt71GEzD2To9DQWjgifsafDNfrkn36UaVYsSMxmtEtcmpZAiYPt5T6daKIun6IxXbGFeyRaL7qZ83GmkRtk+DQ3w9FIfWgS2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu7vlek6; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu7vlek6"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6aae367af50so387807eaf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334933; x=1785939733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBs0uk/Nz7BeNh47t+Q3dnJOuZWHDf1CUHbRfB2n60M=;
        b=Zu7vlek6cx4S3C9lKbOA13aJ+03kEKHYnKklrVbhOtplebZcoCcgWd1jYoS4Oi2npo
         5EoL0Oyv0TE3A/z/ioNAAqsdlFZFDfzW+FssehwYHyxiVHesVQQK7IojsIVfp2fcg7OZ
         UvoteJDnPf9Pq2F2VCfXU8X2l+AR5rda+Ctm7HAG5hjVVW/xYvFOPYB2IsVScdDGEVgY
         WQHK+s6iSZmVbLPrOjmU65uh76nu5kBZz67ajBo067+DapsQJG3EygP+waMhsLyGCteW
         V3doNiC+kNmLjwkDXe71Fvhl3Zn1kflKcFtFBJZNb9iIj69LJ/2Vebv5U9tm76y1DnyD
         G6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334933; x=1785939733;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aBs0uk/Nz7BeNh47t+Q3dnJOuZWHDf1CUHbRfB2n60M=;
        b=OF0tioFQPWsssecVONEkR8d4pV1z6TgrUuzb6vb96bXcpg/2SNGats/Ih8PLHyf/uE
         BGdHRg/HTNDZKIIR0GXILOB/fhXgo6VmPYRDVwBF/s5WWKzHXOXDsby8tMje4f2YFh+/
         GFsSmax20mQFKKOE46HgR8Dp/irZdAEEX6Nwi5HpG5CvDLz2tEtUp4KvnOwgg0sCGpQx
         0XLIkpoaCck9+cEQjx1p4J/vrbtc1jTofZnhwmH5sSJVzvrtJ2YIMCNGDTqDjBmHGQLP
         mXCpSG+T3MC/PCrUANCcbXVHdg6K1VNmp/48P5k2R5uRg1Hd9mfwFXVPQ0QVwBb3Gk22
         mm0w==
X-Forwarded-Encrypted: i=1; AHgh+RrFSzFhjVclzTqwcCZw0mFEPQTzgmg9XVvJqfGQhBu25zkCxroE0hsiR/lHLY1LJTHZ41x6cr0M3FhIJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2Y8NbDShFT5+7rKDFxUTS2CWlsesbGxhJIGIpSOoXuUuqbLR
	6YxqZHqX7YFTSfR1JVLzbHydckxNYXIUXWzonLjzxf8Rjtv3Jn4+2wQa
X-Gm-Gg: AR+sD11idCemRs020lGEZFqMZKwQ6+9/8iyUBaWlLy7KOrQaIu4rSJYaVrZMNMhg/7c
	8pSadYSFlgHW0VuI3as4dgp5YL8coR6/8KIMFVFyEaigg9wsEjvVffsFMiDXtWrgVkCcW1pbkXU
	UPnTVQh45wi/+KdjINDNt4j9AfwVQwTMkRhAE8aSuxkUeHryXEbRH/IAHQ9dbot414ch74fFPi2
	GpAGmZYQTiWNTsNNe1WQ2d8JUSAVdRhXTB0zDgATPLOV4kgL5zQaAjA3VfuCqwX0Sn4HQAeanaD
	Z4afVyWPW9MdSXM/YJmEgDMw33RENlpTERu0NEkOyU81dnGxMTN4qcSB4v5HMqyz6sM4ntYP6qq
	ygnG6+2is9nuY3EAeu/EN+V2YnsVEW8i3B4SdTMzFmkthVe55dC2FV5p8HkkN1KyKR7u/17RYhU
	nLl5jBY3g6R/ZM659z9fvTmPPQlQXYM8ik5vGDP+aLjR77Pnx5CBMVEvWEqm+CIhnFr7nXERNUy
	sBMdLwOsqhxAyPxSN2WODdvGZ4k5OSRFkwegA==
X-Received: by 2002:a05:6820:2908:b0:6aa:f61e:2463 with SMTP id 006d021491bc7-6acb603b4f1mr8979eaf.24.1785334933143;
        Wed, 29 Jul 2026 07:22:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4588646ade0sm2426214fac.5.2026.07.29.07.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:22:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e535a9c5-28a5-470c-be21-95e1812e5e01@roeck-us.net>
Date: Wed, 29 Jul 2026 07:22:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon-next PATCH v4 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-3-c14039dfa0e6@gmail.com>
 <12dfeaae-f806-4adc-95f1-97fe10ef748e@roeck-us.net>
 <amnoV4Vlxmc5QgVC@monoceros>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amnoV4Vlxmc5QgVC@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/26 04:49, Uwe Kleine-König wrote:
> On Tue, Jul 28, 2026 at 10:56:04PM -0700, Guenter Roeck wrote:
>> On 7/28/26 21:46, Luiz Angelo Daros de Luca wrote:
>>> The ADT7470 features four PWM outputs designed to control fans.
>>> Previously, these were only accessible through the legacy hwmon
>>> sysfs interface.
>>>
>>> Expose the ADT7470 fan control lines through the generic PWM framework.
>>> This allows generic PWM consumers described in Device Tree, such as
>>> "pwm-fan", to use the device through the "#pwm-cells" property.  This is
>>> particularly necessary for boards where the ADT7470 external temperature
>>> sensors are not populated and the chip is used strictly as a fan
>>> controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
>>> delegating control to the generic PWM subsystem allows the kernel's
>>> thermal framework to manage the fans based on unrelated temperature
>>> zones, such as internal SoC sensors.
>>>
>>> When a PWM consumer applies a new PWM state, the driver automatically
>>> switches the corresponding PWM channel to manual mode so that the
>>> requested duty cycle takes effect. The duty cycle specified by the PWM
>>> framework is internally converted to the 0-255 scale expected by the
>>> hardware registers.
>>>
>>> The legacy sysfs interface remains unaffected and operates in parallel.
>>
>> No, I won't accept this. It has to be either or. A pwm channel modeled as pwm
>> subsystem channel must not be visible via hwmon attributes.
> 
> I didn't look in detail, but maybe my red line is a bit more lax. IMHO
> it's not OK to be able to modify a setting that results from pushing
> hwmon knobs using PWM operations or vice-versa. Switching between
> exclusive use at runtime is IMHO ok.
> 
It is my call to make, and my call is either-or to avoid confusion.

Thanks,
Guenter

