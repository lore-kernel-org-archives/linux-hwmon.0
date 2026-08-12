Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA043C7C5
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553349; cv=none; b=exEN221yefjdDa1e9WQBB7qhvu0ng6jck9YLtkZQ5h54A/7noJsja3nQstlXmuLycaWQn8F6WvuqzIIUqBdTAzXyCtDGg/EQ64wiTXzCYqAikV0L339E2p07vmNoWwF+LPpro8h15J/5Dm/qw4C+H/Ku6oDXrIrtZA7YegpJTVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553349; c=relaxed/simple;
	bh=cuJ3FpX47OXADnWHIQN7eR1lMsiV2br2xtpvJF8s5qc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EO0UjMGib6nULQ2SULWhWsU4FMZXqIOKgesLTzFPrjXCsqTfOrFXDG7C/oCTDFGL+3QeKG/JKFRlF3Isp6VZAOD+/cXom047lG3FfVuIGreU0n69+YlxT5imhdUF04stGb6ZvXY51aIawQEyDO1iiFI8D5cxmvr9zHnmvTVU0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO11/25e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO11/25e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C991F000E9;
	Wed, 12 Aug 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786553348;
	bh=4OnGja8z7T2DoFCJqXeit/QUmzDB0xBzW/xnuEAZtY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RO11/25esTp7ueLnYoo5OelKTx9p+0rXzPBkAHflcG3/AgJUPqUQlArypUmpmdISw
	 p7ehR46tJ6sacnhClbHQ/MHmHX+guXhI9IW1zVGhsbMsKqUZfrfWl9G+isswoR5aZp
	 DzqCKjfgKvjio1KmxR3J1SkGphpryzALQI/diNHLRp7+WrXwNZe718v9sP2I4tpsYs
	 jQNBmyIvK9oWB8oeG3Zej87npssMqul6dyIdGTeZ8AqTGRNId5GHLnhVAlueQ2kVK4
	 narfivYjcoA0x67GJ44SCOlgek/tZsdEwhfQFeqFHboAHCA8cGcM1E6SQ4jnf3hSiO
	 97Np/WLUYD3gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) Add per-CCD temperature monitoring for
 Zen5 Turin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Ford" <gabriel@gford.dev>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812163812.2760-1-gabriel@gford.dev>
References: <20260812163812.2760-1-gabriel@gford.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 16:49:07 +0000
Message-Id: <20260812164907.C3C991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds support for 16 CCDs (Tccd13-Tccd16) on Zen 5 Turi=
n, but fails to expose these new channels to the hwmon subsystem and read h=
andler, rendering the new sensors completely inaccessible.
--

--- Patch [1]: [PATCH] hwmon: (k10temp) Add per-CCD temperature monitoring =
for Zen5 Turin ---
commit 91c5657242878293503804d18c7b5245b1066ddc
Author: Gabriel Ford <gabriel@gford.dev>

hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin
   =20
Add support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)
CPUs, as they fall in a different model range with a larger number of
maximum CCDs compared to their desktop counterparts. Tested and working
on an EPYC 9555P.

> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index de0760dc597da..b882fe09ac1b6 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -207,6 +207,10 @@ static const char *k10temp_temp_label[] =3D {
>  	"Tccd10",
>  	"Tccd11",
>  	"Tccd12",
> +	"Tccd13",
> +	"Tccd14",
> +	"Tccd15",
> +	"Tccd16"
>  };

[Severity: Medium]
Will these new sensors actually be exposed and read correctly by the hwmon
subsystem without corresponding updates to k10temp_info and
k10temp_read_temp()?

In k10temp_info, the hwmon_channel_info array dictates the maximum number of
attributes created, but it appears to be missing entries for Tccd13 through
Tccd16:

drivers/hwmon/k10temp.c:k10temp_info[] =3D {
	HWMON_CHANNEL_INFO(temp,
			   ...
			   HWMON_T_INPUT | HWMON_T_LABEL,
			   HWMON_T_INPUT | HWMON_T_LABEL),
	NULL
};

Additionally, in k10temp_read_temp(), the switch statement handling raw CCD
reads is restricted to channels 2 through 13:

drivers/hwmon/k10temp.c:k10temp_read_temp() {
    ...
		case 2 ... 13:		/* Tccd{1-12} */
			ret =3D read_ccd_temp_reg(data, channel - 2, &regval);

			if (ret)
				return ret;

			*val =3D (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
			break;
		default:
			return ret;
    ...
}

Will reading channels 14-17 (Tccd13-16) fall through to the default case and
return -EOPNOTSUPP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812163812.2760=
-1-gabriel@gford.dev?part=3D1
