Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446D937F72A;
	Mon, 12 Jan 2026 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240005; cv=none; b=LeTQyzS8Lar+HJHTk9gJaJyfiGsbu1uwVxJ2Jk3F+Ca/j2ZVHCnVVKq20+H8lx50Mi92ooxR3YhUOYDBacgXYE1061ftApy3ruukpsEmEldqZ0+YBdVmnLXMag9ysa2e26APVO3nBr59ZJKCJ0gt/tfEsDLv+f1bImM5nT0TlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240005; c=relaxed/simple;
	bh=rBLtGpI/0VYNzcCLUHZhoPLGsF3FW9thvsBC0blidtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiBmZKtShBRVugIuRNksq7uOGkZQbxtp5LgBR7ZG713Dg5/Do9lrugLcq+qyJviqsHmgppUEnxlpRYC6HwPnVJIgZH7ec9zmPJKqyZJlEIwaWXJmmAxIilMvDWjHryDFF+z7x1Iy/9pylajISwUV03dYQtBFnhnmJUeino0YwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y942kl3Y; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y942kl3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768239987; x=1768844787; i=w_armin@gmx.de;
	bh=rBLtGpI/0VYNzcCLUHZhoPLGsF3FW9thvsBC0blidtk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y942kl3YF0wFGPyvbLT1KtkKlv/O1huTeSvhdiNiUBYRKe6ptyA5qSZwBsg3di2D
	 O+GwmaCi4PK8BT9WMYOHzCApBtJlmFqbQE8LVSRpAnI07fw2H+va20lSUAOwWlhSb
	 ZfC+8/P17Pr5/2NwikpSBYIaIEIvFjZiPgzt2JpGMzOq+m+H1wO4b0+HC7EowEhQU
	 8sw+0gr5+mbLWQsdHr0YNXn9wNzwwaMdqfrbg2qXuHxIz1dRznhtZXvd8PetsApaA
	 9+PBSL7cGwVAP8RVqNNeEy+gdJz3Pp3CnIrr9Q/+ecgv9ZNvF4JChGqG5WdbjPjpE
	 kNh9AJHa3zvM15oqLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDEm-1w5r6o482a-00m6Cj; Mon, 12
 Jan 2026 18:46:27 +0100
Message-ID: <a43a785a-2b43-4588-8fbf-5eaec398acb9@gmx.de>
Date: Mon, 12 Jan 2026 18:46:26 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RRCLYPTX6vU2Hou0MDmx8Xh4tGb2Tx5WXCxkg2qZqIBoCUBXfgh
 y4OdpnQSDK25gcyLfDDW8pntAOe4cuga9kBbNrH+xS5+UtAKsjN00G/buXPd5cmXO/UTcWE
 99uNDr6OHhdGBSAP4FDW0SduYSGGIfJddAXRRRJgEQSjHRhuwHojRh+V3M4smKwwpr1pvAc
 bvT8PwTnAMlIjMaK682Gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t09oH8qPdC0=;rfBCil5dK2qxPnyGVcinMKbO38x
 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
 QRiyZA04=

Am 12.01.26 um 17:36 schrieb Guenter Roeck:

> On 1/10/26 14:27, Armin Wolf wrote:
>> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
>>
>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors during=
=20
>>> resume and allow
>>> register synchronization to be retried later.
>>
>> Hi,
>>
>> do you know if the error is caused by the SPD5118 device itself or by=
=20
>> the underlying
>> i2c controller? Please also share the output of "acpidump" and the=20
>> name of the i2c
>> controller used to communicate with the SPD5118.
>>
>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
>>> ---
>>> =C2=A0 drivers/hwmon/spd5118.c | 8 +++++++-
>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>> index 5da44571b6a0..ec9f14f6e0df 100644
>>> --- a/drivers/hwmon/spd5118.c
>>> +++ b/drivers/hwmon/spd5118.c
>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct spd5118_data *data =3D dev_get_d=
rvdata(dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap =3D data->regmap;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regcache_cache_only(regmap, false);
>>> -=C2=A0=C2=A0=C2=A0 return regcache_sync(regmap);
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regcache_sync(regmap);
>>> +=C2=A0=C2=A0=C2=A0 if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(dev, "SPD hub not=
 responding on resume (%d),=20
>>> deferring init\n", ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 }
>>
>> The specification says that the SPD5118 might take up to 10ms to=20
>> initialize its i2c interface
>> after power on. Can you test if simply waiting for 10ms before=20
>> syncing the regcache solves this
>> issue?
>>
>
> It seems to be highly unlikely that this code executes within 10ms of=20
> powering on the memory.
>
> Guenter
>
AFAIK the 10ms are associated with the VDDIO supply, the VDDSPD main suppl=
y is different from that.
I just want to test if this device disables VDDIO during suspend-to-idle.

I have another theory: if the SPD5118 somehow looses power, we might still=
 need to manually put the
device into 16-bit address mode using standard 8-bit i2c commands.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0 }
>>> =C2=A0 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend=
,=20
>>> spd5118_resume);
>>
>
