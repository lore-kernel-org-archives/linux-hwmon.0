Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DE1847
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Jun 2024 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717743230; cv=none; b=uHk1idZpFaxYyeOCkVWvEOyeEAWXImDTw+zhzFOJ7ucFw3OtLehNlU1vUqm7aoPZqbGf+9iNPWGw6Z7zP03QPW39hxQ7ZcMKxIUkUlx9uAG9Rz+yALb1WZUJm8STGcUvJ6yBOcvjYZFvMYjMDXtDBQ4niK8ie7OKqnx578pAUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717743230; c=relaxed/simple;
	bh=KNGyQXdTnutaMvHHVdH0giLjLucmMgCVt/J+Na13hSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YPpMmMCunlDJp6WmT26DYfveu0c/uvmIGDf6YshaEbz2JqzXT8ID6KZxqOVDggRBfyCI4FezRPyT0BYz6NJx6xPnDZa09ipQtSoXFM41yx99hGSTxbksidth2K2ONUwxfFicY+QftWczfGzP2GccOV8GW5pXFugYVfv4UYwCPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fsvoWktV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsvoWktV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42163fed884so8045875e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Jun 2024 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717743226; x=1718348026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oy9paXt3y1M6rnKNIikFuvNbwWD5iuAyif14OquD/E=;
        b=fsvoWktVwTaWqYZNsf7Lq3m9fTPvqExM1TMNO0b0mtSosIub2tBvVYjeZ+xo05H21d
         fdKOYRS0jIx9gG0pkfg7XdFx40hhPLIh1cO4eIlarnX+k5pWB4pjqVOktbvoHJ9R34x3
         KRUc7iLmCWlUCnBZvFNvski68q2izOdlNXcP7ammjT8czxN3+0yk2iCqO96TudCA7uq8
         x7f1UVSFtOKXuC6jUZNtHWR3WBaZN4P7hXLNmFSBGDqZI3mOHa8pCnEnJcV53tDvDNt9
         rdYHpzV2Wgb1yJnbE5IxVLS/iMfi9ZE7NK1sZE3avm/S4uqgMAtvfSrGX88n0i8kk+uB
         qC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743226; x=1718348026;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oy9paXt3y1M6rnKNIikFuvNbwWD5iuAyif14OquD/E=;
        b=Uo+frjq0mhjNP8I3MbaCa9OF9ExOeU5Mz7XgwvD4UWb1Eoy1HoFu7b/DaEacr7UZiD
         RZ/mHuMI66DGjBiSX0XF9JX5Un/kss+5OPZOKpK8+EXRFIvXXZYhZASvk7RP6CI3gwc1
         R5tL1g0DJXYN1Pbc760ipyp2bLp8bF4C5oo6crnjvF2lFqK98C3sJM1VfDxoCkAQnQjl
         KM5pdOY4t7UE93HD3S9Ky7OlpqDENbxpKrVRqa7JhXwj3Ds6At3ISKltVXKp6tpYWvny
         aQpQ7G/yzVBm5jg1YWIHfQqmY95tGbIWTR0/ugi1UPlTaHqblgR3roSjuEo7Yk5QvRVP
         Zn5A==
X-Forwarded-Encrypted: i=1; AJvYcCVjGbE70voANeP33Xr5P5nBKbBMLi4rzJB7RDrh3+84UOUctQyuBvlbeQU8KB886zcO2avxsUUQU6tHU6KF5ITd4EkEBPD0Q+k7RB0=
X-Gm-Message-State: AOJu0Yxp//ehcpAilFJqlXgsHYIxccORBHvglkf2W21+9e22Mz6hhjLf
	6Wo/1kCwSJuMo/+IblpCN/gId5GgWGy1gGe6pgAkMHZTY+AhC7GC9emjQZVbT27UuuP8Jba/6me
	wcnSKtQ==
X-Google-Smtp-Source: AGHT+IHgA5lgH7zAw9Sqnzi5KBTiy7erUxiMScCpH9Hr5Dutp39kMuOAvdHBlzhbeOGArQ1G7E7JlA==
X-Received: by 2002:a05:600c:35c3:b0:41b:d4a3:ad6a with SMTP id 5b1f17b1804b1-42164a02b99mr14690295e9.17.1717743226409;
        Thu, 06 Jun 2024 23:53:46 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490cesm77164715e9.31.2024.06.06.23.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:53:45 -0700 (PDT)
Message-ID: <22de160e-d925-4295-8208-f03a44f026bc@linaro.org>
Date: Fri, 7 Jun 2024 08:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: lm70: simplify with spi_get_device_match_data()
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240606142515.132504-1-krzysztof.kozlowski@linaro.org>
 <32a542a9-e338-4f8a-af24-a32c8426e619@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
In-Reply-To: <32a542a9-e338-4f8a-af24-a32c8426e619@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2024 17:56, Guenter Roeck wrote:
> On 6/6/24 07:25, Krzysztof Kozlowski wrote:
>> Use spi_get_device_match_data() helper to simplify a bit the driver.
>> Also kernel_ulong_t type is preferred for kernel code over uintptr_t
>> (needed for the cast).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   drivers/hwmon/lm70.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
>> index 481e4e1f8f4f..0d5a250cb672 100644
>> --- a/drivers/hwmon/lm70.c
>> +++ b/drivers/hwmon/lm70.c
>> @@ -169,11 +169,7 @@ static int lm70_probe(struct spi_device *spi)
>>   	struct lm70 *p_lm70;
>>   	int chip;
>>   
>> -	if (dev_fwnode(&spi->dev))
>> -		chip = (int)(uintptr_t)device_get_match_data(&spi->dev);
>> -	else
>> -		chip = spi_get_device_id(spi)->driver_data;
>> -
>> +	chip = (kernel_ulong_t)spi_get_device_match_data(spi);
>>   
>>   	/* signaling is SPI_MODE_0 */
>>   	if ((spi->mode & SPI_MODE_X_MASK) != SPI_MODE_0)
> 
> I'll apply this patch, but ...
> 
> I take it that the earlier claims that driver_data must not be
> something like "(void *) LM70_CHIP_LM70", where LM70_CHIP_LM70 is 0,
> was wrong. I'll start reverting all patches which changed starting
> enum values from 0 to 1 based on that wrong claim.

Yeah, they should not be 0. I think Jonathan also brought it some time
ago for iio drivers:

https://lore.kernel.org/linux-iio/20240226192555.14aa178e@jic23-huawei/

but if all the ID tables are complete, the 0 will work fine:

https://lore.kernel.org/all/20240413154511.52576-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

