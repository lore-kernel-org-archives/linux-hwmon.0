Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2B334C28
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 23:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569343; cv=none; b=QujQyM4VC1/1XiHYTGEZEY88r6B7B3flYPYseeEv80NY3I1MYbiplZNoqRxVD88DBWEBGIueQ1Q82Jx4ts+cdro2FVFqLqO3F+dtCMTdE4VQWCbmOSq1IfaDdwX7CGi1s6Y7xPJ1xBzwIgwH1/2w1xLTRd1gWN2A3fCe0haBNTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569343; c=relaxed/simple;
	bh=4c0N9jmjUp/FlUyQKBEJBqt2Pfyy/uW54mZOCO1DRyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irOMTJVD86gtZc0+krCUTPnRBsi1CdlTQCFsVu5q5HbS+A6c+J9kuzCvED6Ub7JWxbXOmkCyxkSR2rDIHDGdkJXYcMFi+QjZGg3sz9BJ6ugMB+pqBPtEsx+GbgI2lsTcvSr2gqWb6g+A5kDAmR1CSHXBEgf177/Qu+jM0ubrZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsuy5b0w; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsuy5b0w"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1755813eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 16:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774569342; x=1775174142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1lsvyRSL16W8vx0KqsFHDO1ns0BWTDe35//zRW/vpVU=;
        b=qsuy5b0weyaP7M+13ZthEmdjJxZSeDEZsZp1x1Nh2rHwXNJXJneKxN2tHFW2BsHN5S
         26FrnUw2bTvNlqEQYrh7g0mSbxiVWGK0maZ9v+1V6IF+Btjx2WbjK1Mu2calCpo1TDnu
         bGZwf1o+AmHaNAt3cbAy1eoi6kovWxDpwvN/2rhLplNDN7M9JoN1+h6cARhDwG2U8DHL
         +KGG14qVkJt/JMhGZwMJsjjgCJQ3I3/yCvydl/z6+xOgAkIpcomsUyrZboCxgeMOWTfj
         51GO4EzL6ZjmkC7H8D1dZxLTVBa0rd4Y9GjlqHc9S4XRh/yBu3/MHL0zqCGNrpZqhmKl
         shZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774569342; x=1775174142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lsvyRSL16W8vx0KqsFHDO1ns0BWTDe35//zRW/vpVU=;
        b=ifJagcLt8DMO7m+VpzDwkJbhgCEDXy8p08BkPio7+xqfqQkNn6uAOPNYNtYwHyrZ0p
         cHyazuLtXOorYmm2KUAWNqKzdLi9y7fp0mFP20ameGYew1JYPPclXe1IRd+XYmZHjvtW
         2+aIDnRPQbN4oTWeHkhomQVjVY4kPfxitTh2z+fBApKYHX4poj1J1zzGpyBE7Ppp1Fzb
         OKHfCe/4gW73BIxi4QtP8jQ1W6WE1u36KX5YZSxRfabzg9wMWV9bzTgOV12nXED8GbwD
         2pocmcljZW5Jt0geHU8V92ErmjD4rDR/AK8omkW35tTuBcJKf/l757eBbmR+HKBAwGuB
         cVcg==
X-Forwarded-Encrypted: i=1; AJvYcCWk8k1SDQHXXpvaQCeqoNCnr27m8CsH6nzHgsLxmy03DCI/udD1TUlvWAZ1OTuClXHKrOk1b193WPMWPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+acASg80MK6+xGog3yZ/AKCpABMbxWwcFVEf0FrngHac1xRf1
	k3ZjSzjUQ0Cgj27ADWbZly+JjnBZ4SjuSR/CD9T3jBmWoK2rWFda0fpm
X-Gm-Gg: ATEYQzzhguqGsD2KYhVT3yD7fb8I0FQektyhSnPEj1CGIvOVPeGMshrMCO6L6pzV/vK
	BrFh1QQ2wZhN1arbOnq9+m1C2meuqPfbnD+9vET+6Zbkd5j2okQ13L8HCr2PgFD3Da7BmJqk4if
	tSbChycRKgrzqv778AxLMVbb93Z1x4ZoQGzoE0bP9qhZhU4NEIb7XGvyfTMulcg204E5z8fDQ9n
	UMIDpY9v7KsPXzSxwlOxwvIiQitwNU5dY9IxUstmtjz1hcuBbViM3kGaaS9LUh7N7cSQSJxI7LM
	n6FEayg1Dzu8c+EiYf2XhmwbmW9BdIZjk/toucs9SAzk6WdiUmxw4rp5hFtvqhyW9vhaROJVrY8
	W0nsUrm6PevL+kKjsitJOCJ2Cm3NGhm6BLE/8+UIKv+pSNS69c6rs8JJzYpgj9yD/TanK/uGJnN
	VopdiPJ9tARdzXpyoRCJGJZHr0HttLo2CDYyskUXggpaxn7FZCnMWN/NUiBI02pWh5Z091VNoZ
X-Received: by 2002:a05:7301:6781:b0:2ba:85d6:e777 with SMTP id 5a478bee46e88-2c185d69f40mr273561eec.2.1774569341661;
        Thu, 26 Mar 2026 16:55:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec49615sm3981228eec.11.2026.03.26.16.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 16:55:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ba8848a3-03f0-4113-8db4-d6dd46a57959@roeck-us.net>
Date: Thu, 26 Mar 2026 16:55:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
To: Conor Dooley <conor@kernel.org>
Cc: Zaixiang Xu <zaixiang.xu.dev@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roman Gushchin <kfree@google.com>
References: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774429690-129139-3-git-send-email-zaixiang.xu.dev@gmail.com>
 <20260325-napping-turmoil-de37168fb072@spud>
 <09105b02-3d85-4808-ba0a-f3799787425a@roeck-us.net>
 <20260326-lullaby-elevator-3a3d25e9a6c0@spud>
 <20260326-opposing-footsie-33a0deb2ba90@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260326-opposing-footsie-33a0deb2ba90@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 10:45, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 05:42:30PM +0000, Conor Dooley wrote:
>> On Wed, Mar 25, 2026 at 06:05:22PM -0700, Guenter Roeck wrote:
>>> On 3/25/26 11:20, Conor Dooley wrote:
>>>> On Wed, Mar 25, 2026 at 05:08:08PM +0800, Zaixiang Xu wrote:
>>>>> Add YAML devicetree binding schema for Sensirion SHT30 series.
>>>>> Use fallback compatibles for compatible chips and add optional
>>>>> interrupts and vdd-supply properties.
>>>>>
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/
>>>>
>>>> The robot did not report that this binding was missing.
>>>> It also told you not to add these tags.
>>>>
>>>> You also ignored my and Krzysztof's reviews.
>>>>
>>>> NAK.
>>>>
>>>
>>> Maybe we should just point to AI feedback:
>>>
>>> https://sashiko.dev/#/patchset/1774429690-129139-1-git-send-email-zaixiang.xu.dev%40gmail.com
>>>
>>> and only get involved after AI does not report any problems.
>>>
>>
>> The presentation of info in that is weird, it creates a pseudo-commit
>> message, and then goes on to talk about things that the pseudo-commit
>> message has had culled.
> 
> How good is this LLM stuff at figuring out if previous review feedback
> has been resolved? Or is it not capable of looking at earlier revisions?


Both are interesting questions. For the first one, I had noticed that, but
to me it seemed that the pseudo-commit message is an attempt to create a concise
version of the commit message, and I have not seen evidence that the later
comments did not also apply to the real commit message.

Anyway, copying Roman for feedback on both.

Thanks,
Guenter

