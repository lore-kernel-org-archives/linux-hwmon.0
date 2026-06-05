Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92A364943;
	Fri,  5 Jun 2026 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683283; cv=none; b=CE8c1vR0/xWDD94TauOpkA5jklHPeBl0xavJMs2ti6UT+B/ljl0DX3+hgiKHoSQt8Ihsfdra86w6S8vMXQna+42cS/MoMWEoPEhfR9MUKMGzs2f6Ulj1vj1M4rzmrCNYz8jPwF75svkgJHuBh+7qqDzGP6WI2NMZFK9IR/ZUHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683283; c=relaxed/simple;
	bh=QYSMKxAi/8QiAVcF8KEjfh1PlOYOpv7LSYA2R4fKwXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KMAAa5RDcRc7toehEtbkibvw5Wu7n9H3IaYf4tJTV5iAWQOC4WIf04+GmqxjoMHww1qNOLNV9oK3wufz2jDsuKkRDubBubT1hJBU7/VltMsan2fx1OozyqfN76nMv68ckHZDJ21rIgGqjAxPe8UHLm+/mU6Q+pF93Zb62om5OP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QJW1AwVl; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QJW1AwVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683279; x=1781288079; i=w_armin@gmx.de;
	bh=mgaJvxwWMIu9moi7yWPqMjZwliVnyK1XeJ6Mxpb0n20=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QJW1AwVlaBM+bpXynqO/piQWspK6qmCdOWU4G5LdeF3yoAmPJQjJnNsEapVJvVFt
	 g62nlzBQzryLrQVC1eDJ5/eIU2bx0wSqOwZ0Dd19ThAkJMtCIMKBEFClbh0AbsUA8
	 a1yXBlOBpxOMBAGr6TDv0BZ7O0PJPTu8UqSX/qY0QlXNG7r3aE5Yu4wtyUDSUZulu
	 g7NzhYNslFX6cwahx0VULag0by1CZjVVFG833uU8BqHXSrplXFtoqr9CV9VDT3j9S
	 3oxJdR5iTx4vsBQTGD9u0QMtuG6mmte0IHnpX4f1EBojnDwYzDHj449O8stBvEzPx
	 iTh+5f6pq7D35hU6Uw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1wpROZ0P3g-00VhUR; Fri, 05
 Jun 2026 20:14:39 +0200
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
Subject: [PATCH v4 0/9] Convert most Dell WMI drivers to use the new buffer-based API
Date: Fri,  5 Jun 2026 20:14:24 +0200
Message-Id: <20260605181433.188847-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cMXF+ZcnjIzFYR01WDcjYwpw3i8G+XKe0jxpmkAi3CUpm4XtKYw
 tQMZK6Xg49DRvlNRAnDgy74hfbNQPXJcfnk59+Grx3pfNFe3dUg5WTWAB6fp1GHNaMJmtAP
 1zj9tv+N0fOLYlFokEqG0IfHR8urO0YJkR3ZIOPVfiglgMqkq48Z7pR2JsWYZ5Q90m+KJTo
 RK3Tr6in1J4N8HaO8zNhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FoRr5jNkcfw=;BDD/E2ohoKsETn7zcFbam1BJTzL
 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
 4soD4RF/uEYOh99bnep7m5d5Fao=

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

