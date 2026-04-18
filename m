Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941EB23EAAB;
	Sat, 18 Apr 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525611; cv=pass; b=dvvqMK6USpNk9EgN/TTb8RVUC5b6LIBVw1/LnKC9GbMWNvVelirBdBQTbUMPTahshyz3yMeFS2yBTppIeo5ZcbNKmWo6IehkxeoM3qK10BZmOcZ7Dj7bUdy2oqZLjC/S8yzy5r/7WJuKIefOZxBqJ8My2I8XJ5+vwZK+REvtoS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525611; c=relaxed/simple;
	bh=Es4KQSma+TVYNVs4Ex/787Ej8o0H/PSH3tsjSCgff3U=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CDiE26LruuFbsB6YbRmsCB2re02a1B/ihrzHIdS9zRrBSEFDYCm5hu6qrOf7/erJmxhhW0zUhitwnjUqxx8GHUOaXfMiHwZfT7y02g5zOvqqr6AHD7mViIJMiKwU2hU59K0lW7+pWooh3jT4w5YT+QfVz8goetgcEQ5BHHxjCfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=CmGviZrS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="CmGviZrS"
ARC-Seal: i=1; a=rsa-sha256; t=1776525584; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lq6D6A4XBI628F7U7Ywm+H3MH+J0l2qPKJfznrvEOp9WoIXicRbW/TBosQG5ussPQTkwljFyWS40+ZGyzyXW2j+isRmCElklwsvtaPZ+vsX1khkHbgov+W6MnA6l14mELAIE1esa9fLVpIp+k/ag/mHppNUFyXhbYk/yYBN5KF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776525584; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=elQNWl6J+oi+z/Eky6SejZrkNwBm9ZJOYqY2knP7qQA=; 
	b=VIyBT1qpicC5M0ASviZi3oh6GWs8t3ocCVOHElONYT8CVlFhdqF8py9Wt089CZWeiXZQLTDXSRTPslf8slj9gft5z/yJhqEFMWrsCL1IGuhZHuruVf+pgUBkKcavYMnrkKk1DGslhEuB7q4PFKvlLalQ6++Aefn9jP7mJD+FIWA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776525584;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=elQNWl6J+oi+z/Eky6SejZrkNwBm9ZJOYqY2knP7qQA=;
	b=CmGviZrSc22ek1Tkq+h0DRgwS5sTazOBjZBN8Ee+u3M6jjnwiC8cZgUQymbGI016
	XKL6xSeTJh1D9q/ouLYYG1igOkoTcc9Hv15c2nmYxEvEi2f/1tGoNiCloyC2HEw/r2K
	WcQ0cTgxswZ1PApQog9Bd8of2bLjhbgwHgBxxZUIHU2MobCiabqCZRfb+Ro8zaHURp8
	3lZxc1E2nO/NYo0q/DgDYaip6A4luajX8dl/8YMMtdwdv7NBJhJE6q0KtoChTF5zvsQ
	DEH8dT7MpSzmL/3D8982SOrg0CzE2m++Y4pIDw2Xaf9cI4Qt5uEfXNKVfunGaP1kBc4
	ZqxRtyBUbA==
Received: by mx.zohomail.com with SMTPS id 1776525581498205.35466580833724;
	Sat, 18 Apr 2026 08:19:41 -0700 (PDT)
Message-ID: <b70674d5a2152ed6123966f96acbd2872518a6f1.camel@rong.moe>
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
From: Rong Zhang <i@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, kernel test robot <lkp@intel.com>, 
 Sergio Melas <sergiomelas@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, "Derek J .
 Clark"	 <derekjohn.clark@gmail.com>
In-Reply-To: <27b467c7-7ca0-4198-b4ea-efb38f2ac787@roeck-us.net>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
	 <202604180539.EuswNnjG-lkp@intel.com>
	 <b876cbcce7763041d93f9cad28b8aa4cac0a001a.camel@rong.moe>
	 <fed0feb4770f7fab8d4336eb349d8703839e8ce4.camel@rong.moe>
	 <27b467c7-7ca0-4198-b4ea-efb38f2ac787@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Apr 2026 23:14:33 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Guenter,

On Sat, 2026-04-18 at 06:49 -0700, Guenter Roeck wrote:
> On 4/18/26 04:23, Rong Zhang wrote:
> > Hi Sergio,
> >=20
> > On Sat, 2026-04-18 at 18:31 +0800, Rong Zhang wrote:
> > > Hi Sergio,
> > >=20
> > > On Sat, 2026-04-18 at 05:37 +0800, kernel test robot wrote:
> > > > Hi Sergio,
> > > >=20
> > > > kernel test robot noticed the following build errors:
> > > >=20
> > > > [auto build test ERROR on groeck-staging/hwmon-next]
> > > > [also build test ERROR on linus/master next-20260416]
> > > > [cannot apply to v7.0]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >=20
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas=
/hwmon-yogafan-Massive-hardware-expansion-and-structural-refactoring/202604=
17-063319
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linu=
x-staging.git hwmon-next
> > > > patch link:    https://lore.kernel.org/r/20260413060931.31091-2-ser=
giomelas%40gmail.com
> > > > patch subject: [PATCH v1] hwmon: (yogafan) Massive hardware expansi=
on and structural refactoring
> > > > config: loongarch-allmodconfig (https://download.01.org/0day-ci/arc=
hive/20260418/202604180539.EuswNnjG-lkp@intel.com/config)
> > > > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-projec=
t cd708029e0b2869e80abe31ddb175f7c35361f90)
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/reproduce)
> > > >=20
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202604180539.EuswNn=
jG-lkp@intel.com/
> > > >=20
> > > > All errors (new ones prefixed by >>):
> > > >=20
> > > > > > drivers/hwmon/yogafan.c:712:6: error: call to undeclared functi=
on 'wmi_has_guid'; ISO C99 and later do not support implicit function decla=
rations [-Wimplicit-function-declaration]
> > > >       712 |         if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
> > > >           |             ^
> > > >     1 error generated.
> > >=20
> > > Hmm, that's a bit troublesome. Usually we should have been able to
> > > declare `depends on ACPI_WMI if ACPI_WMI' (new syntax since v7.0) or
> > > `depends on ACPI_WMI || !ACPI_WMI' as an optional dependency to preve=
nt
> > > such an issue, but there is no static inline stubs for !ACPI_WMI...
> > >=20
> > > I'd suggest declaring `select ACPI_WMI if ACPI && X86' in Kconfig as
> > > some drm drivers do, at least for the time being.
> >=20
> > Of course you'll still need to guard the wmi_has_guid() checks behind
> > `#ifdef CONFIG_ACPI_WMI'. Just forgot to mention that.
> >=20
> > Hmm, in this way `depends on ACPI_WMI if ACPI_WMI' should also be OK...
>=20
> I don't know is this is a misspelling, but `depends on ACPI_WMI if ACPI_W=
MI'
> doesn't make any sense.

This is the new syntax for optional dependencies since commit
76df6815dab7 ("kconfig: Support conditional deps using "depends on X if
Y""), which is equivalent to the old-fashioned `depends on ACPI_WMI ||
!ACPI_WMI'.

It's needed to prevent the combination of CONFIG_ACPI_WMI=3Dm +
CONFIG_SENSORS_YOGAFAN=3Dy, which leads to linkage error. Considering that
yogafan doesn't really need the WMI driver core except for
wmi_has_guid(), it also makes yogafan possible to build with
CONFIG_ACPI_WMI=3Dn, which implies CONFIG_LENOVO_WMI_TUNING=3Dn (the config
entry for lenovo-wmi-other). No double reporting is possible in this
case and hence the GUID check is not needed at all when
CONFIG_ACPI_WMI=3Dn.

Thanks,
Rong

>=20
> Guenter
