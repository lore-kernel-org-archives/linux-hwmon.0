Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80C73E559B;
	Wed, 24 Jun 2026 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336083; cv=none; b=Z/ssYWv+RvwGY2qJ54/Ss7/bdVmb5wsrmDHzvwpXfyNWLqjxTkASAPtNSRPczpc3Cw5illyaAwZgkH7S4sCP4D0YXhQpZZ0NuKqPgBP3JyexQyq7/Zyg1maeWU0AgYaOnetWe0SPGJUAn5yprwG3pBB8DdBNxwcG9CIr1mAh3iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336083; c=relaxed/simple;
	bh=SMjDvfbUBdvd7Fr+O7HKq5jslK7CwSYRdHrTPkk0q9Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mo3iYEwiohgbtdF+PPJBD2o2eCD1tR210HpasXNfkkF/4aRbhBVZId9mjGNGAtOd+26yYbFPTmJZx15q1/nWt7Tz+f6UQujTA9lkcVZweq3bUlT+TwXFk2KeD1+JRJDrfA1A6oUcyEQdnlV22N8N9k/i6FopKa/FSTOksvZBuIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHN4Cqvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHN4Cqvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F4E1F000E9;
	Wed, 24 Jun 2026 21:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782336082;
	bh=iVtEUgRF39GpEpSnAb7AEy+xuRloGA5qJK/sUx0iHbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hHN4CqvdByduWX145uzovw/D0s7M2EW5zg1pHQFyMGWddySSIH6CRBVYVIz9jejHl
	 2OULALTWDkLPcncaaTSQZZpevgsCUuKgE/ChF3C4y+9QC3u3a7xfDTjaGgCbJLYEEe
	 RrQIHkzM7gbJQJGv6Z3IZ56WJ5Y1n/CcFIfr6ACe3/1UVpll17iKn7WiAoRCRLVy0y
	 laRyGYx+9HxJ3VqlQWbD9AMRMuJnXgt1ATfLIsjCeSOQcYkB4EEdXULJEMji+NaXES
	 QXtIFCPqNQpbb0Ds5Copu8TimqDSZnHrnAArsP+s2y+CaOTBIJadfSM3V9vKDcoO+3
	 r1uTRETQmjXLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] platform: arm64: thinkpad-t14s-ec: Wire EC
 thermal events to hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624210825.264454-3-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:21:21 +0000
Message-Id: <20260624212122.26F4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing HWMON_T_ALARM capability prevents sysfs notification fro=
m working.
--

commit 1242d377b6327e98b089989a953188982e0ca595
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon

This patch wires up EC thermal zone status change notifications to the hwmon
notification framework. It associates hwmon temperature channels with EC
thermal events and emits hwmon_temp_alarm notifications to userspace.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 142464623f0e8..276bb51da33a3 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c

[ ... ]

> @@ -493,6 +496,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
>  	return input_register_device(ec->inputdev);
>  }
> =20
> +static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
> +{
> +	for (int i =3D 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
> +		if (ec->ec_hwmon.sys_thermx[i].event !=3D event)
> +			continue;
> +
> +		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
> +				   hwmon_temp_alarm, i);
> +
> +		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
> +			ec->ec_hwmon.sys_thermx[i].label);
> +	}
> +}
> +

[ ... ]

> @@ -658,6 +671,7 @@ static const struct hwmon_ops t14s_ec_hwmon_ops =3D {
>  };
> =20
>  static const struct hwmon_channel_info *t14s_ec_hwmon_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL),

[Severity: Medium]
Will the hwmon_temp_alarm notifications successfully reach userspace?

The channel configuration array does not include the HWMON_T_ALARM capabili=
ty
for any of the temperature channels. Without this, the hwmon core will not
create the corresponding tempX_alarm sysfs attributes.

When t14s_ec_hwmon_notify_event() calls hwmon_notify_event() for
hwmon_temp_alarm, it appears the sysfs notification will fail silently beca=
use
the attribute does not exist. The thermal subsystem still receives the event
via hwmon_thermal_notify(), but userspace monitoring tools will not be able=
 to
read or poll the sysfs attributes.

Does HWMON_T_ALARM need to be added to the channel configurations here to m=
ake
the sysfs event notification work as described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624210825.2644=
54-1-daniel.lezcano@oss.qualcomm.com?part=3D2
