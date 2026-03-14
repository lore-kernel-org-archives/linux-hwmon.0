Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA91D5151;
	Sat, 14 Mar 2026 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510784; cv=none; b=XHhXg/xzUEeZmVD7HgIBv4c7x5OKtt30/IQZzj0Mwi7xJU1bAYdEUy/AtQxEJzjsf0yMW2VTPrlAxdSDoWMJFXnG9dAcnemtpxyGZtgHw1QApeP3RNMvvH+zyP3IevMTBBOD/OvE7eZjrIJ/IitI5uBwjbvbtL+Ufh4aOkZ6B4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510784; c=relaxed/simple;
	bh=j5I6aaSsr+G4DwV+qZu5y3TtjyGhJiXsQz1wR/PNt24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cEHjnTvxmpHcfwBsjqzq2u7drw4V9KwrwtqXfc0oJZyCo5lCfkIADsQIU8RjDwmLX9DmX3MEvpf/bY/J6gfAT1xo+lUWu8DArCYT+OUteUbvFQcpjvKVvjVuZyUDbxGKapiPsmsoZIraGsN3tS++qag5BWIcV9/Kfwf11EuNcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Zdd7ZHwN; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Zdd7ZHwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510780; x=1774115580; i=w_armin@gmx.de;
	bh=Y0tXdjgalFalA/fPlK6N5O8wW92i4mVjqnMSvgH2UHg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Zdd7ZHwN5/+GGeW7uGUdvH1HyH5YIDZGUjzYwCALwVJSqJkU6+QOOfBu7OnGxc3W
	 m681w9w/lQSHCjcqtWK1NhLbK78hmQp+k+166Xj0IlclVitrS/FblkDG/TLtAxUt5
	 Z1Ne+RHn45jxS/QHXRq3xsKNkJZqveEOb1g9f/MfOBL1ZgdaCbHdPKj47OjWhrhuR
	 hDssOq3mfOuS8Exh76pUuw+RP7OYIl977B9I4KGZgB7FGUgf1dA72HxZ+OU9ZVhzS
	 +DiQzEfoeAN0Khtefet7y0C6RinZwKgqIX1V0++MwY9icH65Ed3LdNk8OWofraJDL
	 zMFfE2YJ0ptQSPlJXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1vviXJ0k9l-004miw; Sat, 14
 Mar 2026 18:53:00 +0100
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
Subject: [PATCH v3 0/9] Convert most Dell WMI drivers to use the new buffer-based API
Date: Sat, 14 Mar 2026 18:52:40 +0100
Message-Id: <20260314175249.16040-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gfy/OeXninda8V8OPkMh1cAZt++3XZD25RbUgka8NWtD3LaYbvu
 iPXCRbI080jlSUk45ajw9vzo4oqNm7eDWB5lakAaD8ByKRPtiDFEOJOK8iyESoV8TWe123y
 hAbfN4TFbxcVXIjNoslL56axNAhafe9rDpqC4E3LBb7vS/0ZUxWuKsoFUbuv4R7I1MBLEVM
 jjnkgcXWqxZ0ZESYEk2og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9KDpMXPJbAo=;kcKwSdTrgK+bIqoLaPTDur8HBeT
 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

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
 drivers/platform/wmi/core.c                   |  34 +--
 drivers/platform/x86/dell/dell-smbios-wmi.c   |  46 +++--
 drivers/platform/x86/dell/dell-wmi-base.c     |  68 +++---
 drivers/platform/x86/dell/dell-wmi-ddv.c      | 194 ++++++++++--------
 .../platform/x86/dell/dell-wmi-descriptor.c   |  94 ++++-----
 drivers/platform/x86/dell/dell-wmi-privacy.c  |  78 ++++---
 scripts/mod/file2alias.c                      |  28 ++-
 9 files changed, 315 insertions(+), 276 deletions(-)

=2D-=20
2.39.5

