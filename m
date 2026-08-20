Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5206338A701
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 05:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202430; cv=none; b=durUCZ5Bu5LNRvmU3T8sT95qlZFHI/Rfzf+TVao4gwfaIRBdoxXk/+3ACb9o0uyGr2yKuL9KOyiqj5tKisBVBRgoC2oWeagUAZBkYKGz0bBHy6XHlEzp3urvNWgYtxqjRvrbYCl9eXkw/crelKc+iuPn70u/+zPsnsndLFRT4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202430; c=relaxed/simple;
	bh=6bQJUpbJ0EYyz3APyA/JGfwVBX3kPSNGdyJ8mz4HVS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=S/4PjsRDkO9XnBgUxD7gCRtOnQL6C4LDrFadbIg1XQNajFP25IiXT+HLqWIDOB44SML251LRjXQQe2QfCVfMUGAHLOvbDx6OYDVZZWgE6tqgBpI5SH87e0S8iEuP7hqm7B2OXRCqTnhMgzsSQeCKqr6F/czPyj7vDdkk5PaeOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV3LERgN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV3LERgN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so385556a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 22:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787202429; x=1787807229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCfnXsQvUdUEVJY7CYJOLHlwTHTW8IYYHLVW+zOQV1E=;
        b=bV3LERgNRRk4hFz2V3y1ovZEMjI2M2SPaGUm/RCI3TmoTx3euVm0Y4oMlS+WdDo5OD
         nCJxJP7DieE/EqlnvNITQfjEix0/PubovF6DGINxPS2cM/LMBup++6JV5LD2HUU10xEf
         CxEv2Wpi1j4a6+urpq/5huax/+l9tEXiy4OE8Dmj1PRKpSxMBux9OFiHvZi9Oi0TS4Oy
         rxBiqXRr5c2x800xHLO21VGJ3qqLDW/7Do0XLdeRReGhY5DTJiYQtP8dlsNTgE5QmS2A
         Vu0DC2HLOWyhlLrSoIZm23uuQKvb+U7EEMz7zB+OyN/ysVAeyDcI1yve2DjwqeaP0quL
         LZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202429; x=1787807229;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:sender:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCfnXsQvUdUEVJY7CYJOLHlwTHTW8IYYHLVW+zOQV1E=;
        b=HLqrzjcskpY+TuUBEKXnagmM2u0nrVnOFyCErSSrebJrzcYIpKMx+WAsXZvvqqw9Dd
         87zzzbq+9Zy3+9EbyLv75K03YmWwJEtdaMFaP054f8lfmnPQI1N3ngwIYpe76fQxL8CU
         xVK5oHOK7FJowWfQ2XNCqKxN8J26in7z6BktpOofr1E1YvParMS+87y6MB+IUsEeeZ9t
         xvQRGghGyvkYgnnCUX+LoHzi0hSjugVJBeExKzsuKLSYRMvd+li7rB1/9LG3gfBTdOSY
         5373R+CdvOB0+N8Y8f4b7v6rjYiQ7SuPvUThKC6WMLle773pqIYAl30alDfTlHEiCnRf
         Uajg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9FshChczwgtulbiJwVlBek+FWZL8EIIOKWtbp+UpoymtFFYiQU3X+iq4INxLsHd0ei2Exuo/yV0usQA==@vger.kernel.org
X-Gm-Message-State: AFuF++lspfCUchJs7EwDyS6oO23YYfalWZJgldZkbZx09rdhGym4fohY
	n5w3WMKL4L7eUPbIOBhHOk3Z6pu2SQ585jVJWOhPQg+Og6sKhatGPpk7
X-Gm-Gg: AR+sD11bkfscv8aVpZPg9C3CT/gMQF1+MPMfwslcB3gCpQMbhF+Djso5TsacEDz4Mwz
	XCfDDn2b4Kxp/1RBoNYfhRgXIKuTpc5su3TScceCrzOKmDGrfTYX9l690fP3lzuubSIf+cQBgaZ
	ew5K6F0XB5iXS4AYWuTgHGG6Q46Zp4oTpYN9MhTm5tUgW2q/wSDkG6DVVO1JGuiGgUspcAK2UwW
	Fqk/yTgRSPRxJ3sWfk1JMHZP6o7kaHPW2RjLp8J0RqTvS/gwaM8it91IFBGIqS6MgIOz3yWhzAw
	HDoOhEADkqVNRWWEbJ2AiEp5LhLznsEuTBMxr3RwKEVHHZF8YWzwrw3gzcBkNdc+bjMO/FHeLPQ
	qHJ0t3UdpQxsn9iUdEK/SiT6nrbNIPG8TnpmQgru6vsCslBMIvrsQ4fNajwblYVfYtzbRMv5Jzg
	HeBYysqBi6v9IZi+6tSAJfScxcMN6YyC35c0xh7QTu4dhB5O8PzubmWN67cXlKdISn44NAFWNsK
	XUD8ND4yC+wMoiluyVywKF02KcvsX5rffyUWA==
X-Received: by 2002:a17:90b:57ef:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-395a06363a2mr4850536a91.12.1787202428683;
        Wed, 19 Aug 2026 22:07:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm20779078c88.6.2026.08.19.22.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 22:07:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c7b1b337-6f7b-4b14-9b39-a53f70e7028c@roeck-us.net>
Date: Wed, 19 Aug 2026 22:07:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for
 StarFive JHB100
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
 <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/26 21:57, Guenter Roeck wrote:
> On 8/19/26 02:16, Changhuang Liang wrote:
>> Add fan tach driver for StarFive JHB100 SoC.
>>
>> The controller supports up to 16 independent fan tachometer inputs and
>> reports fan speed in RPM through the hwmon sysfs interface, along with
>> stall and low-speed alarms.
>>
>> For this controller, the special clock and reset operation sequence is:
>>    probe: clk_prepare_enable() than reset_control_deassert()
>>    remove: clk_disable_unprepare() than reset_control_assert()
> 
> s/than/then/
> 
>>
>> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
...
>> +static int starfive_fan_tach_create_fan(struct device *dev, struct device_node *child,
>> +                    struct starfive_fan_tach_data *priv)
>> +{
>> +    u8 tach_ch[STARFIVE_FAN_TACH_CH];
>> +    int ret, count;
>> +    u32 ppr, index;
>> +
>> +    count = of_property_count_u8_elems(child, "tach-ch");
>> +    if (count < 1 || count > STARFIVE_FAN_TACH_CH)
>> +        return -EINVAL;
>> +
>> +    ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Parse pulses-per-revolution, default to 2 if not specified */
>> +    ppr = STARFIVE_FAN_DEFAULT_PULSE_PR;
>> +    of_property_read_u32(child, "pulses-per-revolution", &ppr);
>> +
>> +    if (!ppr || ppr > 4) {
>> +        dev_err(dev, "Invalid pulses-per-revolution %u, must be 1-4\n", ppr);
>> +        return -EINVAL;
>> +    }
>> +
>> +    for (index = 0; index < count; index++) {
>> +        u8 ch = tach_ch[index];
>> +
>> +        if (ch >= STARFIVE_FAN_TACH_CH) {
>> +            dev_warn(priv->dev, "Invalid tach-ch %d, skipping\n", ch);
>> +            continue;
> 
> This should also return an error. Also, this is the only use of priv->dev,
> and priv->dev == dev. priv->dev is therefore unnecessary.
> 
>> +        }
>> +
>> +        priv->pulses_per_rev[ch] = ppr;
> 
> What is the point of storing the same ppr value separately for each channel ?
> 

Sorry, not reading the code correctly. Ignore the noise.

Guenter

