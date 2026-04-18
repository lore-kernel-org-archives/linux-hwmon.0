Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FA734572F;
	Sat, 18 Apr 2026 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776511766; cv=pass; b=KhH1N+n9nyUb/WHCEsGlc/8rLQz81hGbceqTZ8zcE3grU9WxC8tVEPGMXG+aepfofRTyQuoWYBiGLoe6ux3DXJtzy4PDnX7mmGjbQPn5oZKZldQZdYoVg0wk0vmf1ewP47z64Q4AtqTsucKhyozRJTxchXzLaBBkeIt7axAz6lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776511766; c=relaxed/simple;
	bh=TsSomze2eYKPUCYN4b8KB1OylByI0nJFNwLMr2a5lh8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=foAlJ/BwTwFfg0EJX0Q6PNzoRQ/jPsXVMexI64vygyTzWzBGHcDGGqJqmS1zGeZVTheONnkxBz3auHjYpR0R068AjJ7/L+ElgWAbLB5K9Bext26Kwr8XxjMTu1Fj0ZjyY+IsYeaSiat38O7FwMu5mvKSNitw7TDdtMT6AuSZcAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QbA5+dpy; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QbA5+dpy"
ARC-Seal: i=1; a=rsa-sha256; t=1776511745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j0OKdclz84Z6Cq68oCPSsrjEfe8om6+WXzibp6o/OsbmOT19pHf2X/5nB6L761ovp6NLOrXIw6OmaY7kdO+Ufw7oozYtBcSN9U53lS9+aVGKdV/3w4Qd0zk8yQWkevCp99sazutIkgrFUeA09U/bLRgXpzCuizmVIUzkf/xAHL4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776511745; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q79tK2r02sLbrzVnyGQ3Pk6+nx3R12Nmhqy43XEIP4E=; 
	b=ODKdUZUgzxqQaniJiN5NsNN6uRmIFRcWs0R2uoIdsOQgsYWTe6Q+MzcbriDkZIwEEmr615yssfWNJN2wpHA/UwVvZb01ekVWokW9Y6z0S2c4T66m0LjUsJ3ay8kdiAcPWpHCvz6erZqnstDY5ZhEZe6WP/IAARcLm2nL6njHWLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776511745;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=q79tK2r02sLbrzVnyGQ3Pk6+nx3R12Nmhqy43XEIP4E=;
	b=QbA5+dpyP2d3A1/0qDTXChJBjtfAVDyX22qCdG3+BKliRaV+HJ1X0QpVMiV/hcMo
	VzKv8qmg7Yc5N9HnDqmc/gYpD7ZRQjSEI567b4L3ndrjpkH8E6BuWYrpw3sGxd9+ghV
	jtilDnNHetAi8bATl3aPp43ssBcZzh8Tz8Rro9qIWBnVCJCYRAPxRWbcs+cX7EK8+Mo
	GX6wYvUI/n+wDeZZyoazWsrbHrmARSiGEGJzNpXwJXtJ3aRYRNUSF+e6SSYKDjS7tgu
	fyClV3rt4R1CEqnqHzMvDPnvBK2y26to2LgDebtuDop0Oq+GfAvqz4DGMVSMDziGh+t
	DsRDQpj2fw==
Received: by mx.zohomail.com with SMTPS id 1776511744079819.9088638096537;
	Sat, 18 Apr 2026 04:29:04 -0700 (PDT)
Message-ID: <fed0feb4770f7fab8d4336eb349d8703839e8ce4.camel@rong.moe>
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
From: Rong Zhang <i@rong.moe>
To: kernel test robot <lkp@intel.com>, Sergio Melas
 <sergiomelas@gmail.com>,  Guenter Roeck <linux@roeck-us.net>, Jean Delvare
 <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, "Derek J .
 Clark"	 <derekjohn.clark@gmail.com>
In-Reply-To: <b876cbcce7763041d93f9cad28b8aa4cac0a001a.camel@rong.moe>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
		 <202604180539.EuswNnjG-lkp@intel.com>
	 <b876cbcce7763041d93f9cad28b8aa4cac0a001a.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Apr 2026 19:23:54 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Sergio,

On Sat, 2026-04-18 at 18:31 +0800, Rong Zhang wrote:
> Hi Sergio,
>=20
> On Sat, 2026-04-18 at 05:37 +0800, kernel test robot wrote:
> > Hi Sergio,
> >=20
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on groeck-staging/hwmon-next]
> > [also build test ERROR on linus/master next-20260416]
> > [cannot apply to v7.0]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwm=
on-yogafan-Massive-hardware-expansion-and-structural-refactoring/20260417-0=
63319
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git hwmon-next
> > patch link:    https://lore.kernel.org/r/20260413060931.31091-2-sergiom=
elas%40gmail.com
> > patch subject: [PATCH v1] hwmon: (yogafan) Massive hardware expansion a=
nd structural refactoring
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive=
/20260418/202604180539.EuswNnjG-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd=
708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260418/202604180539.EuswNnjG-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202604180539.EuswNnjG-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > > > drivers/hwmon/yogafan.c:712:6: error: call to undeclared function '=
wmi_has_guid'; ISO C99 and later do not support implicit function declarati=
ons [-Wimplicit-function-declaration]
> >      712 |         if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
> >          |             ^
> >    1 error generated.
>=20
> Hmm, that's a bit troublesome. Usually we should have been able to
> declare `depends on ACPI_WMI if ACPI_WMI' (new syntax since v7.0) or
> `depends on ACPI_WMI || !ACPI_WMI' as an optional dependency to prevent
> such an issue, but there is no static inline stubs for !ACPI_WMI...
>=20
> I'd suggest declaring `select ACPI_WMI if ACPI && X86' in Kconfig as
> some drm drivers do, at least for the time being.

Of course you'll still need to guard the wmi_has_guid() checks behind
`#ifdef CONFIG_ACPI_WMI'. Just forgot to mention that.

Hmm, in this way `depends on ACPI_WMI if ACPI_WMI' should also be OK...

Thanks,
Rong

>=20
> Thanks,
> Rong
>=20
> >=20
> >=20
> > vim +/wmi_has_guid +712 drivers/hwmon/yogafan.c
> >=20
> >    697=09
> >    698	static int yoga_fan_probe(struct platform_device *pdev)
> >    699	{
> >    700		const struct dmi_system_id *dmi_id;
> >    701		const struct yogafan_config *cfg;
> >    702		struct yoga_fan_data *data;
> >    703		struct hwmon_chip_info *chip_info;
> >    704		struct hwmon_channel_info *info;
> >    705		u32 *fan_config;
> >    706		acpi_status status;
> >    707		int i;
> >    708		const struct hwmon_channel_info **chip_info_array;
> >    709=09
> >    710		/* Check for WMI interfaces that handle fan/thermal management.=
 */
> >    711		/*  If present, we yield to the WMI driver to prevent double-re=
porting. */
> >  > 712		if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
> >    713		    wmi_has_guid(LENOVO_CAPABILITY_DATA_00_GUID) ||
> >    714		    wmi_has_guid(LENOVO_WMI_FAN_GUID)) {
> >    715			dev_info(&pdev->dev, "Lenovo WMI management interface detected=
; yielding to WMI driver\n");
> >    716			return -ENODEV;
> >    717		}
> >    718=09
> >    719		dmi_id =3D dmi_first_match(yogafan_quirks);
> >    720		if (!dmi_id)
> >    721			return -ENODEV;
> >    722=09
> >    723		cfg =3D dmi_id->driver_data;
> >    724		data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> >    725		if (!data)
> >    726			return -ENOMEM;
> >    727=09
> >    728		/* * 1. Hardware Calibration & Inertia Scaling (Note 3):
> >    729		 * Dynamic parameters (TAU and SLEW) are calibrated relative to=
 fan diameter
> >    730		 * based on the moment of inertia relationship (J =E2=88=9D d=
=C2=B2).
> >    731		 */
> >    732		data->config =3D cfg;
> >    733		data->device_max_rpm =3D cfg->r_max ?: 5000;
> >    734		data->internal_tau_ms =3D cfg->tau_ms ?: 1000; /* Robustness: P=
revent zero-division */
> >    735=09
> >    736		/* Calculate Slew Rate based on time-to-max-RPM physics */
> >    737		data->internal_max_slew_rpm_s =3D data->device_max_rpm / (cfg->=
slew_time_s ?: 1);
> >    738=09
> >    739		/* * Log physical parameters for safety traceability (IEC 61508=
):
> >    740		 * Provides a deterministic baseline for the RLLag filter verif=
ication.
> >    741		 */
> >    742		dev_info(&pdev->dev, "Identified hardware: %s\n", dmi_id->ident=
);
> >    743		dev_info(&pdev->dev, "HAL Profile: [Tau: %ums, Slew: %u RPM/s, =
Max: %u RPM]\n",
> >    744			 data->internal_tau_ms, data->internal_max_slew_rpm_s, data->d=
evice_max_rpm);
> >    745=09
> >    746		/* * 2. Deterministic Multi-Path Discovery:
> >    747		 * We iterate through the available paths to find physical hand=
les.
> >    748		 * This loop tests variations until data->fan_count matches the
> >    749		 * cfg->fan_count expected for this model profile.
> >    750		 */
> >    751		for (i =3D 0; i < MAX_FANS && data->fan_count < cfg->fan_count;=
 i++) {
> >    752			acpi_handle handle;
> >    753=09
> >    754			/* Integrity check: End of defined paths in the quirk table */
> >    755			if (!cfg->paths[i])
> >    756				break;
> >    757=09
> >    758			status =3D acpi_get_handle(NULL, cfg->paths[i], &handle);
> >    759			if (ACPI_SUCCESS(status)) {
> >    760				data->active_handles[data->fan_count] =3D handle;
> >    761				data->fan_count++;
> >    762			} else {
> >    763				/* Log variation failure for troubleshooting */
> >    764				dev_dbg(&pdev->dev, "Fan path variation %s not found\n", cfg-=
>paths[i]);
> >    765			}
> >    766		}
> >    767=09
> >    768		/* Integrity Check: Fail probe if no fans were successfully reg=
istered */
> >    769		if (data->fan_count =3D=3D 0) {
> >    770			dev_err(&pdev->dev, "Hardware identification failed: No fans f=
ound\n");
> >    771			return -ENODEV;
> >    772		}
> >    773=09
> >    774		/* * 3. HWMON Configuration:
> >    775		 * Dynamically build the HWMON channel configuration based on t=
he
> >    776		 * number of fans actually discovered. We allocate one extra sl=
ot
> >    777		 * to serve as a null terminator for the HWMON core.
> >    778		 */
> >    779		fan_config =3D devm_kcalloc(&pdev->dev, data->fan_count + 1, si=
zeof(u32), GFP_KERNEL);
> >    780		if (!fan_config)
> >    781			return -ENOMEM;
> >    782=09
> >    783		for (i =3D 0; i < data->fan_count; i++)
> >    784			fan_config[i] =3D HWMON_F_INPUT | HWMON_F_MAX;
> >    785=09
> >    786		info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> >    787		if (!info)
> >    788			return -ENOMEM;
> >    789=09
> >    790		info->type =3D hwmon_fan;
> >    791		info->config =3D fan_config;
> >    792=09
> >    793		/* 4. Wrap it in chip_info for registration */
> >    794		chip_info =3D devm_kzalloc(&pdev->dev, sizeof(*chip_info), GFP_=
KERNEL);
> >    795		if (!chip_info)
> >    796			return -ENOMEM;
> >    797=09
> >    798		chip_info->ops =3D &yoga_fan_hwmon_ops;
> >    799=09
> >    800		chip_info_array =3D devm_kcalloc(&pdev->dev, 2, sizeof(*chip_in=
fo_array), GFP_KERNEL);
> >    801		if (!chip_info_array)
> >    802			return -ENOMEM;
> >    803=09
> >    804		chip_info_array[0] =3D info;
> >    805		chip_info_array[1] =3D NULL; /* Null terminated */
> >    806=09
> >    807		chip_info->info =3D chip_info_array;
> >    808=09
> >    809		/* 5. Finalize registration with the accurate hardware descript=
ion */
> >    810		return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(&pd=
ev->dev,
> >    811					DRVNAME, data, chip_info, NULL));
> >    812	}
> >    813=09
