Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3D359A8A
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772485485; cv=none; b=Nua3Fdq5rvLC/iOano3crH4LN878avN1e3Hc3jHXBz2vMqGz4IOT0nxlk3hPUzIqxNrKfbK9aJ8Fh+FbMhVy+WNiIW3yFuuy2J46BLvEQTPT9l2Lss/WeQn1nCEpQaXf8Yw7+990jwmaKVbn9GfU6E8FS1mmIAtT9MlGuXyPUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772485485; c=relaxed/simple;
	bh=/gouw5TP1fzJ/b2kstkQNC+QzsI5T26eKxhEydBmzWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HV5bjb85ZB9R62qMQLjVvjSicrZsnujrZTVE6s9vjsurTaHlKPOtNPKJl9zIGpSh32o2jpz3Dl0royRbg7YmeTLMA9j6kJIkw/mP/A4TweGxAkFZUn0L2c1m3YRQu7YU8dymYt30cxZfxvY7lD2ACx/fOhXvUBG7Aq/hcXVPzG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch6xadXd; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch6xadXd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso4271171eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 13:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772485483; x=1773090283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yu/9ECEl0WAg+psvJiVOlpxZlKJGs77sxaWqlF6W5q0=;
        b=Ch6xadXdBCrQvuSNQCou0+ZLbXGFw8WlkiXJwpvhjmOs/ARgXTs5/5GC20efEE6ayT
         5Gd6DYIU4g7zM0o1ZoPuTcpR8PiVFzlzZMYgDK6K+6d+5ADowVNPZXq6hPupF7iyUBtZ
         VBXAJeO4qMrl7Y2kCcnRCmY+8utyRK9XYL0i2Pj1txh0Ekqft76ac1tGQ75owwW5qOB+
         O6dC/67QdnT0EcnvHr3IhmbIJ/wnzCWnYVlwcVbO95nywHzfR+S+u0WlrTC/wPFuM1Bz
         ilzkwZeqw/nL13ouqo+SvpykfJKNAq1YdEsPDTziC0/CQmuuAXMWKyKOaxl3kmCn0UAg
         v+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485483; x=1773090283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu/9ECEl0WAg+psvJiVOlpxZlKJGs77sxaWqlF6W5q0=;
        b=nyqsbsgZzjIsWzVuzFZmBQJjmAfNyac3qRva8/+GKUpT7EhPEQtfe4hFE871ZCIHrV
         OQhlco8znlTysM2Y7RzpZzpVzpoMptvPOgIg01Y4Qm4qlyoaFTgcdcd/Lj/YxeouN0UE
         99sIXM0Opt+4Xd7CGUFzBr9fLJI+wtBPOdVYhKWgcTIAjLA1NYmJHV0ofh/BEg4RZaih
         ABy/AEWvxz4KnesMbq3QiAwFOgqjEMyMNux0ASq0iAPLgaxKss4cohhS/lxa4J+VBMgk
         h3b3fc19FC6lN5XRW/CSc7ZV6PPuSC310ydjssahBGboLWUVMH+rcN9XmSudVVp/lGW2
         W4tg==
X-Gm-Message-State: AOJu0YxS5vcfcbvS56a7o5SKGMiKgIAaQImno3IYmrb4E7/ZgbymiKHk
	dzE3HRYwPZ3f4tM+69WsZeuR+yBpw2QCVjmsxABnYu7QYjOJQ4gTy1O2
X-Gm-Gg: ATEYQzxOt4iZCt50z8RrAxlJht9QbKJqc8O8bxjJ9VXAgSObIbVYKfj2K/4Rt8ePEZl
	kicJZ7oPROXWaG4geITQArDTizL6FT4q97xw/MxhDGxaGvCNuvZ7QZfT7NlElS86pyXuENXyFcI
	tgbADU6XYII66Ga7mBvw8UepGosXxI1Ec/XYwFWkm8PFaXnPrLff+WgU+FrXBUMxmO8oYf3/3mG
	ZuZgQdJCFLOUtX/Vr26RCbPi7UvSvL62VDFVOamZ5qeKM+bEZnsxCW0mL7lrYfD3o9zxTLqwydT
	B4PBjMLCntqt4PTS56UoGmZDztQsWHjIWVD+kL67N0u8+8VG5WcTyXgln7R3/cq2LsAkfGtHRwL
	qsjGc0h4DqlxSIsxhKjVk0dE+vRj6kIcjIcL/ToV7z3y6VqskWnO4chdbw/cwWBq3Cs7MRD6wor
	BNXhnogowzB4QxUglJ+9eib9YLMUp3Ehwp0hPDAKOIYOZq4VImgjHF/MBt9zBxjA1R6gyEIrTi
X-Received: by 2002:a05:7300:8cac:b0:2bd:cbc7:16ec with SMTP id 5a478bee46e88-2bde1efba67mr5143605eec.24.1772485482877;
        Mon, 02 Mar 2026 13:04:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a5312dsm15168260c88.16.2026.03.02.13.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:04:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c3fc43bb-9a4b-4b1c-aabe-5fee0302518b@roeck-us.net>
Date: Mon, 2 Mar 2026 13:04:41 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] (ina2xx) Drop bus_voltage_shift configuration
To: Jonas Rebmann <jre@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Ray <ian.ray@gehealthcare.com>
References: <20260302-ina2xx-shift-v1-1-4ff5b7b76d51@pengutronix.de>
 <58c0e46e-fa58-40ba-91f0-235a4cef034c@roeck-us.net>
 <b55cb982-6431-4db7-84d1-d64145bf4a66@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b55cb982-6431-4db7-84d1-d64145bf4a66@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/2/26 08:02, Jonas Rebmann wrote:
> Hi Guenter,
> 
> On 2026-03-02 16:50, Guenter Roeck wrote:
>> Hi,
>>
>> On 3/2/26 07:26, Jonas Rebmann wrote:
>>> The INA219 has the lowest three bits of the bus voltage register
>>> zero-reserved and the bus_voltage_shift ina2xx_config field was
>>> introduced to accommodate for that.
>>>
>>> The INA234 has four bits of the bus voltage, of the shunt voltage, and
>>> of the current registers zero-reserved but the latter two were
>>> implemented by choosing a 16x higher conversion constant instead of a
>>> separate field specifying a bit shift.
>>>
>>> For consistency and simplicity, drop bus_voltage_shift and adapt the
>>> conversion constants for INA219 and INA234 accordingly, yielding the
>>> same measurement values.
>>>
>>
>> This isn't about simplicity, it is about correctness.
>>
>> The datasheet for INA234 says for the lower 4 bits:
>>
>>       Always returns 0. Remove these bits from the full result by doing a
>>       right arithmetic shift
>>
>> which is what we should do for all chips with reserved bits instead of
>> assuming that the reserved bits always return 0.
> 
> It says that for the reserved-zero bits at the lower end of the shunt
> voltage and current registers of INA234 as well as for the bus voltage
> register.
> 
> If bus_voltage_shift is kept, wouldn't a shunt_voltage_shift and
> current_shift need to be introduced to support those registers of the
> INA234 with the same notion of correctness?
> 

shunt_voltage_shift, yes, but the current register is not used,
so a current_shift would be unnecessary.

Thanks,
Guenter

