Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413D043E08F;
	Tue,  1 Sep 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279006; cv=none; b=V7Us0gnol86Bl/NVNCysVYGDqYHJOswycg/E+bFGjuto8HyIUAbLh0G8/yhziJGFRGrbTYXFtZ71XRinemR8t2LflQyZ8cA7okF2aWrEMD+s1R92P3x7/0D+Bhx4lLRhdfGLm0h8iOT2PLgFz25GRSBL6zrdur/p7RHc3XKQPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279006; c=relaxed/simple;
	bh=j+50pfBzRNBTcR92gAE77SOuJhxoPsq9P/ZxNM2GP6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cz9jSE3rdGFdzfZ1RLEZFou2oUxdpNOEmPYW1CK42MJ8i3vI/qWZZXkuab/FWemgAC6ASbzzevzA5ZhI+BzWCrIdHbVgJPlxNuG8pFV7Oavr7Vak9m5YrCIHmHroU0caKXw0th1GNDxe0XxMMTPDyvur3zBHcohW9wdLbOysHbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KWYR93Lx; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KWYR93Lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788279001; x=1788883801; i=w_armin@gmx.de;
	bh=j+50pfBzRNBTcR92gAE77SOuJhxoPsq9P/ZxNM2GP6s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KWYR93LxvG8krsE6kGuGa+/2NjiQD5RJjFQhas3ReVuv5f+9kjdio2GrWNSe7+/t
	 8h5+y6dqfoKRVEk66On5I6quminVTjxDijVKezAbX4SUdPEMKmfvokDjT6jRmO0jC
	 ebd8Hj4PKupWwx4UuTKaotAyoPh0j8mW3RzGIS4kFwmL+jxxX5sQYZ71JFw49W6p3
	 TX4mZ69QdHhqiTCe7CLs+sDUn02oBbk3REFlStLowWQsJdHkvzzVUggAdy5yxB2Ec
	 /301R6HxlkFS4AGK3X9UqEYm5pKalJzbQNC+E2wpBTPP4FaDO9QuE01vFw0GVlhOD
	 xUd/NGBwtwOiMQ3qQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1x4Ps61KrP-00B8dJ; Tue, 01
 Sep 2026 18:10:01 +0200
Message-ID: <0c6c5e65-a781-4607-a43a-3aa25d794144@gmx.de>
Date: Tue, 1 Sep 2026 18:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (spd5118) Select page 0 unconditionally during
 probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 ggirouard@bungeetaco.com
References: <20260831193424.95135-1-W_Armin@gmx.de>
 <555c7300-c742-4b91-a67e-5a4aa144bebe@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <555c7300-c742-4b91-a67e-5a4aa144bebe@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IEQ/Ou+DdbAL9go2wpezsHnGPEhUErHGdvXPcHPypNWaeyWZ6r+
 F3qWozmLgDFg6Ymf6OPnCd0tKYPZt8wxekn5fhrjaqey+ERZbccrJv5IR56rSvoM15jyS5X
 SEhXEptwnBY2hyGz03ryrmoz6PpOZd6k8b6J/nh6GG6c6S3KbGLBexFcXCRe6X58ZWPmDcK
 4WkwCstz2fFl5MPy18Www==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yEHHa/+yBfg=;iKt6DIuScQCepEyXY9I+lUsUYNF
 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
 A8=

Am 01.09.26 um 00:22 schrieb Guenter Roeck:

> On 8/31/26 12:34, Armin Wolf wrote:
>> Some Intel i2c controllers can be configured by the BIOS to reject
>> writes to the SPD device. This often causes problems when the register
>> page needs to be changed, usually during resume.
>>
>> Avoid probing on affected devices by unconditionally selecting page 0
>> by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
>> This will fail on affected controllers and thus prevent the driver
>> from probing.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> Changes since v2:
>> - restore original register content if i2c init fails
>>
>> Changes since v1:
>> - Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
>> ---
>> =C2=A0 drivers/hwmon/spd5118.c | 55 ++++++++++++++++-------------------=
=2D-----
>> =C2=A0 1 file changed, 21 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>> index 9724cf70b61d..038d9e6e6a73 100644
>> --- a/drivers/hwmon/spd5118.c
>> +++ b/drivers/hwmon/spd5118.c
>> @@ -637,44 +637,31 @@ static int spd5118_i2c_init(struct i2c_client=20
>> *client)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_S=
MBUS_WORD_DATA))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read_word_swapped(clien=
t, SPD5118_REG_TYPE);
>> -=C2=A0=C2=A0=C2=A0 if (regval < 0 || (regval && regval !=3D 0x5118))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> -
>
> Thinking about it, Sashiko has a point here. I think we should keep
> the above code to have an early exit point.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * If the device type registers return 0, it i=
s possible that=20
>> the chip
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * has a non-zero page selected and takes the =
specification=20
>> literally,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We must first select page 0 to ensure that =
we can reliably read
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the volatile registers on chips that take t=
he specification=20
>> literally,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * i.e. disables access to volatile=
 registers besides the page=20
>> register
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if the page is not 0. The Renesa=
s/ITD SPD5118 Hub Controller=20
>> is known
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * to show this behavior. Try to identify such=
 chips.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to show this behavior.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We must also perform an unconditional regis=
ter write to=20
>> detect if
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the i2c controller blocks write accesses to=
 the SPD device.=20
>> Some Intel
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * controllers might be configured by the BIOS=
 to do this.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 if (!regval) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Vendor ID registers must=
 also be 0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read_w=
ord_data(client, SPD5118_REG_VENDOR);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -ENODEV;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The selected page in MR1=
1 must not be 0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mode =3D i2c_smbus_read_byt=
e_data(client,=20
>> SPD5118_REG_I2C_LEGACY_MODE);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mode < 0 || (mode & ~SP=
D5118_LEGACY_MODE_MASK) ||
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(m=
ode & SPD5118_LEGACY_PAGE_MASK))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -ENODEV;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D i2c_smbus_write_byt=
e_data(client,=20
>> SPD5118_REG_I2C_LEGACY_MODE,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mode=
 & SPD5118_LEGACY_MODE_ADDR);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -ENODEV;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the device type =
registers are still bad after selecting
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page 0, this is not=
 a SPD5118 device. Restore original
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * legacy mode registe=
r value and abort.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read_w=
ord_swapped(client, SPD5118_REG_TYPE);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval !=3D 0x5118) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c=
_smbus_write_byte_data(client,=20
>> SPD5118_REG_I2C_LEGACY_MODE, mode);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -ENODEV;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 mode =3D i2c_smbus_read_byte_data(client,=20
>> SPD5118_REG_I2C_LEGACY_MODE);
>> +=C2=A0=C2=A0=C2=A0 if (mode < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return mode;
>> +
>
> I also wonder if we should strengthen this and bail out if any of bit=20
> 3..7 is
> set. 2-byte addressing is known not to work in the first place, and=20
> bit 4..7
> are reserved in the supported version of the standard and should=20
> always be 0.
>
This would prevent the driver from being forward-compatible to newer stand=
ard revisions.

> Also, if we keep above check, we should only only get here if the page=
=20
> is !=3D 0.
> That means the register value has to be 0x01..0x07. So we could bail=20
> out with
>
> =C2=A0=C2=A0=C2=A0=C2=A0if (!mode || (mode & ~SPD5118_LEGACY_PAGE_MASK))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
> followed by
> =C2=A0=C2=A0=C2=A0=C2=A0err =3D i2c_smbus_write_byte_data(client,=20
> SPD5118_REG_I2C_LEGACY_MODE, 0);
>
> Thoughts ?

Honestly i think that users should rely on the detection feature if they a=
re not sure
if a given device is really a spd5118 device. Manually instantiating a spd=
5118 device
on a given bus address tells the kernel that there _is_ a valid spd5118 de=
vice at this
address.

Otherwise we would basically duplicate parts of the detect callback inside=
 spd5118_i2c_init().

Thanks,
Armin Wolf

>
> Thanks,
> Guenter
>
>> +=C2=A0=C2=A0=C2=A0 err =3D i2c_smbus_write_byte_data(client,=20
>> SPD5118_REG_I2C_LEGACY_MODE,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mode & ~SPD5118_LEGACY_PAGE_=
MASK);
>> +=C2=A0=C2=A0=C2=A0 if (err < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> +
>> +=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read_word_swapped(client, SPD5=
118_REG_TYPE);
>> +=C2=A0=C2=A0=C2=A0 if (regval !=3D 0x5118) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Restore original registe=
r content */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_smbus_write_byte_data(c=
lient,=20
>> SPD5118_REG_I2C_LEGACY_MODE, mode);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We are reasonably sure that th=
is is really a SPD5118 hub=20
>> controller */
>
