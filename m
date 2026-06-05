Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23233A7F4B;
	Fri,  5 Jun 2026 20:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693190; cv=none; b=aOrmGKiJLtKfVHav0y6ByyeCyEUTuN9Afc3amLVh5syvKUwk+omC56rVn30EvdUjhf1HsfXzd3e1Iv/tTtQ5Z8RobBbWWjHBroqRvZYZhSf/fsIamYLwN9XN9Z9990WZnuJ8IUwPpeJwpAUUiQFCDXflv5V/ZUyjQFmscdyplR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693190; c=relaxed/simple;
	bh=LfPiZ0ovEzir7CSrildFF4UclA/EyUka6tGqVizL1gg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qcJPvNOYR/cIrKtOXbTHdDIAfl2DU5bR1HSLtxwoxIf9vmh09ObN8F/krLqIuSS7dXG3dv7b5liHDTzGukbdVlURCNr128GMGXQMEUfxvUTNY6erQ+wGMIQfPtmlYO++RtDBo/kJpKXWPL26qWLZ3i+c3l/yAuTub9bE++1Mxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aYTrmrFd; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aYTrmrFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693180; x=1781297980; i=w_armin@gmx.de;
	bh=iBbowt+FNXdT9YNT1F4yBxlWeGw08I3oe9cEp3vQcC8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aYTrmrFdGct7UDLDfJHWY3siGVoWsxY1xGXnVkr+gPYgC+MR5eLWZihRPvcxIiYH
	 8C4mA5/VLCOk0rVdwiaFbMK9mH9IBnNqs4xlydb2URZis/vySe/m6fRkjMpy7/EuO
	 TG8m+9DitKWMJHBQm1QuPzxw3YfVRELpFErZ3vZOuYZ7ST+JAMwkcEp8D5rUId+0g
	 4Lql+UhT3TyYTC5H268hMZ/zAqvlhhI0gfJNrHEKif5SzItNKVS8ejTMX97PFqX+E
	 fMckKVwdn8h6+Km3KymbH2lT95WRWN70gXmiEMUenqc94egCP1J6NAfce98MC+w8b
	 +qcmhn/J1MakayqoBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Yv-1xQAZD37ml-00udri; Fri, 05
 Jun 2026 22:59:40 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v5 0/9] Convert most Dell WMI drivers to use the new buffer-based API
Date: Fri,  5 Jun 2026 22:59:28 +0200
Message-Id: <20260605205937.530897-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LcOZgoegUEWgHfg1IqxZ7UlfCrbLtjtGKsmviTQZXblIPzVja9Q
 rCbDxlPSkPdoPJc/Ko0cfLnh5ODJEJ9kq2Q/bQjP4mE/S0VglId8u5a22Rp8a3pFnjwsXbH
 dZiBhNLQ4aPchJhegmGSVJ6Bc8GYa2UA/hERWrcnQYbDTiWMDkYcK4zNEc/pjRAGJl85VPA
 NgvguAxoCBeNrdd5aqV6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YCsdbAtqdSc=;xkrjUgteez6nBUPOS19sZdNibjC
 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
 T1NgWhNrKbEq363HnWGoFqvvYUQ=

The new buffer-based WMI API improves the compatibility between
different ACPI firmware implementations by performing marshalling/
unmarshalling of WMI buffers like the original Windows driver.

Convert most Dell WMI drivers to use this new API. This also
removes all ACPI-related code from those drivers because the
new buffer-based WMI API uses abstract WMI buffer objects instead
of ACPI objects.

All drivers have been tested on a Dell Inspiron 3505 and appear
to work normally.

The last three patches contain some misc. cleanups for the WMI
driver core itself. The most important change is a fix for modprobe
to verify any WMI GUID strings from WMI drivers and convert them
to uppercase if necessary. This should fix autoloading for WMI
drivers that use WMI GUID strings with lowercase letters.

The whole series should be applied on the platform drivers tree.

Changes since v4:
- fix issues found by Sashiko review

Changes since v3:
- rework patches to work with the revised WMI API
- use __free() for cleanup
- add missing includes

Changes since v2:
- add Acked-by tag from Guenter
- rework buffer parsing in dell-wmi-descriptor as suggested by Gergo

Changes since v1:
- do not perform pointer arithmetic on void pointers in dell-smm-hwmon

Armin Wolf (9):
  platform/x86: dell-descriptor: Use new buffer-based WMI API
  platform/x86: dell-privacy: Use new buffer-based WMI API
  platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
  platform/x86: dell-wmi-base: Use new buffer-based WMI API
  platform/x86: dell-ddv: Use new buffer-based WMI API
  hwmon: (dell-smm) Use new buffer-based WMI API
  platform/wmi: Make wmi_bus_class const
  platform/wmi: Make sysfs attributes const
  modpost: Handle malformed WMI GUID strings

 .../wmi/driver-development-guide.rst          |   2 +-
 drivers/hwmon/dell-smm-hwmon.c                |  47 ++---
 drivers/platform/wmi/core.c                   |  31 +--
 drivers/platform/x86/dell/dell-smbios-wmi.c   |  40 ++--
 drivers/platform/x86/dell/dell-wmi-base.c     |  70 +++----
 drivers/platform/x86/dell/dell-wmi-ddv.c      | 181 +++++++++---------
 .../platform/x86/dell/dell-wmi-descriptor.c   | 108 +++++------
 drivers/platform/x86/dell/dell-wmi-privacy.c  |  77 ++++----
 scripts/mod/file2alias.c                      |  28 ++-
 9 files changed, 284 insertions(+), 300 deletions(-)

=2D-=20
2.39.5

