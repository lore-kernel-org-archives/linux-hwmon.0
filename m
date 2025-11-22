Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FAA125D0;
	Sat, 22 Nov 2025 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763837160; cv=pass; b=NxrGy7t0saZ6DFuTKx9dEyhdnmbJ6QHwERcLJ6zseFsaX15Vqt+PPuTxMebpVJk5wm11dF8GLqPc5GMWNOY15BL/1W4XjCV43UJKwDRYCFu4Bkppftz3TQA1o9WMWm4aOcHsJNbjV7HaKTMI0SRt9MoQMuB3nyFD5fdGxUI6ycE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763837160; c=relaxed/simple;
	bh=5bAtMoNNl77zppEMXMjcAvLIOO4/AO13H+U7tSiVvo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6ix0JDyD+lkluyLiIcZ3kKh9Nb/05YTFNLzN6Wd4YWN7sGAAFs/9KT7pP6jI+Ldf+2KJnrFE5PqKTLWATDTfjBiWqYU+/JppKp6lzB8Y4FslXW2GKjGeGm6wxqDJqKj2pIaF+zNJgnJmoWzWjBI9ObCEIofK/aTYnX3HFp9zHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=EQL51Ss1; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="EQL51Ss1"
ARC-Seal: i=1; a=rsa-sha256; t=1763837131; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D0r/3/kZrJ/h2djnkOv9q8IM7Cn9503VvbkCVdAWSkkIJ0Cz0n5o+6Z7+DWJ/VpRbshpZ9BUXfg+xFm8dcslRwtHbqFJIyfU3maLBR3/S+KGm1Wbrm427lBRODj2XDBUw8bXQutC9GIrOmSAhvAdhyRlDulUuphVpEPqexL4aeA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763837131; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s7h2m49EgPm7KM4Zv7fAkk1blP6UmUi4ivdOzCAYGoc=; 
	b=LekzQSw2oKF1jW5S2sMZhmHxa6FIYahFwHp/magjYhei/ZbwEIK+4Ran4Yw6X5JgjzfSWleIpASMyj4O8nbXhj5CCzYVX5jSUe5trcw7UkQQ725OdAZkmZt7f7bNtjCRFWyj1Liv1Pj/gEiGbTCgZ+Qu1TqLhHDBhrkUFshYVv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763837131;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=s7h2m49EgPm7KM4Zv7fAkk1blP6UmUi4ivdOzCAYGoc=;
	b=EQL51Ss1XPhK4SDzkncfWdFgzpdEGnikXyWp2LcDmWtyaMrvd1g1aiKuf+VZlc33
	W28O8GnQY0FomXOtRWxCXwd8JaOeNkIwfVNIdpnknajf44CAauJgH2Z00tHjoMbgbIJ
	Q30NMXP4BJ0anaPrvgryteDeNF+6uYjtCdNOTS1A=
Received: by mx.zohomail.com with SMTPS id 176383712834292.31666926543562;
	Sat, 22 Nov 2025 10:45:28 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v6 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add HWMON for fan speed
Date: Sun, 23 Nov 2025 02:44:40 +0800
Message-ID: <20251122184522.18677-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Lenovo WMI Other Mode interface also supports querying or setting fan
speed RPM. This capability is decribed by LENOVO_CAPABILITY_DATA_00.
Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
cooling fans, including minimum and maximum fan speed RPM.

This patchset turns lenovo-wmi-capdata01 into a unified driver (now
named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:

 - fanX_enable: enable/disable the fan (tunable)
 - fanX_input: current RPM
 - fanX_max: maximum RPM
 - fanX_min: minimum RPM
 - fanX_target: target RPM (tunable)

LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
both binds to lenovo-wmi-other. However, some device does not have
LENOVO_FAN_TEST_DATA and its presence is described by
LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
callback is used to pass the data to lenovo-wmi-other.

Summarizing this scheme:

        lenovo-wmi-other <-> capdata00 <-> capdata_fan
        |- master            |- component
                             |- sub-master
                                           |- sub-component

The callback will be called once both the master and the sub-component
are bound to the sub-master (component).

This scheme is essential to solve these issues:
- The component framework only supports one aggregation per master
- A binding is only established until all components are found
- The Fan Test Data interface may be missing on some devices
- To get rid of queries for the presense of WMI GUIDs

capdata00 is registered as a component and a sub-master on probe,
instead of chaining the registerations in one's bind callback. This is
because calling (un)registration methods of the component framework
causes deadlock in (un)bind callbacks, i.e., it's impossible to register
capdata00 as a sub-master/component in its component/sub-master bind
callback, and vice versa.

The implementation does not rely on a specific binding sequence. This
has been fuzz-tested using:

	#!/bin/bash

	DRV_DIR=/sys/bus/wmi/drivers/lenovo_wmi_cd
	CAPDATA_GUIDS=(
		$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
	)

	b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
	u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }

	for guid in "${CAPDATA_GUIDS[@]}"; do
		u "$guid"
	done

	while read -rsa perm; do
		for guid in "${perm[@]}"; do
			b "$guid"
		done
		sensors | grep -A3 lenovo_wmi_other || true
		for guid in "${perm[@]}"; do
			u "$guid"
		done
	done < <(python3 -c "
	from itertools import permutations
	ps = permutations('${CAPDATA_GUIDS[*]}'.split())
	for p in ps: print(' '.join(p))")

	for guid in "${CAPDATA_GUIDS[@]}"; do
		b "$guid"
	done

Tested on ThinkBook 14 G7+ ASP.

Changes in v6:
- Fix mistaken error paths
- Link to v5: https://lore.kernel.org/r/20251114175927.52533-1-i@rong.moe/

Changes in v5:
- Do not cast pointer to non-pointer or vice versa (thanks kernel test
  robot)
- Fix missing include (ditto)
- Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.moe/

Changes in v4:
- Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
  - Add [PATCH v4 6/7], please review & test
    - Check 0x04050000.supported and bind capdata_fan to capdata00
  - Rework HWMON registration
    - Collect fan info from capdata00 and capdata_fan separately
    - Use a callback to collect fan info from capdata_fan
    - Trigger HWMON registration only if all fan info is collected
    - Do not check 0x04050000.supported, implied by the presense of
      capdata_fan
- Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
  please review & test
- Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.moe/

Changes in v3:
- Fix grammar (thanks Derek J. Clark)
- Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.moe/

Changes in v2:
- Add a workaround for ACPI methods that return a 4B buffer for u32
  (thanks Armin Wolf)
- Fix function documentation (thanks kernel test bot)
- Reword documentation (thanks Derek J. Clark)
- Squash min/max reporting patch into the initial HWMON one (ditto)
- Query 0x04050000 for interface availability (ditto)
  - New parameter "expose_all_fans" to skip this check
- Enforce min/max RPM constraint on set (ditto)
  - New parameter "relax_fan_constraint" to disable this behavior
  - Drop parameter "ignore_fan_cap", superseded by the next one
  - New parameter "expose_all_fans" to expose fans w/o such data
- Assume auto mode on probe (ditto)
- Do not register HWMON device if no fan can be exposed
- fanX_target: Return -EBUSY instead of raw target value when fan stops
- Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.moe/

Rong Zhang (7):
  platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
  platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
  platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
    Data
  platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
  platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
  platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
  platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning

 .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
 drivers/platform/x86/lenovo/Kconfig           |   5 +-
 drivers/platform/x86/lenovo/Makefile          |   2 +-
 drivers/platform/x86/lenovo/wmi-capdata.c     | 811 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
 drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
 drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
 drivers/platform/x86/lenovo/wmi-helpers.c     |  22 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 511 ++++++++++-
 9 files changed, 1429 insertions(+), 357 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h


base-commit: 2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
-- 
2.51.0

