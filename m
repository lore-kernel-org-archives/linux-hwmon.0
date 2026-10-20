Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497662;
	b=a8NUFW+aDR6IOOkYfMfLWuTl7LhXEVCi1BkOQDpAUw5niOrxVFJJo549DUrVLXm9QUNg
	 X6WeyZMDjczurPATozXx+3L3HDJeZNtVVZX4HJMt8+jtcrlL9lXrF26Yf9Jth3rj1mYiJ
	 yQ7dUiy498RcreD+MqQr9EhBf31GdPxusLCbGYiqWgjIYWwe0VRv0ex3oHwUeq7bN/FGY
	 JFHWpYwrrEIEK1I8B49+DD5/nyOQ2sJcNhbgUhK++82X5LJ9e7EkncHdPVgmDmTGi7Mhe
	 W6AaxGAvwz/zrCxOlqS9Z1C/hD1qvApMEYVrZnewVihwtHrY4ESagNd83QNax+0/BMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497662;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KXg39mHdTsetgdPucEjKGeP2zUPOX/PjWq1Ui18mlHY=;
	b=DQAvTUV2+6GCTL0BfVAWxvvFdUlq8w0T9fq+6aQLatCFaCMJ0HXmwzSp6MaGDoQxxDSC
	 BK4D7dX9G8OOd6BpNfC698qV971d5v2SPOlDHk+Xjw/3uhHjMvW+t/csvpI4jU/A6nVRS
	 fYGtfwccf5F+HMK0QEalV70CMo4mqm1oe3ZhPIyjCCDuuxJ4p3TFR6PE2qEKCYEpJsexP
	 jEPYH0uDMsGwW47X4Mzlb0K8oxJ1SxvXLXKtlokvYQPvyXNT+eV4gxrKNj7RtZMYkP53B
	 dNevbS2itYToY0VXwa9EP/nwlCd7Svsr/LaoZGtxIuxtSBzlK91yp/Xj/jNsGFjjG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IQNj7t/w";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A828606A31D;
	Tue, 20 Oct 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQNj7t/w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933671F000C5;
	Tue, 20 Oct 2026 12:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497661;
	bh=KXg39mHdTsetgdPucEjKGeP2zUPOX/PjWq1Ui18mlHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQNj7t/wO8XHL5bqaL4l2qNSaVohn28nll/PuQDuRURxaKZZ0BkA7qpw1+KSYBEdx
	 eae6eqSf9GGfHGRWV/m/qcdX3tSJ6pY85wZLLJumjqO188Gur5CgTU3W7AjBS4+XIE
	 6jZvvmcEKiSZoeYdFHRwdvRYfr+ePlBKMmeA6ZlNEr5/T4VMja4G1hF0UdCAE5KJRR
	 ARM+QiKOQ3zmMNziUaJR7bId9+3Bl6xt1pqWTnkAJo4vR2NS6AA0H/vhtKY3tlCivh
	 vMpDoBDZ2FgASsc+9FKMMjar2E2xBh2NpMcqzRfsz09LrvLMV0ZFokWT2z9ZXLB7jQ
	 ZU5lKgxlJ1NnA==
Message-ID: <sashiko-outbox-178914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-2-86b9b728b95d@analog.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
 <20261020-upstream-lt7175-lt7176p-v1-2-86b9b728b95d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 12:01:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: (ltc2978) uninitialized stack read in ltc2978_get_id() fo=
r LT7176P
- [Medium] hwmon: (pmbus/ltc2978) IEEE754 peak values compared as LINEAR11 =
in ltc_get_max()
--

commit 51707b0225138ad0d3a2b0dd58f194120d060f5a
Author: Christopher de Guzman <christopher.deguzman@analog.com>

hwmon: (pmbus/ltc2978) Add support for LT7175 and LT7176P

This commit adds support for the LT7175/LT7175-1 and LT7176P/LT7176P-1 PMBus
buck regulators to the ltc2978 driver, distinguishing them via the
PMBUS_IC_DEVICE_ID string and configuring them with IEEE754 telemetry forma=
t.

> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index aea7b6c93e74b..a42cdc1fe1246 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c

[ ... ]

> @@ -645,6 +649,10 @@ static int ltc2978_get_id(struct i2c_client *client)
>  			return lt7170;
>  		if (!strncmp(buf, "LT7171", 6))
>  			return lt7171;
> +		if (!strncmp(buf, "LT7175", 6))
> +			return lt7175;
> +		if (!strncmp(buf, "LT7176P", 7))
> +			return lt7176p;

[Severity: Medium]
Can strncmp() read uninitialized stack memory in buf[6] here?

In drivers/hwmon/pmbus/ltc2978.c, ltc2978_get_id() reads PMBUS_IC_DEVICE_ID
into an uninitialized stack buffer via pmbus_read_smbus_i2c_block_data(),
which copies ret bytes without NUL-terminating buf, and then checks only
for ret < 6:

	if (chip_id =3D=3D LT7170_ID) {
		u8 buf[I2C_SMBUS_BLOCK_MAX];
		int ret;

		ret =3D pmbus_read_smbus_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
						      buf);
		if (ret < 0)
			return ret;

		if (ret < 6)
			return -ENODEV;

If a device returns a 6-byte PMBUS_IC_DEVICE_ID starting with "LT7176"
(where ret =3D=3D 6), calling strncmp(buf, "LT7176P", 7) without checking
ret >=3D 7 will read buf[6] from the uninitialized stack buffer and falsely
match lt7176p if that byte happens to be 'P'.

> =20
>  		return -ENODEV;
>  	}
> @@ -774,6 +782,20 @@ static int ltc2978_probe(struct i2c_client *client)
>  		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>  		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  		break;
> +	case lt7175:
> +	case lt7176p:
> +		data->features |=3D FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
> +		info->read_word_data =3D ltc3883_read_word_data;
> +		info->pages =3D LTC3883_NUM_PAGES;
> +		info->format[PSC_VOLTAGE_IN] =3D ieee754;
> +		info->format[PSC_VOLTAGE_OUT] =3D ieee754;
> +		info->format[PSC_CURRENT_OUT] =3D ieee754;
> +		info->format[PSC_TEMPERATURE] =3D ieee754;
> +		info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +		  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> +		break;

[Severity: Medium]
Will wiring info->read_word_data to ltc3883_read_word_data cause corrupted
peak readings when the sensor formats are set to ieee754?

For lt7175 and lt7176p, virtual peak reads for PMBUS_VIRT_READ_VIN_MAX,
PMBUS_VIRT_READ_IOUT_MAX, and PMBUS_VIRT_READ_TEMP_MAX go through
ltc3883_read_word_data() -> ltc3880_read_word_data() ->
ltc2978_read_word_data_common() -> ltc_get_max():

static int ltc_get_max(struct ltc2978_data *data, struct i2c_client *client,
		       int page, int reg, u16 *pmax)
{
	int ret;

	ret =3D ltc_read_word_data(client, page, 0xff, reg);
	if (ret >=3D 0) {
		if (lin11_to_val(ret) > lin11_to_val(*pmax))
			*pmax =3D ret;
		ret =3D *pmax;
	}
	return ret;
}

Because lin11_to_val() treats bit 10 as the sign bit of an 11-bit two's
complement mantissa, whereas in IEEE754 binary16 bit 10 is the least
significant bit of the 5-bit biased exponent, any positive IEEE754 value wi=
th
an odd biased exponent (e.g. [1, 2), [4, 8), [16, 32), [64, 128)) has bit 10
set and is decoded by lin11_to_val() as negative.

As a result, when a peak reading increases from an even biased exponent into
an odd biased exponent (such as temperature rising from 40 C to 75 C, or IO=
UT
rising from 2.5 A to 6.0 A), ltc_get_max() will treat the new higher reading
as negative and fail to update *pmax, or overwrite a higher odd-exponent pe=
ak
with a lower even-exponent reading.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-upstream-l=
t7175-lt7176p-v1-0-86b9b728b95d@analog.com?part=3D2
