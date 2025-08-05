Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B519D092
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Aug 2025 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412511; cv=none; b=kbi/0AeUiKCCI52+yNxDccm4/gd+CdfSXQpng7G4fKqZVSqqI8CclTFnd+A/FAC1V5Wfi2PvFNFqJfE06X0A9y4JxNNcy22OcDdAQDHOQ0EytLTeRiHFuPWm+Ut0rFdY6fKoKOeIyZYLAMMnho3ny3f8m1ff3+XKiCJkC706fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412511; c=relaxed/simple;
	bh=tc8k8ww2+GKUiLYuBm4ofl0C4v+jrmmmVAwgBbvdIuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MV5VEGf/vP7oRsq/okzX0WAxubPeHiLg+p7jf5uaxnyhVwKZ8SoyTZi82EWlfWYTSmJv7vJ7AmCWZre9wRg+Wdk4PfB4oJR8UWwQJcvVaIVgVjvk8RfucWbn3E663uzYZ1b2Vg3Waav4K2muFpHwWnAQsGUbpQPhASQS+kOi3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkDKAvxU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkDKAvxU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2402b5396cdso37727795ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Aug 2025 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754412509; x=1755017309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fm8FWZoHJ+WBVG2CNssL5dfQdLAyR4+LHVNKWICsfcs=;
        b=CkDKAvxU9wDdlKEZJYw8DtRVBHqvOhfvJLspXyA6svSoVdCTHPltoA01fig6UQ91Iz
         ySXb68x0zBVJkG4hgtsqY0HNQzddgKtnyBXGq3++aTQWFo1NmzdtwCieXGUhH93MTeUi
         TRZZRNeY7XZs/zL+aEj4Xzjrv+FdH1QrgXYw4fe1c1UKSZP14y2pUVVn+3TIqk9pGbxR
         K+zdUp7AeetmDt18B9ASU/XaYofKH3VDovuU6mMwcCMPKC7SqMUc0j9CT5MFDrfy9idx
         G1JeCJixaP0dKvwosOyOz9L5viG0mx9nWe/16ituJBTtUA3Clrdak1QZXLmC2k7/FLnZ
         VjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412509; x=1755017309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm8FWZoHJ+WBVG2CNssL5dfQdLAyR4+LHVNKWICsfcs=;
        b=l+azPGAipKjnfckxh68m5i9Q3bwBLOqDrtnZrngoJ9U2b/yh6ktW289eT9Wzqs/p60
         1XJCwNUVPvf+xBayqsQ/+XokKrK0FJ3a+ZXDkWp7T0TLP9ac8Or8KfdzSs5E5p9N1Xs3
         46iIxSzkvtGulaCbQkwjW+IBdXXYHwxOwkQD6oWXXBfJfFGnh6EU4LXwL6D6ZtQzYSpg
         YrcJTl16y9HkxFNkBlQTC/cjxLUR2FtzGaUq4q4Rmt6jvSYofL0HqQNZJzeTgmrU1n86
         SluDr9JtdSn71qJoYL5k8PBcC4nekyNC9JxCbtrTh1qXTifC3giYG4HSJaPcgk+6eqP9
         bKvg==
X-Forwarded-Encrypted: i=1; AJvYcCVMveDvKLGn7tlDUlV3q57KQ1BxAmJQT4DP2gAyf2BP5VsDe26YSzbuMayy/eprh9t2+XSbtzFYneXVag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6QPe/ISEFV8B6tzPodSb8ScWajAnuiMaPntMnWkSMfHy2bGH
	JEPIBFKKrlNXF6c48hEOQU7CS1Hum81TEmHg4OyEg98+3YZwLIpTpqxjk67z+g==
X-Gm-Gg: ASbGnct/OKwkPwC+Spoj/5z1tiMY5KAjXL5fIE0NVg9jUne387Iv+Jvany9OPYFJGV5
	WIReBnz8Ox6BJto9HgpoiC1gEYw6nYtWra28uYokYVEJN6eTPddbwoi+YRLVG/Q/CAB6UjYcT/9
	B1SsE3lKhvdkLIK6AzWdWDr4kMpgCOyECqDM4pB1kQeYk70kUmDnMFrP0gI54PnVDFWxeuYQAvW
	se1h0OM6825pmuA0qVsxFtHU5HJ/8ZWH+48eeTrhOQO71djjp6jkLA2BfwuQhdvGGpUQJOHyuhG
	+dKoJVI/SW66hRsvi0C8rRNulhXUPeZW30FKXWQkIPyoGA5U+kqJvuXC7OsxVKHzn3GrXX/mtlY
	3RpB/u/fqv6DM+1SnbHZajGLNYBu8gP2OuVGZkJw9Ng+jSy6T8LMwEnsfdlJXHFrm99c+QmeinG
	HpTjQH1w==
X-Google-Smtp-Source: AGHT+IHLD/VTf5/HDaiYOYQB4r3ADgf6xTZ0lgCxIbHHSPdu+XvwerxKInpmIRKgXxBy5b7XH+IRxg==
X-Received: by 2002:a17:903:8cd:b0:235:e76c:4353 with SMTP id d9443c01a7336-2424706db36mr187381275ad.51.1754412509318;
        Tue, 05 Aug 2025 09:48:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976c40sm139830455ad.84.2025.08.05.09.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 09:48:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aaa21aa2-70ad-4646-8020-73945e273922@roeck-us.net>
Date: Tue, 5 Aug 2025 09:48:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarification regarding handling of PMBUS_STATUS_WORD in generic
 PMBus driver
To: "Soloninov, Alexander" <alexander.soloninov@siemens.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "titusr@google.com" <titusr@google.com>
Cc: "Busch, Martin" <martin.busch@siemens.com>,
 "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "Dabek, Florian" <florian.dabek@siemens.com>
References: <GVXPR10MB817781435A2F2955D0D5A58CF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
 <GVXPR10MB8177AEDA5EC62CFD7BFAB40DF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <GVXPR10MB8177AEDA5EC62CFD7BFAB40DF222A@GVXPR10MB8177.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/25 09:23, Soloninov, Alexander wrote:
> Dear PMBus maintainers,
> 
> I’m a Linux kernel driver developer at Siemens, currently working on PMBus integration for one of our power supply units (PSU), which communicates via I²C using the generic pmbus.c driver.
> 
> Our PSU correctly supports and reports PMBUS_STATUS_WORD (0x79), and I’m able to read it successfully via the generic PMBus driver using pmbus_read_word_data(). However, I noticed that while PMBUS_STATUS_WORD is defined in pmbus.h, I couldn’t find any logic in pmbus.c that actively processes or exports it — either to hwmon or through other standard interfaces.
> 
> It seems that only substatus registers like STATUS_VOUT, STATUS_IOUT, STATUS_INPUT, etc., are conditionally evaluated in functions like pmbus_find_sensor_groups(), but not the combined STATUS_WORD.
> 
> My questions:
> 
> 1.           Is the omission of PMBUS_STATUS_WORD handling in the generic driver intentional?
> 
> 2.           Would it be acceptable to add fallback or supplementary logic to process and expose bits from STATUS_WORD, especially for devices that do not implement individual STATUS_* registers?
> 
> 3.           Or is it expected that STATUS_WORD should only be used internally or in device-specific drivers, and not exposed directly via hwmon?
> 
> If helpful, I’d be happy to propose a patch or help test one.
> 
> If I misunderstood the intended role or expected handling of PMBUS_STATUS_WORD in the generic driver, please feel free to correct me.
> 
> My assumption was that it could serve as a consolidated status interface, but I now wonder if its use is intentionally avoided in favor of the individual substatus registers.
> 
> Thank you for your time and your work maintaining PMBus support in Linux!
> 


Sorry, I have no idea what you are talking about. PMBUS_STATUS_WORD is used
and evaluated all over the place.

$ git grep PMBUS_STATUS_WORD
drivers/hwmon/pmbus/delta-ahe50dc-fan.c:        case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/dps920ab.c: case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/fsp-3y.c:   case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/ibm-cffps.c:        case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/ltc3815.c:          ret = pmbus_read_word_data(client, 0, 0xff, PMBUS_STATUS_WORD);
drivers/hwmon/pmbus/ltc3815.c:                  pmbus_write_word_data(client, 0, PMBUS_STATUS_WORD,
drivers/hwmon/pmbus/max16601.c:         case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/mp2975.c:   case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/pli1209bc.c:                                            PMBUS_STATUS_WORD);
drivers/hwmon/pmbus/pmbus.h:    PMBUS_STATUS_WORD               = 0x79,
drivers/hwmon/pmbus/pmbus_core.c:       case PMBUS_STATUS_WORD:
drivers/hwmon/pmbus/pmbus_core.c:                                               page, PMBUS_STATUS_WORD,
drivers/hwmon/pmbus/pmbus_core.c:       return _pmbus_read_word_data(client, page, 0xff, PMBUS_STATUS_WORD);
drivers/hwmon/pmbus/pmbus_core.c:        * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
drivers/hwmon/pmbus/pmbus_core.c:       ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
drivers/hwmon/pmbus/pmbus_core.c:       status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
drivers/hwmon/pmbus/pmbus_core.c:       status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);

Guenter

