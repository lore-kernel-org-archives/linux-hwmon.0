Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E981D5AB2;
	Tue,  5 Nov 2024 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815905; cv=none; b=Rm1E+g0gH1OPJFJi7CPru6OBvarWLwhz8iP7rK5Se7iPlEo6//TkjM4OG3IKGJShkio5mYcpTNa3tNcYYbpKFAkjrZNvdiompjyQhXjsQ7AfLh/avQ34B7kror4JBc6P4MYbVTn+WWrNlN4XUBFQSMBvSt2oCbvaZx2GNaUL48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815905; c=relaxed/simple;
	bh=KAmosABcY//LvUIistxErNs0QaF+wfIpi4hAoGtVv/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyyhd5mE24RwP6Mhx7SyuGy47yJkh8GqrQI6Rh45chh29zEFOsIJ4H5x9SL74jeL8wUhB7zMyGbr2aU1Y1nyCRW3D+RtofoThtpDOcW44XgsgL8dPr0oVdRUCh9twnzWA+YJyA33+1YCvuWLDCDUYWe77FTikclOg4VsOs2Xhks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OndaoUDU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OndaoUDU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e7086c231so4794298b3a.0;
        Tue, 05 Nov 2024 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730815903; x=1731420703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh0cQeTaKDFLnMA6STcXowxEluTjQai12rpqgAAbyVQ=;
        b=OndaoUDUPxmz3L4yVjUnyLPj07EvWCgrnjrxx6nFc/RIbxbbcKmcK7p4XHttVqQhr9
         U3WN1Tmh9w4Pt28GUnRWG9s5pCC1byYE6Xc2/lKJfoOgiLifd3nmvbd9FbTQXMTGLICL
         3vCdiCDcz/xyicqsAWxd2Ws3Idz1lNUqOH9h2E2onJ0jNsZ4TyVWBn5AJGpY+zOVw9kg
         1fTKn6TTU1uDc9hBMb+y8E2aF3bqAowAJv92fQQeSQc3Zvewpgtzati/5q5fV4Gw1+5z
         Tia9Lodk+BpUBTnuo4JoQOClOd6ufOo/s9nyv3L3W318uc6p68gc9adDx2F/13bXtXrV
         qYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815903; x=1731420703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh0cQeTaKDFLnMA6STcXowxEluTjQai12rpqgAAbyVQ=;
        b=m85ndnHmmOKWhWRZIk9kMfSlbGNwzwA5GBrvzxeXFG1b4ADvV/+wqB2l8e3BCojL2E
         LcEwpJiF9Gtfl8xiCzzDD0ZXRVC9VSrHy7TObrSlc0lgr7Ip9qu4hdi1aVD20cOa6zLj
         r0bZ9dafsZJEi+gnQXpssyhg30LBk/zeyUiTe3FGdKvH2mFkuQKLY/VjCY8stFP0I2hR
         cEDsVuGtGYcX92bFrd8Joz8Zn7cxGciXiehIknFSNLvPMJ9gsDfuMR3XkC+nzgVK3yGl
         es6S9QgsJL5xClR72VXBAjxmLU8bGgAl88fgF5bYV707NKWBN/wjXEJ7EDeIrOsIZryx
         YOGA==
X-Forwarded-Encrypted: i=1; AJvYcCUKa4DCOEC2hnQb57KGBBlz9p82DZQVA/mMi9KLs9K4LKFrzUlcDE9MsBL84vtkeqPc39PWcZKuJbN4@vger.kernel.org, AJvYcCWuExbML0t9snFDblFwilWRlUWA74VC7Er9toArLRjFjbKu8NYopB9hIk5YuHpmgyoF7+CMTOb7hIeOHOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0aj/WQV09GA2c0SNUPgMkRBHSNrcwMY34TNkZq04q9zUp9je
	z+zFlLe82bhVCZRxtXGKavfFxnCd/Zo4amvxuT++F6YUAd85RuWe
X-Google-Smtp-Source: AGHT+IEQXpfmwmcIlk/1c32YG4XNxk//3bsjHLomr42D2DhT0EpPn7qS479JNV8N8AOWNy+d2Gz1xg==
X-Received: by 2002:a05:6a21:1193:b0:1d9:61:e779 with SMTP id adf61e73a8af0-1d9a83ab127mr52947194637.4.1730815902884;
        Tue, 05 Nov 2024 06:11:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2ebebcsm9975234b3a.172.2024.11.05.06.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:11:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <df2eaf57-a4ea-4378-8f24-a843084eb1d6@roeck-us.net>
Date: Tue, 5 Nov 2024 06:11:40 -0800
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
In-Reply-To: <20241105135259.101126-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 05:52, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a dead stop, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which

Doesn't this imply that a minimum pwm value is needed as well ?
Super-IO chips such as the NCT67xx series typically have two separate
registers, one for the pwm start value and one for the minimum pwm value.

> need to start at higher PWM duty cycle first and can slow down next.
> 
> Document two new DT properties, "fan-dead-stop-start-percent" and
> "fan-dead-stop-start-usec". The former describes the minimum percent
> of fan RPM at which it will surely spin up from dead stop. This value
> can be found in the fan datasheet and can be converted to PWM duty
> cycle easily. The "fan-dead-stop-start-usec" describes the minimum
> time in microseconds for which the fan has to be set to dead stop
> start RPM for the fan to surely spin up.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> index 4e5abf7580cc6..f1042471b5176 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> @@ -31,6 +31,17 @@ properties:
>         it must be self resetting edge interrupts.
>       maxItems: 1
>   
> +  fan-dead-stop-start-percent:

Personally I don't think that "dead-stop" in the property name adds any value.
On the contrary, I think it leads to confusion. I head to read the description
to understand.


> +    description:
> +      Minimum fan RPM in percent to start from dead stop.

"to start when stopped" should be sufficient.

> +    minimum: 0
> +    maximum: 100
> +
> +  fan-dead-stop-start-usec:
> +    description:
> +      Time to wait in microseconds after start from dead stop.

Same as above for both name and description.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>     pulses-per-revolution:
>       description:
>         Define the number of pulses per fan revolution for each tachometer

