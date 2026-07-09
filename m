Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654A3258CE7
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630110; cv=none; b=SYSw4YYbXkJGc/mXkXwyCL31ZQPEpoPX5B0OOCiH1Lw6FsoenTGJbbiLGdEG6seV0Vbkc15TCFx9V6GO3H+G+F4BVb0u9o4YnR3KYj6iCiGsCzvksoeWLWH8+of7KNzzPiIBmToV6Qhq9SB6NszV4Mw9gOnULWvgS2MtQihbOBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630110; c=relaxed/simple;
	bh=y8f03nvaRyPEpNXOm+MF8goB59JkwOiVBKd6HQPGArY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a9BiiPD7+4IUvnQBsSpIu8hrnJ6LVee6OXxlyHnYJBGtI8H4td4v8eh0d9JPfNNQanLgzuSt9KwWU1bTRWKCshm2i9wa8rrnqXT1wn4ZPiMH1sBtnzT60oMrb5dsKAROWnTScJdCv7HsZIwsSeXzzabocDfUCeT+hhFLgmPbxwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV4Cetqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV4Cetqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3BD1F000E9;
	Thu,  9 Jul 2026 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630109;
	bh=H6q4/d4nspwY1QeCPk+tW+HTvourrHlrqUb9SCfK5Z8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DV4CetqmI8jGLltLrogJ972tmdISmLVghgpSiInf4PvcC97IQtMcYrBVUwsfjwCI0
	 WAVKmKcDXCBNJjfaXNEQWi9m1K4IAdEjWUBtthvh4XRX3llLIX067KcNrUe4M2Jh92
	 NZoZLqYg8m8myA1bNcgcPm9vj6PN7A6SayyMU+p9E3DwbWFZfGMyexJE4RwrzzSCoU
	 Eso0jT3rRO04KVX9FvvDyTw2nSshSHaytKyGXXI+7pyiZTV3aJUd1KC0aAAJp35ShG
	 vtjeKkQiAtmcYBHcCds2O8MPjSBllUz422sixkityDhxeeyiHZPkqoxuotT26O4vVQ
	 EPFKcxSOwf8CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260709204037.1998433-2-eugene.shalygin@gmail.com>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:48:28 +0000
Message-Id: <20260709204828.CB3BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The patch enables a sensor that returns a specific 'blank' value=
 (-62) without filtering it, resulting in a bogus temperature being reporte=
d to userspace.

Pre-existing issues:
- [High] Missing bounds check in `asus_ec_block_read()` causes unintended r=
eads of EC registers from the wrong bank.
--

--- Patch [1]: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG ST=
RIX X870E-E GAMING WIFI ---
commit 65789a63d90e6f671eaa090793abd6eb2ac05064
Author: Vishaal Saraiya <vishaal.saraiya@gmail.com>

hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX X870E-E GAMING WIFI

Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI. Board specs list the
sensor, reading return -62, which is one of the blank values for
temperature sensors in the ASUS EC.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..742520c485ca6 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -743,7 +743,7 @@ static const struct ec_board_info board_info_strix_x8=
70_i_gaming_wifi =3D {
> =20
>  static const struct ec_board_info board_info_strix_x870e_e_gaming_wifi =
=3D {
>  	.sensors =3D SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> -		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> +		SENSOR_TEMP_MB | SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |

[Severity: Medium]
Since the commit message notes that an unpopulated T_Sensor returns a blank
value of -62, will this regression result in reporting a bogus extreme
negative temperature (-62000 mC) to userspace?

Looking at asus_ec_hwmon_read(), the driver does not appear to filter out
this known blank value before scaling and returning it:

	ret =3D get_cached_value_or_update(dev, sidx, state, &value);
	if (!ret) {
		*val =3D scale_sensor_value(value,
					  get_sensor_info(state, sidx)->type);
	}

Could this bogus value confuse thermal daemons and cause them to incorrectly
spin down fans?

>  		SENSOR_FAN_CPU_OPT,
>  	.mutex_path =3D ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
>  	.family =3D family_amd_800_series,

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential missing
bounds check in asus_ec_block_read() that might cause unintended reads of EC
registers from the wrong bank:

drivers/hwmon/asus-ec-sensors.c:asus_ec_block_read() {
    ...
	reg_bank =3D register_bank(ec->registers[ireg]);
	if (reg_bank < bank) {
		continue;
	}
	ec_read(register_index(ec->registers[ireg]),
		ec->read_buffer + ireg);
    ...
}

Because the loop only skips registers where reg_bank < bank, will this issue
reads for registers belonging to higher banks while the EC is still switched
to a lower bank?

Could this read incorrect hardware registers and potentially cause hardware
misbehavior due to side-effects, as well as trigger redundant, slow ACPI
reads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709204037.1998=
433-1-eugene.shalygin@gmail.com?part=3D1
