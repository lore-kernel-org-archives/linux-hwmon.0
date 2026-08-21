Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A031ED8B
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324488; cv=none; b=NFEzroRVwaMUUt6Cmcm14JESiOf6QjZd7Al2Lg2HLgrYgdK0UbymAN/+pok0+SxvQWaFa4ijBgCRC+bcZZuh36NpzpB+JttvJK/+/YKCjIXTMAKmE5/xGIB0oRqCLLano08KCYi20ULxaEUgth/YU3OGQr1zpBQMBfzfj9egj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324488; c=relaxed/simple;
	bh=JgAotBUAsquCLnSYIsu3ElSd39Cq/K33YIw2pNnxNb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XNb7oasc3kLHHUocjJk8vzWWotsdqehEO3jQ3U2j78EfrN/y06hhr8lvKZXjwQqg+GIliLFZjs2vbCucEBQgjPNP7wRdfqBYYKBtbCo+oAd2vIbSOhbzSXwRyqXRFQ73N2CaiFyfw82zLFMy0lEQ+a3XVz2vjQR6Dlo2OD5JjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlHnS4Ay; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlHnS4Ay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19821F00A3F;
	Fri, 21 Aug 2026 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787324487;
	bh=9apzOT1lqrnueNNBRWqN/AhkjOy6TbOoSGdTpjuaHBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WlHnS4AyFSf9G+A/Ecmm2M6n88HlG6T2lx8dEos8TATO1/kwakoPv1GXfBLSzbqB9
	 rXleus14rf63/Y4pP0k/UgbLS82XggoQLauazCOXGTTDY45eNfOm7kNm2+OFf57xhe
	 I0UrbV2PdvMaZWWGsQzvsUtCiOl9tfSx58acpMMxZaL4rFHIy2hnAnqFhHo+0O+DMQ
	 Skkdwquxmoi49LsIn1gVPsWAfNwF1NXUz3j1VCE2s5A49+Mv+VXG23+JnfE+cVzcn5
	 SV7tffpF4B4FG5EZtBP2jgkASUU2pPn+1ROJwlJlBle9EuKqmiI2lltM9UzthibbXb
	 /hK7Y0eA/Cy5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (sht4x) Fix return value from
 heater_enable_store()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821144916.2889031-2-linux@roeck-us.net>
References: <20260821144916.2889031-1-linux@roeck-us.net>
 <20260821144916.2889031-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 15:01:26 +0000
Message-Id: <20260821150126.F19821F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unit mismatch between jiffies and milliseconds in sht4x_read_value=
s timeout calculation
--

--- Patch [2]: [PATCH 2/2] hwmon: (sht4x) Fix return value from heater_enab=
le_store() ---
commit ffda8f58b43906bc1ea2253c2bf9b7981f601ded
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (sht4x) Fix return value from heater_enable_store()

The return value in heater_enable_store() causes an unexpected write
failure in user-space because it returns 0 instead of count. This signals
to VFS that no bytes were processed, leading to a busy retry loop.
Returning count fixes the problem.

> diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
> index 7a0dc2ed723d8..a97dda9e92dc5 100644
> --- a/drivers/hwmon/sht4x.c
> +++ b/drivers/hwmon/sht4x.c
> @@ -288,7 +288,7 @@ static ssize_t heater_enable_store(struct device *dev,
> =20
>  	data->heating_complete =3D jiffies + msecs_to_jiffies(heating_time_boun=
d);

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing how
data->heating_complete is used, I noticed a unit mismatch in
sht4x_read_values().

In sht4x_read_values(), the code calculates the timeout like this:

	if (data->data_pending &&
	    time_before(jiffies, data->heating_complete + data->update_interval)) {
		data->data_pending =3D false;

Is data->update_interval expected to be in milliseconds here?

Since data->update_interval is added directly to data->heating_complete
(which is in jiffies) without using msecs_to_jiffies(), does this create a
distorted timeout window?

Could this cause the driver to return stale, artificially high temperature
data from the heater phase instead of taking a new ambient measurement?

>  	data->data_pending =3D true;
> -	return 0;
> +	return count;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821144916.2889=
031-1-linux@roeck-us.net?part=3D2
