Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85703112BD
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Jan 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768750785; cv=none; b=p2F7po0eVZpvU/tbsn6IfBLkhQJKNeu8MIYjXysv5Hb+R5PPmgN7NcZ0nvOvF60R4UKw9M7p1SCHnpVEQMbjIk18CX3mJxfzbFZ9julbnV+X2XoaFcEp8znfQUAc58LbqoRrYIHrK7aQ/vRQrz1K8ec1hq/PM7jlMf1lpZr8Y7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768750785; c=relaxed/simple;
	bh=DBS++QDL+B+NseCzl6YSwSygv9kwrnZ3R5BSGohfMPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5KDfotPhMy0d9xvhLq3OpSXfrFAIgoUfRA8Grm3kHX/xmZxXwGOYny2ZGwqY08vqR+aFhEMX2apwQ5STM9QVJj/lfBo4hmN1u3qxoPoyJ8r+ha+g+vE064wCrgfDGhAJbtoplXA12k7aJikdyxgEDjiHEcrsP4Pc4MvmRc4L3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9dAZ4xG; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9dAZ4xG"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121a0bcd376so1942435c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Jan 2026 07:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768750781; x=1769355581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7TVCWCMwz6Bo6NsAIpXiCjLfKU1CCVo44/MCCQya+N8=;
        b=I9dAZ4xG06GH5m1rw4P4DFIbTRPK0SEmBdceRcKRo7zMtQHk+RLBdrrnJDEVwOeGNT
         CVDeBwQ+1lP4TS5ia2URQVu9eT3oh7NRpC3vHEbIxWg8Sv7IfZ1hhQ/EKi8y5Qp64uq/
         NsQC09vsd8fP8m/b7s4kqx+peujraY56vAlt2Sd16Cb2WROxQ48Q72EsgZXVKyttKjSs
         nzmGCwa9qcVz8/HdCQkdj4JK8moUWmw7Yq/mpHtOtBfueguQf8zEYaq3SPSMXRwnSj2Y
         zh1+rldcIleU/5/qjFed9jcdjsB4K99hwS8yS5LvQJqFwxkiOMncY7ghevRVCDKFdtaH
         Xmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768750781; x=1769355581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TVCWCMwz6Bo6NsAIpXiCjLfKU1CCVo44/MCCQya+N8=;
        b=Xg4u3/QsI/nMvewOKID3Zjn5em/QXiqaDrLDB1oky7wkXT6O4W4Vt6XIg4fJQgUoyV
         CGUg+B5mfa5ArDPhT+TiV7FQ4SQE3VEW1DTpfpM6692uId1IkWRPeZr+KBxbgKBfz6l+
         XgxIHEDibhWgBnFWrwUZkSx78YGfAd2Iq1gefazAkxUZl1yti7OFzraVUpPYubaYf/wY
         we1diNO2TpRsgt867jmoDzG3dxHsqjHtNG5OYGD3n9KHW/0OW2Ah+c148JFiYB40s7hf
         ahQPJPriFlHZK8Am562RTtcvZm0UmNr8qrnh/Eew9faJ5l95R+zvRJiKWrzulQjEhDDA
         5PUA==
X-Forwarded-Encrypted: i=1; AJvYcCULjcXHenXn+xgiFa4xttSZXESavZNwzG+mU17RSG2kP+Sxi3/HpVHhg8AS6pKPuVRjQa8fjChLUjRbyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJmSe4az6PCY4vxWyDvRL1qSOenqlAGEfnzQTV9WSJVnFQRpJ
	XKVouA9L8mxalNAD47yzRZkXc4jp8GTq8/hEfCMuXrrQxKd8RpkXqAN3
X-Gm-Gg: AY/fxX5zdcG5Klp9ZUIWiVQOlitUG5vf5hCBPwNgVCF27f797y1VQmNUs0U9sNr8TeF
	Ume9kllduhik66yUe0q1+AZENVXONfyAz1+/b2dJUz6h4M2UogPHzBIkKmHYYN5mAM6v8wEG5bn
	7yqvRlAgpBcLrKL3SMCHPJbouFc7hjhz5vG783FNdltRUU8U1Kn93Hxf/2eVtdAraE69MUxrD6P
	yl6vwbHftiri7SOfG4u/aU2hhomAqfqdH+MNrstcmZHWm3RzM/eEqSB+iiE1dDk7kgi+vjfjELk
	uwcp98mJ6Ff9fKlP9qQMZ/e72y8I71cGlwP6jTnIMQ7hEt/6S/uP1G8kkB112GZNNgEK0TSXOTW
	P/Pd/IaKPvxred3+yZNXjsc/aqaJ2VFlKn5WYHvnmytnR1CGiUNb+2R0NTbazxWGdpVZWdO6qos
	NfSo48RKvkuxA99zJExANj/1AsASarV/1SYBfD1ZaFqUK4kt2gLNKF6stWhezd
X-Received: by 2002:a05:7022:128e:b0:11d:c86c:652e with SMTP id a92af1059eb24-1244a6d7640mr7436950c88.5.1768750781210;
        Sun, 18 Jan 2026 07:39:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm10460653c88.2.2026.01.18.07.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 07:39:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <16d28468-5863-4e1c-9dc9-5721e009b24d@roeck-us.net>
Date: Sun, 18 Jan 2026 07:39:38 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
 <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
 <91c052abe2f88be12ef9f557120d540373471d67.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <91c052abe2f88be12ef9f557120d540373471d67.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/18/26 02:12, Nuno Sá wrote:
> On Sat, 2026-01-17 at 16:27 -0800, Guenter Roeck wrote:
>> Hi Nuno,
>>
>> On 12/23/25 04:21, Nuno Sá via B4 Relay wrote:
>>> This is v3 for the LTC4283 how swap controller. Main change is that I'm
>>> now using the auxiliary bus for adding the GPIO device (done depending
>>> on FW properties).
>>>
>>> Similar to the LTC4282 device, we're clearing some fault logs in the
>>> reset_history attributes.
>>>
>>> Guenter, in [1] you can find some replies for some questions you had in
>>> v2 that likely you don't remember anymore. Regarding the regmap story I
>>> ended up adding a secong regmap for the 16 bit wide registers which
>>> seems like a clean solution (if I'm not missing nothing).
>>>
>>
>> Sorry for the long delay.
>>
>> Actually I prefer the solution used in the lm75 driver: Map all registers
>> to 16-bit registers using a regmap bus. Would that be possible ?
> 
> I do like the current approach as we get the proper i2c functionality checks from
> regmap and it actually maps the device register layout. But no strong feeling so
> obvioulsy I'll try the lm75 way. However looking at code, something come to mind.
> Won't the below break on big endian machines (assuming big endian device)?
> 
> https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/hwmon/lm75.c#L594
> 
> Sunday morning for me so I might be missing something :). FWIW, if I'ḿ right about
> the above, then regmap i2c has the same issue (tough the issue seems to be on the i2c
> API - at first glance).
> 

Technically possible, but the driver used i2c_smbus_{read,write}_word_swapped
since 2011 (even in pre-regmap times). Before that it used essentially the
same code (i2c_smbus_read_word_data followed by swab16), only it was hand-coded.
I would assume that someone would have noticed that problem in all that time.

Guenter

