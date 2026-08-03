Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD43806B6
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753495; cv=none; b=EzaSa1eY9jWsQGAGaFnTtJ7q+Ub+PTveyVSObLUT3NVhJkavtg8ZWzHK4+4Y+Dnc7o5Jpc8rzSO2mq2zxdua86tEshOJUyfHY9s+k7cTaH085Y+Sv4HM74sLM7sq1jnU/Z/6Pcj5fWR49Kf6UKKQfBvslsSxOTA1MlySRjd8jEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753495; c=relaxed/simple;
	bh=hLFkrnHe1Oq2jp/AWrSdGgSnioCt03VhDNB58kABpf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FoWJbSo0GwnbOUz0/FIa0OQzi1FNOqe5Oi7nHER3sBcWGKxt7ApEOrnJOEY7MsSHBuM9kGMLWWtzid3ekh7yW2HyClHlPcSA+YEOFVdAw/tQBf6zw2Vq9DFevLkfJbmLSBjTCgd5j3fVY6haLXorWUq+FuLJUFnsrdOHbf+ptkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6wbAp9X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6wbAp9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD33B1F000E9;
	Mon,  3 Aug 2026 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785753494;
	bh=zfF+94P/0FLguKgKq9Ds1/Zw+OktzZQxLFHL5gQxFAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6wbAp9XLG0VAZgT1nEA+IYmuTWC+lL0rX8CWbJBbgfY/sk3yC5ss+2Rbyi/UUpaW
	 8FfHseCffO0YD9CktBK5RgOprVG7Klc//CWlbjsiid2dTpDXHHirkG8aBXtZi8A2GE
	 SrS/Hf/CYKZEmv2sHZ+9HV7ZgzUXGjTsee1s+Po2tWyjncmq6JSqI2af27TW1jxj/d
	 gvLC/4ET+sacQzc1Q9dnhKvTntLlXlpXJ9hpEPz1JhmbnbhtOF0D7+bYxXpTmbA1de
	 +ypL+RL8EM2D1qoXMEusx9k3yxJSRP+ycZOcmNETQ/WogbADM8A5YicMU7vGZALZ6s
	 ulmw8P0iW5b2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6694) do not expose enable on DTIN
 temperature channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803102148.14196-1-ali@iusegentoo.com>
References: <20260803102148.14196-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:38:12 +0000
Message-Id: <20260803103813.DD33B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores the return value of `nct6694_read_msg()` in `nc=
t6694_temp_write()` during `hwmon_temp_max_hyst` writes, risking silent har=
dware state corruption.
- [High] Incorrect clamping of negative hysteresis offset due to unsigned t=
ype in `nct6694_temp_write()`.
- [High] The embedded structure `hwmon_en` is passed to USB functions that =
map it for DMA, risking cacheline sharing memory corruption.
--

--- Patch [1]: [PATCH] hwmon: (nct6694) do not expose enable on DTIN temper=
ature channels ---
commit ef55d968d34b204a77782df9efb5f40d8d167ebe
Author: Ali Ahmet Memis <ali@iusegentoo.com>
Subject: hwmon: (nct6694) do not expose enable on DTIN temperature channels

The driver registers 26 temperature channels, all advertising HWMON_T_ENABL=
E,
and indexes the enable bitmap with the raw channel. This commit removes the
enable configuration for DTIN channels to prevent out-of-bounds indexing th=
at
toggles the fan enable state instead.

Link: https://lore.kernel.org/all/20260802124730.20387-1-ali@iusegentoo.com/

> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
> index 6dcf22ca5018a..9a9a4db434c4f 100644
> --- a/drivers/hwmon/nct6694-hwmon.c
> +++ b/drivers/hwmon/nct6694-hwmon.c
[ ... ]
> @@ -159,6 +159,9 @@ static inline s8 temp_to_reg(long val)
>  #define NCT6694_HWMON_TEMP_CONFIG (HWMON_T_INPUT | HWMON_T_ENABLE |	\
>  				   HWMON_T_MAX | HWMON_T_MAX_HYST |	\
>  				   HWMON_T_MAX_ALARM)
> +#define NCT6694_HWMON_DTIN_CONFIG (HWMON_T_INPUT |			\
> +				   HWMON_T_MAX | HWMON_T_MAX_HYST |	\
> +				   HWMON_T_MAX_ALARM)
>  #define NCT6694_HWMON_FAN_CONFIG (HWMON_F_INPUT | HWMON_F_ENABLE |	\
>  				  HWMON_F_MIN | HWMON_F_MIN_ALARM)
>  #define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_ENABLE |	\

While reviewing this patch, I noticed a few pre-existing issues in the same
file that might be worth addressing.

> drivers/hwmon/nct6694-hwmon.c:nct6694_temp_write()
> 	case hwmon_temp_max_hyst:
> 		cmd_hd =3D (struct nct6694_cmd_header) {
> 			.mod =3D NCT6694_HWMON_MOD,
> 			.cmd =3D NCT6694_HWMON_ALARM,
> 			.sel =3D NCT6694_HWMON_ALARM_SEL,
> 			.len =3D cpu_to_le16(sizeof(data->msg->hwmon_alarm))
> 		};
> 		ret =3D nct6694_read_msg(data->nct6694, &cmd_hd,
> 				       &data->msg->hwmon_alarm);
>=20
> 		val =3D clamp_val(val, -127000, 127000);

[Severity: High]
This isn't a bug introduced by this patch, but does this code ignore the
return value of nct6694_read_msg()?

If nct6694_read_msg() fails due to an error, such as a USB problem, it
appears the driver proceeds to modify uninitialized or stale data in
data->msg->hwmon_alarm and writes it back to the device, which could
corrupt the hardware state.

> 		temp_max =3D data->msg->hwmon_alarm.tin_cfg[channel].hl;
> 		temp_hyst =3D temp_max - temp_to_reg(val);
> 		temp_hyst =3D clamp_val(temp_hyst, 0, 7);

[Severity: High]
This is a pre-existing issue, but could a negative hysteresis offset cause
an underflow here?

If a user requests a hysteresis limit higher than the current max limit,
temp_max will be smaller than temp_to_reg(val) and the subtraction results
in a negative number. Since temp_hyst is declared as an unsigned char, this
negative value will underflow into a large positive number. The clamp_val()
call will then clamp it to the upper bound of 7 instead of the lower bound
of 0, configuring the hardware with the maximum possible hysteresis.

> drivers/hwmon/nct6694-hwmon.c:struct nct6694_hwmon_data
> 	struct nct6694 *nct6694;
> 	struct mutex lock;
> 	struct nct6694_hwmon_control hwmon_en;
> 	union nct6694_hwmon_rpt *rpt;
> 	union nct6694_hwmon_msg *msg;
[ ... ]
> drivers/hwmon/nct6694-hwmon.c:nct6694_hwmon_init()
> 	ret =3D nct6694_read_msg(data->nct6694, &cmd_hd,
> 			       &data->hwmon_en);

[Severity: High]
This is a pre-existing issue, but is it safe to pass the embedded
hwmon_en structure for USB messaging?

The hwmon_en struct is embedded directly after the mutex lock in
struct nct6694_hwmon_data, meaning they share the same cacheline.
On non-cache-coherent architectures, DMA cache maintenance operations
on this buffer could invalidate or flush the cacheline, potentially
clobbering concurrent CPU updates to the mutex lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803102148.1419=
6-1-ali@iusegentoo.com?part=3D1
