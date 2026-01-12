Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15338759F;
	Mon, 12 Jan 2026 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242187; cv=none; b=cU6gYE0V/u0bd8hknHreh/f/C2eh51u31lxmWwX1uJvWKSLiINYl+c9/eKqpPXCXYNbx5rSIRAQq0qelJuz7KVPKrF/EIWF6iMgOYBlAwQkDoZChYVXB9X1i0+Cvmv2aDEnVUo08cQKN8pFDXVxhTsu719Lx9PgZpxkOTg7Co4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242187; c=relaxed/simple;
	bh=zkOjmQZRnahVlPyqLJKbR52Rf2pB2wrARE/7MI+N+Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKK5aCafRCcgZ5PTpumt4+39lkqI+MSyG4PGUWpahNgf+C7nPP7OcyhwhZnte1gVOpvj2DGeSCRub+WlwMucttOG5Xu3c/mB7b443Vt/B1dhZ9TL9oITqkXeEODkodPkQi+eM5AOMHN0Fb98VJMPVSHj8gIChN/vmGnrELnCMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aZBxKoa9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aZBxKoa9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768242178; x=1768846978; i=w_armin@gmx.de;
	bh=zkOjmQZRnahVlPyqLJKbR52Rf2pB2wrARE/7MI+N+Ag=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aZBxKoa94lU7BQeZoT8RKvFRqRJPJCcY/TrBG7ZWe6v7jTUiHHvk90v86V262FT1
	 QG0/8a4WkCzaRynvT+cn/VBnr2azw4OaLL4VVAYx3XHSWGPD12g6IjtWF2HsFkTDj
	 nsgf5SJwVGLoQdaJsVj4BDLU2sqAEzp27l0xgjDpOn47VKWQHw7bF7ApzlIBwJ0Pq
	 hFgr4Z5bOIqCjik0BopXSWDhg0XqDfQ/+P2tP/jV66ehaP1vgBWqxuy5oG8NyEKDl
	 UQiaHcy0sG0xm31ly1XumSjqWMcniYD+SIH3W2kzjrz/85ZRVD588YbXDv/RbPdJj
	 IDBkUQ4s2iY8ccALBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1vvSem0lPm-013ELL; Mon, 12
 Jan 2026 19:22:58 +0100
Message-ID: <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de>
Date: Mon, 12 Jan 2026 19:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Guenter Roeck <linux@roeck-us.net>,
 Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de>
 <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
 <a43a785a-2b43-4588-8fbf-5eaec398acb9@gmx.de>
 <43ea9f60-aa92-4c2f-b263-6a952a837a19@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <43ea9f60-aa92-4c2f-b263-6a952a837a19@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AcQY/i+I3GjHSG7fwXDSzpvc9Bu/+A4xUKzu2Kxgs6QPF5oD40p
 9iwfNZh0icm8jc/Ys7aoGJD6JIQLPcEC856RGId76NSXVNb2t3Zm0fta5DI+0JCVs20qBhG
 Urals/EIkVE4XFdMxNTkqBMUwiBH1IaqCj1+3z7mI+f496vJwoWY4JHD1tac828tnh8Mo3V
 suHRozBy7G6Ngy02bUiMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:45Q0d79+SwE=;zqAm/rz2u2PinCUg7wNn+BMsd9V
 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
 auvW7Evs=

Am 12.01.26 um 19:17 schrieb Guenter Roeck:

> On 1/12/26 09:46, Armin Wolf wrote:
>> Am 12.01.26 um 17:36 schrieb Guenter Roeck:
>>
>>> On 1/10/26 14:27, Armin Wolf wrote:
>>>> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
>>>>
>>>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
>>>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors=20
>>>>> during resume and allow
>>>>> register synchronization to be retried later.
>>>>
>>>> Hi,
>>>>
>>>> do you know if the error is caused by the SPD5118 device itself or=20
>>>> by the underlying
>>>> i2c controller? Please also share the output of "acpidump" and the=20
>>>> name of the i2c
>>>> controller used to communicate with the SPD5118.
>>>>
>>>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
>>>>> ---
>>>>> =C2=A0 drivers/hwmon/spd5118.c | 8 +++++++-
>>>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>>> index 5da44571b6a0..ec9f14f6e0df 100644
>>>>> --- a/drivers/hwmon/spd5118.c
>>>>> +++ b/drivers/hwmon/spd5118.c
>>>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct spd5118_data *data =3D dev_get=
_drvdata(dev);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap =3D data->regma=
p;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regcache_cache_only(regmap, false);
>>>>> -=C2=A0=C2=A0=C2=A0 return regcache_sync(regmap);
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regcache_sync(regmap);
>>>>> +=C2=A0=C2=A0=C2=A0 if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(dev, "SPD hub n=
ot responding on resume (%d),=20
>>>>> deferring init\n", ret);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>
>>>> The specification says that the SPD5118 might take up to 10ms to=20
>>>> initialize its i2c interface
>>>> after power on. Can you test if simply waiting for 10ms before=20
>>>> syncing the regcache solves this
>>>> issue?
>>>>
>>>
>>> It seems to be highly unlikely that this code executes within 10ms=20
>>> of powering on the memory.
>>>
>>> Guenter
>>>
>> AFAIK the 10ms are associated with the VDDIO supply, the VDDSPD main=20
>> supply is different from that.
>> I just want to test if this device disables VDDIO during=20
>> suspend-to-idle.
>>
>> I have another theory: if the SPD5118 somehow looses power, we might=20
>> still need to manually put the
>> device into 16-bit address mode using standard 8-bit i2c commands.
>>
>
> Uh, no, we can not do that. I tried. Changing the access mode causes=20
> bad hiccups at least
> with some boards. They interpret that as a memory configuration=20
> change, and the next warm
> reboot will end up in the BIOS. Then, after the RAM configuration is=20
> updated, a cold reboot
> will again detect a configuration change and BIOS will be entered again.
>
> That does make me wonder how the problem shows up in the first place,=20
> since the BIOS
> usually does access the SPD5118 during resume, at least on my systems=20
> with DDR5. Granted,
> those are with AMD CPUs, but I would assume that Intel BIOS versions=20
> are not different.
>
> Guenter
>
During suspend-to-idle the RAM stays active, so the firmware does not real=
ly need to access the SPD device.
I meant that if the SPD device is configured during boot to operate in 16-=
bit mode and looses power during
suspend-to-idle, the firmware might not reconfigure the SPD to continue op=
erate in 16-bit mode after resume.

Thanks,
Armin Wolf

