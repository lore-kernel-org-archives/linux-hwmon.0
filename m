Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ADE2D61A
	for <linux-hwmon@vger.kernel.org>; Mon, 18 Mar 2024 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710756173; cv=none; b=TBCL7jWhbFMgQymbcZvRVRicc9XRUckQikMIYQsoc0HI8I/2+4Hx7E1FO+n9pUFDPmXEBvcDWzHyZiGF2Xq5O6B61zBS/qxl/DqZ/aBSOzyqkLOv+dZKrqeLWQOpYYPYycr6GB9u2BQp8YaFWewc/XIxPVEa3FFo5wrh5AoLnXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710756173; c=relaxed/simple;
	bh=p8oCZBJnaZY1TnhydoJkfyKUbQPqqcrKyLCf1Bp8ukE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjJsOH7zgnzxqBs7KHkK/n7ZQjUvOaySEHQtnYfzSgRCPl1N9qxznKuDoNDcFFibTDXcMWqgnU0meVzwjBHh0eLuty1r4by/PG3aI3SUMG2UqmHIDXnS999WieOhL5Q9apf1XtHPcnTr4PrVLvHYy7eguyBZYqBq7DEkp224nIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ll+NPcD4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ll+NPcD4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a44f2d894b7so474877466b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Mar 2024 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710756170; x=1711360970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEMyQbDRzxqKimyVxa1436bQdzhWHFiC8NxOg49e5uk=;
        b=Ll+NPcD4II5EP+nb8klOxY+A8iQ7Tu9vIzKS8vHqVSNbWUzz2ddyuEJaiO7wYKePh4
         Xp7kr2D9nKFq4d1JYpr4pm4hXjkxMJPMqInIzDjNRRUj+iSaYXi1e16nduNB1A+VTlGJ
         WsryCvadOE8+jTC7HLf55pfsr+AK+k3eOJj02QFxGtPWF+bj0eOTSakEBvsYnnPlHGsx
         Dapt2AiALme14ze8x9XwF0gPZoh8qV+9UM0Jm8BPc8dmQMsq4N1kKIBQla6j32h5f02U
         JH0mEp+xciElgbIcERkq1zs0B6X4cX2BLH/zR9L6x90rAXMzshQ41b1sEGrv41nbHk+F
         hwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710756170; x=1711360970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEMyQbDRzxqKimyVxa1436bQdzhWHFiC8NxOg49e5uk=;
        b=rOjKIAxJnJzvuzJaGPGEmaYRhD7GgnApdGuoFDpg8AMd4Ks89+dye8XZ6WEBQ2URgN
         AnLzWTqruhOdQsMmnqdwlTzSIQxAtMLCqsJ2bg1lGb8ypg4mB2sWlWMO/wYvc29bLkpg
         zHhcSHvHB+SwBHguIv7vv3iV9gi4sJVhXkmgDUj94aSF58mA1odRRxMk8ka2ZF5Ckvpp
         qKq6AJnC5LbGypF+meUXaFeN9sspAgE6wvRLM5IphwyEMtU/skiVXV0zVwf1ic+EltII
         3gWLLRnvPYy7L3SS3YxKsMZkDOJk9TsJLhbOaiQkX9qkhqpNz/Q0UmPKtluPCX02UQ57
         iZbA==
X-Forwarded-Encrypted: i=1; AJvYcCWhcNixu8zbejKofcbRxTqPcwapAa07E5s/+VypyBQgDbMDg2v+pAtbVTM7FDrFdw2hx3cmm7tkGAtPx3cMu6lcBw5+jnO+sWKhZj0=
X-Gm-Message-State: AOJu0YxUOEi0Rn6Ff0N/qOsNJvn3gB7KWw/r8p+XNgdBW0XbS8fhSJ97
	Ck1PoNQIN5SSidw3czqmDsqM0c9uFTKchmTvk9qoXiq5ywSRl1fdJE7SD85PDzA=
X-Google-Smtp-Source: AGHT+IESp8JqOgCMzQy4GD24NbUZR4t4iaKCi9svywrWQsXddSMIh+tmOtp/jVYc20GN2F5/dnx+cQ==
X-Received: by 2002:a17:906:364a:b0:a46:617e:d3a7 with SMTP id r10-20020a170906364a00b00a46617ed3a7mr7368668ejb.60.1710756170266;
        Mon, 18 Mar 2024 03:02:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id qa19-20020a170907869300b00a46af3d2916sm1844298ejc.168.2024.03.18.03.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 03:02:49 -0700 (PDT)
Message-ID: <7252305b-4c7c-4cec-8ef1-8bf96293b469@linaro.org>
Date: Mon, 18 Mar 2024 11:02:47 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
Content-Language: en-US
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
 <9d1207f1-4941-4f2a-99d6-371f5b4709f5@linaro.org>
 <f281d2b1-54ff-4e5a-83b9-5b05f18c40fb@amperemail.onmicrosoft.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f281d2b1-54ff-4e5a-83b9-5b05f18c40fb@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 10:48, Chanh Nguyen wrote:
> 
> 
> On 11/03/2024 23:56, Krzysztof Kozlowski wrote:
>> On 11/03/2024 12:13, Chanh Nguyen wrote:
>>> Add pwmout-pin-as-tach-input property.
>>
>> Why is this split from original binding? This does not make much
>> sense... Add complete hardware description.
>>
> 
> Ok Krzysztof, I will merg the "[PATCH 1/3] dt-bindings: hwmon: Add maxim 
> max31790 driver bindings" commit and "[PATCH 3/3] dt-bindings: hwmon: 
> max31790: Add pwmout-pin-as-tach-input property" commit.

Later I checked your driver code and this explains a bit. However first
patch should explain that instead. The split is fine, but just lack of
rationale is confusing.


> 
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> index 5a93e6bdebda..447cac17053a 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> @@ -25,6 +25,16 @@ properties:
>>>     reg:
>>>       maxItems: 1
>>>   
>>> +  pwmout-pin-as-tach-input:
>>> +    description: |
>>> +      An array of six integers responds to six PWM channels for
>>> +      configuring the pwm to tach mode.
>>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>>
>> No vendor prefix, so generic property... but where is it defined?
>>
> 
> Thank Krzysztof! It is not generic property, I'll add the vendor prefix.
> 
> I'll update the "pwmout-pin-as-tach-input" to 
> "maxim,pwmout-pin-as-tach-input" at v2.

Except that you should really look into common properties and use them.
Or explain why do you need new property?

Best regards,
Krzysztof

