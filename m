Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C827280E
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366834; cv=none; b=o+vvbuRuhsGqhVkh69Yex53E+wd4h+9FiC5QQ7ivIKuBAIqWfAg4nUUajchcQJggh5p2FfivmF/6dyJMf1ROFOetjXKUlJzpk1zDqrjG/RR6WFJN3j64IEg/h1BINIPZf9azoPvLkA1fiQT7l/jSAnSf2p6O63WMqytmtZhsfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366834; c=relaxed/simple;
	bh=HGnrC3Y56b3intNHIfOuk135OVxYsXA8hRsU+xpw0as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuJsZeG8s1tS/0zUN7ZkeccON9RA0lj5rKZ4yUCxFC8bA9OMhltVnxVYRkuxuqsfBNYed1zoAxBlBlF8UbumHAZGMYDF8pMipXP5G2+AP1csGqumoXVojwMRLRiLw7uGrcbg9pdpyYELlP/no4Ixokqq1E+jn0GAcD0sLcFv+Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVwmz/PI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVwmz/PI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f5d497692so5328207b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760366832; x=1760971632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iM5/e4UJAfJvXPy0LZcn9NuDbnYMTsJJoi6JFRNlh9k=;
        b=OVwmz/PIscX80IXYNsaJkVtqIyZRNdqL81N0mCCvryk9L0rCePoiPjmeUie11Gy6Z7
         g2sf6gjPFdbSbzcejc4jcVUdiWaHOkmMqT7XTG/q90m9cchzJqYDAjtUnp3pOlbqGLOs
         Wwp/LPpUKLXZGPiHVbr2XxYrwzRcLDNHhv884z0+Es6pkyD0k0py7IXDgy0cDeGkWNtj
         5kK805X13BFxoQVzCsMdJbkrXwVdlBrT3hmTrC6vx7A5HkTHikEJLOjiz8iH9G6ywVJm
         2OEZjFlqnc40QogLTkHUE4ySuNv4evX+ARZNrNDNOITABHOiCppFJODs8mCVhVFOaGCv
         MShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366832; x=1760971632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iM5/e4UJAfJvXPy0LZcn9NuDbnYMTsJJoi6JFRNlh9k=;
        b=IR3rPpFW2ZXxFMgZn1zMHYZDDyg85VJOoX6sAHyLWA5H17pwCxNvRxkveEYsgXKiFI
         rKZo6pL1N7NkBlmmmadU9NeW2hFHQ+VSumM1wgRIUAt3pYbF383U5qnLgUPbutwhO1TK
         AxcSjH+CowsZb5uGv0dWC8q+toHFnGggSBV3NEP/ogOCx9ED3NadGWATdQ8uVLxiTlHA
         pGYSshb5eQu8wa3MxjQvE+JQWSDZW/sD2TeeGhZwMFY+nWVfZWBEq6oUy7xohvb6T3eQ
         Hiuqmw3zNJmM683Z8Do+EIA1geDzIXZmwNL75gBqzXnmLV5uLKW1KRHJZccUhq8CsB+e
         XSug==
X-Forwarded-Encrypted: i=1; AJvYcCVEjLwnDgl9A1HZg3s6OSAjKvHlIv9PsyfKZv14xKYFbUJC7Yv9h8qFtQSRriZB9TUaTz79FE55GR3PHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+SlKG3JFEO56givAuuGDg2XrLyla8x0JX+AV6N/sCqiHqHLt
	S1fVNABDmQ6nVT2i4T+PwH2RCfmRvTJZPmUn/Ah0gARyQAHYtpryVcz4
X-Gm-Gg: ASbGncvCpk96nf9+Tc6aabhfn6EfrVAeaifo1TLKr4c+mwR9KrEJ+YNeZOL0OPVNNwf
	II3gbXujYBxxAzjva3fmjpbbq3r0UBdZPmksK/mUL7kbMOD/URi65uNAHQYL2lv/5drNTRaMxYw
	wZUy4I16r4efEfosJpyEecadvqVOY5ca5QCqn7UOEKpuvyrRMpLVtLFthyGkkOhwmCudtMldvjX
	iQ8Lu2RFB9Gsw6ergcrl5RaQmwOypzL0ro9MiMVQ7LZ4H/RfthDwDO83+lR4muoMk5Ehreg2m3Q
	jam9c5V2Ub3Rd0gNIS797fdgtbNiXs0L3jHIDJ4YLTD6skQizllDbZFb72qGTmGGuRsL7gfQRU2
	+Qf+6y/fSrhDYYo79yGg5wLmXDuaYORLzVJvcD6d8ImhqtCvnLVDrHsl+3XWOG7GgdD8Cz+jX2c
	PQatJsMnu9Cr4RF8Ir/0UCPQR9
X-Google-Smtp-Source: AGHT+IHPU/97MoKvW8vBm9Jrran+thU7TIazvVrMY0e9wgshgLyIvIk5asZAEFCjkaqXX2avBELD4Q==
X-Received: by 2002:a05:6a20:7fa3:b0:331:e662:c97e with SMTP id adf61e73a8af0-331e662cccbmr6834583637.37.1760366831737;
        Mon, 13 Oct 2025 07:47:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm11950521b3a.53.2025.10.13.07.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:47:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1f5362b-16ef-4699-bec5-986de2116d83@roeck-us.net>
Date: Mon, 13 Oct 2025 07:47:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
To: Ivan Mikhaylov <fr0st61te@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-3-fr0st61te@gmail.com>
 <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
 <9badd4e53ddb6166d0aa196da978bd70f61642de.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9badd4e53ddb6166d0aa196da978bd70f61642de.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 04:44, Ivan Mikhaylov wrote:
> On Tue, 2025-10-07 at 10:26 +0200, Paul Menzel wrote:
>> Dear Ivan,
>>
>>
>> Thank you for your patch.
>>
>> Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
>>> Extend the functionality of hwmon (peci/dimmtemp) for Emerald
>>> Rapids
>>> platform.
>>>
>>> The patch has been tested on a 5S system with 16 DIMMs installed.
>>
>> What is 5S? 5 sockets? (Probably not.)
> 
> Paul, thank your for review and sorry for late reply.
> 5S - Intel 5 Series/5th Gen
> 
>>
>>> Verified read of DIMM temperature thresholds & temperature.
>>
>> Also paste the output?
>>
...
> Guenter, I saw that you already applied other two patches, need I
> resubmit series with updated info of commit for this one or just this
> one?

No. While that information is valuable as comment, I don't see value
of having it in the commit log.

Guenter

