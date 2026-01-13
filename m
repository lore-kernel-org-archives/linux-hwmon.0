Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285628EA72;
	Tue, 13 Jan 2026 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348694; cv=none; b=hr1XsYwzK4IF+gsCixUyU+NaSZDO2rW/tOlw19cujlv22rH9CdPLJRFtAMOVU1bYOonAJwJMjjvTExDeqtSS4aODrqHMpp9MDg864HiYRKRCIx3s9bReHoc6lHwF3ix1p4pmaYWcSJV/cy2yqLj3NCVfF4bJSU8PJOmKk4P8M30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348694; c=relaxed/simple;
	bh=2spZq+/JOBIHSv6yN9MvndweYh9cF5IbBTb9qqLHfUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhrFNFzRtQA6vyaVzvejaYmg89MexpkStEtlNIu6GDHK2rtP2nqbczTes01tNQEXK2yVfsAv6826gxgFqC4Y3MC27kUGaLbmhwQv5e2tTPt09TDYwsNyLZRzO0ce4DH3WSZjXIqcF01rtCTnikTqgLTwMgT6ZcXbimcmtSSxRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZQ/RnEJR; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZQ/RnEJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768348690; x=1768953490; i=w_armin@gmx.de;
	bh=0UqprsItwVHQ0Yutuxf/s5Alk2FiiGFR6QpOcCQ/vM8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZQ/RnEJRr+tOj6E/6pWMQWeuXvNtb/vsm8V3RrUuMcaAGc4cLUYro6gF2srxxuSf
	 UP/rXUonsy6NlWDSP0BlNgDDNdBhKGDmmTs/O/RH/Jalj0LTmcibBgp/5Wc76I2DY
	 nRRNJYCkVcPjcmFHZlT7t0r1PwebyFgkH9YMIB++r4R9vJf/uVmnoXx44y6JOV5m5
	 TZGKHvdDBU1Luw7YpiR9MZFnjN+jGVgmuNjIJvPtTWHyQjx/NNaeo1yji7a8i1onM
	 6LsuzZODIbzXrVMcAE9UC9veVJKOGafRkwsHtt3hxqlFN6aAN7SFMoRlCf+mnqyp1
	 hc/dHyYEUVkamChoDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6qM-1w7C173e0a-00nr7T; Wed, 14
 Jan 2026 00:58:09 +0100
Message-ID: <ec572826-129d-4801-b451-22f88d233f56@gmx.de>
Date: Wed, 14 Jan 2026 00:58:08 +0100
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
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de>
 <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
 <a43a785a-2b43-4588-8fbf-5eaec398acb9@gmx.de>
 <43ea9f60-aa92-4c2f-b263-6a952a837a19@roeck-us.net>
 <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de>
 <CAJ12PfPR0enKBN_AU_u7ac6Cqwsfsit+J2LQcm8MvTDjpDTdTw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJ12PfPR0enKBN_AU_u7ac6Cqwsfsit+J2LQcm8MvTDjpDTdTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:teWCPtyugN5+ZLaVfgRqHl+sy0imIXL3vTQrl2gSy8h+mJXpOTu
 SqEkfBhcwwszdiLJNJS1rVjD0xjaYshj83Z2MCCt+Rsf2P9XVi1mijvzNDMKdj+MnoihAE4
 g9VZslcWaM5eIUKMmf0WTo1aB684QM8o6+nCQzgb9o7EQ7R8nTl0F+tiCpvWKyI/E3to3rD
 fEiXie+LwCWGu+HrHYwlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FbUmxm+NyQU=;C4ae/JxVyw8OEsrRk/cckSjErBF
 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

Am 13.01.26 um 20:16 schrieb TINSAE TADESSE:

> On Mon, Jan 12, 2026 at 9:22=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 12.01.26 um 19:17 schrieb Guenter Roeck:
>>
>>> On 1/12/26 09:46, Armin Wolf wrote:
>>>> Am 12.01.26 um 17:36 schrieb Guenter Roeck:
>>>>
>>>>> On 1/10/26 14:27, Armin Wolf wrote:
>>>>>> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
>>>>>>
>>>>>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
>>>>>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors
>>>>>>> during resume and allow
>>>>>>> register synchronization to be retried later.
>>>>>> Hi,
>>>>>>
>>>>>> do you know if the error is caused by the SPD5118 device itself or
>>>>>> by the underlying
>>>>>> i2c controller? Please also share the output of "acpidump" and the
>>>>>> name of the i2c
>>>>>> controller used to communicate with the SPD5118.
>>>>>>
>>>>>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/hwmon/spd5118.c | 8 +++++++-
>>>>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>>>>> index 5da44571b6a0..ec9f14f6e0df 100644
>>>>>>> --- a/drivers/hwmon/spd5118.c
>>>>>>> +++ b/drivers/hwmon/spd5118.c
>>>>>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>>>>>>>    {
>>>>>>>        struct spd5118_data *data =3D dev_get_drvdata(dev);
>>>>>>>        struct regmap *regmap =3D data->regmap;
>>>>>>> +    int ret;
>>>>>>>        regcache_cache_only(regmap, false);
>>>>>>> -    return regcache_sync(regmap);
>>>>>>> +    ret =3D regcache_sync(regmap);
>>>>>>> +    if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
>>>>>>> +        dev_warn(dev, "SPD hub not responding on resume (%d),
>>>>>>> deferring init\n", ret);
>>>>>>> +        return 0;
>>>>>>> +    }
>>>>>> The specification says that the SPD5118 might take up to 10ms to
>>>>>> initialize its i2c interface
>>>>>> after power on. Can you test if simply waiting for 10ms before
>>>>>> syncing the regcache solves this
>>>>>> issue?
>>>>>>
>>>>> It seems to be highly unlikely that this code executes within 10ms
>>>>> of powering on the memory.
>>>>>
>>>>> Guenter
>>>>>
>>>> AFAIK the 10ms are associated with the VDDIO supply, the VDDSPD main
>>>> supply is different from that.
>>>> I just want to test if this device disables VDDIO during
>>>> suspend-to-idle.
>>>>
>>>> I have another theory: if the SPD5118 somehow looses power, we might
>>>> still need to manually put the
>>>> device into 16-bit address mode using standard 8-bit i2c commands.
>>>>
>>> Uh, no, we can not do that. I tried. Changing the access mode causes
>>> bad hiccups at least
>>> with some boards. They interpret that as a memory configuration
>>> change, and the next warm
>>> reboot will end up in the BIOS. Then, after the RAM configuration is
>>> updated, a cold reboot
>>> will again detect a configuration change and BIOS will be entered agai=
n.
>>>
>>> That does make me wonder how the problem shows up in the first place,
>>> since the BIOS
>>> usually does access the SPD5118 during resume, at least on my systems
>>> with DDR5. Granted,
>>> those are with AMD CPUs, but I would assume that Intel BIOS versions
>>> are not different.
>>>
>>> Guenter
>>>
>> During suspend-to-idle the RAM stays active, so the firmware does not r=
eally need to access the SPD device.
>> I meant that if the SPD device is configured during boot to operate in =
16-bit mode and looses power during
>> suspend-to-idle, the firmware might not reconfigure the SPD to continue=
 operate in 16-bit mode after resume.
>>
>> Thanks,
>> Armin Wolf
>>
> Hi Armin,
>
> I tested whether firmware reinitializes the SPD5118 by comparing key
> registers across cold boot and s2idle resume.
> Register values remained unchanged across resume cycles, suggesting
> firmware does not reconfigure the device during resume.
> To avoid introducing platform-specific regressions, no attempt was
> made to restore SPD5118_REG_I2C_LEGACY_MODE.
>
Alright, thanks for checking. In this case the error indeed seems to come =
from the i2c controller

Thanks,
Armin Wolf

