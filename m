Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962733121F
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 21:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867749; cv=none; b=l9GS3qIsVKbyORoWlAH5uxyCOSvx/+rplblpku14xB6UWmDIVdeCugOew79yGg5s4QH9v2A5r/aCSuc0Jp6W/jewWRe+Gg5iWglQPv0P4vVLA8gZiuKf2SxwD4Yz/MgaCwyWVVNNhEOuGPs0NEc6qUoA9J2jSH2T/7GxTatTg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867749; c=relaxed/simple;
	bh=bbPyi1IKHrvlXZz3YSEW14vKIhJmfnptk7rYFjuOiME=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=r95XJ2NsuD3qqoP0tEqh8JHtwlhTNbtMs581YbSjLtxzafQbiucmaaxolOJwL91DH4MoGgs0Kp8EKISSBkBpsddA7m70A8iqIkiL2o+an3BNfwphMeB0ZiKwff1pXYwsIl6NI8S8WjLePbwISbjNJpBUu6Q7wK1JOzckEnBVoFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvraS4ZD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvraS4ZD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b04e6a989eso1946265ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773867748; x=1774472548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LH7Lbg95H8piwE83tNqFN5qewvTimlo17X7rwRxawuU=;
        b=LvraS4ZDRlVpdqP/iF7TMfwj6kQ3dq8g3c9evO0LfayR4bCJmzi/vmujokkQyas7wy
         de0qoif3RoAHdT3AJ7nowd1enFIRLu3d3GAamhaFxeLHM2iMbekpjxq+1L5Tt9/7l+Zu
         XDlGiFZL+Vfd6cHnCSUwrlYIErSm8PxsGUZzOG5B8qBwE6N3R77W/aR4nPkbQNQXvOvx
         Fy8DcGM507A0aufeUpMa1Lal3T6mVYvSYJxlfM+kHsiE1nMjDg+hSG21WnAl7g8s7WbY
         TOdXIOXnsRg/M8EPQxRb2kNhtjea2eN9YWKtrYgI7wfSz59gHnVzqN/3fh3ex0pTND2i
         +rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773867748; x=1774472548;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LH7Lbg95H8piwE83tNqFN5qewvTimlo17X7rwRxawuU=;
        b=p2MHX0QN8lBztOTK4NY+h2LnbJwqQ8WHjO4KfuPfu7pO9KiaWtlpWa6xagW7jZzVUQ
         IMH34yOo4SgE98vPm4reue1XFT6PDa1+rJVJsxRdqTXofQELEoW6fE/xjh93uYqP2sMi
         QMk01nvu1/X+J6TLaldkxIzwWALwZ5M+jmiXCPhYu2LSRqHr6hmFwd4xPq6B/v+LdsjL
         kTKoeMA3CSfSppsv1n8eVgCdSNGVkAVKbOiovyyh3mEEcKoUJlHgGQgipvK6OYQjMHn8
         LlZW0/e9QqsrRGXkfummVvBR+91WLOyq8XuPQl1dkZ+NeuAK/OyMkqjynaUkjYnq6Onh
         l9YA==
X-Forwarded-Encrypted: i=1; AJvYcCUOfORR35GEOlPZ4NcZquSFzXY0jVQsEFoibnaEPmYDim6EpyPjAiuCMHFy6QuOQigvy6L25z4w8Mp38w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyovjJqSKseVJGw+Cg/Pvvlgc4Z5ilWw2cAClF+nqbGMEZBt0zT
	fDT9/LQGmloLDrsTqQ2XlDCazKKJBMWLt8WN8hGNm6Ol5ml2ePZRdfaI
X-Gm-Gg: ATEYQzxWzxNYWXHecqtYaIjvJjNY7x2+GNYvSK02v9afCGQQhdF/P0iKhcJMfYhIWwH
	ucVQWO9YHrvI3RvnSeg0sYPnucJgw1ErQv7E9Msc2ZV34DsbxvbLe6HM/ApDj14azbqlNV/9tc1
	A278RIrMylUtgJqsQUuhFcHenoBFeicgVXH+DOjXLgyweG3+i8SVGV3AUnTvrH1Puq8wr/JnTux
	Llmrkr3aQ4H/VIhomOuQhh5ha+JvrPGl3hihR8gwiB3psjP4gIdgQkCLvdk7SvfePwbGGf8gamo
	9rYILbVVYJ/qw5Huu8vJzHDvTzaL1vuaKbp1PRbXV9Rm4FqhYjJt6aXHePiZkTglf41onsjz+3K
	pVYQNUzuhBoz+cKYkyCrA8Ul7igPACbvb41q6q2m7fJFZRJt0r5dl7vVMFSaOB/Vz89DwsZMZ9E
	CNPi8ja6FCA5CiZCFWtmJeyAY1ofihnmA/kKitayUsdUX+F2Gu0YVAtr9Aagex1ad4a19S5pBY
X-Received: by 2002:a17:902:fc4e:b0:2b0:6a22:5159 with SMTP id d9443c01a7336-2b06e2da3b4mr49002875ad.1.1773867748075;
        Wed, 18 Mar 2026 14:02:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199dfsm37621765ad.6.2026.03.18.14.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 14:02:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b0a878be-4c35-4725-abd7-80701a7a14ff@roeck-us.net>
Date: Wed, 18 Mar 2026 14:02:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/ina233) Handle sign extension for
 negative shunt voltage
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260318193952.47908-1-sanman.pradhan@hpe.com>
 <20260318193952.47908-3-sanman.pradhan@hpe.com>
 <a3f02648-9e6c-4a14-922f-13fb27f87354@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <a3f02648-9e6c-4a14-922f-13fb27f87354@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/26 13:20, Guenter Roeck wrote:
> On 3/18/26 12:40, Pradhan, Sanman wrote:
>> From: Sanman Pradhan <psanman@juniper.net>
>>
>> ina233_read_word_data() reads MFR_READ_VSHUNT, which is a 16-bit
>> two's complement value. Because pmbus_read_word_data() returns an
>> integer, negative voltages (values > 32767) are currently treated as
>> large positive values, leading to incorrect scaling in DIV_ROUND_CLOSEST().
>>
>> Add a cast to (s16) to ensure negative shunt voltages are correctly
>> sign-extended before the scaling calculation is performed.
>>
>> Fixes: b64b6cb163f16 ("hwmon: Add driver for TI INA233 Current and Power Monitor")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
>> ---
>> v2:
>>    - Added (s16) cast to fix sign-extension for negative shunt voltages,
>>      complementing the error check fix applied in v1
>> ---
>>   drivers/hwmon/pmbus/ina233.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
>> index dde1e16783943..819f4e8aeab61 100644
>> --- a/drivers/hwmon/pmbus/ina233.c
>> +++ b/drivers/hwmon/pmbus/ina233.c
>> @@ -70,7 +70,7 @@ static int ina233_read_word_data(struct i2c_client *client, int page,
>>           /* Adjust returned value to match VIN coefficients */
>>           /* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
>> -        ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
>> +        ret = DIV_ROUND_CLOSEST((s16)ret * 25, 12500);
> 
> This may end up reporting a negative error value to the caller.
> Should the result be masked against 0xffff ?
> 

Also, as Sashiko reports, "ret" can be a negative error code which needs
to be checked and handled first. And the mask would be wrong - I think it
needs a clamp_val().

Thanks,
Guenter

