Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4B3469E3;
	Fri, 14 Nov 2025 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763143204; cv=pass; b=Ftx7neuavPiPmRWxjI83GfQ76iH+YBaTd/5rsVvA3mocfbtj8QvUxfUdbF1Mi5lDM1v4qBhafJ2Og9yuDYalDwfzMe/6QKo0YZs7Qn3bmKea0srUWZqk8blNK6anNw1U5qLzrVBW15HXnLkRIyUs5Q464rYuS6BYERvxyJNKeNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763143204; c=relaxed/simple;
	bh=qcX4TEGnKQsEgEl6rKyUtFhiP+TiTSQ0w1sGRY+19ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmW3oEf0vISTCqqCvDvoubgEUUn2ROwKu++j/KPDPSNMLfE9JVCBgBmUkLs1SENAWXMaatlbmFH8SOgArQb/UwUfbrm9j6SyzIobP8kztT6GL+99sSqNRfnKCsRTqRir/CKZ0wUhELfXWnEDegVcB4ZDR7j824Ck4VIFhmkilJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=1l7h7Upc; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="1l7h7Upc"
ARC-Seal: i=1; a=rsa-sha256; t=1763143176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ve2DDZipfJqhztDcioRXWh4+6UkK1q+Y2lYi7wIZf7z3N8tl++Zx3rU76MkfIUjYM+PC58YTCLQGgQAeR2Hc2zFSiKXxhaH4OW8qs5WU8ROAlqFthHTjxa/ZHyyOUvmEH1Z3uKhRDRiweG4H+twO1kVxezgj8ziljqwaDv93Vrg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763143176; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2mPu4kuCypX+SWycXpmahiDL2HkmwQCNzA5l6i1Pu+E=; 
	b=XqmWH6DRrv759aVfONPVzvzN0mtcLk07w1tCK5cfEucxpUPGNMsGlo9BrVrVpNqce5tGF5mK7HCnhT9gX8qxdp8AyjpCb1i+Bq4jChCNz4UaRfgXFI4cE806gIN+tXAiLXKGLW4XRm4U19nMlUN36LPD+5WkIJyOBAUU0lO+keY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763143176;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2mPu4kuCypX+SWycXpmahiDL2HkmwQCNzA5l6i1Pu+E=;
	b=1l7h7Upcz27SlW0z5cCZ00rNHs5JbuN/NF9AbMUDripiBDWaldIpIOZele+GLQS3
	zLayxZvsgKGRKJEySZQQqFlY8291M/FMc4UdeUNenNljFgf/WK92tjV4sfdhvTW39Ws
	TdNhzVB2/SNobIbEG+hfGZBCfs6BoqirdN70ay+M=
Received: by mx.zohomail.com with SMTPS id 1763143173578973.3703228044657;
	Fri, 14 Nov 2025 09:59:33 -0800 (PST)
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
Subject: [PATCH v5 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add HWMON for fan speed
Date: Sat, 15 Nov 2025 01:59:12 +0800
Message-ID: <20251114175927.52533-1-i@rong.moe>
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

Changes in v5:
- Do not cast pointer to non-pointer or vice versa (thanks kernel test
  robot)
- Fix missing include (ditto)
- Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.moe/

Changes in v4:
- Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
  - Add [PATCH v4 6/7], please review & test
  - Rework HWMON registration
    - Collect fan into from capdata00 and capdata_fan separately
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
 drivers/platform/x86/lenovo/wmi-capdata.c     | 808 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
 drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
 drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
 drivers/platform/x86/lenovo/wmi-helpers.c     |  22 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 511 ++++++++++-
 9 files changed, 1426 insertions(+), 357 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h


base-commit: 6da43bbeb6918164f7287269881a5f861ae09d7e
-- 
2.51.0

