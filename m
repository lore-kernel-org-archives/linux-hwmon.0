Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1325A655
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 01:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288936; cv=none; b=K6Z/G2M2+5FXL/WSrdHeDhoM2mLp6sH2N4Qb35lBhxE7bf5xvxELCIpm53rYbJ4T/EEKr12ooAz+Y2Y4zD+oLienYg16LuDVOuCqWgch1CwsGchJc+zrB9mozXJyMryeu8s27mqPmYzADh7VCtyG3HviNe4sCj3m1jjdjsbTL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288936; c=relaxed/simple;
	bh=sV2SvcZOHypxN+2wpELw+PZPGTBHySBWn6AG9jFe1fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8yVxUiLPn/tTuX7Ch8vyzWG9oe5pmq01Px3G3CYGM6ekwAbBTD65kyB5MyKyIgS0AFB9iUR1y2rYu8ZeGrN+hkmN/THRbQrT3aO88zH+mMcwkse26tomdMcu7eHDTzyWTgrLE2YHpjDc1jgN3WVClqgOIOQynsCyEh3pYCrVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rE2Yb5dn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rE2Yb5dn"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c998fd549a8so228303a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 18:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288934; x=1785893734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUfiCLkCKlRJRlT81ihqbtaGYX9nwrTTHIIwvNg7zHg=;
        b=rE2Yb5dn67lsI+LvrhJxj0jm8/uaFp1jTANWpLBHfyw0fi4a+Lp6cmA2PLKHBeLT3m
         c9d9+4nZnmCokyFZkLlDdTspXgKHl5yewkmUEAo/EM6Iw+5A1Sq5H2DN1QyTowyDeA2Q
         TQaGqIj+N5prEcy1jWrbkSGbcKzKD2eIe2G/HHCnNY7MbadAfqPJq4fdHHBPBiu0AMoj
         we6t0tbDgaovCqGNUpDyDvTc1DQTug/1Y5Sm2dOMf7ovO+AWmd0f2nYwZCn5Bmr6rg7/
         R2dCXZTHa+KNEFb8cspu5b6MmaQ9g4ciLTzl/eH6SbVFWam8838jyhUb9BNVUInjnYUk
         FZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288934; x=1785893734;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tUfiCLkCKlRJRlT81ihqbtaGYX9nwrTTHIIwvNg7zHg=;
        b=L4j5ya3YWuM2zZI3YbdD7NnCKL3OMMJscHpNO5wLd164TCZBcAEuopTIV3qZ7/lhBt
         fgsXUeydcS9u8YShfySkr1PQ2r2QgtcQwVsBwHm8jDX9ZIPuYUXKQOo13NJ/SZ+FJSTN
         I9kua8jjk4Vyd8ZMbrS8e/SZTIBlK6YlC89zDUT723w24eZ1l0ot+FrpYzOyWn2PidSJ
         RDzTkgcCN3D7cU6E+Z1pT+t17O4whJf/qYuqYyLpV507o2ru55yQRigV/a6KleKCuXZ3
         MUc5bh/K/57LITgZknW2E+UcALdSbiO+6XV/A0uPDHZdC92TOApE2U4FJNN/PWU9HEwg
         uXJA==
X-Gm-Message-State: AOJu0YxZUmNf5lmM13IxblSKD0Pe2WirfvRphL/mIP78sAejZUvtXJ26
	KqYBBWm3gj3V4ZJb8IgdSrM5JdBo2XJ2Ov8418Ri/A5Gnu7ie6p/VMIi
X-Gm-Gg: AR+sD117HU0OLaQNf4/StmE47zPNzsaItFWRNs/OUcXTWwuCBFMSbeWPUkaQ9HMSbvy
	l3KR+Q2kumyGKl0fzddtQ0lS94k8GjUplV5C8sEUYS3jlHcp8YsxAeugXtlWU3EYBFM94dX5LnS
	wGN8OKyJL0ad36oXBgSWyclwNV+O7BF082I//QaDNFr44mhRpnG1Ucl4kGa+lK65wJUxLDkwhkV
	QRq4sP+HsU405wFqasPLHEZdqD47xNAn5Q6yNilMJ+vaklQFStuxIcn3DVOHlXc8E5Wy0XkrcEK
	k+hbCSUCqQzyNCeVghAZ0MeLK+35YwZ8aHPHCTXG6NXgbVCxEx8X8Eu+fIGBANZ466m2UuMuKDp
	8IYNZX0W1ccU+PkUdKu7H3gMGKSuf9XQQqSBrxsaPmcdggd7HC7yYoHj5ctIYA4v5zNfLAalHU2
	rIVOD53NlZGrpbMe4LfdqGxFe6Y4KC5NT7xRyhXDFE9hKp+umPu0FAA/M0x2Wfcvao+eHhbSgRx
	+apWHk3PyBRkVagsjTQ114s4P0d2V7UXYLNSHblgelRAdkB
X-Received: by 2002:a05:6a21:648a:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3c8ba472cfcmr6275680637.33.1785288933992;
        Tue, 28 Jul 2026 18:35:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b12cdasm4024680eec.1.2026.07.28.18.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 18:35:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <354c3535-71a8-4058-90fc-a991657d1e80@roeck-us.net>
Date: Tue, 28 Jul 2026 18:35:32 -0700
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
 <9812bc9e-75c7-49b8-82c3-1e9162d53ccd@roeck-us.net>
 <PH0PR03MB635177B2B6831AFFAA2C30D6F1CA2@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB635177B2B6831AFFAA2C30D6F1CA2@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 17:25, Torreno, Alexis Czezar wrote:
>> On 7/27/26 23:58, Torreno, Alexis Czezar wrote:
>>>>
>>>>>>
>>>>>> Are those chips still not published ? I find MAX20840T, but no "C" variants.
>>>>>> And MAX20840T presumably has an I2C device ID of "MAX20840", not
>>>>>> "MAX20840C".
>>>>>>
>>>>>> I also noticed that MAX20810 and MAX20815 seem to be register
>>>> compatible.
>>>>>>
>>>>>
>>>>> I believe so yes, they aren't yet.
>>>>>
>>>>
>>>> I just hope they are really compatible, and that the device ID
>>>> strings really include the "C". The "T" variants seem to have no T in
>>>> the device ID string, making it a bit odd that it was (or will be) added for the
>> C variants.
>>>>
>>>
>>> Yeah the T is weird, but I did test the C variants and they do reply the 'c' char.
>>>
>>>>> Actually MAX20810/815 and a few more are next in line after this. A
>>>>> different person is handling it, but they're waiting on how this patches go.
>>>>>
>>>>
>>>> You are making yourself more work than necessary. Knowing that there
>>>> are more chips coming, the sequence of strcmp() is not really that
>>>> desirable anymore.
>>>> It might make sense to create an array with all chips supported by
>>>> the driver instead of adding up strcmp sequences. That would make it
>>>> much easier to add support for new variants.
>>>>
>>>> There also seems to be a MAX20830T. Does it actually make sense to
>>>> list the variants (C/T) in the first place ?
>>>>
>>>
>>> Will think about how to make to scale the code when adding newer variants.
>>>
>>
>> Something like the following should do.
>>
>> const char *supported_chips[] = {
>> 	"MAX20830",
>> 	"MAX20830C",
>> 	"MAX20840",
>> 	"MAX20840C"
>> };
>>
>> ...
>> 	for (i = 0, supported = false; i < ARRAY_SIZE(supported_chips) &&
>> !supported; i++)
>> 		supported = !strcmp(buf, supported_chips[i]);
>>
>> 	if (!supported)
>> 		return dev_err_probe(&client->dev, -ENODEV,
>> 				     "Unsupported device: '%*pE'\n", ret, buf);
>>
>> Then all you'd need to do to add more chips would be to add the strings to the
>> supported_chips[] array.
>>
> 
> For some reason they didn't ask me to add MAX20840, and I did double check with them.
> 

Odd. Well, guess we can add it later if/when someone asks for it.

> Code wise, I ended up with this. (I guess am trying to avoid mailing a v6)
> 
> ...
> static const char * const supported_chip_ids[] = {
> 	"MAX20830",
> 	"MAX20830C",
> 	"MAX20840C",
> };
> ...
> 	for (i = 0; i < ARRAY_SIZE(supported_chip_ids); i++) {
> 		if (!strcmp(buf, supported_chip_ids[i]))
> 			goto id_ok;
> 	}
> 
> 	return dev_err_probe(&client->dev, -ENODEV,
> 			     "Unsupported device: '%*pE'\n", ret, buf);
> 
> id_ok:
> ... (probe after)
> 

If you don't like the extra variable, you could avoid the goto with

  	for (i = 0; i < ARRAY_SIZE(supported_chip_ids); i++) {
  		if (!strcmp(buf, supported_chip_ids[i]))
  			break;
  	}

	if (i == ARRAY_SIZE(supported_chip_ids)
	 	return dev_err_probe(&client->dev, -ENODEV,
  				     "Unsupported device: '%*pE'\n", ret, buf);

Thanks,
Guenter

