Received: from out-2uec-a122.jellyfish.systems (out-2uec-a122.jellyfish.systems [63.250.43.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F328353EC0
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128040; cv=none; b=qbZvgx4yriX78BdVNkGDFYhVd32oRwUuuS/xts42kQRgh9V/IW7qYReXMlICuTUphuKw3bcXqze3harWtaNfvsrmM0CKiai7xy1vgEseaUifOWfLWEVa56oGjnPCZSXZN5xFJBKdrNPFXvRHkGkrcyczgdTl/cuvuubgTyn4Q6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128040; c=relaxed/simple;
	bh=l7nmUuWJjOffCPJDMvHFvCPTSGs2wiisRvGHPT+sZF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FO2nrau3AVaaYxlGS8Pu/uQKOHPeWDpP1v9uebmEbhugPCeQUy3SnbC58bFOgkQmuejACXDmoZHPZftTqC8uyeHYL6Yl+OiPnk170qlXSzZdKoKRtY+IGdpUyTBJpfqgOr0QLr0s8wevG/3BX9zK/M3B+NlnB4RZg/tD5gRI0ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com; spf=pass smtp.mailfrom=effective-light.com; arc=none smtp.client-ip=63.250.43.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=effective-light.com
Received: from mail.privateemail.com (unknown [174.89.145.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hyRPt75f1zyNV;
	Sun, 04 Oct 2026 15:33:54 +0000 (UTC)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH 0/2] hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R
Date: Sun,  4 Oct 2026 11:32:48 -0400
Message-ID: <20261004153250.516730-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: someguy@effective-light.com

Recent MSI boards (customer ID 0x20d) use an NCT6687D-R, whose fan
control registers differ from the ones used on Mitac boards, the only
boards for which the driver supports fan control so far. In addition,
the system fans of these boards are connected to channels 10-15, whose
duty cycle the driver does not report.

This series adds fan control support for these boards, based on the
register map reverse engineered by the LibreHardwareMonitor project [1],
which uses it on MSI 800-series boards.

Patch 1 reports the duty cycle of the system fans, and patch 2 adds fan
control support for the CPU, pump and system fan headers. 

Tested on an MSI PRO B850-P WIFI (MS-7E56, BIOS 2.A93, NCT6687D EC
firmware version 0.0 build 04/18/25), on top of kernel v7.3-rc5. Fan
control is available on pwm1, pwm2 and pwm13 to pwm16 on this board.

[1] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor/pull/2294

Hamza Mahfooz (2):
  hwmon: (nct6683) Report the duty cycle of NCT6687D-R system fans
  hwmon: (nct6683) Add fan control support for MSI boards with
    NCT6687D-R

 Documentation/hwmon/nct6683.rst |  17 +++
 drivers/hwmon/nct6683.c         | 233 +++++++++++++++++++++++++++++++-
 2 files changed, 244 insertions(+), 6 deletions(-)

-- 
2.56.0

