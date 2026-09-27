Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85881421223
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534793; cv=none; b=SSTrS+n3oKxROS4kY/oQrEhK2KiNkFrI9auvLkdtYLmkk5nohCZO0LU5keWF29gpeXgy/V2qUqYndwIbnKO8uwpHmKdRjm5MG0UPMyzj+Pd0Kj5TVTcuS6VfkJ9bUn8ph+YK7sp+jvvoUZglHAbGkb8UfxD+PCYJZ58EzzM0OwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534793; c=relaxed/simple;
	bh=JUm14VCuUt6Ne2t5D1XhwQXzwIMqjbSciMgbYzjAUOo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mxV6j8cVxNF2cXBJy53hUbPkaQ4PqmceshYJd7XRguz9JbDpvMXYEDvmzpaCdxVjEOsu2MgFhHhBXXZoeANBs166CIx2JCholZE/kWyyLl8WTdzBaqYxdrFD62ZG7s7hJ5yAD1XJ4d5RcGfpGMDf2Xl+bN0Hy3fWW/q48RS3F0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTnVmQQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTnVmQQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB7D1F000FF;
	Sun, 27 Sep 2026 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534792;
	bh=QaYuwzen6tlDX9e0kzwwPTUOzCM6YSirM1cyDiFNsfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NTnVmQQqo/RCcAdjR0qJTJh7OLewO0dj6C0DEw+w8LBN/X4cxbUgcfL/sO3vFECaB
	 oeQyw/3zVeBKHTLtaH0oAHFWY50aOWqqmUSrtY8WBRIC7mwONLMvQVWG3fpG/oZgxg
	 9VOsEepF9SRW44a8gCsSlMfUiuvF2zQWTd6rRxn0iuQNHM+2j6Glr/tyTkhcmwLBv8
	 tZlIUgO1IF3uEErhK8/yvg8ph+blSn/1mvw3SnNyMjNYkeCM6L69KGCRm6PKo41sOI
	 9tsTbZnsKuak/YGlpQpG7YZapaXHMpdzzBpnBUeNbLmlbeTNJv3JT39gx63SoJ/ndR
	 6QpE5rPtxrkgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] hwmon: (aquacomputer_d5next) Avoid truncating
 scaled sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927183723.4078226-2-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
 <20260927183723.4078226-2-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:46:31 +0000
Message-Id: <20260927184631.DBB7D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: TOCTOU race in aqc_read() exposes -ENODATA to userspace
--

commit 33794227f1f473259c7900f38a511561b017b28c
Author: Vas Zayarskiy <contact@vasily.cc>

    hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor readings

    High Flow Next power is reported in watts. Multiplying the 16-bit value
    by one million can overflow both the signed intermediate and the u32
    cache. Store power in long, perform the conversion in u64, and clamp to
    LONG_MAX. The other existing power conversions fit in a signed 32-bit
    value. Return -ENODATA for unavailable power instead of exposing the
    stored error as a reading.

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..9178ac4cbdd75 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
[ ... ]
> @@ -1070,6 +1071,8 @@ static int aqc_read(struct device *dev, enum hwmon_=
sensor_types type, u32 attr,
>  		}
>  		break;
>  	case hwmon_power:
> +		if (priv->power_input[channel] =3D=3D -ENODATA)
> +			return -ENODATA;
>  		*val =3D priv->power_input[channel];

[Severity: Medium]
Could a concurrent HID raw event interrupt update priv->power_input[channel]
to -ENODATA right after the validation check but before the assignment?

If aqc_raw_event() updates the shared state concurrently, it seems this TOC=
TOU
race in aqc_read() could cause the internal -ENODATA error code to be retur=
ned
to userspace as a valid power reading (because aqc_read returns 0 on succes=
s).

Should this read be protected with READ_ONCE() or a lock to prevent exposing
transient incorrect statistics when userspace polls the sysfs file?

>  		break;
>  	case hwmon_pwm:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927183723.4078=
226-1-contact@vasily.cc?part=3D1
