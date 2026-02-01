Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF692F851
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 01:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769909104; cv=none; b=hH5Bq3zDJWknC7DGYyR0mRaeGGuTLO+95HByjIafxe5JsMYiqd6zS4HGHcW67s+lSGeWkugD/Hg+QqnZ/Vr2ROOxAorYg/z9D3++cb87yqabEJwLmmm5voE0uyxXhZsRmyUHY829jQItKeMMSG1rRNKbnXcL+yNQ4XxIxWXXbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769909104; c=relaxed/simple;
	bh=1zJieALU8h1RXKP7jBg8CVRQ4QNRYUzTmQe61tr82mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgN4b7B9k7k2Z3zEn6VdCBHB4KB80JfpJBq0+/lnzLzNGTJStkSVylE/6QcPHrBKcGWFmQgYruxi1zqpiWQF1dFVquMN9IyQ9dIRH3XYtTfHoSTlsF4uIMvs1pZwH8Gz+6YUOHNUf1LMD0TDQg239LdasAgZrA/7j/Tz007QSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXklu7VO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXklu7VO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-823c56765fdso425618b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 17:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769909102; x=1770513902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CvLvljMAsvteMqSz8F1hEW5JiUfBr6cONobzhspFMuI=;
        b=SXklu7VOopOZHhZYU7zqjmECgEDW6jyBAtONaZWj9UoXh8ot48QubOMx2fZC7iIoQd
         8CcUB2XndfyjQ6+GMpO4ldWmUOx5v+B9y+g+gMfkCaqV7Uqu/qo8qchOFUhuRP4sGFz2
         qMAX/tyvb8Z4QFJKw1ctGRHVugN+Nxp7LDGb1NwIGQwSZwdc4j1pLlo25Xf1Ah3sykzr
         M64acQdPj3gB1qhCwjMHTCXHLX6iaH6qhTXgiis2o/06fCNStrl/FLcj9xp0vhrM4Sf7
         DG8Jd+8Is9yeDtdT+h+tEGPkHyIzuTv6l02MfNZqj0CSLdibqw3/2ug9cIa2oINguHIE
         okyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769909102; x=1770513902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvLvljMAsvteMqSz8F1hEW5JiUfBr6cONobzhspFMuI=;
        b=OqOtxUgJTwPoRm1q4oL50DlYLTTPaEesDbO414v2qRx3gIjpyAqbTrVexsj4y2LiQu
         9eri38L1oni0KboPtRMKCk/zWEJbXuJJAVOB5lf72p6bzjNET1qBrlWX/O+J5PMydsWs
         RnJrUcy03xVEE63Orpx7c7IEEbGtpPGWrhq/HDY8P2+msy0PC/BzQ6zzvh6Njo2TDaoC
         7u6qCeFt9cv1CfkNIhP22EpTXh5Od6e3qhhrGnYOhKxW3AyDRzKrDtnHkvBv1AGKGksT
         SYUCHP9QvKjnoJ9MnUubCRZ0rPek9TIVxgqIrGNuDy/JlpkCtPjj8NP7CmWr/t229JvU
         dvag==
X-Forwarded-Encrypted: i=1; AJvYcCXud1D+z+A/roB4z7Bdn7pJ7lM+e2HHV4qyoleHzfVSRldwnUwjqJrC6jok5G4BBRNFU7FP+/Xu00ZQjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjEJqTXe0mSNIZIUOulzA9gKh+Hu9xKf54QKM18sGi7qywtVS7
	Ibcd/deCncjSZ0T0T0vv2dGshfQpjv3WS4YOz+BdyLfZcDTM56kF/rZV
X-Gm-Gg: AZuq6aJTYZHd1Ax1Yz3LdKnnBOCkPwWZwB3kFeRf/QY1ZdZ62O9VvWjMY8xz8k1q4HV
	0EJxD1nDaZGptieQGSrGYVd4iNffPXAGPPVHW/6nyiX7anAmsLs1d5rVprsVyxuboI/8lY1xTje
	HZxZchjcxs/Y/hmF3JUHFAgaNVzdJU/iNtXyM463ouW3557agvE5HQeL9E1T8R60s4olb4CpY1b
	bnca/gDwgSM4jmpYROZVQE67VuOXPVOMbEFx+oXFx/TQjC+6ytFjGd77DJ5Q14d08rubx3q69/j
	GM4l//DH0OkRfPAYyjL2DXW1EnlBLf4vWplQJPtAP4XzoJbTlfcxAlWWpm0NK1Elibu8wkhOT98
	OC9Izyecc0CNEU5mz4IcCrvD6Sx8RCZEcMNYNWnzTafM8YlaArERZr1Z2ZB3s7eJzveva/4yvZt
	PFZFqLmKLhaO0X1+L4VQuJQQU2mFRNy+mUUwG8aPspU7D3jjyzqLBGQsau2YAy
X-Received: by 2002:a05:6a20:1605:b0:38b:ea2a:2843 with SMTP id adf61e73a8af0-392dffe90fcmr7782753637.10.1769909102009;
        Sat, 31 Jan 2026 17:25:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f49fasm10612078a12.28.2026.01.31.17.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 17:25:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fb688a65-b2cd-4223-ae04-130b5657712d@roeck-us.net>
Date: Sat, 31 Jan 2026 17:25:00 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
 <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <CAJ12PfM5xf0+Qy07S5OoLPkpnhZz+bj5a+hTSGTfrEFN2R6PCw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJ12PfM5xf0+Qy07S5OoLPkpnhZz+bj5a+hTSGTfrEFN2R6PCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/26 11:50, TINSAE TADESSE wrote:
...
> 
> Hi Guenter,
> 
> While investigating this issue, I previously mentioned
> about a flow where SPD write disabled state can be
> exported as a capability from the i801 controller, so
> that the SPD5118 hwmon driver consumes it.
> 
> The SPD write disabled state is known to the controller
> driver (i2c-i801), but this information is not
> propagated to client drivers. As a result, auto-detected
> devices may be instantiated and probed even though the
> controller cannot support the required access model.
> 
> This raises a major architectural question:
> 
> Should SMBus / I2C controller drivers be able to
> advertise bus-level capability constraints (such as SPD
> write disabled state) to client drivers, so that clients can
> make an informed decision during probe?
> 
> A capability-based approach would allow:
> * controller drivers to expose what is possible on a given bus
> * client drivers to decide whether they can operate correctly
> * avoidance of device-specific policy in controller drivers
> * consistent handling across different SPD-capable devices
> 
> I actually tested the possibility of detecting, propagating,
> and consuming the SPD write disabled state using an I2C
> adapter capability flag. Using this approach, I was able to
> fix the issue even with the CONFIG_SENSORS_SPD5118_DETECT
> kernel configuration enabled.
> 
> At this stage, I am not proposing a specific implementation.
> The goal of this RFC is to get agreement on whether this type
> of problem should be solved through capability propagation,
> and if so, what mechanism would be preferred.
> 
> Any feedback on design direction, or existing infrastructure
> that could be reused would be very welcome.
> 

I think it is a good idea, but how would the flag look like ?
The i801 controller only write protects a range of addresses;
I think it is 0x50..0x57. So any I2C_FUNC flag would presumably
have to be address range specific. You could try adding
something like I2C_FUNC_SPD_WRITE_PROTECTED. Either case,
you'll have to ask the I2C subsystem maintainers for advice.
I would suggest to give it a try.

Thanks,
Guenter

