Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6840273D6D;
	Sun,  8 Mar 2026 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000157; cv=none; b=ZoDlb+Wr9QTGvww6VTe/CWzbtsG5L8n05MDH0Z5sc4ApPFtllcuh573gZ+Wwo0ceTvuC4+Mz3SyTdHEfVgzbT1ArowfG+3EWugE/cHRpaBmovoMq9Aleo77AuWqj4OvdS3yrTMbnC5VtnODInAQoNcvwiACWWfyJmf4xIepp1r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000157; c=relaxed/simple;
	bh=bonotH+9yJFACbFuIGC1z2Sv7reqxoftLCmkoJI54Q8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sp2XKHjBRG9/vfni2rJM7CX5v5n36+mqCbVrsJcZ1/ZtO/t3elKpyHOGALdWEa+XcKNB0AVGiFvtd9e/qHRQbFeacF73eR4ToFAVcGWNeAryWiUmIfEFFrj2QvmdGEeruaC7SRLLqRhWaHE8Hosa62ip1iCUn5LhS3Pnenc4k2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Kodmkofi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Kodmkofi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000142; x=1773604942; i=w_armin@gmx.de;
	bh=u1b1DWFSi7S/zZRhvoMZc4RTLHA6M4myKG5+INHCkgc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KodmkofiRgPRe3LGssdcY0TrsqbPq7dBNkrXwBrbDJcejXJa2Mxww2J1ACSsyHxU
	 RTslw2DI/CTsBIsT51Nk2mgWAp+qjRrss8iiomkT0NFOXQGIPNesZQ2MxKJamoCQt
	 ZzGzEDQ63cg3X9PhEy3TtZK3PWo4Bwz1660Okn8bkR28fFFcrwrg/c922UAk+8Kh4
	 n+2VEvg+G4Inj8miVd8Wn5Yx/7fQvITTSeVeFZhTonFfI4xXcn/F/h4x+2OqCoPnR
	 mRPDL2t4rhQCKcTcM8L6LiWGspfE0/BKd0U0vK1MfUPVsD754e8N29gL/8kap/zA5
	 5J/jP4wuev9Bp+XY8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSc1L-1w5cmN1FsX-00IsGl; Sun, 08
 Mar 2026 21:02:22 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/9] Convert most Dell WMI drivers to use the new buffer-based API
Date: Sun,  8 Mar 2026 21:01:46 +0100
Message-Id: <20260308200155.118950-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:evV5tHLMdq7D3afl9ipHEvt5Vaps9qsm/OX83pd9nZWpGX7DiXk
 YXlqIfu1oBVY4P1T9qOOp7HQJWmGQakStXKOzWgFcXiHVGqfDCuLAsskjxbfogT089Q3qsB
 nbwQUfl5WcgqoJzmJJBfhg8eRbGozSEFeM7b6UP8aq8sO27137GuwVZtprVWGvX76+rBegn
 w8nq+k2Flpgezbm70O+aw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zNn7OrqBW2o=;3/VPIgCXU/75uqkx3fxx+5lZkyB
 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
 nOzr3ytI=

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
 .../platform/x86/dell/dell-wmi-descriptor.c   |  96 ++++-----
 drivers/platform/x86/dell/dell-wmi-privacy.c  |  78 ++++---
 scripts/mod/file2alias.c                      |  28 ++-
 9 files changed, 317 insertions(+), 276 deletions(-)

=2D-=20
2.39.5

