Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA6386450
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597871; cv=none; b=hLfFNNSK1SogmzUuG8qw3xbwdmEuxiNab77wo0QLQmndjj68F5FCZPZRhEsa/O+2X0h3A8ib0KB4aEhtqk7VHUZo2eoYfwcuRdV3U/VuJV5VQh+ekslGHEDF7iIkDNQCtx5D54aD+xNxGn4nAjDe18PgBfvyzaKhbEPNHbqdxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597871; c=relaxed/simple;
	bh=QKwLEzu92dqy/v5lvVDcknrG1rS8b2yfaVTUS4W5g1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dTEUBNCFSWVQASZveI96r7iGQcBm1hgb1bk6TDUg9vSJWZz5rwJaVm8DTRfS2pppwZvm6EvhTSzPTiSvM/v5PRPyIhyn2S3uB/1IMcOksy0OCWFECoQuSr5z4n9RZhgvBEha+0m39q5ZZdcOT445SR4G30KllW0e162gyFKJ/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuxGXqhu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuxGXqhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627B81F000E9;
	Mon, 24 Aug 2026 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597869;
	bh=+DzNcq7RBgOTuuFX4S3QtaBOi/8YJCMf7H5jAX8N4q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HuxGXqhuro5kYorEkjcpaWu6iIfr8gUKWzt5zAP8hCL8KSUZK72agcJq9I0+LPVsb
	 Kzu4sdh5hV9ifQu943C8yoE6F5UMoS/K3OFRv+7lKb3ddZscTu6YJS2VEFdg0WUVUs
	 I6ebLgCLLSKfCoSlQzbHCbQWuB8XyyGtbyIFQCA8uP6kYIPwJcH9dsPmIkTgd2E1sm
	 VFehCtm5IVLB2gi1LqbVv4XdsrLqAge7kRlZE/juOdH+sj9lJvDSxwybV1UDVweEY2
	 X1v6Kjx/baXb7zD4s0oh53Vq4qQv2UOEMuKhSt8nx0n9uQTalG8OBwK2UMadcB6ifE
	 5RTT7Ciiap4Iw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] hwmon: (nct6775) Ignore 0xffff TSI temperature
 readings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?GyRCaHEbKEIgGyRCeX5XMxsoQg==?= <Spector.Tsai@outlook.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824184443.81887-1-Spector.Tsai@outlook.com>
References: <20260824184443.81887-1-Spector.Tsai@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:57:48 +0000
Message-Id: <20260824185749.627B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the `tsi_temp` a=
rray is incorrectly declared as `s16` (signed) instead of `u16`. As a resul=
t, when an active TSI channel returns `0xffff` dynamically at runtime, the =
value is stored as a negative number (`-1`). When passed to `show_tsi_temp(=
)` and then to `tsi_temp_from_reg(unsigned int reg)`, it is sign-extended t=
o a 32-bit integer (`0xffffffff`). The function then performs a logical rig=
ht shift (`reg >> 5`), corrupting the value and yielding a bogus reading of=
 3892313987 millidegrees Celsius. While the patch hides `0xffff` at probe t=
ime, it leaves the root cause (the `s16` array type) unfixed, allowing the =
bug to trigger during runtime updates.
--

--- Patch [1]: [RFC PATCH] hwmon: (nct6775) Ignore 0xffff TSI temperature r=
eadings ---
commit 4af5e21bfe7d5aa83ca756cf26ad0f2043522f36
Author: Spector Tsai <Spector.Tsai@outlook.com>

hwmon: (nct6775) Ignore 0xffff TSI temperature readings

This patch updates the probe path to treat 0xffff as an inactive TSI channe=
l.
It aims to prevent unused TSI channels from being exposed and reporting bog=
us
temperature readings of 3892313987 millidegrees Celsius.

> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 759ea3d1286e3..34e6a01aa4e49 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -4339,7 +4339,7 @@ int nct6775_probe(struct device *dev, struct nct677=
5_data *data,
>  		err =3D nct6775_read_value(data, data->REG_TSI_TEMP[i], &tmp);
>  		if (err)
>  			return err;
> -		if (tmp)
> +		if (tmp && tmp !=3D 0xffff)

[Severity: High]
This isn't a bug introduced by this patch, but does this fully resolve the
bogus reading issue if an active channel returns 0xffff dynamically at
runtime?

Looking at drivers/hwmon/nct6775.h, the tsi_temp array is declared as s16:

struct nct6775_data {
    ...
    s16 tsi_temp[NUM_TSI_TEMP];
    ...
}

In nct6775_update_device(), when reading a TSI channel that temporarily
returns 0xffff, this 16-bit value is stored into the s16 array as -1.

When the temperature is exported to sysfs:

drivers/hwmon/nct6775-core.c:show_tsi_temp() {
    ...
    return sysfs_emit(buf, "%u\n",
                      tsi_temp_from_reg(data->tsi_temp[sattr->index]));
}

The s16 value is passed to tsi_temp_from_reg() which takes an unsigned int:

drivers/hwmon/nct6775-core.c:tsi_temp_from_reg() {
    return (reg >> 5) * 125;
}

The -1 is implicitly cast to an unsigned int (0xffffffff), and the logical
right shift yields the 3892313987 millidegrees Celsius bogus reading. If
userspace thermal managers observe this massive value during runtime update=
s,
could it trigger an unwarranted emergency system shutdown?

Would changing the tsi_temp array type to u16 prevent this sign-extension
issue entirely?

>  			data->have_tsi_temp |=3D BIT(i);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184443.8188=
7-1-Spector.Tsai@outlook.com?part=3D1
