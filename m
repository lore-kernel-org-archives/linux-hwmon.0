Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6AC484235;
	Tue,  1 Sep 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281568; cv=none; b=sHmYARI66ut0hZjFHEYG6EtfKBiUNn4Tr+oGgvkqDywG84Pt6Q7jDqqDg+tS/+2XawxrjOPSQs43WnURAUTVWHxpKo3WUGkSbNvBA7UGoPu/Q9Oc+3jlpmngubawaY8f/x3Qdqyvs4gOaPWiwAa0DLc1sfkaUvilwsEmy36VFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281568; c=relaxed/simple;
	bh=a+8Z+oZ2h5Q9KDIsJc7SrJv3B5OfBCKA4xy7xdVqixI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mljZ1qMMC0dWXlxEfsIu/X+e+tbek2xgjVpfYt0w9sHfMlGgB7LX6w8s7QJwtPN1kOWbITUvnvK87Vja3RGeEfG3+3rMi3+K1zKe3Q45tqnzrHNS4DYjbeKpXdM7KsD8r2iyznBMlaceiwEDms5Hsfn/VM+CDzllXxApVhIdppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JjB9JhQ2; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JjB9JhQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788281560; x=1788886360; i=w_armin@gmx.de;
	bh=a+8Z+oZ2h5Q9KDIsJc7SrJv3B5OfBCKA4xy7xdVqixI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JjB9JhQ2C0fy7tIbZFe1Lau5VCReHbV5KQkPFRTJ1F4jgxdrSuO41bwXz/+LrfMf
	 ROIoXlH6f7g7S4z2sYTKvLQGYXIcfQPrRQVXAzkOY6NSRhwhTUBuzZpUPqfGrugPj
	 GWdJO99LMmu5GUZblh7WT1HHDcjIYHWM5dUTQV2nbg7Jk72n/stPwwTQWrdgKt282
	 ebCKeF4B4+Z54c7P+3jm97FFvKU1ch/xIQcOgTqhEj/Iep3p/TC5Le8T09uNT2/0x
	 D84iWlQ+VTVohW16HdLtC49X+uHL+J05xoeVQ2tmOb248c/jx0+sq5vrmDDRabfZn
	 MBtPOqubOeuOi/hFvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hZJ-1wwn1K3wHZ-0041mh; Tue, 01
 Sep 2026 18:52:40 +0200
Message-ID: <659b67ad-a2d7-43e1-b0d8-6e326901ba91@gmx.de>
Date: Tue, 1 Sep 2026 18:52:39 +0200
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
 <0c6c5e65-a781-4607-a43a-3aa25d794144@gmx.de>
 <497d1e4f-a1c2-4d2f-9874-187da23dd8f9@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <497d1e4f-a1c2-4d2f-9874-187da23dd8f9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RfYYJ///VoTPKpQZxW7sm0qzuBqRXHJ2+0iCeL37ThB7A1Xo4d5
 RyiXgKaExaH1wmCyoqq9jbgEExjYwOLD5mcJm6m+lrDU2MWBXD8/bXmtrctetGDIFi7/0sb
 ptWDNVVdemUmqG/WhyygbNtIpkHeJ2Amt9RdYXcTXGwmzxTXKJujxPCtwKfKVbqQzydjS7e
 JtLC0Nq12o9SIuQhVsNgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qNqXk74SDNQ=;50axDX92bgiODE7x1IKxgPRIPE0
 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

Am 01.09.26 um 18:35 schrieb Guenter Roeck:

> On 9/1/26 09:09, Armin Wolf wrote:
>> Am 01.09.26 um 00:22 schrieb Guenter Roeck:
>>
>>> On 8/31/26 12:34, Armin Wolf wrote:
>>>> Some Intel i2c controllers can be configured by the BIOS to reject
>>>> writes to the SPD device. This often causes problems when the registe=
r
>>>> page needs to be changed, usually during resume.
>>>>
>>>> Avoid probing on affected devices by unconditionally selecting page 0
>>>> by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
>>>> This will fail on affected controllers and thus prevent the driver
>>>> from probing.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>> Changes since v2:
>>>> - restore original register content if i2c init fails
>>>>
>>>> Changes since v1:
>>>> - Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
>>>> ---
>>>> =C2=A0 drivers/hwmon/spd5118.c | 55=20
>>>> ++++++++++++++++-------------------------
>>>> =C2=A0 1 file changed, 21 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>> index 9724cf70b61d..038d9e6e6a73 100644
>>>> --- a/drivers/hwmon/spd5118.c
>>>> +++ b/drivers/hwmon/spd5118.c
>>>> @@ -637,44 +637,31 @@ static int spd5118_i2c_init(struct i2c_client=
=20
>>>> *client)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_S=
MBUS_WORD_DATA))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV=
;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read_word_swapped(cli=
ent, SPD5118_REG_TYPE);
>>>> -=C2=A0=C2=A0=C2=A0 if (regval < 0 || (regval && regval !=3D 0x5118))
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>> -
>>>
>>> Thinking about it, Sashiko has a point here. I think we should keep
>>> the above code to have an early exit point.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * If the device type registers return 0, it=
 is possible that=20
>>>> the chip
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * has a non-zero page selected and takes th=
e specification=20
>>>> literally,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We must first select page 0 to ensure tha=
t we can reliably=20
>>>> read
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the volatile registers on chips that take=
 the specification=20
>>>> literally,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * i.e. disables access to volati=
le registers besides the=20
>>>> page register
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if the page is not 0. The Rene=
sas/ITD SPD5118 Hub=20
>>>> Controller is known
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * to show this behavior. Try to identify su=
ch chips.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to show this behavior.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We must also perform an unconditional reg=
ister write to=20
>>>> detect if
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the i2c controller blocks write accesses =
to the SPD device.=20
>>>> Some Intel
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * controllers might be configured by the BI=
OS to do this.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0 if (!regval) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Vendor ID registers mu=
st also be 0 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read=
_word_data(client,=20
>>>> SPD5118_REG_VENDOR);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn -ENODEV;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The selected page in M=
R11 must not be 0 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mode =3D i2c_smbus_read_b=
yte_data(client,=20
>>>> SPD5118_REG_I2C_LEGACY_MODE);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mode < 0 || (mode & ~=
SPD5118_LEGACY_MODE_MASK) ||
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !=
(mode & SPD5118_LEGACY_PAGE_MASK))
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn -ENODEV;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D i2c_smbus_write_b=
yte_data(client,=20
>>>> SPD5118_REG_I2C_LEGACY_MODE,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
ode & SPD5118_LEGACY_MODE_ADDR);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn -ENODEV;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the device typ=
e registers are still bad after selecting
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page 0, this is n=
ot a SPD5118 device. Restore original
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * legacy mode regis=
ter value and abort.
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regval =3D i2c_smbus_read=
_word_swapped(client,=20
>>>> SPD5118_REG_TYPE);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval !=3D 0x5118) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
2c_smbus_write_byte_data(client,=20
>>>> SPD5118_REG_I2C_LEGACY_MODE, mode);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn -ENODEV;
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 mode =3D i2c_smbus_read_byte_data(client,=20
>>>> SPD5118_REG_I2C_LEGACY_MODE);
>>>> +=C2=A0=C2=A0=C2=A0 if (mode < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return mode;
>>>> +
>>>
>>> I also wonder if we should strengthen this and bail out if any of=20
>>> bit 3..7 is
>>> set. 2-byte addressing is known not to work in the first place, and=20
>>> bit 4..7
>>> are reserved in the supported version of the standard and should=20
>>> always be 0.
>>>
>> This would prevent the driver from being forward-compatible to newer=20
>> standard revisions.
>>
> Good point.
>
>>> Also, if we keep above check, we should only only get here if the=20
>>> page is !=3D 0.
>>> That means the register value has to be 0x01..0x07. So we could bail=
=20
>>> out with
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0if (!mode || (mode & ~SPD5118_LEGACY_PAGE_MASK=
))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>> followed by
>>> =C2=A0=C2=A0=C2=A0=C2=A0err =3D i2c_smbus_write_byte_data(client,=20
>>> SPD5118_REG_I2C_LEGACY_MODE, 0);
>>>
>>> Thoughts ?
>>
>> Honestly i think that users should rely on the detection feature if=20
>> they are not sure
>> if a given device is really a spd5118 device. Manually instantiating=20
>> a spd5118 device
>> on a given bus address tells the kernel that there _is_ a valid=20
>> spd5118 device at this
>> address.
>>
>> Otherwise we would basically duplicate parts of the detect callback=20
>> inside spd5118_i2c_init().
>>
>
> This _is_ the detect callback inside spd5118_i2c_init(). Problem is=20
> that the device
> currently instantiates if bit 3 of MR11 is set, even though it is=20
> known not to work.
> Prior to commit 7bf5a11dde2c ("hwmon: spd5118: Remove 16-bit=20
> addressing") it would
> at least bail out if the controller does not support I2C_FUNC_I2C.=20
> That means we'll
> at least need to check for bit 3 (SPD5118_LEGACY_MODE_ADDR) and bail=20
> out if the bit
> is set.
>
> Thanks,
> Guenter=20

Good point, we can indeed check for that. But the early exit point suggest=
ed by Sashiko
is a bit overblown IMHO.

Thanks,
Armin Wolf

