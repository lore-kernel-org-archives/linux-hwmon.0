Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79A345EC0
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680286; cv=none; b=oJbsQW8kwQQLZ/iOu2+yFDYS+3FV0iCVcbcGeZF80//NnttOP3TMf6ikC2r2mzkKhrZpmmrn7oaA94E9QTFThdLg5yd8CMY4Y+FCaxuelIvNKYIPzMD0Jj0XSnLuwDhYI0MVQ+RaK3qWd/TfzaAA3VG2VMYJOkoyHUEkHIPem+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680286; c=relaxed/simple;
	bh=KnipwVdDYwcFSzYrBA2FCD5BowtOVl2P3j/pqtv3kmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWgDijDsvJNLk96cyKVzwCwNemeg6dDEND+pBFLNxq+0hpOkoUiijcZkceKjrt2WH08bEL4XCmBETFxl6ydxBync7Asyp6Vwe7+wFtlWLAyEqSuoKKKuLCinN1lRW/IDY2SdXatFeja2OBWkh5Uoxl2Uyy52xKj1qQCLOF61lxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g53QHdyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g53QHdyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C871F000E9;
	Tue, 25 Aug 2026 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787680285;
	bh=R/fTT64Xia6nj9M+4V6eQrDTim8lVCbCRYcZw8icf1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g53QHdyTKoEGlbGeJNu8l9s2qd1oHJXAtq3V3Cf6GEqFUpgfQx8rxXRwDQum2hJb+
	 sJqzCon98i0dQY/H8XCadyfIgbbvE/5PDOQYfW7aXdsEDGDXH9X0XZvUueZidRPDGR
	 5nx4+qDoJefCBJ0TI53jyurACQsGPySxhVa42DPRAI/gRcyPUjLJ3rUjaQHRYzL8tF
	 +cA32ruiFC+/5427T0joJ2j8qYUOGx8LM9i7iEVYRc48xLrWkXs7uFQ6RlfGbbCM35
	 yAyE5y1TGm57qYoz57Y2Viae4lnpIXyHQgyCwaSh0ES9o976xkA6J/l3S3v09o2LE0
	 RXw5cKEn1Y5AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 6/6] eth: fbnic: firmware notifies hwmon on
 sensor threshold events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824175059.2485048-7-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
 <20260824175059.2485048-7-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:24 +0000
Message-Id: <20260825175125.48C871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unsupported sensor thresholds (FBNIC_SENSOR_NO_DATA) default to S3=
2_MIN, causing incorrect critical/maximum hardware monitoring alarms.
- [Medium] A malformed thermal payload drops valid voltage exceedance notif=
ications.
--

--- Patch [6]: [PATCH net-next v2 6/6] eth: fbnic: firmware notifies hwmon =
on sensor threshold events ---
commit cb433d6b1a4ff2dfdeefaa87867490a37344d0ed
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: firmware notifies hwmon on sensor threshold events
   =20
This commit adds parsing for firmware unsolicited messages about sensor
threshold events (FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP). It
translates these messages into hwmon alarms and notifies userspace listeners
while guarding against concurrent hwmon registration and teardown.

> --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c

[ ... ]

> +static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
> +						  struct fbnic_tlv_msg **results)
> +{
> +	bool therm_exceeded, volt_exceeded;
> +	struct fbnic_dev *fbd =3D opaque;
> +	s32 value;
> +
> +	therm_exceeded =3D
> +		fta_get_sint(results, FBNIC_FW_TSENE_THERM_EXCEEDED_FLAG);
> +	volt_exceeded =3D
> +		fta_get_sint(results, FBNIC_FW_TSENE_VOLT_EXCEEDED_FLAG);
> +
> +	if (!therm_exceeded && !volt_exceeded) {
> +		dev_err(fbd->dev,
> +			"Threshold exceeded message with no flag set\n");
> +		return -EINVAL;
> +	}
> +
> +	if (therm_exceeded) {
> +		if (!results[FBNIC_FW_TSENE_THERMAL]) {
> +			dev_err(fbd->dev,
> +				"Thermal threshold exceeded but no value received\n");
> +			return -EINVAL;
> +		}

[Severity: Medium]
If a firmware message arrives with both therm_exceeded and volt_exceeded=20
flags set, but the thermal attribute is missing, fbnic_fw_parse_threshold_e=
xceeded_resp()
returns -EINVAL early.

Will this cause a valid voltage exceedance notification to be silently drop=
ped?

> +		value =3D fta_get_sint(results, FBNIC_FW_TSENE_THERMAL);
> +		dev_err(fbd->dev, "Thermal threshold exceeded: %d mC\n", value);
> +		fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_TEMP, value);
> +	}
> +
> +	if (volt_exceeded) {
> +		if (!results[FBNIC_FW_TSENE_VOLTAGE]) {
> +			dev_err(fbd->dev,
> +				"Voltage threshold exceeded but no value received\n");
> +			return -EINVAL;
> +		}

[ ... ]

> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> +void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val)
> +{
> +	enum hwmon_sensor_types type;
> +	struct device *hwmon;
> +	s32 attr =3D -1;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return;
> +
> +	switch (id) {
> +	case FBNIC_SENSOR_TEMP:
> +		type =3D hwmon_temp;
> +
> +		if (val <=3D fbd->fw_cap.temp.min)
> +			attr =3D hwmon_temp_min_alarm;
> +		else if (val >=3D fbd->fw_cap.temp.crit)
> +			attr =3D hwmon_temp_crit_alarm;

[Severity: High]
If a sensor threshold is not supported by the hardware, it defaults to=20
FBNIC_SENSOR_NO_DATA, which evaluates to S32_MIN.

Since any valid positive temperature value will be greater than S32_MIN,
will this unconditionally trigger a false critical alarm when evaluating=20
against an unsupported threshold in fbnic_hwmon_notify_event()?

> +		else if (val >=3D fbd->fw_cap.temp.max)
> +			attr =3D hwmon_temp_max_alarm;
> +
> +		break;
> +	case FBNIC_SENSOR_VOLTAGE:
> +		type =3D hwmon_in;
> +
> +		if (val <=3D fbd->fw_cap.volt.min)
> +			attr =3D hwmon_in_min_alarm;
> +		else if (val >=3D fbd->fw_cap.volt.max)
> +			attr =3D hwmon_in_max_alarm;
> +
> +		break;
> +	default:
> +		return;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824175059.2485=
048-1-limzhineng2@gmail.com?part=3D6
