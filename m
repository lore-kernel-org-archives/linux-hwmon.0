Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76625A62A;
	Sun, 26 Jan 2025 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737920193; cv=none; b=djY1+9kgrDuOF6nv/PyMvlfUfTdOjd/IYM/9pVWPD0prgDp5FXdYDUfD5FkOHEW5FdHdR7lhIVXZCjlyOj72qm4jzIprxjl6ogLpi7pSiMt9bJzj8C7uFZjReNZVV/LIaKFpKU8J13JMxOxZ6mx7eYiH3egXs56wMwTYuAogNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737920193; c=relaxed/simple;
	bh=76uMwJh/lN6UmGAxVIFKan6b+Wa00Wohm+sbF66v6fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8M94j3CMYbrXCawCDZrmjIxDFmLzwaf3CL8bfKBbByppjRJp0baUo5q8UAH6quRjYrnsvjNNYGGjsyfCAFxRDj/QoltjPGgKZlQ/L2BRv5gRMIxaO2ODfw4Vogu1gxAl+BZ19ucMOQHweuD5f4wL0jnK+NRTJiHSPTxOTghikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isKzPGBN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isKzPGBN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21631789fcdso62571575ad.1;
        Sun, 26 Jan 2025 11:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737920191; x=1738524991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z8llH24tmUTla0aCffDzxjanetE+svdznZQ0YrHLfZg=;
        b=isKzPGBNXf84NT+ZDPexvLd0ldnO5zi87IBhozClxCM1JhgIvsfnOyPpw8uNgzqgxv
         IxJ/G125lSAreY5BhqNe5epGCd1nySjD2zQcmpwbyjNQZdSm1eGwYWNCN5JXhNZcY0vv
         EWMWgY6tBCzQyKA6s91YfN4CTx3T0QB4z9BL/XBCCaJL0Q/04ZrMg4GvklMo/6O61iLN
         UMPwZD060WmQ49MH/N3gR3u9ELWJhmXSe8LMKbvQN2WTp0jc2zcryiAItIhhdfj8vuEE
         ooh9tPu2GJbT/PzW4p+eNC+V47HbC+CqTeeWH5O1k7b2Zc14j1K3Buu92z/Bcn2aeHW/
         m0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737920191; x=1738524991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8llH24tmUTla0aCffDzxjanetE+svdznZQ0YrHLfZg=;
        b=c4XMMWn/D+EVQqJqxRowpUCQ6BW9kemWmHHO4CK7Ec/BD/GT6ZKqlGs0JMchP1wbA5
         HQI9oB6+A+FM23m6Mg8jd2ndbhgysV6+VwrJqGQwLB6Fmj7ckOidkmgMVniR3YkQoRvx
         dsrJcx9iw/rkUtL/RAC3zITP2A9HtBzlGF2ez/uTNw5BsivpIoxE8/wWiQwQGmn96cdu
         jq1kUl1Z7IQP6k3cuq+M/94G1APAntwetOsglBzUkepukcSzLmLlbWV+TfbabztrZWN/
         KUx2HFuNdQE3Ezhhladg7Dafgl9QwDfshB61K5HdZm3vXsZ/b0i/5F9A6Z51Cc9SM49q
         nvxA==
X-Forwarded-Encrypted: i=1; AJvYcCW9f+ftqBcI1QeUt2HtXcSA/wxzBOQHhYh6tYJ7R9ll0UfVpcIv89JAxAURM24Wp+kTh6/9xUzYqnnP@vger.kernel.org, AJvYcCXdXAiiH4g7JTva8SAcT1g4ds1gAbIXjY4qig1IxT/92x3Jg13nDi0EJjO5UGDFOkvdkXKeD5GyQfKKXVvL@vger.kernel.org
X-Gm-Message-State: AOJu0YxqIsJjUcT0TOyKY++soL33O4RTYgP2ynJD9WHNdKRZQPoM/8GT
	WwzFDWYmRFkaN21Dl1BOb3dm2+EVeIjkT8m4Wbdrz5s/8nk5l0ov
X-Gm-Gg: ASbGncvUQ61Tn7Y8G7piaHqrLugjyKPXeWjG6IUEDrU9o/SzmBU2qVHV26x78YZfHce
	6FxoaK0EtxkPYefHN9YrXOyqG2bD6uE48ZQAM3EyzFYU1KypJF/R0/fbc/O5BNt4qcwIRD6OMgS
	eRjogwQAaZfCRq5zIZk50hwfpYc3gpxilWcIHIX8vb+A8Q4eu8Xihnu0SlkK2vNPYRinPAUrBqg
	QCjprboNbZKfaVTaWWxd5/EvDq9OJvWkXxrIvS8tbNZYsNF4yMzf8uHV9CU81OVb0maEjiT9PF/
	Pvh9WPgAywM/FHj2QJDWgNBsOfXsKE13kU5LS2i6jNRDrR/lhz5Qlg==
X-Google-Smtp-Source: AGHT+IH0FpEBc6nzy3mlkGy301+4ZufXa56BDaBgG4rgZrGW9XvFQlTfqMH8nvjta3AL/QxauZCw+g==
X-Received: by 2002:a05:6a21:600f:b0:1e1:adcd:eadb with SMTP id adf61e73a8af0-1eb696e2d17mr23633036637.11.1737920190953;
        Sun, 26 Jan 2025 11:36:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b30a4sm5715463b3a.53.2025.01.26.11.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 11:36:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a841ebd1-7b28-4a85-95c9-f0c3b9661662@roeck-us.net>
Date: Sun, 26 Jan 2025 11:36:28 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: add driver for HTU31
To: Andrei Lalaev <andrey.lalaev@gmail.com>, jdelvare@suse.com,
 conor+dt@kernel.org, robh@kernel.org, krzk@kernel.org,
 christophe.jaillet@wanadoo.fr
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
 <20250126144155.430263-2-andrey.lalaev@gmail.com>
 <1f76d87e-cf99-4114-bb3f-d812bbc5b45f@roeck-us.net>
 <0e003860-004c-4004-ad13-36c77e1b8378@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <0e003860-004c-4004-ad13-36c77e1b8378@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/26/25 11:16, Andrei Lalaev wrote:
> On 26.01.2025 15:59, Guenter Roeck wrote:
>> On 1/26/25 06:40, Andrei Lalaev wrote:
>>> Add base support for HTU31 temperature and humidity sensor.
>>>
>>> Besides temperature and humidity values, the driver also exports a 24-bit
>>> serial number and heater control to sysfs.
>>>
>>> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>>> ---
>> ...
>>> +
>>> +static struct attribute *htu31_attrs[] = {
>>> +    &dev_attr_heater_enable.attr,
>>> +    &dev_attr_serial_number.attr,
>>
>> I'll accept the heater enable attribute as sysfs attribute,
>> but the serial number is most definitely not a hardware monitoring
>> attribute. Please expose is through debugfs.
> 
> It makes sense. Will be moved to debugfs in v3.
> 

Note that there is now a ->debugfs pointer in struct i2c_client.
You can use that pointer to attach debugfs files, and there is no
need to remove the files in the remove function.

Guenter

