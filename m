Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D111C40B6FB
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557687; cv=none; b=qy2odOhxfvMcVtFtBZ5kHZqfW2jcVreu43RCb0QKPIjQmlrQTzTLqpFSeNE0FcXONkhTcZUvlZ4N8zfIDvu/JWJJ86ejY7lK+oRvpZWe+qoqI1UWdpfVpbIWBNT+YnKm3/RN1JuWrgd0BF+sIcNQREGAo5HPR8AGkOke/NhHdf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557687; c=relaxed/simple;
	bh=msv4UKCWnzRJ8AaUkkjBcemw+RJMUndgSk28nTFccU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4eZxMT+Qe2lZuAHVN7p8l/jpXEn0Sd4pe3TG9WvNKqqG7Z0FaVF5G//jVXYB+/pXADE/E0MXxXoMzSsrW03qNhU3H8sI6hlJyJzrLjl240SmyEWAIIfygm1b4PkjYZ3JTETOqjNEUgClrs1mmvppvFVy/cNa/GTcrr7YdhDD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF30Fap2; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF30Fap2"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c726ef332so1418014c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777557685; x=1778162485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qfZbAXfxGOXaCq4/H3CYpwcnIHDGtx5biK9MXIffcuI=;
        b=UF30Fap2OP/jPoGwTfeqM9oMj9KBgS0zZmZ5USk1NV+1Oe9G+Vy7x9at21mo4KtAoe
         /BM46uzhZf869bMOEhOlUfQXxdQGAbl+JcR4Yzac7G756qiC4GDj0Qk9SPww7H1Zz/yd
         LSNTCXEm+xdKYA4Znod+rk2sFfkeSEBRPFKNsOER9UIF60sVisQhntf0fNgc3sX8MdLj
         80tnux1/nkHMS7CVjm3SRPna3aN+iKueC9q2NtoOJ2fziVRgkOpleDNV9jANMCMGIFWE
         T9YRz+SqlADevINb6C4eq2RsuO1XkAuj4PJdDwXG0CskWEzPmevVc6NDOOilhw0FYAXg
         CVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557685; x=1778162485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfZbAXfxGOXaCq4/H3CYpwcnIHDGtx5biK9MXIffcuI=;
        b=irb4j4B7Ilhnj96YsWTX6b4vfeitWhZvYz5cCeuWpIIkfPmlatUBdBicDJQY9W/piT
         vwCmqF/QEu0OAKiize6Ks0DHZ1XAx5zrq89l1BNpXeIaE4/QYgZVt975L6Vl9pd8QYJE
         5D1ocrf6N9uhKAucT1CGofWL8l0Lb1s8Vl04RGx61iBJnwTHrbciNZnxzcN3MO4UzDPa
         bFKudzAD/KEN0sVJtLHaloJ4/pDXG3INte5W7CsjL8aClssGIryFRJlvXlUh5ajhyWlg
         lvF0Qrg1eKaZkqtUsLPG/Jo2Rxn9EbvaJG15nUeB8NMq2FSL4a5XsQhvoc06gIgcbIgb
         uneQ==
X-Forwarded-Encrypted: i=1; AFNElJ89+Tq0SbEny13wVkcIuBVIRrKKB3RCq2OrOB3DkUhaPeg5dnjGbFz3rXyD9wgPyzE8EIPRd5lji5tM/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UC72U93YJMbuxbgq8tC2+mBmLhW2Zl32lfEBK0/kkqmfxakj
	3+3HFZt6FSzIFYdQHDh2U91F8o+A8e4D2vWSQCsnxvA1ByLrDof2gctb
X-Gm-Gg: AeBDievfC7X56MS4ueLrrh1P6a9893TJhKb4EELJ3nBHqMRuTejWNnWQy4uFLreIuUB
	M3dd7SgQc6+u1JyB3SieIzJK25bYSCRdcpAjDuMDFGZ5t+xiAZ7+drXz7vdYcnpxMFsoqQ9Vhv0
	j4FFTeXkE3U0P6FMR/Jkn/1F+4lTkYLFXojVwrQ5Yn58mYG0NDDz2Rnf4dOdhtCVX5fsjGKrw1p
	Wkc6sCyORG+qKrJr3AwYKfDZciO7cQCysIUHmMUj8qpZNSqN3lSQeWgpMCU66S756/L2Ztplmop
	KwhVNkbPtP1MKGQCJbZCm1wdmlVzTA3wfNY98Ez8TrBIBz26GxmhAapGRtwWBrU2XF9Gql+UJoW
	f5lIDizSia1uk12A/2k94NPQT4wuCZgaOlbshE2b3NK6Ic1P2rLzAKKEKYwFC20gQa0dv/JQ3j3
	Swa2aAAhukTblvdMKHWaB77vkz0v9J3jpFu3o1mFAsT1bR6OHyjC7a11VXDH9cS0CybJKlUodC/
	J2AbR/mAKs=
X-Received: by 2002:a05:7022:1702:b0:12d:ccf5:271c with SMTP id a92af1059eb24-12deace0f72mr564658c88.22.1777557684718;
        Thu, 30 Apr 2026 07:01:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de321df36sm10222426c88.7.2026.04.30.07.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:01:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f3b8d049-744c-42ab-a641-086bc1726b24@roeck-us.net>
Date: Thu, 30 Apr 2026 07:01:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
To: Brian Chiang <chiang.brian@inventec.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>
References: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
 <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>
 <mhguhlt5gi7sg7qsgetsizdslm2z4vdhlgag55bqjnq3a2kz24@iafh7hhezp4l>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <mhguhlt5gi7sg7qsgetsizdslm2z4vdhlgag55bqjnq3a2kz24@iafh7hhezp4l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 23:58, Brian Chiang wrote:
> On Wed, Apr 29, 2026 at 11:29:37AM +0000, Brian Chiang wrote:
>> From: Jack Cheng <cheng.jackhy@inventec.com>
>>
>> The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
>> module from Delta Power Modules.
>>
>> The Q50SN12072, quarter brick, single output 12V. This product provides up
>> to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
>> efficiency up to 98.3%@54Vin.
>>
>> The Q54SN120A1, quarter brick, single output 12V. This product provides up
>> to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
>> efficiency up to 98.1%@54Vin.
>>
>> Add support for them to q54sj108a2 driver.
> 
> Greetings, I received the feedback from Sashiko for this patch:
> 
> ```
> This isn't a bug, but the commit message only mentions adding support for
> the new modules. However, the patch also includes several other changes:
> adding PMBus locking in the debugfs read/write paths, fixing the
> WRITE_PROTECT restore logic, modifying the configuration for the existing
> q54sj108a2 module, and refactoring the device identification logic.
> Could the commit message be updated to describe these additional changes,
> or should they be split into separate patches?
> ```
> 
> I'm wondering if it is more appropriate to split only `fixing the WRITE_PROTECT restore logic` into separate patch? Since disabling WRITE_PROTECT was introduced in previous commit. And maybe keeping
> other changes Sashiko mentioned in this patch and record them in the commit message?
> 
> Please let me know if you have any suggestion, thanks.
> 

Sorry, I seem to be missing something. I dont understand the logic above.
What does fixing a bug have to do with how or when it was introduced ?

The missing lock in debugfs functions is a pre-existing bug, isn't it ?
All pre-existing bugs should be fixed first in separate patches so they
can be backported.

Please use guard(pmbus_lock)(client) instead of pmbus_lock_interruptible().

Also, your patch does not apply anymore. Support for q54sn120a1 was already
added in a separate patch. Please rebase your patches to v7.1-rc1.

Thanks,
Guenter
