Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0541624DF
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178532; cv=none; b=Zd+BHTQ7A6opnqoTH/j/iM64kQiWjYqKbJyKwlQiT/7goMgoNejYEIEPHWLTbevk1uBEtx3nP9PczaoKYMXWKNthSZEIyPHPyHb7wlZXvy4WsnwC4efe8CK5RD+S8ajgJtTIGS3eJW7T6IQmA2/nknTm8dG+HKUpWsad80GwrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178532; c=relaxed/simple;
	bh=/1hZJEmmjYrWmizJ2XQNxy5Z9jsipLYNR/8k4bfXDUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMfWXLX68jP9UxdhIBlXTzBnNeDikay2Ba218H9A79BoQuanDIYHAHi3aluioVkvaprJ9nwaMDFMX/SJgmPvsVry4SCF55HBBBoK4bjdI1WAKh7vrGUlCFFS553mSmI8FIhSHYfpRsQwQ+BMRDXcJmgTkSmnCCtoBl1r01QEezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZpRH2XF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZpRH2XF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so39009325ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785178531; x=1785783331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7s3NY8HvmOabzcWDfdBtfJrwVxvIJEKBPYhXRbvoayw=;
        b=XZpRH2XFmuQP9GNhyI3vHvA0SLkTqZwbSMjv08+moYvcImmCEWFSoOD47rQ3aX9/dk
         9ziBLmqiEaxcezloUnSZCnbNgTmcdXhZb8xGK7s/r99sWnZTbZvbgAVOfKOOHe9z40ux
         3lNplt9rffQCodoF+WE5P+eLcbB3l4r3rLGIieqwyrJTSvRdTHbTbGyoRcVnQlgmSthD
         S4E1fj8Yt1NiSl2NYpNNKumvjnuLLXaaAmox4fnXYogI622NYTw5CQvYZGOubloGxbBU
         D9wsib08AARw4WSPyVSEB+ulIi2KSlHfYdwO5TH+Lwtuaum0seg7hC4CPsrRpowV6JSV
         1Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178531; x=1785783331;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7s3NY8HvmOabzcWDfdBtfJrwVxvIJEKBPYhXRbvoayw=;
        b=VINQsGa1iO3vU8op36pyqdYy9ydYpTb5Ul4LYBO0ufY9xuHs2O4REzJnxASyYkt2kO
         y0iQYAzyP2xs4UbmJ+lzA2TzZCyl54dJQ8Rv31c3tRlnPnD5CVj3abvrWXq26Po7dxmD
         ibpcu4pQhKAAP3EYQyCskVq1SluuybcsHYlzg/1+BtLCS0HxrA4a07PQ/YDxHYkhkQFM
         prIcIMiaPVWN1IM993K5vO5ydKhXxeCmxNuNfkGxxlLBcIub5fZyRhh/8MtOY+T8Bfk2
         1zctM92wkU2HjHPBf8TyAmPxzEdf8CftJ3gx7VkoIe49AUUtEroSr5mE+xmnZUVqJuZr
         UMTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrlvLrs/p5Tl7e7lz9ydtFF43RsYSugn5EuhdQxeSRgvyZytO25iicDoxJHdAoRiNFnyymVYn1IpWteg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxknobhDTdKGuMdfl+hdXG1mud8CdvQLeswvxVTWpLRCHn6sE
	8Wc5BbA7HutvDbHwTH9Zload98idiWFpt4PGDeoQrXmHOeZ0mr7QN/Gzt2IeoQ==
X-Gm-Gg: AR+sD10l2ODu5kSccE4vQO0/GUg5jMlonph72IkPP8XhftpnyAg1ZrTK5hXu3CVtvui
	iC1MbIsQOAxzCqLsyesjysKQzoKxydqHP4macbPuQ9CgQJzzr6xvewzifTEGOaYvrxdn2Q+qbM8
	nhIyPKuk761hAkgKm7SiyW0BAXk4AoBbbOs7qzOGhDcjOuViotyzFqIAIlXCA2sFrksUXQJg1tv
	3vixa8SLS4oedDynTsrUDsy85GtajhWz21rKOak/KYfJmhI1ikYgpGxbyQhY5zfg6OlwlVRFi0b
	80vVa97PRX8doDLhs7bMYZwATLqNxUHTOKc12scR1/1mmxzxO93Y3b4o/869bXyPOmA665isMx0
	cn/ceRL0BbwjaQ/NyAo45IsqmGsomLzvXAw7KNxdMN1KgaGpjga+v+EPVfy/g9aANSusTjKSClb
	JqokTrI48GwKnj/HnjwJPbZAVUs4wLSO1lWMWordNjvRgzEMf7h8I=
X-Received: by 2002:a05:6300:8d:b0:3c4:48da:8102 with SMTP id adf61e73a8af0-3c67daa5c35mr9606155637.29.1785178530607;
        Mon, 27 Jul 2026 11:55:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm34318893eec.10.2026.07.27.11.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 11:55:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a4a9b5c8-cb83-4865-a226-66c55987ec38@roeck-us.net>
Date: Mon, 27 Jul 2026 11:55:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency
 value
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com>
 <f15dd16d-0e3c-4d7a-a8db-59ca3d34d4dd@roeck-us.net>
 <CAJq09z57AMTFyEnvbHw=-6KDC83sA+E944=WcNc=FjzFySAmzw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJq09z57AMTFyEnvbHw=-6KDC83sA+E944=WcNc=FjzFySAmzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 11:44, Luiz Angelo Daros de Luca wrote:
> Em seg., 27 de jul. de 2026 às 11:33, Guenter Roeck
> <linux@roeck-us.net> escreveu:
>>
>> On 7/26/26 20:34, Luiz Angelo Daros de Luca wrote:
>>> adt7470_pwm_read() currently ignores failures returned by
>>> pwm1_freq_get(). If the register read fails, the negative error code is
>>> returned through *val while the function itself reports success,
>>> potentially exposing a negative PWM frequency through sysfs.
>>>
>>> Fix this by using the cached PWM frequency maintained by the driver,
>>> eliminating the register access from the read path.
>>>
>>> Apart from the corrected error propagation and using the cached value,
>>> no functional change is intended.
>>>
>>
>> An alternative might be to use regmap for caching and drop all driver-internal
>> caching. I have done that for other drivers; typically it simplifies the code,
>> sometimes significantly, since the update_device() function is no longer needed.
>> Something to consider for later, maybe.
> 
> That definitely sounds like a nice upgrade to consider!
> 
> I haven't used regmap's caching feature before, so I'm not entirely
> sure how cache expiration is typically handled. In adt7470, caching is
> mainly used for volatile readings because hardware access over
> SMBus/I2C is quite slow. On my device (which might be an extreme
> case), reading all registers can take over a second.
> 

regmap caching does not time out. Registers are either cached or not.
Usually that works just fine because there are not that many volatile
registers in a chip. Most are limits which can be cached forever.

> What would be the recommended strategy here? Would it be caching all
> registers and periodically calling regcache_drop_region() (or mark
> them volatile) to force a refresh?
> 

What I usually do is to just mark the volatile registers in regmap,
and drop all driver-internal caching. I would not see the point of
re-reading limit registers.

There is still a case-by-case decision to be made for cacheable
values which would need excessive calculations (more than just mapping)
if read from a cached register value.

I'd say never mind though - you are right, the driver has a number
of issues, and Sashiko is likely to keep finding more.

Guenter

