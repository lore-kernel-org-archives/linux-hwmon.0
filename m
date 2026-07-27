Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96EE13E41A
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123881; cv=none; b=Af1jrLMQfVR9J1/EiuPbYldGND21V2IPu7fgONFyYYbKiEZVjYGMjeG6FKGAZWCW7spCqu5dAfonu8M8FEcwQSLVmQcu3b7wLOZMrcplV4WZRAjiH59YF1s14eSEVKEBmAuRdtNVoobuzdSGZXpk2Zsd1yVHPR4Vg+aZ+NlbJdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123881; c=relaxed/simple;
	bh=H8yvT8qf2FYX3OxwxjYv7unYxOkjAViRfn9QxS7/14Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=liWC00LHqzVWzfeFUbHiHIdO47QTbh1XKQPAxleM8GBLBZNCCVIElfpZt47EI/zd+EcmCGhsuC9oAkUuoGjK3giKQMObgga2HVZaMG3YAdjOV6c3AM7MOkYH2ufqf3vh2+PN/fbmGqEMvbilkP4JCy8j6+hQoU3bmJjm6jCHZh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fP62ZLV9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fP62ZLV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA821F000E9;
	Mon, 27 Jul 2026 03:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785123880;
	bh=r6q0ROj8DJW2mWdBu23cKB7FrApVJ0bz8yFrcgtXPJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fP62ZLV9TaI5kck4J5HTbVbjBIvXDgWFQcSv1VBi0WiubBVqIzqW2InEv9ZoKeF3M
	 L7UB70oajt6Pfjsb08veJpnEIYQOiDAj+k8I7q0yBG9NbFcnO2nMBN5+4YyDVp3tn4
	 lzQ/xdDC/QORWce2zG6JoE3PAyvR6NkTM4RhBbN+qX7DjCJUlEwT6dPKF/e4tVdFcD
	 zeELv9LUYyRWht78YaIhoR7J57CtMu/RIz0KCoTY/QpRZGc0f6eKe4gWoqQ08owZSx
	 1EK/CXhaQgWNaK8sat/ZVCbkyVBf2XIn/KG2ME9rD+LUiXDkb2EcdiQGEpByX+jOVf
	 V6oMIROeSbHgg==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v3 5/6] hwmon: (adt7470) Fix temperature alarm
 logic in hwmon_temp_read()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_thermalzone-v3-5-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-5-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 03:44:38 +0000
Message-Id: <20260727034440.2CA821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The bitmask calculation `BIT(channel)` for temperature alarms inco=
rrectly maps channels 7, 8, and 9 due to a discontinuity at bit 7.
--

--- Patch [5]: [hwmon PATCH v3 5/6] hwmon: (adt7470) Fix temperature alarm =
logic in hwmon_temp_read() ---
commit ab0ed15b014e653c238da0d91110d0699630d8f7
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix temperature alarm logic in hwmon_temp_read()

This commit changes the temperature alarm read logic to use a bitmask based
on the channel index, attempting to fix an issue where the channel index
was previously interpreted directly as an alarm bitmask.

Link: https://lore.kernel.org/r/20260717211224.B9E291F000E9@smtp.kernel.org

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index a34635526aaa2..f1150f0fe2172 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -569,7 +569,7 @@ static int adt7470_temp_read(struct device *dev, u32 =
attr, int channel, long *va
>  		*val =3D 1000 * data->temp_max[channel];
>  		break;
>  	case hwmon_temp_alarm:
> -		*val =3D !!(data->alarm & channel);
> +		*val =3D !!(data->alarm & BIT(channel));

[Severity: High]
Does this bitwise calculation map correctly for higher channel indexes?

If bit 7 of the alarm state is the Out-of-Limit (OOL) global flag, it
appears channel 7 will erroneously report the OOL flag instead of its actual
alarm state.

Could this also cause an off-by-one mapping for the remaining channels,
where channel 8 reports channel 7's alarm and channel 9 reports channel 8's
alarm?

>  		break;
>  	default:
>  		return -EOPNOTSUPP;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_th=
ermalzone-v3-0-21424d550c3d@gmail.com?part=3D5
