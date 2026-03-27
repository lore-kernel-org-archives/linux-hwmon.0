Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BA2D46B2
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774590754; cv=none; b=t9X8K82t24P3NbYpYicr83RQD+vetg3naydG0YhtSc3KQeo1waKEXHr7zsN6NFmrfN8mmwot0OayF3BwgywTH5z5iPVnzN1bLt8dSk69vogklH3NtPiAOD24b1UYn0YIoXkD/zPT2CLggQQr24SruZD5k5CYFSM/VlE0bCae7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774590754; c=relaxed/simple;
	bh=O471JxDyOaGHhRSW1e+qXf8HgAFFtrfTOfXekmSvKhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaX13hK3R77ZY497G03NAIzBsULUVi7wuDv9JAh86AHPHaBclVlOIsVV6MqhJxw+2OlyzD6VVdqFof6Pz6ZRWSSs/9cUfqgRkohMekoM93QsQcXYsevRNmIVN9Ph0lIdk4MrPm06qEifIwWMas169Lm5F2PFq3Tww/svxXcKTig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW0EUigL; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW0EUigL"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1088333eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 22:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774590752; x=1775195552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jamsNPP8NPRoSXNfjpe1lU9yeAnpkTB9vjPatiS3iLw=;
        b=YW0EUigLFb4qTqOEeTO3K6gtguqSPksK2x+V1Mtnuqa1s3XXsKrYZV1bYiPR5sgG/y
         aoN+SLSUiGvlZSSbYdJJ3qSVwvsGkHGU/YZVGSMxMn6O9ANFCHphScfisZZxZ8OL4R0s
         kRuh2ydZ3/edyXZIobP7qg84TLxY7v8El83pVGVkcvCWZcC31ZV2/ZcwXtVQwjgNdaiG
         hAcqM36SqdZ2LOj6DuAaGMoD7NjE5LbCIbqF8K395tunhVaHSKnC8q6zr7+YQ8fK45mt
         tBfi4zeztkTgHXV5EaAjRBsfq0PmOhTtSGvYuAAqpkX7bNR5VHemKXNU9B458x+znNxh
         DaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774590752; x=1775195552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jamsNPP8NPRoSXNfjpe1lU9yeAnpkTB9vjPatiS3iLw=;
        b=SR/IMFpDkizWjFky9RkBc1xYVfIaPdRAD4rUOJMehqjS972EuzURk2b78wtNGFWlCu
         5OeVpe4QaK3diTEG3aIUZIpkn207kRK+pBwEEwlxrxRwc0daf90pYhUMMvFGF/Ad3Tqn
         dtMi4B3tt37ZNAZyI8inzUQU3CkD9csuAMnp+x27whjjnLXhiTkql6iHkVg7mbqBvOHr
         U5cmJWdHy5QJm3pI/GoquBAOFtuio5eslqSyA9TLq3aU9958VzfOefWtQ2ytRywd8NoT
         eqkRJFbr0OjvNAe/K/QiaFW93p+kJDKh9UyFnxhuyChQGkD+VzIxkMtxEUBqPDHgIuk0
         vZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqrvfPIimOi0+HlBKY6x+jCo8tSL+vBFkp3JHRi64dClu5wZd4miZi0GTUmWTub3V0/e9dzvfoI4XNSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNESgpseAwWFlX6w9csn03pS/v4QdCZ0MMMoGsG8czy3F5PsG+
	+r2bRvl54/qIuqCN2AmjOCnXdalDNqNXENhZ+qR0sEf9JYPeD26mony4
X-Gm-Gg: ATEYQzwdjQZpQEXuaP4MiVCY6GdWyF0Cf2zem6Kwl1cEZWthsu24Li2gAFcxyTw9oh+
	+sa3gfWfHXcy0zlCDTMGUqFaP8alErSCRYgZqfd+Gku0FvsjvC8OKMCO5r3S8Nj0ygTE6+7/yIt
	/IiZvhHDX+hMWaHKgtOuCnNbvc7gRttFX/V3O5tN5t6Zdq1Cd3C2QoQgYq0ANoAg96N4+c1q4tq
	cbCZWK86W46JR/rXJpfBlUFS5DgEG+uOKDe6QyqXB2aIgxUZFqcl604UD50JcpQvpjz7EpF5U0D
	a0SVr6O60CuEdJSzcHRHRMggWKRexrVK0cD49OcHeN5adqQcmpwVxSOd+uB81EjeGYEWtMdigqV
	X/SpCWk1PFlwKvEWS3ZoFcjfpcFldVM/ijfEGrst6+Qqj5ttgu2whTMmBSK3Av7JZaCDc8a2g+C
	MIlZuUhKNKqtJFtTrijcqAilLRotet6uPzdL/pbPUuCMSsU+A2KrTPmTmXJ09EGzaiGK59sKpsB
	+8/0vTgkT0=
X-Received: by 2002:a05:7301:6091:b0:2c1:7480:ff9b with SMTP id 5a478bee46e88-2c17727c7a9mr1968997eec.18.1774590752190;
        Thu, 26 Mar 2026 22:52:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edc0458sm4585992eec.21.2026.03.26.22.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 22:52:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <60ab1803-accb-4ac3-91bd-f6d24354c19a@roeck-us.net>
Date: Thu, 26 Mar 2026 22:52:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] hwmon/misc: amd-sbi: Move core SBTSI support from
 hwmon to misc
To: "Gupta, Akshay" <Akshay.Gupta@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "L k, Prathima" <Prathima.Lk@amd.com>,
 "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
 "Umarji, Anand" <Anand.Umarji@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "kunyi@google.com" <kunyi@google.com>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-2-Akshay.Gupta@amd.com>
 <86ec222b-d252-4586-a1cc-2a7a5674e1b4@roeck-us.net>
 <d0ed96aa-529d-42fb-a680-917c325998ee@amd.com>
 <91e527b8-f753-411b-bdf5-7439edb48c34@roeck-us.net>
 <9e05e255-6245-415c-8c74-ee4f1809976c@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9e05e255-6245-415c-8c74-ee4f1809976c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 22:07, Gupta, Akshay wrote:
> 
> On 3/24/2026 5:03 PM, Guenter Roeck wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 3/24/26 03:36, Gupta, Akshay wrote:
>>> On 3/23/2026 7:45 PM, Guenter Roeck wrote:
>>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> On 3/23/26 04:08, Akshay Gupta wrote:
>>>>> From: Prathima <Prathima.Lk@amd.com>
>>>>>
>>>>> Move SBTSI core functionality out of the hwmon-only path and into
>>>>> drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
>>>>>
>>>>> This split prepares the driver for additional interfaces while keeping
>>>>> hwmon support as an optional layer on top of common SBTSI core logic.
>>>>>
>>>> This moves the driver out of hwmon space into misc/amd-sbi which,
>>>> in my opinion, is completely unnecessary to accomplish the stated goals.
>>>>
>>>> I assume this is to be able to make changes which do not follow
>>>> the hwmon ABI and/or to bypass hwmon subsystem review, similar
>>>> to what has been done by others.
>>>>
>>>> Obviously, I think this is a bad idea. I won't give it a NACK,
>>>> but I won't approve (nor review) it either.
>>>>
>>>> Guenter
>>> Hi Guenter,
>>>
>>> Thank you for your quick response.
>>>
>>> At present, TSI supports a range of functionalities that cannot be exposed through hwmon. Additionally, a new protocol leveraging the TSI endpoint in hardware has been introduced, which, to our understanding, cannot be accommodated within the hwmon subsystem.
>>>
>>> Since we already support the RMI interface via misc/amd-sbi, we believe this remains the appropriate place to continue AMD's out-of-band support.
>>>
>>> I will update the commit message and cover letter to clearly articulate the rationale behind this change.
>>>
>>> Thank you
>>>
>> That is neither a reason or an argument for moving _hwmon_ part of the code
>> out of the hwmon subsystem.
> Following feedback from the Greg and MFD subsystem maintainers, we introduced an sb-rmi driver under misc/ that calls devm_hwmon_device_register_with_info(). We are considering the same approach for the sb-tsi driver. Would you recommend a more suitable alternative?

I would have suggested to use an auxiliary driver, similar to PECI,
but who am I to argue if senior maintainers suggest otherwise.

Guenter

