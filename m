Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077A350A25;
	Tue, 13 Jan 2026 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325329; cv=pass; b=j1h7BxcLB3SXiRh3j1Cg3MQCt+QZmZSEIb5Z2t2RP4yNfrheSpXMrkg3cB+7kaUsb/m6Hb+FMMIfGkd0wIH8oxKIkf0zw0yUuyNBiSug3+O8J73kYJq1IFdgnPLhiM7ZFcX+d0RG4W2CjewGnL5gNzcxBHy1f1hlzlOAxY2FxCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325329; c=relaxed/simple;
	bh=uNzZ+TINXWUy+7WrZcBlZfn42CQZ3Jn53WFVsoNislc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZXv++XIyXXWwm175twbD+x1cH4owKRC4mBRRxTGk2CHt613MR4nNCdTlWhEkXdWv9YJKOnCd3VFBtWAI3lx1tvsgoH6hWTvWh4blM0qM+b/CkXWpNHH7BDGQEwbPB3QQ3CCIT0/vXv+urWVk/xoxN21ElNX4cau5eg1wrj6PEvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WUahsqpd; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WUahsqpd"
ARC-Seal: i=1; a=rsa-sha256; t=1768325305; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YVgjqVf4HV7Jv3hKjTUxSFI95kTmhMeCeiQQt5eb3+mWAY1KIRhodFOuL1A+VntIBJxUNBUWYmLC6u3SkqWBUf0Mo5JswqLe0e+rT3tAT/sg9J5UAttnVZiO2zV1nclN7Q+i9U1jdThs6UpmYl+QWUwkE8Z9NHDXq935V6iLgZk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768325305; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xcF266Z9sn8Z2eRNPTe5ZzZyYe2SvfLkQdIgIy0ZECw=; 
	b=YwxJoP3atUMs3IVl798kZRryteUtyRuScxgrqrdXRAdbZiDV3jLglDJ4senYH/wbj2Fvwb/NSbvDB2P0vZIlYKMUjUMh5SMVzr605je8u+28OIosKrAh5a9URO6hIGNiVm5wM4Rd0+eal4dcs5v0BnJVmHQ8HjQxTnj/sYM8LCQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768325305;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xcF266Z9sn8Z2eRNPTe5ZzZyYe2SvfLkQdIgIy0ZECw=;
	b=WUahsqpdELMTrOZichEGqdw+2S6LhJ5WXAy51bnnVPPH/77loVM2jYC8Nw+CZdCn
	v2oip4qoAbEgYa6hSWRSTHUNgDXYFFCI4Vmfgvyy3BtZ7zjB30R1IkxFarj8hQMJYnF
	DLybXiqViP8TbO0LtWiksc03TXeyMAfWJY3WG8As=
Received: by mx.zohomail.com with SMTPS id 1768325302917436.6783718204408;
	Tue, 13 Jan 2026 09:28:22 -0800 (PST)
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
Subject: [PATCH v8 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add HWMON for fan speed
Date: Wed, 14 Jan 2026 01:28:06 +0800
Message-ID: <20260113172817.393856-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Lenovo WMI Other Mode interface also supports querying or setting fan
speed RPM. This capability is described by LENOVO_CAPABILITY_DATA_00.
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
- To get rid of queries for the presence of WMI GUIDs
- The notifier framework cannot cleanly connect capdata_fan to
  lenovo-wmi-other without introducing assumptions on probing sequence

capdata00 is registered as a component and a sub-master on probe,
instead of chaining the registrations in one's bind callback. This is
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

Changes in v8:
- Refactor some statements to improve readability (thanks Ilpo Järvinen)
- Use more commonly used errno (ditto)
- Fix missing #include (ditto)
- Link to v7: https://lore.kernel.org/r/20251125194959.157524-1-i@rong.moe/

Changes in v7:
- Fix missing #include (thanks Ilpo Järvinen)
- Fix formatting issues (ditto)
- dev_dbg() instead of dev_info() on probe success (ditto)
- Rearrange to drop some gotos (ditto)
- Move the declarations of __free()-managed variables to where they are
  assigned (ditto)
- Improve the readability of struct definition and error paths (ditto)
- Prevent back-and-forth changes (ditto)
- Fix mistakenly inverted boundary check
- Emit unaligned access to Fan Test Data's WMI block
- Properly calculate array index when we truncate Fan Test Data
- Fix typo
- Link to v6: https://lore.kernel.org/r/20251122184522.18677-1-i@rong.moe/

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
    - Do not check 0x04050000.supported, implied by the presence of
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
 drivers/platform/x86/lenovo/wmi-capdata.c     | 813 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
 drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
 drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
 drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 517 ++++++++++-
 9 files changed, 1436 insertions(+), 357 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h


base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
-- 
2.51.0

