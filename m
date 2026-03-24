Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB723EAC76
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 11:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352017; cv=none; b=TTNaGUf3fjLVGaVpcjAb70p9DWjhLyIc0UG18g7Cm7MSinZNNtSIRlMxdYk/x6nafFG7DsvtfFp+vfCR6LBDeAVb24KkgYbWQoQSHyASjSk443cjFAZlb36/qFUg6Z79YZ3e72vReoNSb0Rx4CBvgK9Hq7HOpBWXu/Gzfd/tZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352017; c=relaxed/simple;
	bh=GrKvDX1ji57i3Sq2Cn23BB9Ti8XkjnCPU1lJqk5WwGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3Xv1KaVk9J4h2j+PnqqvT1dbzHVgX2TD0g2ImWky8RcpwSCUr9SMpYFUX1vJj7bsfEN+H1KA6Z8/vejb1/yUGJkKV5PKXgtPh9+bY9y4UxQ2u0qZgF3s/5T0hHceFqHIwM0L8kqgvPzPBQBV5mwsrC3aN9j3YEZa8EmNDdnZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhVwMNzZ; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhVwMNzZ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c11c43aca0so1885088eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 04:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352015; x=1774956815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xVLL0DMqhfW1NaHcAuU3NvnXvKaindH3Q3xhBOqsfOM=;
        b=WhVwMNzZnLBjCHUD6vNNsHzXOJujJt6UyA7DBowpss1RT3MryVHZOk6pmX7DTcEbYC
         6aml9UTj46KyyjvAIg7LEffFXpFmJvq+lmFFQQXPOUPcPORvNYAdJ9C60IiBBxFdIVXm
         qL/ViFWm+WDeLMcI6B4oeq9Ly36QGSt3xi2Yh0BEZBy4LUM94Vx09vAaB5Lc/j4Ybtch
         hOq9cwu6QggPv3r0gVrd66S04a6UGKAzLZH9ua8DpBOzgDKLUtmCXcBpCnNW2WN1ofea
         Lc+K7kNXVASIKHxnt+MjDgjydlgq5DELV57+jH5aMU8VzlDXTCCJaPt8iAg2fzaQD+7N
         2zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352015; x=1774956815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVLL0DMqhfW1NaHcAuU3NvnXvKaindH3Q3xhBOqsfOM=;
        b=jS+cmVuZbPEP8TN/kUoJIk70K355bJza0s8EjAko92XJ17OsiBf/ePioFa+9FI93oS
         YPR8qGYDyrjQLjO31+dp5s545n+hc1zbRB8pgQdoruPz7r4Bw5BrJW2rK8kv9AE8D7FE
         uJhjG6XonSYFljEPu/6NZ016GxY9huAwhYpkQCBV3ApL4VMXEZ0mEWfNmUa7+cUNtNbM
         ScWQQPqrYcpSjxBtmDb2oJofmF3NFpCK08JHX8HE5oYHW9gxyCahrnQ1/ZgAQJ8kCUjR
         GhNZq/pO0FVVu+5l47A4BWGU8nw39gw3aZ28+Y5FnNUurk4R5gxIaFxosZTsRz9enFhr
         FGkw==
X-Forwarded-Encrypted: i=1; AJvYcCUVMGF5MfQvPXkQAcv07qmFxRZ2lrYN8HPqFPCvdfGchoVDZA11F7El/Ou5Ivr7mtkCaK6U2QsbY7c6xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYlluYdsBHhwD1E27LHrBnRtWmsPkwliKCdd6ptm045sNNCmOc
	rG2EHSj3cvDoPomV9ocH0HQbeRy57mabrDa+qDpVIqU7jHU0rEuMc9bp
X-Gm-Gg: ATEYQzw+TV1Ym4psk3+X00yrvf8Q4GPNTzvznd/UB+2PgZxwJClG1ItIGwHAOpNjuGS
	NDGWFAIfFewy503DZc8G56ctW1Q6vGP4GqcgksEZIty3IheGngi2fBdaHFEwSYtJ5o4Y59dnlrj
	t3FO31Fu2xZuzXLWq+PNusUsdjcz1CygH/mFGf9slxEakYPe7izr/vBpC7TWohxkoMd3PFQlAlV
	RYHVk0ZAF+OjIGg8jThUN+WuFGsnNQoE6UDmis/1jb4sSfidFVlzxWzsWCc5qPMxeDA8Ocut7Ls
	P3kvJlclUgLujetXKu28tJhN7c5GvNoBx+YUeUq4QGDQkGNFq9LSITyzyenuEakyTqzHclj/I2j
	9dU9LZaRzIlerblMqiWDe6rTSUIqFOe1h8Ff6RsEninMzew3AWQTNsU/9fz2milPBnOMnxXyX9x
	DUHKp4ME3DI5b5KC9PG80BqpKRmrEOCK/YcvXtyiBOesDtvU2TPNiwOxJnrrTM2BXKGTEzA2B1S
	3MNTyL6kOA=
X-Received: by 2002:a05:7300:2319:b0:2c0:c1e0:2449 with SMTP id 5a478bee46e88-2c14b46f3bdmr1419149eec.2.1774352015053;
        Tue, 24 Mar 2026 04:33:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d673asm18181543eec.24.2026.03.24.04.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:33:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <91e527b8-f753-411b-bdf5-7439edb48c34@roeck-us.net>
Date: Tue, 24 Mar 2026 04:33:32 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <d0ed96aa-529d-42fb-a680-917c325998ee@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 03:36, Gupta, Akshay wrote:
> 
> On 3/23/2026 7:45 PM, Guenter Roeck wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 3/23/26 04:08, Akshay Gupta wrote:
>>> From: Prathima <Prathima.Lk@amd.com>
>>>
>>> Move SBTSI core functionality out of the hwmon-only path and into
>>> drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
>>>
>>> This split prepares the driver for additional interfaces while keeping
>>> hwmon support as an optional layer on top of common SBTSI core logic.
>>>
>> This moves the driver out of hwmon space into misc/amd-sbi which,
>> in my opinion, is completely unnecessary to accomplish the stated goals.
>>
>> I assume this is to be able to make changes which do not follow
>> the hwmon ABI and/or to bypass hwmon subsystem review, similar
>> to what has been done by others.
>>
>> Obviously, I think this is a bad idea. I won't give it a NACK,
>> but I won't approve (nor review) it either.
>>
>> Guenter
> 
> Hi Guenter,
> 
> Thank you for your quick response.
> 
> At present, TSI supports a range of functionalities that cannot be exposed through hwmon. Additionally, a new protocol leveraging the TSI endpoint in hardware has been introduced, which, to our understanding, cannot be accommodated within the hwmon subsystem.
> 
> Since we already support the RMI interface via misc/amd-sbi, we believe this remains the appropriate place to continue AMD's out-of-band support.
> 
> I will update the commit message and cover letter to clearly articulate the rationale behind this change.
> 
> Thank you
> 

That is neither a reason or an argument for moving _hwmon_ part of the code
out of the hwmon subsystem.

FWIW, your patch series removes a lot of error handling code. Sashiko has
a field day with it.

Guenter

