Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27183803EB;
	Sun, 27 Sep 2026 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536434; cv=none; b=islWJlaQDvQfsoQ7hBMoYsiIPh8NdsCP5FGHSgcsEtwsC7opmQY95ca7dmN9n8Db0fY5+rdbUCLy3F6Z4IMpPUCz1iO5DWBrDkH2SjmD2MH+k3dQ5VjtCBDNBxlWuq9nOxaSkYASk4ZqsdQeSW/yNkkll4vFjE0QzB3fmWTQw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536434; c=relaxed/simple;
	bh=LaZLdcF4TYiS3l3mZirh4KvfIgwqwZVOoUIrNen5pEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSq1VS5xTLvtrtP3fnP7cFICanWfA6R/GWF7zvvVbBVaowc2mm80vLf+ZL85N+rVCm4qAEmljfIPLyhOCj9ICc6BKkGyCrh6x3zrHhCp3QFDRsxIc30tLQoSbQ/kyi7NcAPD0ldF7EzojhrcnUTv7xXZUMdUDvgmyZP86LHY/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=d98+opzr; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="d98+opzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536427; x=1790795627;
	bh=j2kaTSxqrFLfgzyt8ZBqEAVxakeVJTIWha5blvfzHv0=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d98+opzrpi0aLpHneDNCqtCWMIDfIIfNE71JCY+EpnnczGxb/t4kNFlb6gmSomq5j
	 R4JwbaxVpcx1QrQwnrsYp2WRzDZpnAB91Z7Ch0u2VoGu7glwOHwCMb7wD1fvwHFZxQ
	 YEo6qF4WTCFQ3puOR+SXO2SrdAWC/8H93ik8naeG6Tec2xtStioqX3REOwqEkC3Byv
	 ETxy1V3aKFvyxxJCxP8R5IP9vDtVUeOf1k9jKsDV5HriGtefO0tYE/nIfv5taNYdwU
	 UA2Vbu9LuNchmCcSpY5jwh4AcWu1wVuJivjEYvCzB6IA43KDASIrugO1VAuHgBKDnO
	 V7liTwxO18jPw==
X-Pm-Submission-Id: 4htDck6L1Qz2ScDC
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 0/5] hwmon: AMPINEL telemetry support and shared fixes
Date: Sun, 27 Sep 2026 22:13:11 +0300
Message-ID: <20260927191316.4137752-1-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds read-only AMPINEL telemetry to aquacomputer_d5next,
along with shared numeric, initial-cache and report-validation fixes.
The separate keyboard interface remains deliberately unsupported, and
there is no HID core or generic-HID change.

Changes since v4:
- In patch 1, read the power cache once with READ_ONCE(), check that
  snapshot for -ENODATA and return the same value. Mark the power-cache
  updates with WRITE_ONCE(). This addresses the check/use race identified
  by Sashiko review; the HID callback does not take the hwmon read mutex.
- In patch 5, use WRITE_ONCE() for AMPINEL's power-cache update as well.
- Patches 2 through 4 are unchanged. The base remains hwmon-next
  9edd5ab2656f (7.3-rc4).

Validation of this revision:
- The hwmon object builds on x86_64 and i386 with W=1 and Sparse.
- All 995 captured reports pass the actual C parser/read replay under
  ASan/UBSan, including simulated 32-bit long clamping and the existing
  shared numeric, expiry and report-validation regression cases.
- A userspace scheduling hook invokes the actual raw-event handler after
  a power-cache read. Valid-to-unavailable, unavailable-to-valid and
  valid-to-different-valid updates preserve the checked snapshot.
  The old double read and two independent READ_ONCE() calls fail this
  check. This models an interleaving, not a live-kernel race reproduction.
- The exact final source was built and installed on Linux 7.2.6 with
  stock hid-generic. All 24 raw USB/hwmon comparisons matched after
  module loading and system activation. Telemetry binds successfully,
  the keyboard remains unbound, and other HID devices retain their
  drivers and input capabilities. No AMPINEL fault or kernel WARN/Oops
  appeared during installation. This revision has not been tested across
  reboot or suspend/resume; the earlier v3 lifecycle results are separate.

The power snapshot does not provide atomic readings across different
sensors. Other Aquacomputer models have synthetic regression coverage,
not hardware validation here. Channel labels follow report order;
alarm reporting and protection configuration remain outside this series.

AI assistance: Codex assisted with implementation, tests and submission
text; Sparse was used for static analysis.

V4: https://lore.kernel.org/linux-hwmon/20260927183723.4078226-1-contact@vasily.cc/
V3: https://lore.kernel.org/linux-hwmon/20260914233728.22725-1-contact@vasily.cc/

Vas Zayarskiy (5):
  hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor readings
  hwmon: (aquacomputer_d5next) Expire the initial sensor cache
  hwmon: (aquacomputer_d5next) Validate incoming status reports
  hwmon: (aquacomputer_d5next) Skip unknown firmware version offsets
  hwmon: (aquacomputer_d5next) Add AMPINEL telemetry support

 Documentation/hwmon/aquacomputer_d5next.rst |  13 +++
 drivers/hwmon/Kconfig                       |   4 +-
 drivers/hwmon/aquacomputer_d5next.c         | 118 +++++++++++++++++---
 3 files changed, 116 insertions(+), 19 deletions(-)


base-commit: 9edd5ab2656f040d726b5388f49ceac10bb2944f
