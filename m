Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2A38DD6;
	Tue,  5 Nov 2024 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730821543; cv=none; b=lhaku6cV8H7ePBAesl2A/zbifOIC9dTQT1puE5f4e8bQ5qvWSYZRdHEFVRPlFkN/lwNh7uZ6vH1foTbRo023TXh/Nawo8gFVozV8sjXZw+qYCiXIPWhE4XIz95x6Zm82Sr+Zntog18iVhEuFkE7ZAnYVR/A/0T0DIF7Vfp22daQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730821543; c=relaxed/simple;
	bh=KS0e2C0yzq5Sdw72rQdkimvdeeHIPQaOIVPRw/R+Jpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GslpZMcRox1s0VSw/49fGDBrR9oLfpbVX7TszKElA1oJJYZ7KvCGGwYi6OQoOauFqZ8dIzpas318JyqVetia+GzQTYHqw7zuHXIBS6wNxWIoAhgcyT60o1iu+TRSAnCqYYxzpx+ugGOiBpYXcap74IRhEGN1BvMZoOGMkdHXlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VylFva/R; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VylFva/R"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e5fa17a79dso3120922b6e.1;
        Tue, 05 Nov 2024 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730821540; x=1731426340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=U46kt6szyPyGfKSsshK2tYyR7oUZn8yLnP4zxUDzHSw=;
        b=VylFva/R2DSY1A0YLojLrzgSkt9o+19GtZmsqsdBz7IdHODGux0520Cx67lzopPr+a
         7L55CFXEk8xGcNlYA2i0aS11JkZC6S5upGyYvAW7QvqcEDpmp88YB30rikOMWcWteSZ1
         w2T+QaT0aY3EFWAMWCfP6dinxQiwtZieenxK0UJ6OLRbGpWvyTFpGi5W27PrV8cv6d0g
         W0liaz4PgeoAFVby1WqsAn0G76ZRkVHAb9KAE40Ig1NVClG2ybHjNY9MrGkdpCvW4xfs
         FBoKOF1514UkuKZsdE41+wOTx0GsIsHp8ZPYf/zD8eSJ4cTKx3OfejQ6FOYE2QhiK+q1
         XkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730821540; x=1731426340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U46kt6szyPyGfKSsshK2tYyR7oUZn8yLnP4zxUDzHSw=;
        b=PSPTx0IHQWHVt6GleYywXonsvShYyIYzd4kcVTwVWr/wypS/FOG0OY3GcCBW9rorpw
         5L0UAwE5EjzZb6uu6C/pkScGFphZ1uHebCn4ZdRKs4CE1YCwOfBHRPTTSb7/jy6RTbs2
         5R4niJ5wlh2dFZSfXZfmRpoIi9LYohvrNBhLqxQ6DXexJIhrPIJ3Hr1id6CNWqSmAsOa
         /e38A3E3F1FrA2bX1UV4UzxhqY0BRLx+ybTnxWckk0Pmx7KyEo7IJgUcqDvOfdfcKeKm
         PK6GqCsoRoeSiX/tBa5SOfy2pelwnmzw+Tp+TP9gIH7DJdNsgBNgl7jmDmHzza7js9Na
         zXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR1I4DwdLadpsKmONfenvbUjaObXByH8eYrUFONzD91a5XF08QN+MNPF7xI4PVDoIG8T1dk0bHIT0hbIo=@vger.kernel.org, AJvYcCX1Vu3j7dsvE81TsGOmhnxyt1OfwiVcO8q9k1ALybXrSYgWSdPqPNDacd+RcRs7jYdF51Eq7LpEUuzn@vger.kernel.org, AJvYcCXFVCZ/fwxyZ+URyCp99CxBgE2SI5bFiLAf1JJdKZd16VBk/pZfhvY8o6pdEloqtKl3VkNod0bLDOHW@vger.kernel.org
X-Gm-Message-State: AOJu0YzOrJkblCzeZTEG/ag8ut1qqsLKfSAFaU2/VJt03HuNV07agh8H
	OSRQUR5KNVg6sJ48QlT2ipmsT+hE6N9qje/VbNhoA3xA7Ujmz8ek
X-Google-Smtp-Source: AGHT+IHdutIt/b133vTBEiC3TH29nMw8GJxs9wcEnAoVYP1T0wE1L3L0Jiw/MMiFm6kvD4HQ4d7W6w==
X-Received: by 2002:a05:6808:150e:b0:3e7:6468:1fd5 with SMTP id 5614622812f47-3e76468380fmr10048209b6e.34.1730821540507;
        Tue, 05 Nov 2024 07:45:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45299f2dsm9182016a12.15.2024.11.05.07.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 07:45:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2afabeb7-9cf7-4092-965d-55a9c0762948@roeck-us.net>
Date: Tue, 5 Nov 2024 07:45:38 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
To: Rob Herring <robh@kernel.org>
Cc: Grant Peltier <grantpeltier93@gmail.com>, geert+renesas@glider.be,
 magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
 brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
 <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com>
 <0f855c81-ce0e-41e8-ae08-5f653d3ca8b0@roeck-us.net>
 <CAL_JsqK=kgoKvusMMqdtx7b4z2aveE5O9Q=UHXCgook5UBS4bA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAL_JsqK=kgoKvusMMqdtx7b4z2aveE5O9Q=UHXCgook5UBS4bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 04:19, Rob Herring wrote:
> On Mon, Nov 4, 2024 at 7:20 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/4/24 07:08, Rob Herring wrote:
>>> On Wed, Oct 30, 2024 at 5:41 PM Grant Peltier <grantpeltier93@gmail.com> wrote:
>>>>
>>>> Add devicetree bindings to support declaring optional voltage dividers to
>>>> the rail outputs of supported digital multiphase regulators. Some
>>>> applications require Vout to exceed the voltage range that the Vsense pin
>>>> can detect. This binding definition allows users to define the
>>>> characteristics of a voltage divider placed between Vout and the Vsense
>>>> pin for any rail powered by the device.
>>>>
>>>> These bindings copy the vout-voltage-divider property defined in the
>>>> maxim,max20730 bindings schema since it is the best fit for the use case
>>>> of scaling hwmon PMBus telemetry. The generic voltage-divider property
>>>> used by many iio drivers was determined to be a poor fit because that
>>>> schema is tied directly to iio for the purpose of scaling io-channel
>>>> voltages and the isl68137 driver is not an iio driver.
>>>>
>>>> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
>>>> ---
>>>>    .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++++
>>>>    1 file changed, 147 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
>>>> new file mode 100644
>>>> index 000000000000..ed659c2baadf
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.yaml
>>>> @@ -0,0 +1,147 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +
>>>> +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Renesas Digital Multiphase Voltage Regulators with PMBus
>>>> +
>>>> +maintainers:
>>>> +  - Grant Peltier <grant.peltier.jg@renesas.com>
>>>> +
>>>> +description: |
>>>> +  Renesas digital multiphase voltage regulators with PMBus.
>>>> +  https://www.renesas.com/en/products/power-management/multiphase-power/multiphase-dcdc-switching-controllers
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>
>>> Somehow "isl68137" is missing from your list. "make
>>> dt_compatible_check" reports it as not documented.
>>>
>>
>> Turns out it is also documented as "isil,isl68137" in trivial-devices.yaml
>> (together with isil,isl69260). Both are referenced in .dts files. How should
>> that be handled ?
> 
> Move those compatibles here. And this file should be renamed to
> isil,isl68137.yaml or some other actual compatible value.
> 

I guess that is a bit more complicated since Renesas acquired Intersil.
Is there a common guidance explaining how new compatibles should be defined
in such situations ?

Anyway, I had the patches queued in linux-next. I dropped them until
this is sorted out.

Guenter

