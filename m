Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEDD209F47;
	Wed,  6 Nov 2024 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730924376; cv=none; b=eHy5ZaGt/d0kPmpK4qRQOxnSvPMLnYyvCBpgdBTeKRmr6LhXfDttdGMO9O/BNM3/P2JDWOkhssryQ0HV7Ezm70ka3YnqSehhjPv6uLn1GL2rPTUu1gUzfvqdmhQErLvkozvU6Wr7LU7+GtizRE0Bi3Yf5XrhLV1D947jez9fGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730924376; c=relaxed/simple;
	bh=MJSFz27Ji55PHJ1n4fI09xN6UGtcbpYFyh32JQWDFq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZbrDqilljnuWQk3PPX9Uxp7ZiR2yJMV8iwLEk8SBSiGU5llZRmx/aXo0lATKl4zJ3F/mnbGdt3Q671QEu3SE55x8i6gg7srdLj869EJApVera38eMCIwATWOm2R2lM3mGNrSW0k85Sz2cbT/20gjFtyGRFO7iZYX2qA5/YA7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Hxp2xQm4; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Hxp2xQm4"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C2EF288DF1;
	Wed,  6 Nov 2024 21:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730924372;
	bh=9N5vcEnIW/8VZ3VrzuxZ0+BS39XylvXZAjYCA4yjhPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hxp2xQm4PJD0Ypy2rLoS4v4kFlvUQKxQfXgAxhrrkAYAja6WkdbrU+Wy6Vg+Gk1W2
	 GekRRf0Ipab80pH4/rQZu13tpGr1KcurSOPdb1d7GX1kMz3/lfNWnInTWa6gz6Sqvl
	 9MaluF0QcD08Ck/0UwSkfxJ5fUi+PGmqCu8fozdDeZx+4n06JEGO0fXkS0B1EcSLDr
	 Fm00P3e600fLN/hunUmQXQgyyeCmg3tFgMEnON0F+vke4dEiRcWltCLIG8ykjUgh5l
	 MAhvWp5vCQRHQjgbO4L2SUasAPzU655SBALGE7ST1KiLoAEKI3pQSRE63G14Evuugz
	 msEQKZL4j0iJg==
Message-ID: <592f2327-c642-42bb-b01b-c601c6ece18a@denx.de>
Date: Wed, 6 Nov 2024 19:58:51 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pwm-fan) Introduce start from stopped
 state handling
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241106021559.175105-1-marex@denx.de>
 <20241106021559.175105-2-marex@denx.de>
 <eb635646-17fa-4380-bc9e-b872af227e21@roeck-us.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <eb635646-17fa-4380-bc9e-b872af227e21@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/6/24 5:26 AM, Guenter Roeck wrote:

[...]

>> @@ -480,6 +497,7 @@ static int pwm_fan_probe(struct platform_device 
>> *pdev)
>>       struct device *hwmon;
>>       int ret;
>>       const struct hwmon_channel_info **channels;
>> +    u32 pwm_min_from_stopped = 0;
>>       u32 *fan_channel_config;
>>       int channel_count = 1;    /* We always have a PWM channel. */
>>       int i;
>> @@ -620,6 +638,19 @@ static int pwm_fan_probe(struct platform_device 
>> *pdev)
>>           channels[1] = &ctx->fan_channel;
>>       }
>> +    ret = of_property_read_u32(dev->of_node, "fan-stop-to-start- 
>> percent",
>> +                   &pwm_min_from_stopped);
>> +    if (!ret && pwm_min_from_stopped) {
>> +        ctx->pwm_duty_cycle_from_stopped =
>> +            DIV_ROUND_UP(pwm_min_from_stopped *
>> +                     (ctx->pwm_state.period - 1),
>> +                     100);
> 
> Since "period" is u64, this results in the "ERROR: modpost: 
> "__aeabi_uldivmod"
> [drivers/hwmon/pwm-fan.ko] undefined!" error as reported by 0-day. Or at 
> least
> I think that is the problem. I'd suggest to try building the driver on a 
> 32-bit
> system to be sure.
Ah, right, fixed in V3. Thanks !
