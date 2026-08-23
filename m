Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C581D2BCF4C
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508669; cv=none; b=Mz9wFRCbZTRiZBBgkl8VrPOhiDoczYrb1Hk+N6/6HnvQD6Gt8EPF8nc2Ju45dozqarkd1bgniTf4g35EBeC1UCKoMT7bLZOHYwwrQIvXBoff284UEyzrsUxbKC/BLwXHhNpROHnTMf/ZjYczEvBok7Dz0HOZFqUqo5oNCx+iqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508669; c=relaxed/simple;
	bh=JPMBHmWNkHgpIw6oX4ck0Js3VGzh70l5gtzQeJLKTHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iklO36MI7eyzidqPMqWBNHMRp9W10O8UhEvscympFRfCP2HwQh5PDSyvNjTtTw457Wjcl1SEaV33kpjD0scs9Cm6L/Hfzu0d1gareI48Px8LjxzOrScaawO8l3fEWZQNj0gHdX4dlvNHfdKqdRMUfmVvvompaQ163bL4AQPbsk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+e+E8Xc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+e+E8Xc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476DA1F000E9;
	Sun, 23 Aug 2026 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787508668;
	bh=L4Oakzj7WG2qm0NkxGsXbkYoh1+FT2Cux8KGrLIPgHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+e+E8XcO+3a6t9tc9SUUwm7dzrQKlqvtKsLEZxVVO3eQb4csMn0sisSdQqhnqEjj
	 /ZbZ72aGBwM4EUAc5Xnj4yXpvdsv6gd3AR+VN1fMev4IzFc3hNSX0ofX+6EQ8Ugp9P
	 yGW7aauTbPUaq3BOHOuD9W4fCxhcTqg/FUWwnSHu73R5DV/jwQE50HbDO6OvIulEG6
	 bh1Y48+sWscJsrL64S8Hprc++jaFDCL1RO0zmfb0Tkecq9tjeh0vZUYtuuOBKQA6Ks
	 zvMrPIgdYhavliBwYEYCAU8J6vA4pNAuxc+PiiDxcc7k0GGcm4v5KpFsYdUv0QSiCu
	 D2c0eThrzZCYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: chipcap2: fix channels in humidity alarm
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260823-chipcap2_locks-v2-1-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-1-6a26c8e9e2fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 18:11:07 +0000
Message-Id: <20260823181108.476DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unaligned memory access when casting byte arrays to `__be16 *`
- [High] Incorrect endianness conversion for SMBus word write breaks on Big=
-Endian architectures
--

--- Patch [1]: [PATCH v2 1/4] hwmon: chipcap2: fix channels in humidity ala=
rm notifications ---
commit e05e5dc803c6cf895cd85ba5388bb75fbd791d04
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: fix channels in humidity alarm notifications

hwmon_notify_event() expects the channel number as its last argument,
taken into account with the type parameter that it is a humidity sensor
type. Given that this device only provides one humidity channel, 0 must
be passed. The custom construct to enumerate the channels makes wrong
assumptions by listing all types together (temperature and humidity).

Remove the custom channel enumeration and pass the right channel to
hwmon_notify_event() for hwmon_humidity_min_alarm and
hwmon_humidity_max_alarm.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 086571d556b7e..9bef767b589ee 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -92,11 +92,6 @@ struct cc2_data {
>  	bool process_irqs;
>  };
> =20
> -enum cc2_chan_addr {
> -	CC2_CHAN_TEMP =3D 0,
> -	CC2_CHAN_HUMIDITY,
> -};
> -
>  /* %RH as a per cent mille from a register value */
>  static long cc2_rh_convert(u16 data)
>  {
[ ... ]
> @@ -499,7 +494,7 @@ static irqreturn_t cc2_low_interrupt(int irq, void *d=
ata)
> =20
>  	if (cc2->process_irqs) {
>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
> -				   hwmon_humidity_min_alarm, CC2_CHAN_HUMIDITY);
> +				   hwmon_humidity_min_alarm, 0);
>  		cc2->rh_alarm.low_alarm =3D true;
>  	}
> =20
> @@ -512,7 +507,7 @@ static irqreturn_t cc2_high_interrupt(int irq, void *=
data)
> =20
>  	if (cc2->process_irqs) {
>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
> -				   hwmon_humidity_max_alarm, CC2_CHAN_HUMIDITY);
> +				   hwmon_humidity_max_alarm, 0);
>  		cc2->rh_alarm.high_alarm =3D true;
>  	}

While reviewing this patch, I noticed a couple of pre-existing issues in
drivers/hwmon/chipcap2.c that you might want to look into.

drivers/hwmon/chipcap2.c:cc2_write_reg() {
...
	cpu_to_be16s(&val);
	ret =3D i2c_smbus_write_word_data(data->client, reg, val);
...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this endianness convers=
ion
work correctly on Big-Endian architectures?

The SMBus protocol always transmits the least-significant byte first.
On a Little-Endian CPU, cpu_to_be16s() correctly swaps the bytes in memory,
causing SMBus to send the high byte first, matching the Big-Endian device's
expectations.

However, on a Big-Endian CPU, cpu_to_be16s() is a no-op, so the SMBus core
extracts the actual least-significant byte and sends it first, resulting in
Little-Endian transmission over the wire. Should this use
i2c_smbus_write_word_swapped() instead to ensure writes to device
configuration aren't corrupted?


drivers/hwmon/chipcap2.c:cc2_read_reg() {
...
	ret =3D i2c_master_recv(data->client, buf, CC2_EEPROM_DATA_LEN);
	if (ret !=3D CC2_EEPROM_DATA_LEN)
		return ret < 0 ? ret : -EIO;

	*val =3D be16_to_cpup((__be16 *)&buf[1]);
...
}

[Severity: High]
This isn't a bug introduced by this patch, but does casting the unaligned
address &buf[1] to a 16-bit pointer cause an unaligned memory dereference?

Dereferencing an unaligned pointer using be16_to_cpup() can cause an
alignment fault and kernel oops on architectures that strictly enforce
memory alignment (e.g., SPARC or older ARM). This also happens in
cc2_data_fetch() when casting &data[2] to a 16-bit pointer:

drivers/hwmon/chipcap2.c:cc2_data_fetch() {
...
	switch (type) {
	case hwmon_humidity:
		*val =3D cc2_rh_convert(be16_to_cpup((__be16 *)&data[0]));
		break;
	case hwmon_temp:
		*val =3D cc2_temp_convert(be16_to_cpup((__be16 *)&data[2]));
...
}

Is there a safer way to parse these bytes without casting potentially
unaligned byte array addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823-chipcap2_l=
ocks-v2-0-6a26c8e9e2fc@gmail.com?part=3D1
