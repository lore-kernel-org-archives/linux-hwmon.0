Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3541321423C
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768787105; cv=none; b=egPx/0sz4U5JvaXlWY0eh4r9eqERYpRwvX9QODSJFaivOVMjX86BUuR6raVA6V9oKTjsTnGRK3aMdgbExr5wkWXsxyVFzOud7pfeE95WLv93Ez72N6Jh9+nKcZQFTIh1RouhxKia5jIIMRs2V0uPlOrpGXdJVDxbA0jIG5I1+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768787105; c=relaxed/simple;
	bh=N6/5EVm2AcMQT1kye/rQbhIFzqexVCwNT6WeSrv3aPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qccm45ooW+7aG+r08qkcQeKjY3y9xKHCm4gD8rtmzIQwB08K2ncp82DhpmYi7lwxDkS65bthpJ32yQj5P0EsEc9ijZSxcBIXOl8a+d4+oj9WxJZzcjo/1PZ83Pcf4PuhkZ8vLGbe3DsQuO5eC45rwxcTZGK2yXQM7Oqxrh7Adnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5PheNVZ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5PheNVZ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ad70765db9so3779411eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Jan 2026 17:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768787103; x=1769391903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=s87tThxbZd/DcmcnvOZNycySqw7quHQWIM3ahwKwjr0=;
        b=G5PheNVZdfbNLJvtZUp4n0KFcv/7jlgPcpNvMXf+cr/0HamgOFwVO7HJS3dUk5RiQb
         HNscq7QNwfRgWlrC7Se0CzVwOlOHL6R7YEQIiqhV7Rqsa8dfRjbJKEb9QnAkZd0L+QbD
         euXOp7KPRTXB5SCFWa1h8KxNR8EumTUNspz/XVpC1x8vR7dEjACjUtmj2sd/8+nYjM3V
         GvBdAHik3En8Q9mXz38j81t4idEK+brDzU8uooWsL3boe31r5OE5n2chey+mGFZYjH8Y
         2ijr/xUlg1gPpvjTiDbuT3PiVEmu3CW/5k/d3wcF4f3obXqzmbUKueXl3Nh2xfY9PWDV
         Zgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768787103; x=1769391903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s87tThxbZd/DcmcnvOZNycySqw7quHQWIM3ahwKwjr0=;
        b=CIzFCyFawVEFUOJc2wyKG6uyS/dFPOuKyd7zj0my+IhLyRDbo0CM18J+jKHIOOtPhZ
         ViOigyXuI3kUA0UdVNi3I5tKvFzTTP+0tSear1rd2bZwgjxbvoTksP0B8WGnem6mjd/Y
         rGkfsDQaq3dEZImxc7VYQw9W9aAvigtGXdPFH7giUyYQRodx254GDMg/nhuLmAy6nnjy
         LY++5hrPsd+byqTZoQXWHeyHDWFmErM9x4VtZpIhhr3Hnn8i2ezC2pwfo83kvWAUOrbv
         rkELBa/EP4Lv3VEkz5L0FNjBOOMXFocz1r8yqzuU1ToQfVVEQOujhc96mLliIwpEq9CN
         GyQg==
X-Forwarded-Encrypted: i=1; AJvYcCVVihGe9z+4CT8bxe0jtvxhVMyRKtInca9jTcIhG7PaELT/SgLsTBFxVnN8t2RYfLssMbEy3Nkb79DeSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBXuCx2u06gTJcR1b74xGnQ4nUHrglLArCnnnhnaRUT/XwpWdz
	Dhq8afykFtxP77hWaOc+RUZQOovzh+uUjqpPyMe0VZCfA6SLP45NeewE
X-Gm-Gg: AY/fxX6Fy2lsU2VAziwBh/2pjwRotmyOhiGAneFTvjBhTeqWiR0ozqx6f45ZUfzkY7I
	e7QlLQNsXeYMSjgRrnYypGfW52ZYpGvaZ2IntqXQo1gT3A5HRzroaj+5/VTJ41BSJHXOCkK/aA+
	WvcW4UpfLDXeGeklUGSVEnKMIwFrWWlYTuMmoHXTZVP3giEnq8Pt119/ffIjWBxNHQC5lDe2zPm
	pXGcAVqkqYRUyoRK6/hQ6LSqcUlevYC1Yk/Ps5u+4gre41DOVoyte+2rssZ4lD155iJ6at1yG9D
	Qz76b3N3W0Tbkgveor5L3fgVu4xRdSx0nVvajJS0xuoQGNOIEWI8ctRPsLJfhy8LkNakbN/VkO+
	g0IQkWumIctmCNJToT5xRvaCfNVAYfwDfYsNmg6s27S4xRmjCOali7SUx01IxpjQKaXopVoXqMr
	ibcAa0XBYX9W3ezo2/68coE8r394MP2cornBaMeZ5J5CfGbtT0zW5Jqtn/mrmX
X-Received: by 2002:a05:7300:6c15:b0:2ae:5b27:d182 with SMTP id 5a478bee46e88-2b6b4e5b5a3mr6897836eec.12.1768787103297;
        Sun, 18 Jan 2026 17:45:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c11c4sm11050254eec.1.2026.01.18.17.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 17:45:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b3fbd4e8-8d63-4769-8b9a-2f4f0eed882f@roeck-us.net>
Date: Sun, 18 Jan 2026 17:45:00 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
To: Frank Li <Frank.li@nxp.com>
Cc: Mayank Mahajan <mayankmahajan.x@nxp.com>, corbet@lwn.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 priyanka.jain@nxp.com, vikash.bansal@nxp.com
References: <20260116113554.986-1-mayankmahajan.x@nxp.com>
 <20260116113554.986-2-mayankmahajan.x@nxp.com>
 <aWq7d5XOpeUYdlzg@lizhi-Precision-Tower-5810>
 <5e4c5665-9094-4ed0-9b7e-0d7c565ad33c@roeck-us.net>
 <aW0Ywij9SDXPDMIj@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aW0Ywij9SDXPDMIj@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Frank,

On 1/18/26 09:30, Frank Li wrote:
...
>>>> @@ -101,21 +120,7 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
>>>>    					  &regval);
>>>>    			if (err < 0)
>>>>    				return err;
>>>> -			switch (regval & TMP108_CONF_CONVRATE_MASK) {
>>>> -			case TMP108_CONVRATE_0P25HZ:
>>>> -			default:
>>>> -				*temp = 4000;
>>>> -				break;
>>>> -			case TMP108_CONVRATE_1HZ:
>>>> -				*temp = 1000;
>>>> -				break;
>>>> -			case TMP108_CONVRATE_4HZ:
>>>> -				*temp = 250;
>>>> -				break;
>>>> -			case TMP108_CONVRATE_16HZ:
>>>> -				*temp = 63;
>>>> -				break;
>>>> -			}
>>>> +			*temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD, regval)];
>>>
>>> This code optimation need seperate patch.
>>>
>> No, There are now two ranges, not just one.
> 
> Previous code use swtich case to handle sample. now convert to use a map
> array tmp108_sample_times[].
> 
> My means use a small patch convert existed switch case to map array firstly
> , then add second range, which make code easy to review.
> 

You are not signed up as reviewer of this driver. I am, and I don't want to see
a separate patch just for this because it means extra work for me.

Thanks,
Guenter

