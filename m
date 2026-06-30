Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98722374A09
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833673; cv=none; b=QKIEJOtnc6p2QOndXDe72CJwFxcYFFnoLBtfr6Riac6np6pZ544fMsPr+dtloAnkMN9URu98l2MUoqriaKPNL/G/eylawD7qu8UYyzTLBtIJLGjX3cOHaTqoJ/fNbSz7bUVEtqaZPvYayFMyeWmv6pTjGc1ZOuEObmMfb5uJfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833673; c=relaxed/simple;
	bh=2ia29FOid9DCDBJThMX7SXehlTFT2aAD2DcITn7t53k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPVGtAnfhndt8NSxYscL/qYBqCQd26xITQhcVfEL+2KmduwT9yX4DSYilIMfPTtm67kGLqz3XmMQD8QSIAEr9WWBlBclc0VpDnYCWBmtSFJTvUQse4HaOTo4GrZee6LcgM39h0MqMncV3E0BZsmlXIgoqKwj2KriQ5Ts2dDk9TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G799Hw+8; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G799Hw+8"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30c965eab27so860884eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833672; x=1783438472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NloBhb9YEdTOJQ3ljenyQY8tI50jHNC+E9yq8lpQGk4=;
        b=G799Hw+8jbSMZS0iusfJmNF0o2dmgibwoE9hcyVOAE5lLHfSoTqhORjN1/cI2tk2XE
         H5iCXv8AST3M7uWhaxlwPMxEQWN2F6Ymv+efcRfYF32OIFozTv7kJtqVXPkZogmBnSWN
         IW0st2XzcumreVBzpWmfb1824nScW8z6NAoSHmxu9qN738cW9esBxLDkR2VUAKyhDZbV
         RzZwpamAZ9ddzVs6e4xR2sAccSuZ18xuupw4Wcr3EGfHCyFrHIERAE3L6uJa6OGuz/sV
         z9mQJo3WtbKtK92oUh90qO8UB0eEMgf+8o4GRxSsrRKG2hDkGYH3X/WVxUcvomsoc/gY
         DzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833672; x=1783438472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NloBhb9YEdTOJQ3ljenyQY8tI50jHNC+E9yq8lpQGk4=;
        b=Lff/vaoFH6jEkKqFmvYz8w611vUUIpRwhWc/3YHBxDlQ0IqYYxkhk5q8RQ6qcMYe/x
         by3CpsW4SZ7NqqmjFUr4M/QHcLXMvcaKFy+eQo9irKIqB/g0/KIsbxPy59tYtYdF+sN/
         djx776XJS2Y4pRoqczxqiCJwyW1mPRgnS9Bev2U9CrO10e+5mdACmnrLyTtnwVBlPUx6
         kQHuBStmb2oy1aqAnwZLyokNEVxO+hVR+99v7sXBo0TS1fAUoSluLLNFFU1nqomCirsL
         8X0VlpuxsFWtBdVxzreq5pBJBaZk0DoLK2P6r2Ypfzx1uWFMBP2KgQjBju4+j495I1tL
         BQfg==
X-Gm-Message-State: AOJu0YzprcJtfLedCDU1vmoa0VCOlZHXN9cB1h0rtDgLCLXP+bVkNshh
	Xe4u7jUGkEFS4slR9WIYHJamByHEusjjfThGAtGsBTC3Ea7vh2JCHMM/RULr+A==
X-Gm-Gg: AfdE7clMFPYXz73aElOegXBiFlNYkKlHIFVEe3AYa5g8wzfipfxb+x0ZvrOAoFGjwcu
	pnM1hdPBAyh1RzKv6uCggLZiGH1AFN8iK59By2dq2d6hZmqMpmsbk7k9V6oTcX9xb/JT7kOpyrQ
	0rFKrDO2HGvJtwDbmHSj+mi5L5cDN/kVgbB8x3NvMUE/YrwPHctsfPwglNQ/b2est59ML328TxV
	cB7A6f8QDfYoxKtR5+Z8eSpm+LWGH9IkwWNpyjtwVM8MULy0M3akOX+2AfsaRBYcHJKJIajnPsP
	OhK5mrwPwqmt23G5blO6GZJ1pnnc2l6+q/GDhZHA12NgwJbKoQcmfK1YmPuiosyhvKv6GV3X5kK
	WFFjqDYHk4FvD2jqeSO6MPL7vNdsr03d4WhTDlDYBYkZGlOoCZl5viOm9CQ/APEdcqgDrClGVCx
	eaQ6ZE5MHnZ3hFT76F86wAjhh88ufkqBjTYiKkaHm4o4aoOAJA44IeXclgU5Kd5A==
X-Received: by 2002:a05:7300:df09:b0:30c:536e:3a8e with SMTP id 5a478bee46e88-30ef07fecdfmr775365eec.7.1782833671691;
        Tue, 30 Jun 2026 08:34:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5e4dcsm9551992eec.5.2026.06.30.08.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:34:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3e5fe838-6c2b-4bd7-9248-7879403e6f34@roeck-us.net>
Date: Tue, 30 Jun 2026 08:34:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
 <d306dab2-efcb-4626-b480-c4e8779cdeed@roeck-us.net>
 <PH0PR03MB6351C114AA65A11F2E133B8EF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB6351C114AA65A11F2E133B8EF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/26 01:07, Torreno, Alexis Czezar wrote:
> 
>> [External]
>>
>> On 6/29/26 19:46, Alexis Czezar Torreno wrote:
>>> Implement support for external voltage divider scaling using the
>>> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
>>>
>>> When the desired output voltage exceeds VREF, a resistor divider
>>> (RFB1 and RFB2) is used to scale down the feedback voltage. The driver
>>> reads these resistor values from device tree and applies the scaling
>>> formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)
>>>
>>> The properties are optional. If not specified, the driver assumes no
>>> voltage divider is present and reports the raw VOUT reading.
>>>
>>
>> This will require a detailed explanation why only PMBUS_READ_VOUT would
>> require scaling but not any of the other vout related commands.
>>
>> Guenter
> 
> Will add it.
> For reference, the device only has 3 vout related commands. The other 2
> is referred to a feedback/reference voltage rather than a scaled output value.
> Hence only read_vout has scaling.

The other two commands are VOUT_COMMAND and VOUT_MAX. While they are currently
not used, VOUT_COMMAND _would_ be used if someone adds regulator support to the
driver in the future. Thus, even though those two commands are currently not
used, you have to at least add a note into the driver that the register values
will have to be adjusted if regulator support is added to the driver in the
future.

Thanks,
Guenter

