Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456973;
	b=1UO7ub6RRA+QWsX57Z2RvPYtgo5PtWV9cqb+NAx+AaJ+E5HEedzr4CkmYXnKQCv1sJU1
	 vPk1t+ImVjXk5aPDJQEVibjr+wokQeq9iLtlPPYkHMbxoUZbhVG7XKt+cOR5xStaYeRP8
	 JZ3CpMdqGd1v4H0Ze4PIDABUAgqMTR6bk89npuy6zXY4GijALKDdr/yOQdYWU2GszRCqp
	 Wj9xZWeZ3SgIIuor4Vzlwj61HMio7v1GWFvyPT2ljnef6iZRPmMtA2lyfg8pzHY4dVhkp
	 mPTUIIKp+9ROKg8sTqfYrGbuMsyVh1Ktgh419eE9HkQK10UYKF4ajff12GT42f+tXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456973;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MGV6mw8GSxlCrXQJotxuF7PfSO8uiZc3gB1g6qUnyM0=;
	b=UiQJNpLMJFGXF++stDHe9xroUUxYcS1sa0K+x6tFgw7E18XUW37dWgvx2UG+mAas55zE
	 BOdq7H23MJmdGcTiHDkYwFMhOJifr6SoY/FLtKF7muWc1dMAKNs867zZ+o2dQbcGUC56y
	 87ISPmQvaMJqcKTHtjYRBQXRxmALRda1XZp0XqRdHQp5vNCfc06TWnxgeoyOpd2CmRzoA
	 ZT/8rwDQvZF6ibniEiYaWiAzmQIFSiqfdNERrgppSCyV9QpjofQpYeFpI8hMZDuz+3Tnx
	 pnfYWEYhK9Nzg9SvEs2txFf3F/O7CnoyomlIFsfRDTVdCqINGlnHTDmQf4OUQC4vyPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7IlbslB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F9606A31A;
	Mon, 23 Nov 2026 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7IlbslB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708901F000CA;
	Mon, 23 Nov 2026 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456972;
	bh=MGV6mw8GSxlCrXQJotxuF7PfSO8uiZc3gB1g6qUnyM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7IlbslBSq9fbHF8hfR0XIWrnrzqstOn7Uw7uXFM3xPnzDMz3UOIn2hLxFFJPq5nl
	 XOqitMmoZcsjJR2Ha1eR2aIWqxeKM1Sx/peONYm+CeBMKShzVyVmgU968lKvUeSYy2
	 TGup8z4WQl0dmEtZRk0RDpe5FxRhDPeBTTgIzWp2dQ+iaiAi1Qrr2BrV3It3hhPkUY
	 lB+Y0L0gR/KCoYsnatrKGyoDa9vxtZYdok0i/cCt550U9SdzIgxYbzp6HFR8S8uPho
	 qCIg3FSLXvT8LmaOnq2b61Ajwyir7XoahDS7992sT38YDAmLefWaE9WGdTT/HAykpx
	 Tc9UDHIi39SNg==
Message-ID: <sashiko-outbox-229791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
 <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:02:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] iio: adc: max34417: voltage read fails on power overflow in
  CAM mode
- [Medium] iio: adc: max34417: stale OVF and state desync in
  max34417_setup_cam_mode()
--

commit bc8a43ebc9b20a80f36676c2f0db12f5485b7c1d
Author: Neil Armstrong <neil.armstrong@linaro.org>

iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power=
 Accumulator

This commit adds an IIO ADC driver for the MAX34417 four-channel voltage and
power accumulator over I2C/SMBus, supporting single-shot voltage and power
measurements as well as continuous energy and average power accumulation.

> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
> new file mode 100644
> index 0000000000000..241cc9c3c2546
> --- /dev/null
> +++ b/drivers/iio/adc/max34417.c
[ ... ]
> +static int max34417_check_ovf(struct max34417_data *max34417)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	u32 control;
> +	int rc;
> +
> +	rc =3D regmap_read(map, MAX34417_CONTROL_REG, &control);
> +	if (rc)
> +		return rc;
> +
> +	if (!(control & MAX34417_CONTROL_OVF))
> +		return 0;
> +
> +	rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_OV=
F);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/* Save the timestamp for the next read */
> +	max34417->last_update =3D ktime_get();
> +
> +	return 0;
> +}
[ ... ]
> +static int max34417_save_accumulators(struct max34417_data *max34417)
> +{
> +	s64 acc_power;
> +	s32 acc_count;
> +	int rc;
> +
> +	rc =3D max34417_read_acc_count(max34417, &acc_count);
> +	if (rc)
> +		return rc;
> +
> +	if (check_add_overflow(max34417->acc_count, acc_count, &max34417->acc_c=
ount)) {
> +		max34417->overflow =3D true;
> +		goto check_ovf;
> +	}
> +
> +	for (int i =3D 0; i < MAX34417_CHANNEL_COUNT; i++) {
> +		rc =3D max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
> +					     &acc_power);
> +		if (rc)
> +			return rc;
> +
> +		/* Check for overflow on local accumulators */
> +		if (check_add_overflow(max34417->acc_power[i], acc_power,
> +				       &max34417->acc_power[i])) {
> +			max34417->overflow =3D true;
> +			goto check_ovf;
> +		}
> +	}
> +
> +check_ovf:
> +	rc =3D max34417_check_ovf(max34417);
> +	if (rc)
> +		return rc;
> +
> +	return max34417->overflow ? -EOVERFLOW : 0;
> +}
> +
> +static int max34417_read_voltage(struct max34417_data *max34417,
> +				 const struct iio_chan_spec *chan, int *val)
> +{
[ ... ]
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/* Save the timestamp for the next read */
> +	max34417->last_update =3D ktime_get();
> +
> +	if (max34417->cam_mode) {
> +		/* Retrieve all channels to avoid missing data for other channels */
> +		rc =3D max34417_save_accumulators(max34417);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	rc =3D regmap_noinc_read(map, chan->address, &buf, sizeof(buf));
> +	if (rc)
> +		return rc;
> +
> +	/* Ignore first byte which contains the Byte Count & data starts at Bit=
 2 */
> +	*val =3D get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
> +
> +	return IIO_VAL_INT;
> +}

[Severity: Medium]
Should max34417_read_voltage() fail with -EOVERFLOW when a software power
accumulator overflows in CAM mode?

Voltage readings from MAX34417_V_CHx_REG are instantaneous 14-bit samples
that do not depend on max34417->acc_power[] or max34417->acc_count, yet once
max34417->overflow is set, max34417_save_accumulators() returns -EOVERFLOW
and aborts every voltage read.

In addition, because neither max34417_read_voltage() nor
max34417_save_accumulators() checks max34417->overflow before running
check_add_overflow(), subsequent voltage reads continue adding into the
wrapped max34417->acc_count and max34417->acc_power[] values.  And if
MAX34417_CONTROL_OVF is set in hardware, max34417_check_ovf() clears it and
writes MAX34417_UPDATE_REG before max34417_read_voltage() has read
chan->address.

[ ... ]
> +static int max34417_setup_cam_mode(struct max34417_data *max34417, int v=
al)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	int rc;
> +
> +	if (max34417->cam_mode && !val) {
> +		/* Reset counters and accumulators */
> +		for (int i =3D 0; i < MAX34417_CHANNEL_COUNT; i++)
> +			max34417->acc_power[i] =3D 0;
> +		max34417->acc_count =3D 0;
> +		max34417->overflow =3D false;
> +
> +		rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_CAM);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	} else if (!max34417->cam_mode && val) {
> +		/*
> +		 * If CAM mode must be set, the Control byte must be set to desired
> +		 * values with CAM =3D 0, then followed by an UPDATE.
> +		 */
> +		rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_CAM);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM=
);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* Save the timestamp for the next read */
> +	max34417->last_update =3D ktime_get();
> +
> +	max34417->cam_mode =3D val;
> +
> +	return 0;
> +}

[Severity: Medium]
Does max34417_setup_cam_mode() leave MAX34417_CONTROL_OVF set in
MAX34417_CONTROL_REG when toggling CAM mode after an accumulator saturation?

When a hardware accumulator saturates, the chip sets MAX34417_CONTROL_OVF
and stops measuring until MAX34417_CONTROL_OVF is cleared followed by an
UPDATE command.  And once max34417->overflow is set, max34417_read_power()
and max34417_read_energy() return -EOVERFLOW before reaching
max34417_check_ovf(), so disabling and re-enabling CAM mode is the way to
reset accumulation.  Because both branches here only modify
MAX34417_CONTROL_CAM via regmap_clear_bits() and regmap_set_bits(),
MAX34417_CONTROL_OVF stays set in hardware across the reset and keeps
accumulation halted when CAM mode is re-enabled.

Also, in the disable branch, max34417->acc_power[], max34417->acc_count and
max34417->overflow are cleared before the I2C writes, so a failed write
discards the accumulated data while leaving max34417->cam_mode true; in the
enable branch, if the final regmap_write(map, MAX34417_UPDATE_REG, 1) fails,
MAX34417_CONTROL_CAM remains set in hardware while max34417->cam_mode stays
false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-topic-sm8x=
50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org?part=3D3
