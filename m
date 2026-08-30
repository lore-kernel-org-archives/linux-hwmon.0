Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793B35C68F
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788133693; cv=none; b=G3HdktQKPQrP7NVf6wOLrUQXZxoeVRoC9qV6Q+22ZiPFrW417qg+m2TgpAYjjfuN1FfDdYOy+4RKAy2jqbnoauF136QFOW/fxx6cJ4uZfTiZ3rs5ZuYY/0zW/Yf+GWvSsnNVo4Luj2ER0XKLFuO4AsKPQpNMK9wtqB3l7UcUUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788133693; c=relaxed/simple;
	bh=QOkOlz84VHzYD9uUI4Hnc+gmPdY/yyAXtbgll765AIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p34d3EX1Yk3WcFeGN+R3uMUIiZronds+9ZRC5F55ubJt1vie/B5OTk6+hoQMfNvp4DdrT04iu7IjnJKUW6kYYjPFMEs7+MKzHOTiE/YkjQfMVb51FwTHPmGEIwEW1rcEvQuW7aYSHWPNZlW74pTKglP733X5wSwLBKuuIncv1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=laA8yP+d; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="laA8yP+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788133688; x=1788738488; i=w_armin@gmx.de;
	bh=4U1tjhrw6ymyqCMBUqpuphGSk0tCCtngSGk2nY8HAZk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=laA8yP+djLQ2TuIkdIsaktsy2d0/3vn/0MEXRigyffb/tNIxLQ6mViB+NV3Tb6y9
	 jNTQoYTlRRwCR1MNqz0nDNqd88k2BQz05f2bbcVbDqz0JB3fZRgTwV/Bjz04DEjc2
	 zE/lxH7YH9TTwAOkhFVCdANP3ZCydQr8cTUY/bwSywdYwoCXVpKzZJ57Cj9zZjd/2
	 6Pwji3yQF+QEvj+BRhbgzwNisGL1uXMKkZNljzRU2qGmgbFnJtLNYRzPSydQNDmI9
	 TBcOsO5bOrmUmZLlLKpyhK/aoMyOUh4DQNEXHn7rWKvPZai9DU/2MQ3rvuz/5TnQr
	 TrH09sWED0jB7ohUBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDou-1wgqae1PMe-011KS2; Mon, 31
 Aug 2026 01:48:08 +0200
Message-ID: <b5c0b655-e158-430b-b663-70913a99ce9e@gmx.de>
Date: Mon, 31 Aug 2026 01:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (spd5118) Select page 0 unconditionally during
 probe
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260830233009.322206-1-W_Armin@gmx.de>
 <20260830234131.498F71F000E9@smtp.kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260830234131.498F71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bkcTAWvSUYRUokhx92F/podWmCUrb6Fl5YzniukDaiv3UzrfmUF
 US0iTYT9pjLrVlajWVp3H+BJU1h6wHfWQXuWiqDYlMUgvSJkGr9p/MsqzjYn0CL7Cn5miOn
 ezKlMjHwGPr0GAe/6DqCeIpGsHAMyTZpTOog7WMu5BK/8uOr+bFuUfeRWWk9ekwyQxC6/WV
 L1nPil/+w6zfNvhCbAQBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ss9zj/gOpIg=;/zyvVkgrAPORTSyXBZtcNjkC5G7
 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
 MFpx4lLlw8s=

Am 31.08.26 um 01:41 schrieb sashiko-bot@kernel.org:

> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
> - [High] Unconditional I2C write in `probe()` before verifying device id=
entity can cause permanent data corruption on mismatched devices.
> - [Medium] Failing probe on read-only buses entirely drops temperature m=
onitoring capabilities.
> --
>
> commit 83cea797ff679bd0608e7bc406325588975c70cb
> Author: Armin Wolf <W_Armin@gmx.de>
>
> hwmon: (spd5118) Select page 0 unconditionally during probe
>
> This commit makes the driver write to the legacy mode register
> unconditionally during probe to select page 0. This intentional write
> fails on controllers where the BIOS blocks writes to the SPD device,
> thereby avoiding issues on such controllers by refusing to probe.
>
>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>> index 9724cf70b61d4..95b7cbd2f111c 100644
>> --- a/drivers/hwmon/spd5118.c
>> +++ b/drivers/hwmon/spd5118.c
> [ ... ]
>> @@ -637,45 +638,32 @@ static int spd5118_i2c_init(struct i2c_client *cl=
ient)
>>   				     I2C_FUNC_SMBUS_WORD_DATA))
>>   		return -ENODEV;
>>  =20
>> -	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
>> -	if (regval < 0 || (regval && regval !=3D 0x5118))
>> -		return -ENODEV;
>> -
> [ ... ]
>> +	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE=
);
>> +	if (mode < 0)
>> +		return mode;
>> +
>> +	FIELD_MODIFY(SPD5118_LEGACY_PAGE_MASK, &mode, 0);
>> +	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE=
, mode);
> [Severity: High]
> Does this unconditional I2C write in spd5118_i2c_init() risk permanent d=
ata
> corruption if the driver is bound to a mismatched device?
>
> Because the device identity check reading SPD5118_REG_TYPE has been move=
d
> until after this write, any device mistakenly probed (via sysfs or incor=
rect
> firmware tables) in the 0x50-0x57 address range will have its byte at of=
fset
> 0x0B overwritten.
>
> For an ordinary EEPROM, this clears bits 0-2 permanently before the
> subsequent type check fails and aborts the probe.

The detection code is unchanged, and we need that write in order to read r=
egisters.

>> +	if (err < 0)
>> +		return err;
> [Severity: Medium]
> Will failing the probe completely on read-only buses deprive users of al=
l
> temperature monitoring capabilities?
>
> If spd5118_i2c_init() returns an error here when probed on an Intel
> controller that rejects writes, the driver completely drops support for =
that
> device.
>
> Previously, the probe would succeed and at least allow reading the memor=
y
> temperature. Could this degrade gracefully instead, perhaps by marking t=
he
> regmap as read-only and disabling suspend/resume writes, rather than tot=
ally
> preventing hardware monitoring?

No, because the driver will then block suspend/resume on those devices.

Thanks,
Armin Wolf

>> +
>> +	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
>> +	if (regval < 0)
>> +		return regval;
>> +
>> +	if (regval !=3D 0x5118)
>> +		return -ENODEV;
>>  =20
>>   	/* We are reasonably sure that this is really a SPD5118 hub controll=
er */
>>   	return 0;
