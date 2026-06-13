Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AB3E2756
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355932; cv=none; b=S2K1j91VUem5z5mZEQLUb3fPb4y00Va7xSEjjy9kjfn8uAljn/dJUCFJSdICbndaXnn/33DlWLt65l13i6ijnryXnitbprXPUJIHlU7FNBirmKCGH5HhJYnWYb21V2dx2iVkMk4VpntYjwKDuOHIRqY9vwSNFDUXo8EMuxfBqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355932; c=relaxed/simple;
	bh=Y8HSeHR6nXrPlWAtA7xiMTkB9LxHnHiAsO+J+VLh9NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPhMTfmKNCWIOzvjZZK480YNz4kpa+PHspmMcLn4hTOFxDCZZvhgXKMH8SGw4WZmCzWamjtk+2DIQQrkIVTfg8hrEQw6ZKIh6m9W3wGwM6B8QFY3aV/WiqQnHTDbK7xUlLn1IXM9k4aHPurvPCWSYqoWYqs24nAeuKULQiLCXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlXciG0E; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlXciG0E"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84236f9b638so977617b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2026 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781355930; x=1781960730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J0/xN/u9yjMUTPaayxrM2NpfLmKfjqNjjwrj2rQQV1g=;
        b=HlXciG0EgtbbDOL8avd/BOL0zJV56B2+FpCQ2JHkxgm9RHw6LCnlvDcekSuwfmxEVl
         FJIvt4RumgCpzWDyq3cBLEL78FiYdurXPN0ZboPQQVTVrgEKepwsXpf16Ndnyf6rgnXx
         8UQmE6G2AcjcS2ZGZT1iM0t4ML3hEHk1p0taS6qmpAs6ZLzGD64/Y3Q+/Wn3oklR00CI
         n9mUQtKu/GBgXpg0Cs2XV4Z22Hd7GE+DuhrHZMxFYnDfLAsK8ICZ67d/+sMamsyMMAGe
         pnguzzyFu5rQBVVr2iJcdFCZA0EWgEmR9y5Hb5ArzzkqBBWvcmh87QafE+sHteFFzKod
         +fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781355930; x=1781960730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0/xN/u9yjMUTPaayxrM2NpfLmKfjqNjjwrj2rQQV1g=;
        b=PY8Rp+nOKXai6Jrn7P6QUCGmQNqNiRHxhJlAJYyJg25gR9+02l6Wr3LovtpY1UKkEw
         CucBgtalq1IsSsFZqXCGmlwlvrSaCWeD6rQaNkwUMarwQ66LLhAYeE5hMqjN/SbIzVrh
         y8+Vn+ogreMRq8B3cvxWPHmhNiC+H2Tl2fCWI7pZ0SJauSIQCVQQTmU6Wt/XlSN3+2kT
         OKQGOhjJuAAQU+MIE7ReCmFW8m6VHShj7Z2XDUBNnyrFtjVsezYZdosRltrTp/mUtUyT
         W6XRFofx7Zmb000YTAutVPjc9OWJBYzYxNDwZILY+AauoiYg9fzSIq2Y6W5piKSVhvvZ
         A4yQ==
X-Forwarded-Encrypted: i=1; AFNElJ/intReKhbOFVuF3b9GUMmwwTV88yYTOo3IWM43ZTzfLkyd1AIt/JLDsYdx8lziLQz6m324KHmYFZdpaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHANkKxMol3HpV6ZA1uFYfLkmU5ezATFpCRqOu2QLryk5EKCk7
	E4nRi+cqTHOz6KYFWjVRLhj5kYqt05S+jLORqmfLu/tGjifwkQufcNzt
X-Gm-Gg: Acq92OGnSanq1beDlZAviWPyigTimYZagrDbSqJV2/xvvBGdv+D27xyEXZWukNRQDab
	+ni3mm3UzhTZvHsGkK312tQnm4G9J6Ba8TPK2gz//2D//Dn5ZCFl8f3xBhJ2PAOo23mGDEE+7/t
	moq7E1ymyZNnQH3BD+u13kYEHzyVa5x6gJXh+bHiiems8D2rHr+vA74UFKP/ZKVo8QiGtuXnUdS
	MZZjgScixB9PpzeDvbDdzH+DCqK6+aGHZTel3MKtxoDjR9Tzc6B+VVlEtxlwNgYNp6kgPIIOxad
	RCLGnK5JniPyhga1Stuos7NxkYrd9kNorLWw5TzdpTJjq6Oet8+kPgvXYlaEod9YbbKtY3jjGfl
	NdKrn7+lKj19i+fMCn1AUSoypW/Zg48ll3VaddjN6figUxdME3u/mu+uD7La5tzG9p8c9yDL+ws
	DVYQDqEA5811BLhQhdUtOE+9+CvYXEGP6aOhtn0OXyRCO+Z2q/7AGpQffjgn/MrKIPkEioOKlh
X-Received: by 2002:a05:6a00:4146:b0:837:f79d:909 with SMTP id d2e1a72fcca58-844e1a8c494mr5080470b3a.39.1781355930330;
        Sat, 13 Jun 2026 06:05:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm5058107b3a.7.2026.06.13.06.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 06:05:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4875e6b4-0d9f-4920-9efa-883d1fed983f@roeck-us.net>
Date: Sat, 13 Jun 2026 06:05:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
To: Conor Dooley <conor@kernel.org>
Cc: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
 <20260611-mocha-strive-a7f3265dd3f4@spud>
 <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
 <20260612-lecturer-unclad-d80218119ae5@spud>
 <059f9ce2-39f0-4553-909d-58585d46edd3@roeck-us.net>
 <20260612-sibling-battalion-453d3d239aaa@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260612-sibling-battalion-453d3d239aaa@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/26 14:13, Conor Dooley wrote:
> On Fri, Jun 12, 2026 at 10:19:14AM -0700, Guenter Roeck wrote:
>> On 6/12/26 09:12, Conor Dooley wrote:
>>> On Fri, Jun 12, 2026 at 05:10:38PM +0800, Potin Lai wrote:
>>>> On Fri, Jun 12, 2026 at 1:27 AM Conor Dooley <conor@kernel.org> wrote:
>>>>>
>>>>> On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
>>>>>> Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
>>>>>> properties to configure the device's Current Limit (CL) behavior using
>>>>>> SMBus settings instead of physical pins.
>>>>>>
>>>>>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>>>>>> ---
>>>>>>    .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++++++++++
>>>>>>    1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>>>>>> index a20f140dc79a..95ea7c26dec2 100644
>>>>>> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>>>>>> @@ -46,6 +46,26 @@ properties:
>>>>>>
>>>>>>        additionalProperties: false
>>>>>>
>>>>>> +  ti,cl-smbus-high:
>>>>>> +    description: |
>>>>>> +      Configure the Current Limit (CL) to use the SMBus high setting.
>>>>>> +    type: boolean
>>>>>> +
>>>>>> +  ti,cl-smbus-low:
>>>>>> +    description: |
>>>>>> +      Configure the Current Limit (CL) to use the SMBus low setting.
>>>>>> +    type: boolean
>>>>>
>>>>> What's smbus specific about this? If the pin was connected to a GPIO,
>>>>> you'd then need to have different properties or use these ones with an
>>>>> inaccurate name.
>>>>>
>>>>
>>>> The "smbus" in the property name was originally meant to indicate
>>>> that the setting is configured via the internal register over the SMBus (I2C)
>>>> interface, rather than physical pins.
>>>
>>> Right, but if you do it via the physical pins using a gpio, you still
>>> need a way to say what limit is. The status quo only works if the limit
>>> pin is tied high or low.
>>>
>>
>> The physical pin is supposed to be connected to ground or left floating.
>> It seems unlikely that anyone would ever have the idea of connecting it
>> to a GPIO pin, and doing so would for sure mess up the driver because
>> its state is only read in the probe function. The configuration here
> 
> Well yeah, "obviously" if someone wanted to use a GPIO the driver would
> have to change to handle that - but probably not that much since it'd be
> a static setting that could be done at probe.
> 
> I get that it may be unlikely, but it seems like a reasonable thing that
> someone might want to do, and renaming the property to not exclude that
> usecase seems to be "free".
> 

It is not only unlikely, it would be risky and potentially result in
undefined behavior. The pin is supposed to be static. It is undefined
if the hardware evaluates it once after power-up, after "power good"
was detected (if the specific chip supports it), or continuously.
Making the pin run-time configurable would be a risky endeavor with
zero gain since the value can be set by software configuration,
while at the same time adding complexity to the hardware.

Guenter

