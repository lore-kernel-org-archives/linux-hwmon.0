Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB520DF59
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788484026; cv=none; b=fjlz9S/edhtYoXeZnSjSSmRSC77uy+GwA8s2PH4xSL2aDbB600Xs2ExjXfjZtaFgBVtBttWFkuXFapMhVW2oxF+vah23csJFMQ9BJ/Hr2IUjQX+l3wO6rmTypV7pgxRy0NuvCwMm5BCg4r9gfQEtLvWKjLoXeWIUp/JYJKvselI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788484026; c=relaxed/simple;
	bh=1orPyQ8sy+s0UlHrQM/lDNxqkA7c6YQAOqGEmMvP1lI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YcVf13ukEIU8o86qwe5PdYLXtf++47u4zmM/3Q6KqDMaz7x8RutvU9FTYCqJ/Nm2OZ3VTTKE7LqUrOIImA+Ois9jq3WdtCrzRFhDtpfqAE5M0m4OkH7crPqPweGdl5Y0gBjDvund4wroYEYT3UDULp1mP30S+vQ0x+9fMuqvIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdpnZVzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdpnZVzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543661F000E9;
	Fri,  4 Sep 2026 01:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788484024;
	bh=gI2mIeP3gGx7qJst7qCqI5xuWZrqP0g6CvgneIzqQbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdpnZVzk+r6kjCkOBWTk2AwKe37iZ1LzLS6W4NhZ/FYtdpS07RRfFiwvMInUjztiT
	 gg6BgOI4ve4p1u94WZX/xz60swmVodiS3hl6BvOas+9AqI3B+gp/hiKUTlG9EIJviM
	 DN0CwnAlRg6RC4QlGZX2O4CT2zsGqXEgrBQfOXx2MeEamkxCrqaBXakdTJ0K+dGp5h
	 3xPzM6XG+mv3oY9AvgsKsijihSFijQsKYu2vanG2bhpfY3m9zBey/scAlImFfnJ6HC
	 IIwSkDPtaTEWJUo8TqG1IxaaKLj6euYqxLNfdBeMEDSNXe+UWAoGcJAllTkVloN/SB
	 RFa97MbpGDnEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 1/2] hwmon: pmbus: Fix vout_mode parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aryan Srivastava" <aryan.srivastava@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260904005351.2136374-2-aryan.srivastava@alliedtelesis.co.nz>
References: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
 <20260904005351.2136374-2-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 01:07:03 +0000
Message-Id: <20260904010704.543661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch truncates the PMBus VOUT_MODE mode field from 3 bits to =
2 bits, violating the PMBus specification, wrongly accepting reserved modes=
, and introducing dead code.
--

commit b7e943858dbfad31b0cd1d29753290823efc6361
Author: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

hwmon: pmbus: Fix vout_mode parsing

This patch masks the vout_mode parsing in the PMBus core with 0x3, intending
to handle cases where devices unexpectedly set the top-most bit of the
VOUT_MODE register.

> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 7a7eac90d62e5..b629acbffbfb6 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
> =20
>  		vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
>  		if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
> -			switch (vout_mode >> 5) {
> +			switch ((vout_mode >> 5) & 0x3) {

[Severity: High]
Does this change incorrectly alias reserved VOUT_MODE values (4-7) to stand=
ard
modes (0-3)?

By masking the top 3 bits down to 2 bits, if a PMBus chip reports a reserve=
d or
manufacturer-specific mode (such as mode 4), it will now be parsed as a
standard mode (like linear mode 0) instead of being properly rejected.
Misinterpreting the voltage format could cause erroneous voltage calculatio=
ns,
which might lead to system instability or physical hardware damage from
overvoltage.

Should device-specific quirks (such as a specific device erroneously setting
bit 7) be handled via a custom .read_byte_data callback or a quirk in a
dedicated device driver, rather than breaking PMBus protocol compliance for
all devices in the generic pmbus_identify() logic?

>  			case 0:
>  				break;
>  			case 1:

[ ... ]

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 806c9a4913bb0..60ddc49afb3f7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2751,7 +2751,7 @@ static int pmbus_identify_common(struct i2c_client =
*client,
>  		 * Not all chips support the VOUT_MODE command,
>  		 * so a failure to read it is not an error.
>  		 */
> -		switch (vout_mode >> 5) {
> +		switch ((vout_mode >> 5) & 0x3) {

[Severity: High]
Does masking with 0x3 here introduce dead code in pmbus_identify_common()?

Because the evaluated value is strictly restricted to 0, 1, 2, or 3, and all
four of those cases are explicitly handled below this switch, the default c=
ase
and its error handling (return -ENODEV;) can never be reached.

>  		case 0:	/* linear mode      */
>  			if (data->info->format[PSC_VOLTAGE_OUT] !=3D linear)
>  				return -ENODEV;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904005351.2136=
374-1-aryan.srivastava@alliedtelesis.co.nz?part=3D1
