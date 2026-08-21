Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E949373BE8
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331502; cv=none; b=g1gYEec7F1ZG/1NcPKv3xn4yYFWFFTurku66PTzUt8p5FZ2PsmrUwud12IKAbAwLWhlDwaKyGcElvLdfMUPGFd/zsRFkl00lsDlxk0HEodzR6Yz6btqq1GGnllZgmA8hETj472PZ+p7NGltjMs+1WKxL924cm6QrB8P2R0DO5to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331502; c=relaxed/simple;
	bh=oF7hJRfKcsBhrzRG5UopmiXACltxf5cm0GPOSDldZBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1KWrk1r7ii7sdKbZqiJacyKtjWwBO2L23Q3LNH0AYExdpq2mpMSFpasGWwv+vv4+sl46kw3493S8Vb7sPA6YfdIdt/AcewvD/eiDYygGEX2Hy09bUlCaNi8EKCrpyUVzPhiQy0yPq7XjYaqIYsOSdaUWgP1Bzogsi8DFUkel9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akFSH1UP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akFSH1UP"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1026560b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787331497; x=1787936297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw/cVXcD5z/4y+bl6d3DM5h/euK53M2j/RQeTGK7GPY=;
        b=akFSH1UPk0vH2rEiixWgv6RwlnmpX3P5+qzfBVuX3KasW6aDn8HJwXp8/GNWpM8wKY
         a0hBxRnBuec8Fvnzi8efr/Iwdg7otW3bs3dh/8bxyi427l9ivOOg6sCDVDYEtRS8ro0p
         yjOd6wiLr5ymtD4BCvGm5opxCJecVjWZiOUp9kGpXGnYwKLQjPxuWNqqXPiAYGFatfBx
         YLkYIz4qGtMKV1PdbLh5ZK8jokqGXnC94AHg3Ac4peHayzmX1q4oacm26Efd3ybMAY39
         xog0r0gTaHPWsYNztOV2W0Y3e9jz/jJZrv2ov28IZUDEFzHG/zsQO5d0l/vOu4rJsIpG
         YNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787331497; x=1787936297;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sw/cVXcD5z/4y+bl6d3DM5h/euK53M2j/RQeTGK7GPY=;
        b=m6T26P+k3ow5QxbODdqB6y4VYSRBzYoZei1hBix8vKi4H8EhGM597dsgXmiNnDkEf2
         NmF/lax1CDSBmkkHUJwizpa6md5lAw0FmrQG6iVe76UFBsgHdyaLfEEyk4TfIo08glZi
         V8XMk4gL/ZcYLEOpm9UNgXuKY7jSFaWImZhYEgD2igRIQYywDP2gO63GVRQbKOZSxfj6
         3ZSLiHwVQFrA3GfQRFsm5ZHgAz0cKemNLkiWsHn+Jsp1CH73p3qCbKpQ4FDQqtKVWUtQ
         gbwgB9bLcEU/6s+hHTju4mQ3iZe8RcH0vZ+C6RDrMnnCHljOeMyWlhvR34Tq4dFQOa9D
         8zZg==
X-Gm-Message-State: AFuF++mlecXCPgygDxmtqvZst0cXVkX+GdowYMNpnqyOQ548QI2u55nK
	I0Pta+Au77VNwesAsu+4ClVNme4S2uGGCZg1Egt7iva6UFztbaSGtUn9
X-Gm-Gg: AR+sD11Sxsf+cZ6XGHqAFKYm11jYoNkcz0hrnKuabREQj1g44q3/IIU498UyMValr9o
	tLK80KEXZWCXTcpySCnb2hGBFVUJp3ldPDTakRL0AhRciPlkmHoVjdfpxbV3RSh9A628GnAc1Mg
	OKbB3wBHh2odhI9bynNVp1VImtgNETJYhnIKJu5MvfmtEJNeO/+FhbA9GKnDFj5eu7ghEtMMTVD
	DR9XllzdDvv5mxm+nWjM5aM8++aJ9DNr5iLaGps4vNBNWSpQJjeCbxf3eKYYytYuXF1kGrPgB3J
	avg/EjAoeJD0cYpV74denKaoNUiqloI/Q8PCr/b2QM4aWNoTxONIxFtyMWT0zZjXBl26ZTdrT99
	zCzf6ac50JcvyZ85SgR40IAAOx42Y3AHXTF+vD3urch1+vb9tAQY8u2o7N+5QqIuck0YdQgiEOw
	m4awiWOwtihRqR+nYsmOSQBpOyPuD2EWAhg7tgyPy0xmjVbwaAgDXC6CHwvCF0/+FvJULLZgoGi
	Mtw/Ibih8WSKCYD3gZEzMA546jZ44ESbWZ/8A==
X-Received: by 2002:a05:6a00:138c:b0:851:b007:2fe0 with SMTP id d2e1a72fcca58-8520b9c6d39mr67083b3a.1.1787331497279;
        Fri, 21 Aug 2026 09:58:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640dd4sm3076215b3a.41.2026.08.21.09.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:58:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d1b91675-7675-4b6c-821b-464e8f113144@roeck-us.net>
Date: Fri, 21 Aug 2026 09:58:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
To: sashiko-reviews@lists.linux.dev, Jared Kangas <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
 <20260820132304.2B1BA1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260820132304.2B1BA1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Jared,

On 8/20/26 06:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Writing 0 to an inactive alert limit unintentionally clears the currently active alert, breaking the newly introduced alarm decoupling.
> --
> 
> --- Patch [4]: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms ---
> commit 0eea1308d1961d2cb0471626855b002f45901d56
> Author: Jared Kangas <jkangas@redhat.com>
> 
> hwmon: (ina2xx) Decouple in0 and curr1 alarms
> 
> This commit attempts to decouple shunt voltage and current limit alarms by
> tracking the active alert type and returning zero during reads if the active
> alarm is for a different type.
> 
>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>> --- a/drivers/hwmon/ina2xx.c
>> +++ b/drivers/hwmon/ina2xx.c
> [ ... ]
>> @@ -484,6 +521,7 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2xx_alert_
>>   				 INA226_ALERT_CONFIG_MASK, 0);
>>   	if (ret < 0)
>>   		return ret;
>> +	data->active_alert = INA2XX_ALERT_NONE;
>>   
>>   	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
>>   			   ina226_alert_to_reg(data, reg, val));
>> @@ -492,9 +530,13 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2xx_alert_
>>   
>>   	if (val) {
>>   		mask = ina2xx_alert_type_to_mask(alert);
>> -		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
>> -					  INA226_ALERT_CONFIG_MASK, mask);
>> +		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
>> +					 INA226_ALERT_CONFIG_MASK, mask);
>> +		if (ret < 0)
>> +			return ret;
>> +		data->active_alert = alert;
>>   	}
>> +
>>   	return 0;
>>   }
> 
> [Severity: High]
> Will this unintentionally disable active alerts if a 0 is written to an
> inactive alert?
> 
> Because the read side was updated in this patch to return 0 for inactive
> alerts, state restoration tools might now read 0 for an inactive alert and
> subsequently write 0 back to it during initialization.
> 
> When ina226_alert_limit_write() is called with val == 0 for that inactive
> alert, the code just before this hunk unconditionally clears the hardware
> mask and the newly added line sets data->active_alert = INA2XX_ALERT_NONE.
> 
> Since val is 0, the if (val) block is bypassed, leaving all alerts
> disabled. This seems to allow writes to an inactive alert to silently
> disable the currently active alert.
> 
> Does this function need an early return or guard to ignore writes of 0
> if the alert being written to is already inactive?
> 
Is that a valid concern ?

Thanks,
Guenter

