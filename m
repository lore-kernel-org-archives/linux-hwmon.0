Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848B27AC45;
	Sat, 31 Jan 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769851352; cv=none; b=oVs1m7RNShn9NMFgg/IGwDOg0E+79VXUvPv6IMCwRBXyoQ9RFFBYeb2yKjdTCSwHvX1nVMD+KowgcDr023rE8fw2u7F4A9Bd4db4CE8pIuqfo44XmkEdn/bfHqybQc56AeG1JnkUFV+7TjN9aBVmk929K/eS5NLFl7RHHyrsY/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769851352; c=relaxed/simple;
	bh=vu3nwszHlk+WryheOICtx9/nuvgJ9myzct94p/XyHJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxZbype3ngX62kZH8oXOSmPNCEh7gyINT4eir4HpQBmNDtUpl96iGPqIFQVsWrCbCcskntj+c4c52vtnJftbUG0Hs7d1oUHb7aKnYlsSKLwaqWxH927LFDjsOzbwhjafgpBoJedfhSG+HEGbfBFMNHaz/AR3usdUmEJJat7/oF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ndX0ot6Y; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ndX0ot6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769851348; x=1770456148; i=w_armin@gmx.de;
	bh=vu3nwszHlk+WryheOICtx9/nuvgJ9myzct94p/XyHJE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ndX0ot6YfHoKO1wA8DlHmnOZiaE37P3ojUacqt10zKbisaP14VdetadAnwCwsV3U
	 cViv5l4y+KJ/ifnADsqOSV9iggAUl/iSmk5dpXGqopXHFBFQID2Q0qzM7khwJddXQ
	 MVG8Q2+VTqju8/+VXviIG/Ap2TGkJl4TDFuqxE7EK1oPo+F2u5Et1c3qNtxOVk7MD
	 wEZCZSOWj3e1gzEOXpVqSAJWttsh9eU8qQWqPsZvXS0kA5TYFWh+Sn7MrM+hHvK7s
	 SSuN6Pv8C4FzhWfRY4DSQXh+cY3MMl2PA6YCgjKrtOOLNllhuSfvR5RH1OHysdZkj
	 DU5Kb1eS7myJaVl5aQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.67.125.97] ([164.15.244.33]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1vEoaj0xZJ-00V3tO; Sat, 31
 Jan 2026 10:22:28 +0100
Message-ID: <77f1f2c8-b072-4625-a4ba-2e4882108ec7@gmx.de>
Date: Sat, 31 Jan 2026 10:22:26 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Guenter Roeck <linux@roeck-us.net>, Kurt Borja <kuurtb@gmail.com>,
 TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net>
 <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com>
 <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>
 <DG2D60UNIM2J.3BXEHP4RJU0BL@gmail.com>
 <f9a4e815-bb21-468b-9568-b4acfd792527@roeck-us.net>
 <DG2EEU6SXFFE.20DWQUV1BW9QW@gmail.com>
 <516f5dfd-3e84-4938-bfea-5c52e884f1af@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <516f5dfd-3e84-4938-bfea-5c52e884f1af@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IBwQMCyypokCOvbfXwlQKoIbg3VQJ3b0KiD8heKtVFVJLIjIM3c
 uIGTUPln7LGAqjzFgKeMIeHKxPheBdi/Q81ri2K/Pw57lzYsJE1sfNjVqnWpw8pwmpYPk9i
 qdZjF65TEjWq0/9LE4pdwVoxxt2HBD7mzMim7HfOu22H1731qRiR4WFDsNbwD3JKEHSgwR4
 +4hXk+bBwPuQjYKHB4UJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QWOow8CSou0=;Rf8JYS5sEV9j9GDFeZ1AYFykf5J
 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
 Ykc0vseAbI7XbhEcWvJz

Am 31.01.26 um 03:06 schrieb Guenter Roeck:

> On 1/30/26 17:54, Kurt Borja wrote:
>> On Fri Jan 30, 2026 at 8:21 PM -05, Guenter Roeck wrote:
>>> Hi Kurt,
>>>
>>> On 1/30/26 16:55, Kurt Borja wrote:
>>>> On Tue Jan 27, 2026 at 6:41 PM -05, Guenter Roeck wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Jan 27, 2026 at 10:23:24PM +0300, TINSAE TADESSE wrote:
>>>>>>
>>>>>> Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the=20
>>>>>> issue on
>>>>>> affected platforms,
>>>>>> even without any code changes. This confirms that the failures are
>>>>>> triggered specifically by automatic
>>>>>> SPD5118 instantiation on systems where the i801 controller enforces
>>>>>> SPD Write Disable.
>>>>>
>>>>> Thanks for confirming. Can you try if the patch below fixes the=20
>>>>> problem ?
>>>>> It is a wild shot, but it might be worth a try.
>>>>>
>>>>> Thanks,
>>>>> Guenter
>>>>>
>>>>> ---
>>>>> =C2=A0 From b44c31c2c779a67827e3144b818cf21f5efacea1 Mon Sep 17=20
>>>>> 00:00:00 2001
>>>>> From: Guenter Roeck <linux@roeck-us.net>
>>>>> Date: Tue, 27 Jan 2026 15:32:32 -0800
>>>>> Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature=20
>>>>> sensor in
>>>>> =C2=A0=C2=A0 probe function
>>>>>
>>>>> Instantiating the driver does not make sense if the temperature=20
>>>>> sensor
>>>>> is disabled, so enable it unconditionally in the probe function.
>>>>>
>>>>> If that fails, write operations to the chip are likely disabled
>>>>> by the I2C controller. Bail out with an eror message if that happens=
.
>>>>>
>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>> ---
>>>>> =C2=A0=C2=A0 drivers/hwmon/spd5118.c | 5 +++++
>>>>> =C2=A0=C2=A0 1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>>> index 5da44571b6a0..3e0e780014f9 100644
>>>>> --- a/drivers/hwmon/spd5118.c
>>>>> +++ b/drivers/hwmon/spd5118.c
>>>>> @@ -552,6 +552,11 @@ static int spd5118_common_probe(struct device=
=20
>>>>> *dev, struct regmap *regmap,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!spd5118_vendor_valid(bank,=
 vendor))
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
-ENODEV;
>>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 if (regmap_update_bits(regmap, SPD5=
118_REG_TEMP_CONFIG,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SPD5118_TS_DISABLE, 0) < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev=
, -ENODEV,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to enable t=
emperature sensor\n");
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->regmap =3D regmap;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_init(&data->nvmem_lock);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_set_drvdata(dev, data);
>>>>
>>>> Hi Guenter,
>>>>
>>>> I'm experiencing the same issue reported in this thread. This patch=
=20
>>>> does
>>>> not fix it for me :(.
>>>>
>>> Thanks for a note. Well, it was a wild shot, so it is not entirely=20
>>> surprising
>>> that it didn't work. I suspect regmap doesn't actually write the=20
>>> register
>>> if the value is unchanged. Another option might be to try writing a=20
>>> value
>>
>> I tried forcing the write with
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0bool change;
>> =C2=A0=C2=A0=C2=A0=C2=A0err =3D regmap_update_bits_base(regmap, SPD5118=
_REG_TEMP_CONFIG,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SPD5118_TS_DISAB=
LE, 0, &change, false, true);
>> =C2=A0=C2=A0=C2=A0=C2=A0if (err)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, er=
r,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to enable temp=
erature sensor\n");
>>
>> and it fails to probe
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0spd5118 17-0051: error -ENXIO: Failed to enable=
 temperature sensor
>> =C2=A0=C2=A0=C2=A0=C2=A0spd5118 17-0053: error -ENXIO: Failed to enable=
 temperature sensor
>>
>
> Nice, I didn't know about that API function. And, even better,=20
> 'change' can be NULL.
>
>>
>>> (e.g., 0x01) into register 0x13 or 0x14. Those are "clear status"=20
>>> registers.
>>> If that fails, we would know that the chip is write protected.
>>
>> I'll try this later too.
>>
>
> Don't bother. I'll write up a patch using regmap_update_bits_base().
>
> Thanks!
> Guenter
>
Good idea, maybe regmap_write_bits() is exactly what we need for this.

Thanks,
Armin Wolf

>>>
>>> Thanks,
>>> Guenter
>>
>
>
