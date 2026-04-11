Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E40329C49
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775892032; cv=none; b=cgt46/huVEOx3hyBNGa+1ac89HFhT5rahz43amoGmisMgYgPYrMzrVYbyI4dN7vuG74zAb4LDvwtuE/ZBiSpMr4VGW16a7c7CWErvhEu+YhS2eLUgShgwYN1iiCKQ28E6l8f8VrzzgV0k424JtgjG8Z9ycTd5ia477URw4HO5tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775892032; c=relaxed/simple;
	bh=giGY+nVbFQQ4Xw5h+OvpqFsfwqaC6d2zZAaoZfV8m6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9qYGtBgBdPhDFTKC4rX24gYpKcjtQ/apXoBP+NTBzS5O0nhqRDsFyjYEEeLQDGBYEj9Ux7k7nLCbmscH78riA0TPNbotfYhW7uETNm/WEK3Zns7TRyj+/PsT+uUnLKlUNAx0XBxe3G5k4qK9b1z9BxCRcnKRjqs/calf2PI5fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6wkAzBv; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6wkAzBv"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d95017a68so1855333a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775892031; x=1776496831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VlHFHyv7lotD4cDN/ipcHMLKOy2CDqZhb9XbRaJOH1U=;
        b=h6wkAzBvB2DI6GRbAcT03i/5nmeRpuWPKr8xtzuTDRqqKTXLtuXmzgxS9JJjbhGjz8
         81fj1S2a7sAl0WZe74H65R5DcSNslDqJEozYH/aWnsKFFPyY1T2xZE9JvZsP9Y8t45+7
         mXuMtNKXWhzF+d8an6fLn3FoAmUKkoCa8MEsZsyg/uIqNRB9Avdee48D0+wt8ZXv61ta
         ywVtNobAfgqGPZHV1PuN+5hhGUGpbuGYfYtJ9+xCHu4EbhNBJaYza0dPGaWnx4g8qrSg
         mF5QzJ7f0DPLhIj1A57kbcs5aheAme4BZz3J2cA6x+ZLcePqSZ04erdB6bYd2JGdpmJV
         C8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775892031; x=1776496831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlHFHyv7lotD4cDN/ipcHMLKOy2CDqZhb9XbRaJOH1U=;
        b=kr/qJBfW67Y3vi2kive9iy9kx+sS5lE8eKIG73l8AIQyZxsvqgT68fsHnPVrNQCByw
         7aP6qsDbYoPQuZdIGxzOMfEX2ILQjDkqtbWFhNtjz03lLL/hgw0Wh9a+5njn5cC9YlOX
         pF556gCJ09QBwDAt9aenznKc4aS0d0HT0Egc3GnL2UEOwDJxdeOH/lPP5HRUCxmcZiCY
         2QNy+kgdyAmQUHsh/VpXf5nu5Z87jQUTFEPkH0WQ+pvZ97Dz0pxf8hdS46MlRxfdt1Nm
         kKGJw/miSa6lvmRB2o9e540nRmyW+Njd/uI35ic4JVT5qHA1hDDgyAB0uiaKngsEIdDD
         0j2w==
X-Forwarded-Encrypted: i=1; AJvYcCUfTx/kL/4BppmaPbOD+klunl0C6xck9Mz6OkAFJu9pXyamHK+YDfr6r8A9t/P3/19YmxHVirF10D3lLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylNOeyXjtA4xcAXRvri0CNtKraXfxjwfTZbo/w3aXvDsXoIahq
	geAD9E8DEgHy152ohhfEWsdQ3zPiMyAXl5EjdoHBlTGtGz7bhyvYq3fE
X-Gm-Gg: AeBDievuZjTNARDcYzdOJsn0LaxHlyZhnm603TgWiIwefgRrSUPanJtUQqE7UTwv132
	euJCg6NTm2IVO0ksTn3eCZR5uUxW3AtXRhOB0dmKpI5Vk13cFQ51UQ5XPmKYvlTpdvQNNjyjQlB
	bWkw3/eaYKti6QF7SIAeQDa5dQPP9v+TDprSNhVox5dI9yS4D2PnwaJscF9j8wn0NjapGERrpiQ
	8d7f+YhFHQirWv8nIwADJjbeTcTYR6OGo9i4D8HSK9YFOv8Ax66AoCTYT4vH76xmifPoDmpfiGF
	oTs3jzER6e8U8SJlTOR5Q7rKme02/B4kBnCcBLWDQ22o0M0prph5wDvxGacCO/ZruUfYGJCZr/3
	8Uylye0SlZQNNtk9cSYj/zHJA/z36n44tsZDMAqQRhAMt17Ly19X8yS/IS6o1KQTBf3XrEzg60A
	AOTKyaqzZrYAhaIwXJMjZ17rjH3iA1n4RSKGPNPqDZ9I0BmGItKkrjQ7+7s0BTtdFgl56e91ON
X-Received: by 2002:a17:90b:2ccb:b0:35b:c900:79a6 with SMTP id 98e67ed59e1d1-35e4274e341mr5769646a91.4.1775892030776;
        Sat, 11 Apr 2026 00:20:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35155829sm9191314a91.13.2026.04.11.00.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 00:20:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0f1f053-589a-4681-8c8f-8e4b5daec145@roeck-us.net>
Date: Sat, 11 Apr 2026 00:20:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Akhil R <akhilrajeev@nvidia.com>, krzk@kernel.org
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, p.zabel@pengutronix.de, rafael@kernel.org,
 robh@kernel.org, sakari.ailus@linux.intel.com,
 wsa+renesas@sang-engineering.com
References: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
 <20260411053433.49655-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260411053433.49655-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/26 22:34, Akhil R wrote:
[ ... ]
>>>> And it
>>>> should bring me clear rule what I can or cannot remove from defconfig,
>>>> if in 2 years I come and start pruning it from symbols.
> 
> I am still a little confused on what information would likely accept (and
> keep) these configs in the defconfig. Would updating the commit message
> as below work?
> 
> "These configs enable the support for SPD5118 within the
> Small-Outline-Compression-Attached Memory Modules (SOCAMM) LPDDR5X found
> in the NVIDIA Vera CPUs. The Vera CPU uses ACPI and is part of platforms
> such as Vera Rubin."
> 

It is quite interesting that we argue about SPD5118 which is mandatory in
DDR5 systems. At the same time, CONFIG_IGB_HWMON, CONFIG_SENSORS_MACSMC_HWMON,
CONFIG_SENSORS_RASPBERRYPI_HWMON, and CONFIG_RTC_DRV_DS3232_HWMON _are_
enabled in arm64:defconfig. CONFIG_IGB_HWMON is even built-in.

It is kind of difficult to understand why those are more important than
the temperature sensor on DDR5 modules (or the temperature sensor on DDR4
modules, for that matter).

I don't know what the policy for defconfig is, but just based on that it does
seem to lack consistency.

A separate question is if it is time to enable I3C in default configurations.
I'd think so - more and more chip vendors support it, and presumably they would
not invest in it if there was no demand, but that is just my personal opinion.

Guenter

