Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D3322E
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721655949; cv=none; b=rgPFB4MJh1DDwIxY4t77JLcxR5+CSwCMxBif6eECW/gdxEDJy/3WsS/zZNTUbF4Pt71jlq126cUvkTvC3RhNeJOngutjGSNUaQ35mEElQMWl6T1klt3QD4zcLNVxNXqrzp/MFHUHd724AXZCymbKeEqm893fA4QNXLIR/Kv6s40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721655949; c=relaxed/simple;
	bh=d6sdmsNqop898mHAo4+UjT3Hf7ZGj3W7t2t7YS3Bx7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+RWqwm/mYekKC0M2qa49I/1A0U0FdvJcV4Z9m4ybC0LEc23WeEk1t1rdY1pSuOwTkARLt4tSCeRs33bh/ZnQbHFJPtq2YYDFXK/B5+Q2Maiuo2KULncVaE9SgvMCdFfw206tADZmFYBGKpqKI9SY1KtqlgtJ9noXd+dm6chIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXBpOyKT; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXBpOyKT"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7036ab4a2acso2286737a34.2
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721655947; x=1722260747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S3j0U3T/veTF4H4wL2ok0u6PwR9PNMFDWttUo6ijjSQ=;
        b=eXBpOyKTrwhaSlRotnDOKBwm3R+WG18sMS5c84zxZMaun0eIQZG8EzSP94ZU4TptNM
         6pFVlX9aNAApm9JROzhdIRP97GPNle0XPLiFEiuqVP3ae+z9O6MVeqjiCX+KKtYw2Wgl
         gASR2sfglMINPpJYige0TT4Cj++YugtgHSH5Ln2pJAc8iGlAjvD1dMoxKsuwiIjS8DAs
         dTHdgExLWMcv173mdqWofS63ERCF6CzVraeeJ9UCJSzHNzVquaG+1cfH7X8DhIe+978E
         UYwxlc32JslxblA5o9wOI6diw/hk8mPJEHrnQFC0CHi6NNmbEo5Mdn3AuFN2xW/zIgKT
         rXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721655947; x=1722260747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3j0U3T/veTF4H4wL2ok0u6PwR9PNMFDWttUo6ijjSQ=;
        b=d4UMgpRwHkK6USdCZiKNH4tPYFGVjj7LGzwXUvPy3Y98+5BLH2EvzXliyCIFytlpYW
         V5uLwPDnm1EigX4HTzSG/H6xOaVXrnrWWvV1uawYRhzkklIDo4yzSEzmQfUx6FQAXURf
         zFR2J0WoXE7XPRqWvGHHFaB16Ay+G0OAvJlOoIY0dm4q0VETDiOfCgzlhixuEGTIjK1i
         3ATk66iqpcreOce9n3aEGCJqJG6RxNJdK9+9/eBN+xxYEf0fR4V9BN1vdQRgwjrgzO/U
         Zpr4xO6TrG/h3xqf8BOMvjUv7AtudsjoSURXcgQCVarQ39zZRDU8IUTWVQg6+7+3dLXy
         RphQ==
X-Gm-Message-State: AOJu0YwDxl6nLaq0vtV0WZz4BbOrOW9IYRE2CCa8b12P3PnHKdBDX9mi
	EVPP3O7aHHpiDnUrElhNWwP+pnS/9vX8fvMCFsIoil9XxiD51IZ7
X-Google-Smtp-Source: AGHT+IF3V42YMeZLvUDg9D2mmAgMJl0UPsiuUBnv+76IXRmgw/0uAS00MkJ/w/AoVOQXhre/4CS/Kg==
X-Received: by 2002:a05:6808:308e:b0:3d9:245c:4225 with SMTP id 5614622812f47-3dae5f4b7ddmr9540652b6e.6.1721655947151;
        Mon, 22 Jul 2024 06:45:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a23c3bd206sm1696432a12.72.2024.07.22.06.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 06:45:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5785d51e-660e-4292-9d19-c5a9502f9909@roeck-us.net>
Date: Mon, 22 Jul 2024 06:45:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (max16065) Fix alarm attributes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240721193506.2330006-1-linux@roeck-us.net>
 <20240721193506.2330006-2-linux@roeck-us.net> <Zp3ScBZOJQixuFN9@google.com>
 <3335085f-7ab5-436f-b358-f53a3763b63b@roeck-us.net>
 <Zp3yYg6eA5_UVgCq@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zp3yYg6eA5_UVgCq@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/24 22:47, Tzung-Bi Shih wrote:
> On Sun, Jul 21, 2024 at 08:48:51PM -0700, Guenter Roeck wrote:
>> On 7/21/24 20:30, Tzung-Bi Shih wrote:
>>> On Sun, Jul 21, 2024 at 12:35:06PM -0700, Guenter Roeck wrote:
>>>> Chips reporting overcurrent alarms report it in the second alarm register.
>>>
>>> I can't understand the sentence.  Not sure whether it needs to be rephrased or
>>> not.  s/overcurrent/overvoltage/.
>>>
>>
>> No, it is over-current. Not all chips support current measurements.
>> Those who do support it also support reporting over-current alarms.
>> Over-current alarms are reported in the second alarm register.
> 
> Table 16 in [1] and Table 11 in [2] use "overvoltage".  Please ignore the
> comments if I'm misunderstanding.
> 
> [1]: https://www.analog.com/media/en/technical-documentation/data-sheets/max16067.pdf
> [2]: https://www.analog.com/media/en/technical-documentation/data-sheets/max16068.pdf
> 
Yes, those two chips don't support current or over-current reporting.
Only 160{65,66,70,71} support it.

Thanks,
Guenter

