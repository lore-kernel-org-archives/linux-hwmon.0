Received: from mx04lb.world4you.com (mx04lb.world4you.com [81.19.149.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0915B543
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 22:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741557850; cv=none; b=ZLbsYppv/Ou5xctcawgB3gqqIQWH73OHyl3EgGmdItMnwcbA2/Qp4T4X3n6GGOzVFP/3dojtyD2OGzgqpecOcnHPy9luP2m7s0aq5sHepU0fJiuXpktsYVZnCemvct5PwCgmYtxQd1IiSnubQEOuNPKItEULUUj/HAKouzXeVMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741557850; c=relaxed/simple;
	bh=UuaHfPbeMNMl8DBm5BmUwfZgjrAg8dJ3BblyQ0OaFBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmvH24enHKYt59e0kg44IlsItxfkYp3ksYwgh0hecjwVM3C+dLRaHyfnCc7iwbXuBQfStoI3dqYNyqBzC4mT1sEOKZuNCL5RNpLPQx8N87mJYtiCkfwp1pgTyms8JSp5rvHldP4YsIkky/XbxMaf0W54aGmbaIM/fXnItQft2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=YTsDSEqT; arc=none smtp.client-ip=81.19.149.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="YTsDSEqT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kmfwlhZ8zzAviWbwRySzG3sCDtiqi7zA00PMNv256m8=; b=YTsDSEqTI5hZkGg4W8aP0Vj95T
	DDBTSx8qC4hG/OZGo8N3we5G+yZTlzic/HkReD9RzrnoFstse6i4koFLtcz6wGDRkPCHSzrq1mGdr
	v9/zX3X2Hhni0R5EiDhWrIbCSAcyRJ+Wgdx/f1uSafLz4jpXDqod0NFeOQjYmYZw/7C4=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx04lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1trOkf-000000002VM-238t;
	Sun, 09 Mar 2025 23:04:05 +0100
Message-ID: <71f2d248-9bcd-4b50-8044-7895e23a0d68@engleder-embedded.com>
Date: Sun, 9 Mar 2025 23:04:04 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 Gerhard Engleder <eg@keba.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
 <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
 <f65dd656-2195-4686-b2e7-bdd5df47ede5@engleder-embedded.com>
 <27859459-2640-4e33-93af-dd9c2ca0f16d@roeck-us.net>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <27859459-2640-4e33-93af-dd9c2ca0f16d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes

On 09.03.25 16:22, Guenter Roeck wrote:
> On 3/9/25 01:16, Gerhard Engleder wrote:
>> On 09.03.25 09:23, Thomas Weißschuh wrote:
>>> On 2025-03-09 08:38:06+0100, Gerhard Engleder wrote:
>>>> On 08.03.25 23:23, Thomas Weißschuh wrote:
>>>>> On 2025-03-08 22:23:46+0100, Gerhard Engleder wrote:
>>>
>>> <snip>
>>>
>>>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>>>> index 4cbaba15d86e..ec396252cc18 100644
>>>>>> --- a/drivers/hwmon/Kconfig
>>>>>> +++ b/drivers/hwmon/Kconfig
>>>>>> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>>>>>>          This driver can also be built as a module. If so, the module
>>>>>>          will be called k10temp.
>>>>>> +config SENSORS_KBATT
>>>>>> +    tristate "KEBA battery controller support"
>>>>>> +    depends on HAS_IOMEM
>>>>>> +    depends on KEBA_CP500 || COMPILE_TEST
>>>>>
>>>>> KEBA_CP500 already has a COMPILE_TEST variant.
>>>>> Duplicating it here looks unnecessary.
>>>>> Then the HAS_IOMEM and AUXILIARY_BUS references can go away.
>>>>
>>>> With COMPILE_TEST here the driver can be compile tested individually.
>>>> Is this property not worth it? But I can change it if needed.
>>>
>>> COMPILE_TEST is meant to break dependencies on concrete platforms.
>>> KEBA_CP500 itself is not a platform dependency.
>>> The platform dependencies of KERBA_CP500 are already broken through
>>> COMPILE_TEST.
>>
>> Ok, I will change it.
>>
> 
> FWIW, all those COMPILE_TEST dependencies are pointless:
> 
> drivers/i2c/busses/Kconfig:     depends on KEBA_CP500 || COMPILE_TEST
> drivers/misc/keba/Kconfig:      depends on KEBA_CP500 || COMPILE_TEST
> drivers/spi/Kconfig:    depends on KEBA_CP500 || COMPILE_TEST

Ok, I won't add them anymore.

> On top of that, both SPI_KSPI2 and I2C_KEBA select AUXILIARY_BUS
> which is equally pointless because KEBA_CP500 already does that.
> I2C_KEBA depends on HAS_IOMEM but I2C itself already depends on it.

I'm sorry, I didn't know that Kconfig must be strictly minimized.

> It is also ... odd ... that KEBA_CP500 depends on I2C. So it isn't
> possible to enable any of its sub-devices without also enabling I2C.
> It is not immediately obvious why this would be necessary.

The cp500 driver uses functions of the I2C subsystem to find a defined
EEPROM.

Gerhard
