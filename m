Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6E372673
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731745; cv=none; b=FEDu9N7n+js6gEhWyyZ2Vkkj014+fDUidmEe3AeVi63E7kOVih9D0skxKQf0AJXLJ3rhR+UeZvjNfvEECBGa+kXG5q1CuOd/xTkvlYQEyP1Hk+CBqfJOlwRJRXtu6FEQpAGBrwkeunkQE4qR9yKmEpgbspl3pfFRDH0P+EN9jyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731745; c=relaxed/simple;
	bh=/uQRhUHSziqsC8E4ILczbbJW9vqGoNQNGJEOg76R7Jg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W0Ik8zavUvA8f2Q3Izjfk78xdStGkI7Gxmg+yjg5A1/lH7NNcaIo6rvAAMUy8Ey8QFKFn80VXLGv0UEi1eQ0y5pXInS38bCw1qqWGvlY++aUo//l8oFM6uezZe1iElDopGxtTxWufrO1axTlPI1X9ZoM+ErnX2WBH9RaY3vh8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hin2E6w9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hin2E6w9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9DE1F00A3D;
	Wed, 22 Jul 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784731744;
	bh=mhhvStz0XQYAtOQU/ZtpZB00F8YRsoyh5SBimgmy5tM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hin2E6w9vB6Oh815VvGEEbCYSuStFg1gapcmeZopF+Ih3MM0y8BYhGwoxcbZxFi0d
	 MALLPtv9UYFYAgvD0fO//mOu6qu9+yvjq3dL/EfIjhvAcrwB7PLLw/hafVPp9tDYXn
	 5k4coeGcMZhIUrTPPV4nLi8XFSu9tIArlZog+ydLyUCuSiw67QJkKMsQS4W9fGBLg3
	 0EpDwJj/YkUz8JCuA3NIjQHjAT9vgpVVpOCrepmuuMge5Wclm9V4soeEzQHfTIjKGs
	 F/xchIdHEfCN2VBKt5oFBJHRxYwFPqHR7to855KTIIZ3GGUwya3/8nIkIdhx5RbQxO
	 dKUn1tSfGqGNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775-core) Fix number of temperature
 registers for NCT6116
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260722142846.2302075-1-linux@roeck-us.net>
References: <20260722142846.2302075-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 14:49:03 +0000
Message-Id: <20260722144904.1C9DE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds global array read and invalid hardware register acce=
ss when initializing/updating PWM settings on NCT6116 chips.
--

--- Patch [1]: [PATCH] hwmon: (nct6775-core) Fix number of temperature regi=
sters for NCT6116 ---
commit 835ff18121a1acfa963233fe43066bfff28a84fa
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nct6775-core) Fix number of temperature registers for NCT6116
   =20
Unlike NCT6106, NCT6116 only has three temperature registers, and with
it only three temperature source and temperature source configuration
registers. The register addresses match those of NCT6106 and can be
re-used.

Closes: https://lore.kernel.org/linux-hwmon/57cfc3fa-d4e9-4c10-8aa7-4ad0af7=
ebebe@roeck-us.net/T/#t

> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index d668dc390def8..51253acff4b06 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
[ ... ]
> @@ -3652,7 +3650,7 @@ int nct6775_probe(struct device *dev, struct nct677=
5_data *data,
>  		  =3D NCT6106_CRITICAL_PWM_ENABLE_MASK;
>  		data->REG_CRITICAL_PWM =3D NCT6116_REG_CRITICAL_PWM;
>  		data->REG_TEMP_OFFSET =3D NCT6106_REG_TEMP_OFFSET;
> -		data->REG_TEMP_SOURCE =3D NCT6116_REG_TEMP_SOURCE;
> +		data->REG_TEMP_SOURCE =3D NCT6106_REG_TEMP_SOURCE;
>  		data->REG_TEMP_SEL =3D NCT6116_REG_TEMP_SEL;
>  		data->REG_WEIGHT_TEMP_SEL =3D NCT6106_REG_WEIGHT_TEMP_SEL;
>  		data->REG_WEIGHT_TEMP[0] =3D NCT6106_REG_WEIGHT_TEMP_STEP;

[Severity: High]
This is a pre-existing issue, but since nct6116 configures data->pwm_num to=
 5,
does assigning these 3-element NCT6106 register arrays here (and for REG_PW=
M[5]
and REG_PWM[6] earlier in this function) cause out-of-bounds reads?

When nct6775_update_pwm() iterates up to data->pwm_num, it accesses these
arrays using the loop index:

drivers/hwmon/nct6775-core.c:nct6775_update_pwm() {
    ...
    for (j =3D 0; j < ARRAY_SIZE(data->REG_PWM); j++) {
        if (data->REG_PWM[j] && data->REG_PWM[j][i]) {
            err =3D nct6775_read_value(data, data->REG_PWM[j][i], &reg);
    ...
    if (!data->REG_WEIGHT_TEMP_SEL[i])
        continue;
    ...
    err =3D nct6775_read_value(data, data->REG_WEIGHT_TEMP[j][i], &reg);
    ...
}

Could this result in global out-of-bounds reads, and subsequently use those
values as invalid hardware register addresses during PWM updates?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722142846.2302=
075-1-linux@roeck-us.net?part=3D1
