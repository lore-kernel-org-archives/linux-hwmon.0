Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6E311597
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jun 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781675809; cv=none; b=I5Lf5nlMPy/YdMq1fki+eg1imv3zZnpveW9CQS3NAmksvfhz1OYhoRcBjF9afBwmOWKQ6DdF5L/IFcRAyRcm+RCAVZiAH5El4S6qdm0I9/NWCIfxkhn+XaHOLSrZWsUaCFWg6R9jLz2lKsngjLLD1kCJ1nBtvf1V5BdgJN3Rjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781675809; c=relaxed/simple;
	bh=U4jb1XEnfVj/10uymo5MpBUZyQ6pA2zJ8zU684ftx+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhqQVG55BD8InPhCD4QGd82lBei7NZPHsiz4HehEVQHj5uRFdjup4J4cMvVnmdU3Vr38zwGVk8ia9IdedJJiYS7R6Qf7A+PehoFfZ1nWTHRdeFirDOk32pxeE/pLrBxFXluX/54G5kuYkfnPq3BKwJP9dl/21tkRb3SBFgxF7IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZDQfNqS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZDQfNqS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso5486193e87.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 22:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781675806; x=1782280606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZAGUj+0EAl5ib1P7hbkGJIeLUQqhxo3UG278FtSsv8=;
        b=gZDQfNqSiBnlo6rLr7XiUn3jOb6HpRoCzbGZXX2HgXlljePUCKSjZR5i0r3wikIwiI
         7/oRNgOVW0feLEk+ylHc84xF611pPUHgRrPh5dV5QgAy1neHms0UbPORq+o6v+D/or8B
         crWimb3Gd7c8bbCYgj+nfcZe1/2Cm5OBMtYeX3SPNlnAlFF8bT4Y5/PBgc2iQyCxjupA
         IDDGJjlkcgEqY9xN2/YsPEMHpXuCbHuKD4eZvR/X92aHT6CZtnTdPrz/bSpx1t1rWBV9
         IcbsfqnUNtI5bxayqE0+Twm59pIKEEauRSsV6cHpVso4qBJMYZfBoOpNO81d+ZsyiXdh
         tlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781675806; x=1782280606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZAGUj+0EAl5ib1P7hbkGJIeLUQqhxo3UG278FtSsv8=;
        b=Nj1ySJlIrcJVH1SMP1B4sBbSCoYAmddToB06/0kKYBBXvIymZptzuyddXMMli6wvRb
         xInqE0rFxh/Cx5JuFxWu+3bQx+GwsKUqOUQO9QNTgS+7LPZkCX5cAS2+1NfLBMHoLcjC
         LSdEBH2O7amN5hPyXjl08CZBZ0reskqUKQxIBab8mtXA64tz/ZH5qA0G36gDfGBNfuL8
         NJ1r1OWxgDc1KfIv7QWtE08qX6d6bNmqAMSlgMvWZ7kJlI6v2yAnlU+rwxqkbpsKYU4B
         Nn/aFLyzLWwo122SJhFX9iZo4kMAkjHGb68P+aT6ddnCoejOcpUtJG/ze77KnKoP7+/q
         1yKA==
X-Forwarded-Encrypted: i=1; AFNElJ/BURq2/8qdHIBnPztlP+vEqwlTuEPhDRnR72ezCXGgrVS32P05PLOX7VCv6MoyWZbqS3jO5sF61KKZrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZeAdajs4po5FBQpIyQeyOOVZGgNwBjOHPFij0023dlwzpkvGW
	PnZ1XdRBcAocCQntQ2Am7pibUbrJxLOfyS/TNeT3dzDTDNRKbHK3BUAN
X-Gm-Gg: Acq92OEUF8szENUaxUoMWRogDFvDE/MNEPXfLHyMoF8IZZ/Cx+zV6ABBOvajMIAELTP
	JbemriUM59nRldFe59Ul778NgOiCx4M69aL1ESnunfh0H/x5XmHKpBIKsZqPsYtWtpuUoIWJCXo
	sQoO5Pk2G8VxYJXNiMIApCjefVWXsEbcnyOTFGNmxw7L+oSaH3xZJ6f6IfsKFbVLCMVrf+YnID4
	gIJ7IXAoENa+wOY72exnVHFMWxa8BRCMe74An1C+kH7KHuanwHn8cxBc7/nkV/gqX9nc0NAI+c1
	7AiuK+3FZ05YdNOZUvn2HcXiyy3UNRi7fpCjLbwSVHLw5ARivI6719g3ckZ1gj2uwYSd5sb8DVo
	EXrgBUBQPRptrZKHL/1fgpUrUWfS7Sisl8WHLb2z8UXnXYTGz5B01S4b7Q5Pi/KknnU8qCc05BZ
	FdCU44vnTnyyHn9+2sokkSR7psLQhd3vG6Sa7t3rwZFG4UCOjQnyApP7vcQ6kyvngw82TKuA==
X-Received: by 2002:a05:6512:3d87:b0:5ad:3035:c2be with SMTP id 2adb3069b0e04-5ad470250fdmr678739e87.51.1781675805782;
        Tue, 16 Jun 2026 22:56:45 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162222sm4195880e87.17.2026.06.16.22.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 22:56:45 -0700 (PDT)
Message-ID: <7e430392-1b27-4c3d-bfc7-1311b9838156@gmail.com>
Date: Wed, 17 Jun 2026 08:56:44 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
To: Guenter Roeck <linux@roeck-us.net>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
 <e1673147-a51f-460c-ad09-21f54d3d6803@roeck-us.net>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <e1673147-a51f-460c-ad09-21f54d3d6803@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/2026 17:08, Guenter Roeck wrote:
> On 6/15/26 23:44, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Add support for ROHM BD12790 hot-swap controller which is largely
>> similar to Analog Devices adm1272.
>>
>> The BD12790 uses the same selectable 60V/100V voltage ranges and
>> 15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
>> (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
>> a dedicated coefficient table that mirrors adm1272_coefficients, with
>> the following differences derived from BD12790 datasheet Table 1 (p.18):
>> - power 60V/30mV: m=17560 (vs. 17561)
>> - power 100V/30mV: m=10536 (vs. 10535)
>> - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>
>> ---
>> Originally this patch was AI-generated. I did pretty much re-write the
>> probe changes by hand, and also fixed some of the coefficient math
>> afterwards :/ But yeah, this one was AI "assisted". :)
>>
>>   drivers/hwmon/pmbus/Kconfig   |  4 +--
>>   drivers/hwmon/pmbus/adm1275.c | 53 +++++++++++++++++++++++++++++------
>>   2 files changed, 47 insertions(+), 10 deletions(-)

// snip

>> @@ -655,12 +681,23 @@ static int adm1275_probe(struct i2c_client *client)
>>           break;
>>       case adm1272:
>>       case adm1273:
>> +    case bd12790:
> 
> Please don't overload the existing case statements.
> Just add separate case statements for the new chips.
> 

Hmm. Ok, although, here, same as with the BD12780, I would like the code 
to clearly show that the BD12790 is very very similar to another IC 
(adm1272). When we have own case for it, this information gets kind of 
lost as these cases are a tad too long to easily spot the differences. 
If there are any ideas how to ease spotting this while having own cases 
- I am keen to hear.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
