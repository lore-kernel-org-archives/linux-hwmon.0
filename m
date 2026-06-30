Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEAC3D9DDB
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 04:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795116; cv=none; b=F26IGSKWwLOb7w8OG0KLviOLiUlkGYWWSf/0lUwf5k74EJinvw1ZKTpRjU0ng/aPK/KxiK8vwbfzHkQVrTnfzR/FnruB6c9rVeBgj/L/FsT1hXgBnNJh+6r8y5dJss2vr8qf7oxjQ+y4MpfCJEzlnyO8sRk2RpbdY9NOXgez8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795116; c=relaxed/simple;
	bh=+GppeprviWx6+rVyB68VL2Wo6H4/HCZqlCd4o4IZogQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aN8HM6nZOYqLUoSu4fw0tFda7UOeF2cfHPulbmsNspEQfwx2x0dD3V5+7nqzX0xs3HrBVSc0SdsPpvLNfBCMVCAeJjJ/WBwQjEHAjPGAZ+GQasJaDuDxT58A7NI0XWLzbisuT94vheAfKpsuIfzUKod5OxeTO8yavVgvzG658wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtwpZS71; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtwpZS71"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38060005f1cso55757a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 21:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782795113; x=1783399913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jCZdfuwHXPS5iUGzRiV5MmLLNlygQGOVBjUIXIsu3F0=;
        b=GtwpZS71HjWhJEdrhZTdkA1Noj+UM+NjRadB4MW2O5dLwBZzGHEty2QqrwqJDRhZRz
         I00Yn6WAndHqPKx8YTuyyffybCBo0kJMtlHgBMzHtQgxx/unArfUV/sMzn2/CFe5wZ+i
         MLFChpDaaLvdfiOMszfw48vKN6L5CywlQB9hpkx5Ji4WPWf/nc8etPK9NgWQtMqsDnhL
         QTjRFCEDmidtPJSWClEz8YDfYIdM6tnE2v5ZNJ/6HlNIkiEP4jpptqg4uLRTejKjz0K5
         C3NE7iUuGJpsA900tntWxF2e54axaTmkWIllQXBm7l/ZuexH0CYMk5xUNcqLoH1WM8mW
         E5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795113; x=1783399913;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jCZdfuwHXPS5iUGzRiV5MmLLNlygQGOVBjUIXIsu3F0=;
        b=agShx+DgCzPT+IZGcumIk1dgru/o9N1KFCAF+tNmWj3fJN1Yi+LI3O50RXWaOp+OU5
         0gHaFYAV3I3BWzQ+X/xqIGntRjJZYqNmKu8jRXRe/OMezxLUxV1uY/ZVl6x0oH/8DUNA
         owqj2VSxJaIBXIx2thOGzeuB4Irbc3ucHaFbxFVvZEpywKK1AX8AtQ5ljbTmmZ6CY9vM
         4iZy3bsV2MoXko9Jt15Fgip8yJo9A2MMYT/MhTbTUsvnAVzcR0t1jpnb329/MH9/9yc+
         ZoImNJzjlrJIkojlI5Xxl3cyKXBw/YTifO6sOkBQoUsl3kwDkqDyVjneH43mthiKWsQy
         OzZw==
X-Gm-Message-State: AOJu0YwLDMB3kAz7CLGwSSDXqqBFkg3qaAehmnv67IAsPMjcPmmnTlZh
	2SdAlpbPz8pw5akFU4+gVS4Y1QAz7Btm5D7CeBQsTWKEToOa4g2f64mN
X-Gm-Gg: AfdE7cmKSHsFsmLTLT38H2USp0jc5bi4LtEsNs3Zp+yub0+QrErC2pvhIgRVjGTD8oy
	4HlnIVShjs90rBMjwAc+ZH9Zx02wlsqrdQesgljcmu6plQ6q1hNbm+5REWKGA8QVckwxAqAsQ0j
	tYr+db9tqsIQ28Mzj13MPhJSWevDjc8lB8hECuyrXuiCQWpBZlPVd5iMW/yAN2NvtKUlWwHAQdz
	Tzq3K5GLlssoS5SAivCCo/azPs9727ZhLbKuakA/h92d8sU7yaDVNC5f+BDKVFOhd/wR+dydfu8
	eKwOeBYPA9C5GfU6YQjSiLbojK2n3r/x5x7HVqtRJn48QfY0UaGBebjjqqn8o2k6kPWPDV5cTxo
	RSRBv6NR5LW/6Nj/Al9LOWdJlj4JCQAtoyR0bgyxqi7kW0i8BVKR7CCkYDwWyxDMK8DGmK2Tdut
	258Ufhh7Aoq+7Yy81aFi54FGV7Qjz0S/HrSckze0UP8wjjg7AcCa6Oz/rv6AmtCoio73T+H5OW
X-Received: by 2002:a05:6a21:10e:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3bfd2637dd4mr251772637.6.1782795113067;
        Mon, 29 Jun 2026 21:51:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95b8a4sm761296a12.18.2026.06.29.21.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 21:51:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1eab7897-ffca-487b-b40b-958be4f30f49@roeck-us.net>
Date: Mon, 29 Jun 2026 21:51:51 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hwmon: (pmbus/max20830): add support for enable GPIO
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
 <836b833e-e503-4cbb-92f7-3574f3fb430f@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <836b833e-e503-4cbb-92f7-3574f3fb430f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/29/26 20:50, Guenter Roeck wrote:
> On 6/29/26 19:46, Alexis Czezar Torreno wrote:
>> Add support for the GPIO controlled EN pin. The EN pin is asserted high
>> for device to operate.
>>
>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>> ---
>>   drivers/hwmon/pmbus/max20830.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> index cb2c23672166d641852199ca07eb716924f4f286..cb3a39d747edee3aefb0fb4051ef957436b3c15b 100644
>> --- a/drivers/hwmon/pmbus/max20830.c
>> +++ b/drivers/hwmon/pmbus/max20830.c
>> @@ -6,6 +6,7 @@
>>    */
>>   #include <linux/errno.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/i2c.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>> @@ -29,8 +30,14 @@ static struct pmbus_driver_info max20830_info = {
>>   static int max20830_probe(struct i2c_client *client)
>>   {
>>       u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
>> +    struct gpio_desc *enable_gpio;
>>       int ret;
>> +    enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
>> +    if (IS_ERR(enable_gpio))
>> +        return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
>> +                     "Failed to get enable GPIO\n");
>> +
> 
> The above code gets the gpio reference, and then it doesn't do anything
> with it. What exactly is the point of this exercise ? Where is the
> chip actually enabled ?
> 
> Do you have an actual customer with such a set-up or is this
> "just in case" ? Have you tested this code to ensure that the chip
> is actually enabled in this setup ?
> 

Also, please explain the need in detail, especially in the context of
PMBus command 0x02 (ON_OFF_CONFIG) which can be used to configure
the pin functionality. Specifically, what would be the point of
trying to force-enable the chip if on-off-config happens to be set
to 0x1b (ignore EN pin and require OPERATION = 0x80) ?
And if ON_OFF_CONFIG happens to be set to 0x17 (Ignore OPERATION
command), why not just set it to 0x1b and override EN ?

In other words, I expect the use case to be explained in the context
of the ON_OFF_CONFIG and OPERATION commands. "The EN pin is asserted
high for device to operate" is misleading and only half-true since that
is only the case if the chip is configured to actually use it (which,
I notice, you are not doing here).

Thanks,
Guenter

> If there is indeed a use case where a customer indeed connects the
> enable pin to a gpio output, wouldn't that same customer also want
> to connect the "pgood" output to a gpio pin ? And what about
> the LDOIN pin ? Shouldn't that be connected to a power supply ?
> 
> Guenter
> 
> 

