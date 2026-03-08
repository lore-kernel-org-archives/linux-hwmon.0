Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253AE1DF73A;
	Sun,  8 Mar 2026 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929555; cv=none; b=QbxcvskCSGcAQ4rqfMVOcWOYZyzybqd3CayPI5LbqIFkCj8qAQyv0m1EbsM6i4EsbViKAvxgqpuJYjiW208fe45bfcTLNAXi5a8VBvAjQLm0FCHZvRRi1UW7KdHyTuIfX5f1fOEp/vW8Y7ori8dCghc1afh7zbMHnp9fjBJLb5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929555; c=relaxed/simple;
	bh=4bzICzmZOo+7SwqDhYlO/23u786m4otIgCUo7y/qF3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cGR2EbO/L/ECu8QWTvNu+I/17PaiBizZI6qIuEcsU8IZhSdOi8RXsr17vNrgoJWpl3vgHLGNF6ZylaL8ZppBo/qK1dwDjPbeDn7Eg1TYouF1moRc7cES9PKE9KL4YuwLtSNa9eYad/J91Mf3trjMUok5HOha+wqn5tJDcP+Z9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nmYvQDhp; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nmYvQDhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929528; x=1773534328; i=w_armin@gmx.de;
	bh=bzjB2sztaBNOWUBbO/XWnKyy2KCALsGBP093MtXNjro=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nmYvQDhpXByej2EkCUVr34+n4/LsAhOC9wOku3hxfzwgRYg3jL954uBD5DfI1sGW
	 gVgyF3R02WdBqFrPMcbU6QKc/nSYBW6Fyi7NfTnUA9TK45L11OffIRNe8s2p8JOtG
	 jddSn+k98WklDYICRahlE/KJdadMpY9WP5uWPHEMDviGNFS0IEIQJ+0gnBkXdEXHC
	 x0dELQBAeKNbmHpQ3uYE4fpyeL78f/CShehx+5pOCkLI9yPM1b7n/VlX+feGttSAn
	 AWjD3hPYQqyXK+W1RGk6JxxVqBjeJfCmcr73w9SfHaS6a5mCeGda87lSMLY3YzPc5
	 3rYwBC9V+vypq+ExEw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7R1J-1vZraX28C5-00tWhB; Sun, 08
 Mar 2026 01:25:28 +0100
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
Subject: [PATCH 0/9] Convert most Dell WMI drivers to use the new buffer-based API
Date: Sun,  8 Mar 2026 01:25:13 +0100
Message-Id: <20260308002522.4185-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sxmtJfK0/SeN8ltILdeJ34HYwr7NeVnvU1mRZeqqiqXtmMNxpc7
 nSmza5/VRR9kGn3BSYKisQ0TC5GSnNSO7+5N4mhufysXhuLAYVzWN0dePtUEX4fLuQA8vOv
 OxqtpxKDgoxx8f/C9afdRjTpSAz8I6ZxuE7v0TwADvt4K/uSvxllKWK0ltwM+zvpxJui34O
 IJ5B+Bxg0A0IACLueFZHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eHV347mL1HI=;XJZu0LciPBtdVYCmUcL8rwcMPZr
 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
 bBhECbFi18udnUk5PLuwjgkHK5Faf

The new buffer-based WMI API improves the compatibility between
different ACPI firmware implementations by performing marshalling/
unmarshalling of WMI buffers like the original Windows driver.

Convert most Dell WMI drivers to use this new API. This also
removes all ACPI-related code from most drivers because the
new buffer-based WMI API uses abstract WMI buffer objects instead
of ACPI objects.

All drivers have been tested on a Dell Inspiron 3505 and appear
to work normally.

The last three patches contain some misc. cleanups for the WMI
driver core itself. The most important change is a fix for modprobe
to verify any WMI GUID strings from WMI drivers and convert them
to uppercase if necessary. This should fix autoloading for WMI
drivers that use WMI GUID strings with lowercase letters.

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

