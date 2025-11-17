Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA593328ED;
	Mon, 17 Nov 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391881; cv=pass; b=m3HRZVoJyE6AJG8bVoBokKKZp3kok3D27xjivMuPGwHNarkenqHjkcGhK2X9Va6ikqv+WmNZwUddG/EDfKOXv1l01IUFfp/t5a//q4M8Y3MdHIRUfDom1fe/kNuPNuqjTbRUkY4MNmpKb+z1YYHINK1Xhp7ko4EZoegpvwscylM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391881; c=relaxed/simple;
	bh=sN5CO3AUWc/d1im3I//6lMuGpX8hIeavt6R3PUsH6AM=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cI6yKOBhZ5SZiDx4jA81FVdYnpCCPrN+8BH4lpURRL/9XoOh5GEFwlNz+jRn0nr+2x3W8jhspgALUf9LDbjqV3/OpqWWcbKnF1dDiSRoA164JuWfEQmjqHnRFh26IUhVdZnGoYz2W2btlFTxu7qawLv/UyZUEtwcu4OuH3mtVSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Dp2J9Wrv; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Dp2J9Wrv"
ARC-Seal: i=1; a=rsa-sha256; t=1763391859; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h//t/7JPYAQrbemuZaVMCZLvrLuB2P2OAGdwSNvEo0zA1IbXcb1tHVHieYGGuTb4uuP4rqVeuc8VLfGjtF1bLazICcoROHdkKWYiN0YcC5mR0RSdljA2GJHn406oByAhLJQvKtoCOvTuw08kaHuYrUbsm69p+G86DhZzc8Q+GHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763391859; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EagaKbl39+TJsgt4HDbFikQSX0moQU46XoRqLysDGDc=; 
	b=VJq9DE55SSLXtzeOcT0cB6GRfVRcM0kKvY71Vp7k2tUyw64BHPJnu0V8tdJQtjf691sRC7+zGvMgsJEXiOWZ33kAE0YVRZ4How8Bry84IQW0X4jQlMT5nqyjLAAQ0+HKTiLSxnF4zy7NrTXAi8fln9y/SRVWp0ORPz/hoG5oNtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763391859;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=EagaKbl39+TJsgt4HDbFikQSX0moQU46XoRqLysDGDc=;
	b=Dp2J9Wrvd7TdKgPRZCD+bP3PTOvILeW4LD4CMDaRBypn3d9GoYw8clBB/rcJqB/g
	g6O5WP9oqdA8EsAr7mZ+JxOg0MqLsmQEM8i6pyTw7c4u5Tvynu+jidt+xO8406ikKxH
	Emakv4e+d8YEKIeEvQUz1xPE/8zUDX089eCh8KN8=
Received: by mx.zohomail.com with SMTPS id 1763391857120684.9254548982545;
	Mon, 17 Nov 2025 07:04:17 -0800 (PST)
Message-ID: <e754c86ff92f2f903c052090938175f186337c32.camel@rong.moe>
Subject: Re: [PATCH v5 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
In-Reply-To: <12f73d80-7e74-4e81-b7d1-2bcb0993bad0@gmx.de>
References: <20251114175927.52533-1-i@rong.moe>
		 <12f73d80-7e74-4e81-b7d1-2bcb0993bad0@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Nov 2025 22:58:58 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Armin,

On Mon, 2025-11-17 at 07:38 +0100, Armin Wolf wrote:
> Am 14.11.25 um 18:59 schrieb Rong Zhang:
>=20
> > Lenovo WMI Other Mode interface also supports querying or setting fan
> > speed RPM. This capability is decribed by LENOVO_CAPABILITY_DATA_00.
> > Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> > cooling fans, including minimum and maximum fan speed RPM.
> >=20
> > This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> > named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> > LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
> >=20
> >   - fanX_enable: enable/disable the fan (tunable)
> >   - fanX_input: current RPM
> >   - fanX_max: maximum RPM
> >   - fanX_min: minimum RPM
> >   - fanX_target: target RPM (tunable)
> >=20
> > LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
> > both binds to lenovo-wmi-other. However, some device does not have
> > LENOVO_FAN_TEST_DATA and its presence is described by
> > LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
> > callback is used to pass the data to lenovo-wmi-other.
> >=20
> > The implementation does not rely on a specific binding sequence. This
> > has been fuzz-tested using:
> >=20
> > 	#!/bin/bash
> >=20
> > 	DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
> > 	CAPDATA_GUIDS=3D(
> > 		$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
> > 	)
> >=20
> > 	b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
> > 	u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
> >=20
> > 	for guid in "${CAPDATA_GUIDS[@]}"; do
> > 		u "$guid"
> > 	done
> >=20
> > 	while read -rsa perm; do
> > 		for guid in "${perm[@]}"; do
> > 			b "$guid"
> > 		done
> > 		sensors | grep -A3 lenovo_wmi_other || true
> > 		for guid in "${perm[@]}"; do
> > 			u "$guid"
> > 		done
> > 	done < <(python3 -c "
> > 	from itertools import permutations
> > 	ps =3D permutations('${CAPDATA_GUIDS[*]}'.split())
> > 	for p in ps: print(' '.join(p))")
> >=20
> > 	for guid in "${CAPDATA_GUIDS[@]}"; do
> > 		b "$guid"
> > 	done
> >=20
> > Tested on ThinkBook 14 G7+ ASP.
>=20
> Sorry for taking a bit to respond to your question regarding the previous
> patch series. Your idea with the submaster seems good to me.

Thanks!

> Your script
> for testing this is a very cool idea, are you OK with me adding  a
> similar script to the tools/wmi/?

Sure ;)

Feel free to add Co-developed-by: Rong Zhang <i@rong.moe> if you
prefer.

> Thanks,
> Armin Wolf

Thanks,
Rong

>=20
> > Changes in v5:
> > - Do not cast pointer to non-pointer or vice versa (thanks kernel test
> >    robot)
> > - Fix missing include (ditto)
> > - Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.m=
oe/
> >=20
> > Changes in v4:
> > - Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
> >    - Add [PATCH v4 6/7], please review & test
> >    - Rework HWMON registration
> >      - Collect fan into from capdata00 and capdata_fan separately
> >      - Use a callback to collect fan info from capdata_fan
> >      - Trigger HWMON registration only if all fan info is collected
> >      - Do not check 0x04050000.supported, implied by the presense of
> >        capdata_fan
> > - Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
> >    please review & test
> > - Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.m=
oe/
> >=20
> > Changes in v3:
> > - Fix grammar (thanks Derek J. Clark)
> > - Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.=
moe/
> >=20
> > Changes in v2:
> > - Add a workaround for ACPI methods that return a 4B buffer for u32
> >    (thanks Armin Wolf)
> > - Fix function documentation (thanks kernel test bot)
> > - Reword documentation (thanks Derek J. Clark)
> > - Squash min/max reporting patch into the initial HWMON one (ditto)
> > - Query 0x04050000 for interface availability (ditto)
> >    - New parameter "expose_all_fans" to skip this check
> > - Enforce min/max RPM constraint on set (ditto)
> >    - New parameter "relax_fan_constraint" to disable this behavior
> >    - Drop parameter "ignore_fan_cap", superseded by the next one
> >    - New parameter "expose_all_fans" to expose fans w/o such data
> > - Assume auto mode on probe (ditto)
> > - Do not register HWMON device if no fan can be exposed
> > - fanX_target: Return -EBUSY instead of raw target value when fan stops
> > - Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.m=
oe/
> >=20
> > Rong Zhang (7):
> >    platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
> >    platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
> >    platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capabilit=
y
> >      Data
> >    platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
> >    platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
> >    platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
> >    platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
> >=20
> >   .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
> >   drivers/platform/x86/lenovo/Kconfig           |   5 +-
> >   drivers/platform/x86/lenovo/Makefile          |   2 +-
> >   drivers/platform/x86/lenovo/wmi-capdata.c     | 808 +++++++++++++++++=
+
> >   drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
> >   drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
> >   drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
> >   drivers/platform/x86/lenovo/wmi-helpers.c     |  22 +-
> >   drivers/platform/x86/lenovo/wmi-other.c       | 511 ++++++++++-
> >   9 files changed, 1426 insertions(+), 357 deletions(-)
> >   create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
> >   create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
> >   delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
> >   delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
> >=20
> >=20
> > base-commit: 6da43bbeb6918164f7287269881a5f861ae09d7e
