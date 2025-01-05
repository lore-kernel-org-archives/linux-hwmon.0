Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884361547F2;
	Sun,  5 Jan 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736095331; cv=none; b=fxzcVV9XZay2+HwS1fbXoiacVTCIHyFA+LfKexc7kGe35eph/jnGESxM4TsPem7AZ8bXsZRINfTRzEkh3JQwkDzFgPbNQl3LggSIUS5/KghGuZkHFrp7aHWp4p/vS5WATfuqnrKNofkVaf15bQqqkX48EMHmLec+iGhOQzklIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736095331; c=relaxed/simple;
	bh=bKBx7aitlIazaqZNctOn1VJbBNa3kahRJ/wVkoik0ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+fUJH2hAzVVVbb6+3YA3/7MGMG3mtCL9yKdfc86K8BjJGMKzXoLgJUAx4hYHbnb3YQRbwl/vjbV94fNSzBQ5KN1k7Wbq1v5TWgh7skWA4t8GjvnWqVm8ElKn3gQ4xJMwFriW8qJ/TwogHBl+okUKU5sAtNqmTnPxuF1jmtG7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8E8edWs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8E8edWs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2165448243fso230858245ad.1;
        Sun, 05 Jan 2025 08:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736095329; x=1736700129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2sB/zlKcQkKZFXBCL4/xaZRFw1Nwl9vG4ydVqMtfyLo=;
        b=U8E8edWsS3nSaDQY0ZJiviZrvE2bWkerRvzon3wXixXatHaPvIvSDbHz1KmM/F0GcR
         wMr7bt+VTC4jvmyh1CCaZWkEuAlolDrO6S44mwcoqgCLXIdjaTYLQw54h91+5/bBZ9TL
         gR+CZhkyHSkx8YrBEKoMQSYuO4SJUIhL7CiNdwjy34xXXNv00ucQYG9wZhkH5qn3N4Tn
         C+yMp3gTRerEDJFRQ8yPdKOGomxrquiE+ga3YgdXRyq1JElq9/k2MipxcLiDQexN8q/g
         IbDeCstdlfsueoZdJkVskIACJxQeWqQbOgpvir9unM08h+5VCuvWfaEQ+GneJ8CF3Cbn
         rzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736095329; x=1736700129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sB/zlKcQkKZFXBCL4/xaZRFw1Nwl9vG4ydVqMtfyLo=;
        b=I8pHfjW4S4uSm0LQDDvebb2qjyTuOfdWZxrvbQsRdnz5aJdr6wq/a3HMar4C1No88s
         F1RAoItCqlpq8zVwNurPwaIzgLfwLXteWak/1OIF55/Z0HfMpT3JnFNdaBQpOiE4egev
         iu0Sf5anwgdBVQrFg/TeWkO0WjAe5oHp7AH0LFyQkqQuASlM+OSYL8xAnhU3Mor111AB
         nvS8Df6RDTulzEkX7Zxzk3EcNKEsyHgc96HHnkcs/QbCsPeHHWPBWVvG0sPzV4+KbOaJ
         H59bvksRK8KMzkrr5T+Fn9ZdEQIstHITMeJfRi2dKIqjTOIJatNc7kBtxUPmlE5zpanE
         SqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Yn5IO8SyQrwbwFGYK45/3iuGOeue3ZVjdSympXZj2zz7/ekzY7aA1exh9R2BR7veOlR2ou1DMjxQHiJl@vger.kernel.org, AJvYcCVflFubI8KR3rPq00Zx9P8e90bVToqN8k4/3OITlj3+/YErCutvLofYkPWvOZYEL8UofsGFGIMzu27deA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/4ObzdF+5nx3KGkTBLlScAZ1uYqT0lP9M4ReV5VSDdf2u79l
	rsAlidK+7EyscuQI2tIWo/ocELq9pfG6h6fb0bhNrfb+vrdkQfhzgVtjXQ==
X-Gm-Gg: ASbGnctumJraNRw67DRR5QNzaeYLjIdG+P/ITCS6lgiDVO+PZMlhXecsxoh0FYladm6
	d42FQpJwQso/oeU7dhLqcvd0f5Y5uGmF3VFfAQBkXZQMIeJYv0dRT0/IgDK4elyv9+tYZe2ExM+
	0Y/L0mEqLt+oH9u5tpTvA1RyQZToAwNNCAo7dqxWdY5FSX3Ca79BLu+/WOzMwbWv/N/zj0fb/sL
	hrDbmE+o6gjJP4571KMl7hFGlTd0H86moh+MaUSvD9hVeTbVtKCFkZ2V1aESs2aKpiyZxxfXt1I
	1HOx2InC0rd8ppy1VPc5dx3fRs5KwQ==
X-Google-Smtp-Source: AGHT+IFnvnWyBTlD6IdGIAww0zD0t4sJ2UMMMDn6ANsHJ58TeSm/o3SsxFx5zzLHxSRyqU6x3B7rzA==
X-Received: by 2002:a05:6a21:3997:b0:1e0:c9a9:a950 with SMTP id adf61e73a8af0-1e5e081cb96mr88420439637.39.1736095328676;
        Sun, 05 Jan 2025 08:42:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81582asm29766187b3a.9.2025.01.05.08.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 08:42:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d1ae914a-26be-437d-ba0b-60aa327c2218@roeck-us.net>
Date: Sun, 5 Jan 2025 08:42:05 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
 <20250103195810.GA2624225-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250103195810.GA2624225-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/25 11:58, Rob Herring wrote:
> On Fri, Jan 03, 2025 at 11:14:47AM +0100, Peter Korsgaard wrote:
>> The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
>> always be desirable because of noise or power consumption peaks, so add an
>> optional "default-pwm" property that can be used to specify a custom default
>> PWM duty cycle (0..255).
>>
>> This is somewhat similar to target-rpm from fan-common.yaml, but that cannot
>> be used here as target-rpm specifies the target fan speed, whereas this is
>> the default pwm to set when the device is instantiated - And the resulting
>> fan RPM resulting from a given PWM duty cycle is fan dependent.
> 
> I still don't agree. Quoting Guenter:
> 
>> The two values are also orthogonal. The fan rpm is fan dependent.
>> Each fan will require a different pwm value to reach the target speed.
>> Trying to use target-rpm to set a default pwm value would really
>> not make much if any sense.
> 

That is a mis-quote, really. I was talking about target-rpm. The property
to be added here is default-pwm, which is completely different.

> But RPM is ultimately what you care about and is the fan parameter
> that's universal yet independent of the underlying control. RPM is what
> determines noise and power consumption.
> 
> There's 2 cases to consider: you have a tach signal and know the fan RPM
> or you don't know the RPM. If you have a tach signal, we probably
> wouldn't be discussing this because target-rpm would be enough. So I'm
> assuming this is the case and you have no idea what RPM the fan runs at.
> The fan-common.yaml binding is a bit incomplete for this. What you need
> is some map of fan speed to PWM duty cycle as most likely it is not
> linear response. I think there are 2 options here:
> 
> Use the 'cooling-levels' property. Fan "speed" is the index of the
> array. So you just need a 'default-cooling-level' property that's the
> default index.
> 
> The other option is define an array of (fan RPM, PWM duty cycle) tuples.
> Then target-rpm can be used to select the entry. We already have
> something like this with 'gpio-fan,speed-map'.
> 

That won't work. Literally each individual fan (even the same model)
runs at a different rpm for a given pwm value, and I am sure the rpm
for a given pwm input changes depending on fan age and temperature.

Quoting from the NCT6796D-S datasheet, for an example:

"The default duty cycle is 7Fh, or 50% for SYSFANOUT, CPUFANOUT, AUXFANOUT0, AUXFANOUT1,
  AUXFANOUT2, AUXFANOUT3 and AUXFANOUT4.
  Note.The default speed of fan output is specified in registers CR[E0h] ~ CR[E4h] and CR[E7h] of Logical Device B,
  and the AUXFANOUT4 default speed of fan output is specified in register CR[E3h] of Logical Device D.
"

Note that the term "default speed" as used in the datasheet refers to pwm.
Again, from the datasheet:

CR E3h. AUXFAN4 Duty Cycle Register
                 ^^^^^^^^^^^^^^^^^^^

Setting the default value for such a register is what we are talking about here.
No rpm involved, just default pwm values. This is completely independent of rpm.

Guenter

