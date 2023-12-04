Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsapIfs5"
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67E0101
	for <linux-hwmon@vger.kernel.org>; Mon,  4 Dec 2023 00:06:49 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33348e711e0so572758f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Dec 2023 00:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701677208; x=1702282008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SQPC1k8FTDPz9MCtBbupDwJS3N6SevnSxOhLsecLNY=;
        b=BsapIfs5yl5EWZUJmQ9nmL7e3CzXX4jLR3uJz/OPnvaCwhK9WUuoz9d/Xq4MjZQOT8
         0/Fvm+530VT2n2hIbAlSiSXgfZzWSfJod5XOLx3YB4XkQtXaHHF6pN7GbrIzRv+ZhHYs
         3gO8TaVj7tbHqYCqevnjfRH9OSWLJIR1vZv8oHB3hWSuTYh2BuEp6exHVOKEg271jKqp
         23fUHTEMVg8Tho+R4EC6yccgMkQdl58cD2u3Eic/V415PjrPUfnos4zHs6NOXAez8g7+
         ZghUROG31XQ3oFkYsc4vxlsKieX+dkDGP1YVHRDJttE3EmGIaQDxhwHdMg5yCQG4VGDm
         HqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701677208; x=1702282008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SQPC1k8FTDPz9MCtBbupDwJS3N6SevnSxOhLsecLNY=;
        b=PN3fvriZ9JIIYi5VSlb4faBcWCKfcf7/N4v5v+dmVunfSqr+1Q8BIyUgqu/oYhB2g/
         BikyGSRj/pfXy0l8symhwJmhHy0zH6xchQ+tzXw8wtl4dWMKTUC+zO5B3dxf0Igzdd3m
         p70d0Tg3d1K+kxfPaQNy+Jf09Yt04d6CbeIfnGFcHuODvZdBOnoYghf9pzjmTNuysoyN
         yV1ZOiteEYe/q0CybXhmNLkDacNBWZq90unq08jCDWCQ+bWUFOW9vtp6meS0vdobrTxt
         1RG277SQZXya0e3tIMbIQGTXTlZqlbu/K09D11+1ESmMRSmdhcNzMAoaaJl3ZPylJxu7
         eDlg==
X-Gm-Message-State: AOJu0Yy3EGSiCcwjRPsdXuf1+ddiDdhkRP2QRMt8ChptMKdp3iCYV66o
	pcbx628pne/5ResS4dB+pCfrPA==
X-Google-Smtp-Source: AGHT+IGWv0u+9neIHj1nwxekIP34hUjVFaM+7f9uyY71muGCMC9Jb66oXkE4DaWCyEEsCph6ulV5jA==
X-Received: by 2002:adf:e40c:0:b0:333:3cae:84cc with SMTP id g12-20020adfe40c000000b003333cae84ccmr1477581wrm.138.1701677208201;
        Mon, 04 Dec 2023 00:06:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id l3-20020a5d5603000000b00333371c7382sm6402030wrv.72.2023.12.04.00.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 00:06:47 -0800 (PST)
Message-ID: <eff4defd-dfd5-448b-9056-d2f711f14018@linaro.org>
Date: Mon, 4 Dec 2023 09:06:45 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
Content-Language: en-US
To: baneric926@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, kwliu@nuvoton.com, kcfeng0@nuvoton.com,
 DELPHINE_CHIU@wiwynn.com, Bonnie_Lo@wiwynn.com
References: <20231204055650.788388-1-kcfeng0@nuvoton.com>
 <20231204055650.788388-3-kcfeng0@nuvoton.com>
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
In-Reply-To: <20231204055650.788388-3-kcfeng0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/12/2023 06:56, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> NCT736X is an I2C based hardware monitoring chip from Nuvoton.
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---


> +
> +static const struct i2c_device_id nct736x_id[] = {
> +	{"nct7362", nct7362},
> +	{"nct7363", nct7363},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, nct736x_id);
> +

All ID tables are next to each other. Move it down. Why does it not
match of_device_id?

...

> +
> +static int nct736x_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct nct736x_data *data;
> +	struct device *hwmon_dev;
> +	u32 pwm_mask, fanin_mask, val, wdt_cfg;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(struct nct736x_data), GFP_KERNEL);

sizeof(*)

> +	if (!data)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, data);
> +	mutex_init(&data->update_lock);
> +
> +	data->client = client;
> +
> +	if (of_property_read_u32(dev->of_node, "nuvoton,pwm-mask", &pwm_mask))
> +		pwm_mask = 0;
> +	if (of_property_read_u32(dev->of_node,
> +				 "nuvoton,fanin-mask", &fanin_mask))
> +		fanin_mask = 0;
> +	if (of_property_read_u32(dev->of_node, "nuvoton,wdt-timeout", &val))
> +		wdt_cfg = 0xff;
> +	else
> +		wdt_cfg = WDT_CFG(val) | EN_WDT;
> +
> +	/* Initialize the chip */
> +	ret = nct736x_init_chip(client, pwm_mask, fanin_mask, wdt_cfg);
> +	if (ret)
> +		return ret;
> +
> +	data->fan_mask = (u16)fanin_mask;
> +	data->pwm_mask = (u16)pwm_mask;
> +
> +	data = nct736x_update_device(dev);
> +
> +	data->groups[0] = &nct736x_group_fan;
> +	data->groups[1] = &nct736x_group_pwm;
> +	data->groups[2] = NULL;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
> +							   client->name,
> +							   data, data->groups);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id nct736x_of_match[] = {
> +	{ .compatible = "nuvoton,nct7362" },
> +	{ .compatible = "nuvoton,nct7363" },

This means your devices are compatible. Express compatibility in your
bindings (specific compatible followed by fallback). But then your
i2c_device_id is not matching this one here... confusing and clearly wrong.

Best regards,
Krzysztof

