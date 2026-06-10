Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13B64A3405;
	Wed, 10 Jun 2026 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123741; cv=none; b=a4Jku33EsIOl5lpzPm+ns0usCfq3uBiuG7jUZ8N2UK6Qh9HXcFciFkZfqlFjEldIRIJvASC6cQ6lYYZazLZA8dX0xRYsSc/9ac/EF7sg6HtESSrSMUYgTzQH5oieASdGhOuFt1gY0ro/aSU8h5tocezv8oj3AhhngIkkLAUovY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123741; c=relaxed/simple;
	bh=jZYfeHqnSHJJPWZ1R6pRFLGcXkSgGLYmtFfjN+XYexQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kUZFTsF4vUNSenJg/wLUa8Hl1NuAzHNjl+QeIKUQJ3vGDTP2TtPPSTyYbFaIO8fRj70SzXGEa0KDDOAPEa+9wL8BVnAFA6fNNesIer0anmhMmYQsfAO98hkx5GKSe+nnDZNFNotNqWj7g5aHPbkvgaOl6VNeIZkc7/1R7Ju5PbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uAuCLDWV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uAuCLDWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123701; x=1781728501; i=w_armin@gmx.de;
	bh=fvSLKMprWZ6A6b02GjTbLVMSvzUOgYx3tXRoQDZAYqE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uAuCLDWV+nEDMGKWpzSoz8lmq01K26Up+jclxHWMMSryXR/OhGqvLtWG7Gv55xwP
	 huAEWI3Up4MY+drdaCo4TYnmvUMYzSMYXnqCQAEuClfpKuB9snJk22dt+/1SXhAk3
	 CyxlILmmQhXX/w+Gq6y0YwKUk1pbYPem6Ak4aXiDsMHD1kD3dZ7HAXLMNeuIbpPUh
	 9O5ENM9Sl9Q3H5EniyTKuF9w5kS7E9z8eGkroIsMxYDSR2mfBwOXAA9e4GJFu8Vk6
	 MbddxUHa4qdifexaoayl6jaK4sitQ9iGAKyfad8jY4wTY9PrOuB9DoboPl3lArTTB
	 AtjmDBrRWDJGI6l5Lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1wofVV2LKb-00Tb1g; Wed, 10
 Jun 2026 22:35:01 +0200
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
Subject: [PATCH v6 0/9] Convert most Dell WMI drivers to use the new buffer-based API
Date: Wed, 10 Jun 2026 22:34:44 +0200
Message-Id: <20260610203453.816254-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uvZmgJGT00YnzULuYUfyovS3v8llLHNtaPF0nj14pngo89XDXgk
 /0AmauzHc1i23Nm1L3/EUygHbdUJkiBLn3T3YBcZ9lF+QAzdi4DucsWpy1IP8sZ9g+3CuoH
 0DPLj+sW5yh6exhqSfR/WwdOkR5rfxkgtExNgz4DbqWDjYeSEcAxExEbQf8hAxpVakGAeya
 6Y5ep288z/6Ps0XP1KqmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kaear0x3S3U=;v9JVlmR/x79FErD76eJMVReUZl6
 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
 nEepFvxYlf6QYl3Cd/lnq9nQipk=

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

Changes since v5:
- mark pseudo-strings in dell-wmi-descriptor as __nonstring
- rework placement of variables being used with __free()
- use __free() in dell-smm-hwmon
- keep original logic in dell-wmi-base
- add Reviewed-by tags

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
 drivers/hwmon/dell-smm-hwmon.c                |  49 ++---
 drivers/platform/wmi/core.c                   |  31 +--
 drivers/platform/x86/dell/dell-smbios-wmi.c   |  40 ++--
 drivers/platform/x86/dell/dell-wmi-base.c     |  60 +++---
 drivers/platform/x86/dell/dell-wmi-ddv.c      | 179 +++++++++---------
 .../platform/x86/dell/dell-wmi-descriptor.c   | 108 +++++------
 drivers/platform/x86/dell/dell-wmi-privacy.c  |  77 ++++----
 scripts/mod/file2alias.c                      |  28 ++-
 9 files changed, 276 insertions(+), 298 deletions(-)

=2D-=20
2.39.5

