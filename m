Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9846A60C
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851989; cv=none; b=gYnJmgBOpVklXBfmgtXNOZfDNiw9UZREPUDlDF38CwvioPvkoKxqLcKZAHZb6GCw6wdokT3+PZ22QIC1fHXLgy4AjuchcXnwgxIC7LC+28jNJ9LzF/4sOpfwkAEBRz2YdtkST5G8mEfiRdgXWDcPhfJNOUggDbM7nV06CPAFDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851989; c=relaxed/simple;
	bh=EH09jQFTeWoHs309HdbutoKTeCUYz35kcR8BLAhCyAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SN69KFxUGIlH1lmXIcqwrFx3aG1mNYkP7MYS8v3izG9+gUZlDmkEhSc0AeinyV8aMpW/u+YxPfCedChBLY+hftQ9f1rkonzA3rx5nTSiRoKebEPtfLjpWImy7Z8EjrTqluWAOyVikiLrrJfIO4LqHUqRbbbK3ySuI1HQquh7Sr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxKStaqu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxKStaqu"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso3511290a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851986; x=1786456786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=937XXt70UD99/sTdtME9pl+I5/+mWs4NA437Z4HSSMg=;
        b=OxKStaquxsQ9syb44CuTviWXXxXLljUonv9yZE5l8s9F9IpAIAmhHIpSchv/7ASmXL
         JDN2aHTKPicacxNtbuCslGBry5m91GgZ0F50z5aKbGOOwnjiCTGKxDqVxMmHHnO5n3me
         3KCj/oZ49IG8n827VLNk9JtCnE8TC6J2gK4Wfm9ms7Wzv7b7TFTSL66a+AubVUikuyop
         /mWwtfea/9oqBXfHtwNEbzfWLgI7AqDYkIUavs8zZHOwRwAC4BdIdPpb0aA9Rof0dsJu
         8AKwd1/gYnN0+gONKWqXxlBbDN4LEUzjS5HWH85Mts50FBfTcSuNNiQizqT/7a4c7/Co
         Muww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851986; x=1786456786;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=937XXt70UD99/sTdtME9pl+I5/+mWs4NA437Z4HSSMg=;
        b=igsySgkkVIN6Dr3UqZ+FoWXDvwZyLo1i9s5JOzPZfdLA3gPuv1JXFEXkEDf301xnzs
         asrNFXyBJoC/sNyK9l4JN4XYwRZFWgt8tjKX1jNhM3rwjGYPRyxW1KZS0Fwi9uFdPCW7
         tVmHIzKh8n91OxfrgVCzH5sIeGQnujy4fxdlFw3YqbOuC5og+FRcChXyXZKMCxUIlUj2
         PgRZ33nIU1KH527vOIdrVeL3V4TussYqPH6zxXNqsl1jA+W+plSW+VwDSAZLu2vAp9uK
         00KSbWpV0Xgib32YcsazCaJYcmws/BeBbNUlVLQnRVSyr6KGk24XvXgG/dfU7rIEmr+E
         nETg==
X-Gm-Message-State: AOJu0YwJ7F20+2skFhHsgkXl1+3C22srG6wAiB64eIvyqlRkRXKAfRJo
	iOeh6bZqgpda1+p3ghoLVCw7wxkDyHte24ZzGNKF0apJS+mNtQa9lC6u
X-Gm-Gg: AR+sD10mZdh1mSrSODX4oACR5zwqB5TIW0QSXZhlSKWrHcgXOYB+z+44HFM3VBeR2s4
	l4p2pT5fKYHlLQb282vnIoaOx3DKKgk6YjBbflLp9jRSLffCgAFejodCzY/WHsgFVmQcfu/p5Yh
	aTiKfI4Ef916hVgBi0rVwqTaZS9k9AFmnI4MOX4oCKjd6YmV2Ji2EFytWUj0v3KEWFhXuC7Nj6H
	tjd9M2/NH8KpGOJYh9su3sWbEB4EKrEfcfj3HKVWnhQR2tpHBvb/XUw/FxKQQTsaf95vtFJFrJ+
	Vr/7cMSNJK/GETXJ+euL1CCg9du3r/dMNDRsYCNVOJnc3EA596JFTX91Dt6ELPpGEi0kuKa+UE3
	3yAqa+AT/Wow06GCn3I+YKduE8yhkjHgDldkI7UOuuKjZh5sCPWF5pxm4lFZvo3o3Qvw1rD04tG
	PVYl4Hkky5po7CD531CbonpdnYA8i8bdvKQFi04F6g4Wu81aMm0DlcIGShCHGQOF29QIawnqfLX
	CdB4Tr3Hz/shiCwPjXDEJ+Uz2jaAjlH3ydKaUaewFT7X+cn
X-Received: by 2002:a05:6a21:398e:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3c92a4d6fd0mr15013628637.1.1785851985934;
        Tue, 04 Aug 2026 06:59:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm8207973eec.11.2026.08.04.06.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:59:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b9ab157-faef-41d3-83a4-62fcae83a524@roeck-us.net>
Date: Tue, 4 Aug 2026 06:59:44 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in
 probe
To: Qingshuang Fu <fuqingshuang@kylinos.cn>, sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260804091719.651479-1-fffsqian@163.com>
 <20260804092412.59EE91F000E9@smtp.kernel.org>
 <48933be.818f.19fcc44b0e9.Coremail.fuqingshuang@kylinos.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <48933be.818f.19fcc44b0e9.Coremail.fuqingshuang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/4/26 03:14, Qingshuang Fu wrote:
> 
> At 2026-08-04 17:24:11, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] The driver ignores `-EPROBE_DEFER` and other errors from `devm_regulator_get_optional()`, improperly falling back to the internal VREF.
>> --
>>
>> --- Patch [1]: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in probe ---
>> commit 2a7377992af717bb6d251109d28baf026bc4a665
>> Author: Qingshuang Fu <fuqingshuang@kylinos.cn>
>> Subject: hwmon: (ads7828) Check return value of regmap_read() in probe
>>
>> This patch checks the return value of a dummy regmap_read() used to enable
>> the internal reference voltage in ads7828_probe(). If the read fails, it
>> logs an error and aborts the probe instead of silently failing and
>> registering a non-functional device.
>>
>>> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
>>> index 149cfcec78dcc..91ef0c4a08c4e 100644
>>> --- a/drivers/hwmon/ads7828.c
>>> +++ b/drivers/hwmon/ads7828.c
>>> @@ -112,6 +112,7 @@ static int ads7828_probe(struct i2c_client *client)
>>>   	unsigned int regval;
>>>   	enum ads7828_chips chip;
>>>   	struct regulator *reg;
>>> +	int ret;
>>>   
>>>   	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
>>>   	if (!data)
>>
>> [Severity: High]
>> This is a pre-existing issue, but does the driver mishandle errors like
>> -EPROBE_DEFER from devm_regulator_get_optional()?
>>
>> Looking slightly further down in ads7828_probe() in drivers/hwmon/ads7828.c:
>>
>>     } else if (dev->of_node) {
>>         diff_input = of_property_read_bool(dev->of_node,
>>                                            "ti,differential-input");
>>         reg = devm_regulator_get_optional(dev, "vref");
>>         if (!IS_ERR(reg)) {
>>             vref_uv = regulator_get_voltage(reg);
>>
>> If devm_regulator_get_optional() returns -EPROBE_DEFER because the
>> regulator driver has not yet completed probing, the driver ignores the
>> error. It proceeds as if there is no external reference and incorrectly
>> falls back to enabling the internal reference.
>>
>> If an external voltage reference is physically connected and specified in
>> the device tree, could driving the internal reference onto the same pin
>> result in incorrect ADC readings or potentially hardware damage due to an
>> electrical conflict?
>>
>> [ ... ]
>>
>>> @@ -166,8 +167,13 @@ static int ads7828_probe(struct i2c_client *client)
>>>   	 * voltage needs to settle before getting valid ADC data. So perform a
>>>   	 * dummy read to enable the internal reference voltage.
>>>   	 */
>>> -	if (!ext_vref)
>>> -		regmap_read(data->regmap, data->cmd_byte, &regval);
>>> +	if (!ext_vref) {
>>> +		ret = regmap_read(data->regmap, data->cmd_byte, &regval);
>>> +		if (ret) {
>>> +			dev_err(dev, "dummy read failed to enable internal VREF: %d\n", ret);
>>> +			return ret;
>>> +		}
>>> +	}
>>>   
>>>   	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
>>>   							   data,
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260804091719.651479-1-fffsqian@163.com?part=1
> 
> 
> Thanks for the review.
> 
> The mishandling of -EPROBE_DEFER from devm_regulator_get_optional() is a pre-existing issue and is not addressed by this patch. This change only adds error checking for the dummy regmap_read() call.
> 

In other words, it fixes a non-problem while ignoring the real one.

Guenter

