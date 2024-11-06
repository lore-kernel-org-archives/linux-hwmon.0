Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E11E522;
	Wed,  6 Nov 2024 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730853270; cv=none; b=jmLKWpGkLP0uUYwdKYctRxp76C92dlkZJz2X0TEgFwG+Q/vQGeW7te5jXzDqYVuQCeL+13YkmEhLfCuU9nlBPgv7nULbWHvFV8xoxLDt79bQD4NESl/Sb6gnJCKOzNNvJ5gVMFbvVE/KrQfnouw2103OlYJCutvfGfRhLzpRmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730853270; c=relaxed/simple;
	bh=u8TEc0hX2TrP8CmDt/UvnD1A2cGI/ey4CDkWZ02goQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mmo7DCGlH78eIc/9NqBkdKaWWjoUAO4ezIrK4vYpjHlPCFogTZImr4D/hKtOw1Xa8mDDowfnxEv8foLUoNWPxtWZone2Pb5D4HXKr1IbmOUznP74iDj4JG4E+Ha2aatU5AUrZRhaSMqXX77vHKHgxAfsbLFCOOC0Z6nFnLK/Ong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fbt3TQg7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fbt3TQg7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e52582cf8so5290868b3a.2;
        Tue, 05 Nov 2024 16:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730853266; x=1731458066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EoJomedHE1ufrTbGfCTqbnhEZxPGAgl2MOU3g1a1u4A=;
        b=Fbt3TQg7mb/5OT7k83J/2aPIPBRnLcEu5tUjhba7SovUz4yhe+JOAnTPAmEyFJ/vfb
         fGd2uiXy5uOY3pGv0uhwliUD49axLZudPgVH+A9ZQkDSTgPJ+RSCnHtD8jemEArDqfun
         FFh7k+cRfu2Pt6Ey9R9Tt5FSwYlMRGS0OraLfk5prUhmMFRJLrSUrRPFHEmfHwDGVbYl
         /qsZ7LQAOvSmyN8wJnq4tS4/KY2ub3N2tHmSKAAGcE7P2XvB90yHuic/i5MoSifnOWjB
         Ma3HhE2RORHNK6Rqbdp9cX1ogxeLeNjAyvbKjBkE6U6Pa6ajBdramCUCQEjv4zhEpU94
         c+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730853266; x=1731458066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoJomedHE1ufrTbGfCTqbnhEZxPGAgl2MOU3g1a1u4A=;
        b=BF2t8c//qlfP71ZTWMOfauDu3s0dKLU18bmT5/qvXNsQfZnQ46kMZI6hrmnt3IhNgj
         r7V4jGuuK5+e0MPVKEoVyJq9yniJwnAdNrQ7Tfr2ftAKaGLNHVX4zRpDcGj+RNpVuHS2
         vCTd+niNoHMndIwjymw8RCFGcbVhxnmVGSQYaeMgywPYGDGm5LBzzA4SZvWE2Ix96E4M
         xxLlEDwtl2oxPkBAtm0hUtolBFqcNriyMwGwdJcRcZrJ26RbPcVYxstuCgxV8Gt+GC/H
         ervappckUB+Aks56yxSwsjApKrrDZfq8EngNarbR/vOjA2PSiJxIz5sSyCvHJBm9Jj3J
         B4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhAHY+QfgwEPXU34OtwtYZU12f9C7k6ckHtDYc3rYrguwRpg6n7gm3H+4PfuS12F+h/CyJ9VQeo8xH@vger.kernel.org, AJvYcCX0TpU9IyjiGzhpwyXmfmVTdEBUOBc9IH8xX/yhHyz3m3e2pWnB/YH7qZMVVDy6+eJ8kcp/ZqvjpDikSgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvBUQ6HUcxruF9ILG+b0LrVTsTi9oaInxj2sStUthFejS7H57v
	+b670oe9DJ+mwtS/pcom/SjK93fzBFu3Nj0qr8lrMRsyFH/EpFGRZY4D1w==
X-Google-Smtp-Source: AGHT+IHLGOqHgvUYNfBtvEZeGBBAknaVPyhl0n2WXVh++Ke8CLX2Uv4/UJZZ0MOI/C6fM7Kiw28IOw==
X-Received: by 2002:a05:6a21:7886:b0:1db:e177:7737 with SMTP id adf61e73a8af0-1dbe1777839mr11149502637.8.1730853266306;
        Tue, 05 Nov 2024 16:34:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a5a3205sm151107a91.33.2024.11.05.16.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 16:34:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1a8b0024-97db-4c1c-9d04-45057a2ba800@roeck-us.net>
Date: Tue, 5 Nov 2024 16:34:23 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document start from dead
 stop properties
To: Marek Vasut <marex@denx.de>, linux-hwmon@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241105135259.101126-1-marex@denx.de>
 <df2eaf57-a4ea-4378-8f24-a843084eb1d6@roeck-us.net>
 <189cd4b5-005b-4311-a5de-2b376eb0b9d8@denx.de>
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
In-Reply-To: <189cd4b5-005b-4311-a5de-2b376eb0b9d8@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 10:53, Marek Vasut wrote:
> On 11/5/24 3:11 PM, Guenter Roeck wrote:
>> On 11/5/24 05:52, Marek Vasut wrote:
>>> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
>>> to spin up from a dead stop, and can be afterward throttled down to
>>> lower PWM duty cycle. Introduce support for operating such fans which
>>
>> Doesn't this imply that a minimum pwm value is needed as well ?
> 
> It depends. For this fan, yes, it does stop at around 8% PWM duty cycle.
> 
>> Super-IO chips such as the NCT67xx series typically have two separate
>> registers, one for the pwm start value and one for the minimum pwm value.
> 
> I use plain SoC PWM output to operate the fan. This one needs to be set to higher PWM duty cycle first, to spin up, and can be reduced to lower PWM duty cycle afterward without stopping.
> 

Yes, exactly. That is what many fans require.

>>> need to start at higher PWM duty cycle first and can slow down next.
>>>
>>> Document two new DT properties, "fan-dead-stop-start-percent" and
>>> "fan-dead-stop-start-usec". The former describes the minimum percent
>>> of fan RPM at which it will surely spin up from dead stop. This value
>>> can be found in the fan datasheet and can be converted to PWM duty
>>> cycle easily. The "fan-dead-stop-start-usec" describes the minimum
>>> time in microseconds for which the fan has to be set to dead stop
>>> start RPM for the fan to surely spin up.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Jean Delvare <jdelvare@suse.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-hwmon@vger.kernel.org
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/ Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>>> index 4e5abf7580cc6..f1042471b5176 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>>> @@ -31,6 +31,17 @@ properties:
>>>         it must be self resetting edge interrupts.
>>>       maxItems: 1
>>> +  fan-dead-stop-start-percent:
>>
>> Personally I don't think that "dead-stop" in the property name adds any value.
>> On the contrary, I think it leads to confusion. I head to read the description
>> to understand.
> 
> The documentation refers to this behavior as a "dead stop" , hence the property name. I can change it to fan-stop-to-start-percent ?

I do not understand the need for that much complexity in the property name,
and I don't think it makes sense to name a property based on a specific
chip documentation. I have seen that before, where different vendors use
different names for the same functionality. That doesn't mean that the
vendor-determined name has to make it into the property name.

As an example, Nuvoton calls the values "Start-Up Value" and "Stop Value".
ITE calls the start value "start PWM value" (and as far as I can see doesn't
have a separate stop value). I am sure pretty much every vendor uses a
different description.

I am personally not a friend of long property names. Having said that,
I'll let you use whatever DT maintainers accept. They may have a different
opinion.

Guenter

