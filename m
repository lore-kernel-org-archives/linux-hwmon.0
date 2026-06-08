Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010636F8EF
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899840; cv=none; b=rGkD3N9ZP1iqL5nC/R1NNkoHVw06EI+tJm/mcUNLK3nzeiGRWZT0Wq3KzFt/BkAwC8T9y584oWZkk8AU9dm04ldY9Oi6/qFfUSN1E3TDgtaHPFNSN4b9qcdJwgbswZ7tA+jm2AAKoebH2VdRG0evQlpNmM3DCmui7rVu6bKMYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899840; c=relaxed/simple;
	bh=slic6/rqIjjknQFj/l9xQFQe4/RegrSIBH61zcuNJx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JcMItg62u3+UwuxiT4oqG/bkt5b+mGdE8zTs+kdJr5bCUJa/QjIy524bjBHVQqHSUPzxhB0XljqqpFcAJoQlLbDh8u+Jz9ley4O+xseRHLQZ50XT9ZSAQ9BMtyLiA/gRr+pOETFH/ZssSXmM5KAPNu9aXtxG4gjv81SOJ2F7lMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URR+G/HN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URR+G/HN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48AE1F00893;
	Mon,  8 Jun 2026 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780899839;
	bh=fgVRBz9Ze/+IvrBrTVzwArLDh940kDhaXxZzDXwdfuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URR+G/HNQY2i0jWMbJWrDarcHXypJ6PZ1y5JxFqkvQK28j3GahRFwCSAhk9pCwlSV
	 7IiF+qz9mbWc8ama74nNFtzr3vWn+5wS3MqkvHyrXc6DLn+s3gjCGwhAla8dbpepjk
	 +sEoAzhQoSbCE0wCzgS2NtWrsNAOYiSrkSOzke7Bax2M/XpbAXDE6YmLUnz9a7UWKw
	 pefhRIsAaaXs4eqgc8FL7zRoD1UTqurE8ykBRBAxD8F9xRwXasCddY7Uq2ivUXNrMb
	 piSAUJrXjD3ieVAunEu1xpHn2pzvwTQyU3rNc4hG0DmlDQV5RPag12jAkZH0jCtyis
	 iMcxUcN/aH82w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790
 EXTREME
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260608060855.40469-1-eugene.shalygin@gmail.com>
References: <20260608060855.40469-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 06:23:58 +0000
Message-Id: <20260608062358.E48AE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Flawed loop condition in asus_ec_block_read() causes invalid EC ha=
rdware bank reads
--

commit 8836d81dc6f932fbdf066b7ca8c52190b6258c01
Author: Brian Downey <bdowne01@gmail.com>

hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME

This commit adds hardware monitoring support for the ROG MAXIMUS Z790 EXTRE=
ME
motherboard to the asus-ec-sensors driver. It registers new sensor
configurations including water cooling telemetry and updates the DMI matchi=
ng
table.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index b5d97a27f80d3..08418a01208cb 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -404,6 +404,12 @@ static const struct ec_sensor_info sensors_family_in=
tel_700[] =3D {
>  	[ec_sensor_temp_vrm] =3D EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>  	[ec_sensor_fan_cpu_opt] =3D
>  		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> +	[ec_sensor_fan_water_flow] =3D
> +		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
> +	[ec_sensor_temp_water_in] =3D
> +		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
> +	[ec_sensor_temp_water_out] =3D
> +		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
>  };

[Severity: High]
This is a pre-existing issue, but will adding sensors across multiple banks
like 0x00 and 0x01 trigger a bug in asus_ec_block_read()?

Looking at asus_ec_block_read(), the inner loop iterates over all requested
registers but only skips past banks, omitting a check for future banks:

drivers/hwmon/asus-ec-sensors.c:asus_ec_block_read() {
...
        for (ireg =3D 0; ireg < ec->nr_registers; ireg++) {
            reg_bank =3D register_bank(ec->registers[ireg]);
            if (reg_bank < bank) {
                continue;
            }
            ec_read(register_index(ec->registers[ireg]),
...

Since the ec->registers array is not strictly sorted by bank index, could
this cause the embedded controller to issue an ec_read() for registers
of future banks while physically switched to the current, lower bank?

This might result in unintended side effects like clearing clear-on-read
status registers or disrupting hardware behavior.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608060855.4046=
9-1-eugene.shalygin@gmail.com?part=3D1
