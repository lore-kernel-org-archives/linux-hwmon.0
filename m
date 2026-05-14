Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0993A542A
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750984; cv=none; b=MLt1k0Z8M5sZl/eNKiGmi858Ifa6YnPjfFshiNksaNnn4DP2wfnsSOwu5uypoov1QRtnoQcZkJpOLJ4J4Dj4sPalA5HOKrYsOGVcx8zMplKdYyMrVDcVUNPsNpSMV7NdKTSshOniT2WkyLXZZqzp2MvG+Gkk9F0PZrMDWENPZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750984; c=relaxed/simple;
	bh=bX2Fs2P79DYqj2MK2NyVBkeSmTQxqS63AIJ5ZPTS91I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/pobcthFVkmrBWMXDjMyusGaJwuwIyRu82HTMhDBMAc4QtN2U5qShn2Vh4zA+SPdzD2bGynKmx+WUPmAjycrlcw6zXvT8S1N/26f2g7v9qlPWQlbC1OgQX2PHwRhxWz0R9MDd2w044vhuOqAas3hb6hLmIQWy63yHB0URNtmsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrMy56EA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrMy56EA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DFEC2BCB3;
	Thu, 14 May 2026 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778750983;
	bh=bX2Fs2P79DYqj2MK2NyVBkeSmTQxqS63AIJ5ZPTS91I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XrMy56EAqOiuGJO0R/fvQSOSr4qekncO3CLEt8ul0QrHn24sTkYunXcCgjCrQR6E5
	 0GF2Svfk/2hKtFFSeSmkl91yni8a037BkLBZcVJZo/UDY1it0qgZwhpQtl46RzPmoR
	 XzxJ+llNhkxQzvQTTZiSEw2VRHpzKLXF6ct/haZu0pAbmh1c7nllYskXjaPQoIp8lu
	 Wqm1kXM26aQSzcUzIzEoQxmpAHwr5rpPVEl8SvezSy/dsAgrMdCl8b8c0NhmiLiyix
	 f2feXrsPleLgxjdhFciQvV5Z0RIg6PSTfB9WyhKn/qtI6CCbheAWh7hAhLmQLM4wz9
	 BeAl07n7xyF0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] hwmon: scmi-hwmon: Log number of sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v2-3-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-3-36607e9dd540@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 09:29:43 +0000
Message-Id: <20260514092943.B5DFEC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The scmi_hwmon_probe function configures the wrong sensors because=
 it passes the array index `i` instead of the actual firmware `sensor->id` =
to `sensor_ops->config_set`.
--

commit adc025236960e1cfd8886f8043954aa0a9f37bc8
Author: Alex Tran <alex.tran@oss.qualcomm.com>

hwmon: scmi-hwmon: Log number of sensors

This commit logs the number of discovered sensors upon a successful probe in
the SCMI hwmon driver. This aligns the driver with the existing SCMI client
driver logging pattern, making it easier to confirm firmware-exposed resour=
ces
during debugging.

> diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
> index eec223d174c07..456ce11d050c6 100644
> --- a/drivers/hwmon/scmi-hwmon.c
> +++ b/drivers/hwmon/scmi-hwmon.c
> @@ -335,49 +335,50 @@ static int scmi_hwmon_probe(struct scmi_device *sde=
v)
[ ... ]
>  	for (i =3D 0; i < nr_count_temp; i++) {
>  		int ret;
> =20
>  		sensor =3D *(scmi_sensors->info[hwmon_temp] + i);
>  		if (!sensor)
>  			continue;
> =20
>  		ret =3D sensor_ops->config_set(ph, i, sensor_config);

This isn't a regression introduced by this commit, but could passing the
local array index i to sensor_ops->config_set() instead of the firmware
sensor->id result in configuring the wrong sensors?

Since SCMI sensor IDs are global and can map to any sensor type, passing
the local array index might mistakenly configure arbitrary unrelated
hardware components.

Could this leave the actual temperature sensors unconfigured and break
subsequent thermal zone registration? Is it possible that thermal
mitigation would fail to function correctly due to the underlying
temperature sensors remaining disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v2-0-36607e9dd540@oss.qualcomm.com?part=3D3
