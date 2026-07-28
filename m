Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5E448CE3
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248727; cv=none; b=m94eDDFWtbCnaBOCNjLkTMws/4JiGmx040IBKlx1jGlG3LW2AuDVPehQQHZIf7NYPUfnRNMqwH/xdmkRwOc8jZJcOOyktjZQ86+zpXzy38DcB6WAlWb6E5mzpkPh8CV5EyOD91XIuX7nIboVPM2SwJLefoaxgh0HromDWbd7FRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248727; c=relaxed/simple;
	bh=5pXi4dgAo1m0sp77oTw62O1Q9wJLmYmFtoegNg07rZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nkp1SyTPILb3M8t24Kk71rUcZrEfK0dUJF4c/CgHvQWRLGajU2G35G6CP6+QH0XzzyIQ8/qwJrsSzvlRdQUIdz6qIxRWUjdT7SaB4Uof2WQn3p6EJGtBccCOfLEOf5XZ2K53saeDP2dcPDEuj0L3LHGTN27aofCFeDy0G8x2lYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+Hd9qTV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+Hd9qTV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so40637225ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248725; x=1785853525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAjDSAgZ2SM25Sq8ILGGacbnA1ulD3BXrj3aZojkvoQ=;
        b=I+Hd9qTVKczeqvIxEuLGaXEtA/u2MWaOJ0GrySOwjQXamqKda2QynOikZCPmqlVltM
         wzmdZYDxvMOEIzZq1HrxlfUFcrVOt5WSTk7sSlN5mf4c1MHUJq/ryXuOvSH63+DkvmNj
         3fAFLki31ORrBpefJgGlYytOZCvIcmfuu5NO370sZq0P2s4MABleGsXFT/l+GS8Y1I/S
         omY/zkxLq2DTBAX9uTef2/wA/jJ6grsymCoDCgurEA1/Y9GFPSVHHRr1xGxpT/WV8Q7P
         7IdOj5gu7+lXpgmKXgwLlB6VdhD8ZoAjBgP/6LKzukP27i5JZnTs4SOx+7r6eM+ZBJ5l
         0FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248725; x=1785853525;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mAjDSAgZ2SM25Sq8ILGGacbnA1ulD3BXrj3aZojkvoQ=;
        b=mqw3/wYA91kbnM0OSTQhT8DfL1wval0/bXEkEf/NUyb0ZyCjNojxVnbiWYBYJe7l54
         k+42caQqvNWiuTCcNrEPDFQPufLSm3UWt3/DKsd8NO2QcFUEkvPLUGV6K6orGzmuI8NW
         AYxyxLpnldrfAU3r1aVl7w5r+SpdA1W1ELSuNT+DsKW3NfSXSBz9Cc7RHHdrD7oN7x3H
         Uom+CEZ+s9bkjxHeTqzeJmpMQzYbxqg/D1hkgxn7qkpzj8GDM48pSZpC+xG/l8m8hx7R
         sJy3PM0oNGZHfY64vos/Ihckpsw5DUcEG3tKcdfQJ+sQ4qcl8VwdYtnxfzIk6Q15+YvZ
         Q5HA==
X-Gm-Message-State: AOJu0YzwL4BQindH1zvbNODZNUE13scZX5mipIrkaboEDi4icvZEymY1
	M6LckHA9tGaACnRgZ5FncgTdtNaNNBjL/vM9PmbCiU04HQuTJtyaaKVIhr/Fgg==
X-Gm-Gg: AR+sD13E18sJSwXtCeiIM8IvJTX+rMxurX4F9FmnW18uSG50IdgPxU4MJSQxfbR8XNN
	rWTQeoedi1/NfXeH6ka8/s8SkBm6uTf7k8cXDT6a2BoeI9Bb9oO3e9lo45Yx1kqfzOg1jxiAwmD
	BLj/8IMP0vsC1HwfAnIF4VyKRaww2N+5PGsV6P8v6PxUJkb/ZKdFCQi9v4polZxX3UPee7JXPjO
	ybcoCmqfWTn4gRlehX8OdgM/yVGTGvLUFAhrmbi1XJksWUfE9FQe2fp6605NrbWlcCmGYEj3GVi
	q9gVL0OqHfzmIh7dYJ0EjecccKisC0PLD42+obUd5/iLCCMDVr8/jb9/MNKdRiZfCRcK/fV0G4i
	bCtEGebh5wcrZoI2HEaU3xJpvUmiwY6tXlWsotnwbdx76wNAI5hnOHTRde9tXJ3fnHLj6+/XInD
	o3NJZQ3FQujF4LCc0CagTnSuk2MXLkQggNS19UnNSffCqHHDqV1Ow=
X-Received: by 2002:a17:903:46cd:b0:2cc:f7c6:8353 with SMTP id d9443c01a7336-2d015da2cdcmr30952985ad.41.1785248724721;
        Tue, 28 Jul 2026 07:25:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548efesm45553281eec.14.2026.07.28.07.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:25:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9812bc9e-75c7-49b8-82c3-1e9162d53ccd@roeck-us.net>
Date: Tue, 28 Jul 2026 07:25:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
 <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
 <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <9559d319-4b44-45c2-ae13-f92099de4c89@roeck-us.net>
 <PH0PR03MB63510057D496CBE8EBFAE246F1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63510057D496CBE8EBFAE246F1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 23:58, Torreno, Alexis Czezar wrote:
>>
>>>>
>>>> Are those chips still not published ? I find MAX20840T, but no "C" variants.
>>>> And MAX20840T presumably has an I2C device ID of "MAX20840", not
>>>> "MAX20840C".
>>>>
>>>> I also noticed that MAX20810 and MAX20815 seem to be register
>> compatible.
>>>>
>>>
>>> I believe so yes, they aren't yet.
>>>
>>
>> I just hope they are really compatible, and that the device ID strings really
>> include the "C". The "T" variants seem to have no T in the device ID string,
>> making it a bit odd that it was (or will be) added for the C variants.
>>
> 
> Yeah the T is weird, but I did test the C variants and they do reply the 'c' char.
> 
>>> Actually MAX20810/815 and a few more are next in line after this. A
>>> different person is handling it, but they're waiting on how this patches go.
>>>
>>
>> You are making yourself more work than necessary. Knowing that there are
>> more chips coming, the sequence of strcmp() is not really that desirable
>> anymore.
>> It might make sense to create an array with all chips supported by the driver
>> instead of adding up strcmp sequences. That would make it much easier to add
>> support for new variants.
>>
>> There also seems to be a MAX20830T. Does it actually make sense to list the
>> variants (C/T) in the first place ?
>>
> 
> Will think about how to make to scale the code when adding newer variants.
> 

Something like the following should do.

const char *supported_chips[] = {
	"MAX20830",
	"MAX20830C",
	"MAX20840",
	"MAX20840C"
};

...
	for (i = 0, supported = false; i < ARRAY_SIZE(supported_chips) && !supported; i++)
		supported = !strcmp(buf, supported_chips[i]);

	if (!supported)
		return dev_err_probe(&client->dev, -ENODEV,
				     "Unsupported device: '%*pE'\n", ret, buf);

Then all you'd need to do to add more chips would be to add the strings to
the supported_chips[] array.

Thanks,
Guenter

