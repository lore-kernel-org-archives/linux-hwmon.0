Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAFC3C7E03
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025965; cv=none; b=WrI5/pMa2vBoa0570gCDchGzow1Z0NtRE5jvMEGGLk1etj77KtoPGDYb3hJgfQ+dQh93XR107zglHuDRuO6k1gwhcBsHn50UW/Yp2+5crr8q02o9wRiWBDEyUNAC7dhetVdsz82bj62E3ZQALGnNeogW34FxID0sAFaP8SuMe4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025965; c=relaxed/simple;
	bh=L2W9w+6vxLH9URQi7p+/IvyA/+Uzq/UxyMxJZ9bBeRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocgDT5Zq0+2D7tatTOvKJRipRRVKmsGkHMDrjVTGChrB2P0y4yPqd907q7K1UcctWpxsufMfO0FHEfXYXQKzBvazjo6NeXFjWiHzabzgXu+30JF/Des5Ryq0pi/M9NVW+SVWq9sJw2XazYJFpQHCrTLv2xq/zTB1dE2jVVHVpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij474Kf7; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij474Kf7"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0c955a481so923534eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025964; x=1774630764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DH6eZIfXMuPqwWwyaGQJpfDG4fu2ZIQmnG7Lhe0n2FY=;
        b=ij474Kf7H5mM4VhNNeRo0GfJmmtxrREkgisZywWXi1VlC0rl68CSnY0p951yc0UZGZ
         xXik3R9X/UyWJyx45G/IIXYamH77rLsmy83FD37PgGFeeNZdK2MT1PtG59v94ZgnY41Z
         b3OMrDRdDlT9LnlL1r1mEvX89aP9kMuKGYWGapmz6z5IuaEwepjqGrCpdUCD6zJ9f8tc
         NKQZT4wf0e85SW/Z8EmwnKjk95EnenM3rHMHZt/x2fGjiK10G0ljaSqFXv+YWp8g26yV
         TxQAc90THXa8eWRu65SfXRBIPmVsXY70CuUIi8w58lNoI8bwVt2hWAlhDtThUmqCvilT
         Gazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025964; x=1774630764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH6eZIfXMuPqwWwyaGQJpfDG4fu2ZIQmnG7Lhe0n2FY=;
        b=IljHcY/tF31J3ciR3idRrIynCCAy7Mcys27XX+q6KjDOpX4QWxWjIDTZ1RrPwYI2zn
         v4TIqNSy6YZGPORktroDodprUzGOnLaCEk7N06REn87BAgCYZwhw9k1R380Nxpj3aCHW
         WNWt3ZeGzdchhIFpXXQk/2fRfSXd2+BaxYGyr8RANS0SSg3CQZVg3pJCvdgcECN44RXg
         FAqIR3eaWtFQ4cUVF7Gfi4OfpecQ8YntLQIi7+t/yEARLr2UppuutGKTXo14mbTowEzY
         4F5bG6lJjEvxakTXmaEAALrBYWFpfmejyfyBXoD84vcuqMmugSKCnWiVh+x2eXbFgGkM
         K84w==
X-Forwarded-Encrypted: i=1; AJvYcCVohKGqEFD16YF/PdgL7P8Gv4AWLbwGhWsvI9DcHljY9RquCi+Gf5oDh4lNBvMLa2Bd4q0JDSgB+f6Hmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTrG147rUTLDPSvS879iVpYaIFDJjq34mDxqbpZJgdTToCPUM
	nQwGeadE4GR33ns+yS8fhg01GtgMAP/tjAGpXGJm2TnTBosQ8R24Ki1M
X-Gm-Gg: ATEYQzxIe7YoztMLepUPV6JFmav6sSDXHx7N4LYEOI8bJLm57D2pxvr536Xc2QtdYFs
	z6g3o/JOMDF1B+ROEUFLC2z2Ge+3FE+cyVnR3G9DD0k5eBweZ43SLSNClAQyjJJHSkT0f4ea7hf
	SlZ51O2HyOXrxIkzsIm0X91hvDz3w6GHxTRwqNsskCrZIXQaRTNkkM/uVPy/CuZOuBpwQHJqwbw
	Ui3r/a+1pXe9rbHKJSuoqeBdzFn0nZ1an4CJPg687+wdlE+Kqc7yyAkFw2aVAS/6uB8N5SVpKvR
	Z5kWNYSN4jd4UciSOkUmaoaKDtCRuy0yv1R2eRFCIEP0MvMNbjLE6tcx8ZE8ImPD9fkky56yEyv
	W0cH0fJAjUSzciBa41TaQsAmv67FpV9cNPr7YD/dG6WLjw8+Ucije5E7pJ5DsixklhiQfrNKsKB
	KxO7abZvqMwzovkEddvqA45wMBS2GRDp4b62TeGOvQy/1tvdygSklPPGPnM03Z600DNOcE690m0
	rEt9Alr1iw=
X-Received: by 2002:a05:7301:4198:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2c109712d6fmr2027659eec.19.1774025963508;
        Fri, 20 Mar 2026 09:59:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm3862969eec.6.2026.03.20.09.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 09:59:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1db8667b-5546-47bb-8ba5-cdb99fd60848@roeck-us.net>
Date: Fri, 20 Mar 2026 09:59:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/26 09:08, Daniel Lezcano wrote:
> 
> Hi Guenter,
> 
> On 3/20/26 16:22, Guenter Roeck wrote:
>> On 3/20/26 07:52, Daniel Lezcano wrote:
> 
> [ ... ]
> 
>>>> +
>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>> +
>>>> +/* Interrupt names for each alarm level */
>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>> +    [LVL0] = "bcl-max-min",
>>>> +    [LVL1] = "bcl-critical",
>>>> +};
>>>
>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>> and critical. Would it make sense to do adaptative min / max ? So when
>>
>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>> an additional _cap_alarm for power attributes and _emergency_alarm
>> for temperature attributes. There is also a generic _alarm attribute
>> for each sensor, which is supposed to be used if the specific alarm
>> type is not known.
>>
>> What exactly are the three levels of alarms ?
> 
> Manaf can give more clarifications, but it is like we have yellow, orange and red alarms. So there is an additional alarm comparing to what is available in hwmon. The proposed driver maps orange and red alarms, respectively to bcl-max and bcl-critical.
> 
> I'm just asking if it is important to have this 'yellow' alarm ? And as there is a missing alarm to describe it in hwmon, how can we use it ?
> 

Is this for high alarms only or also for low alarms ?

I would not mind adding _emergency attributes for non-temperature
alarms if needed. We could also add another low alarm if needed,
though I don't have a good idea for a good name for that.

Guenter

