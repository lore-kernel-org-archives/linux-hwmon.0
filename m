Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326793C4B93;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615540; cv=none; b=gSYiVXRTZhoIHKr6j68FKlaSOH+8ZNYQeO4USw3jV2is6Qd67lJpUMvusbrQ0LRRPUXva01RX0nlrGPyu+dNIj96sTt5+yqdiCQQkOcCDBQzzTGR5BOFukLNj03bN+JakvVX/y1A1Kng9JVm1rKZQW1CppbXzTUC89H/n6pdowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615540; c=relaxed/simple;
	bh=iLj5HgtenDHXi0SHFSIAeJJT74tSyCYXvam8/Z5ATYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mir8GEDbJyPGUyAd19UQHRFEStHMO0w+N/sm2yw6Hlo/y6kJo/6N726Szt5Y3YAwJf21vBDibv0Xqf+kT1EYdL6oV4rxKNQIAK+8ne0Cu8JqHWlMxG/BuflxNAU5mQSZTxBuzZOKitFIJYdWR8OpN0hk9liIWfnUoncCOEwTgys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkNW4hEO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkNW4hEO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC134C2BCB8;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784615539;
	bh=iLj5HgtenDHXi0SHFSIAeJJT74tSyCYXvam8/Z5ATYM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LkNW4hEOiPLctPp1dRggsy14KgPfXJT2iGWby+mUTvF+3wy7C04ZivtILRqLebrFW
	 fKSpRg6Wjryx6x3Xj8THFYnPVofPHYJiWeJosVh7xtxccTaxype9/5cSzUFqVJh7C4
	 2T5Hj/YxoighJFZOIzXgIOyKjoajrxv0tIuehbvbKuuGMTGZtOBm1loyt0VgtAURpg
	 ehBzOV4Q83XPxJH86ur+1zOYPAxBc/vC1awGU5KMZ95q6C6tq1fpABnxu1QLoirtzr
	 W9GrXSbNS+hqlsv0WESAhRIY9gc8EGR2bXgNdW3rsJy6JtFVNV97g6XLuKIupDPsjP
	 CZ+lLJdyKzGZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8249CC4451C;
	Tue, 21 Jul 2026 06:32:19 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH v3 0/4] hwmon: Add Kandou KB9002 PCIe retimer driver
Date: Tue, 21 Jul 2026 14:31:31 +0800
Message-Id: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMSX2oC/2WNyw7CIBQFf6VhLQa4llJX/odxQXlYNH0EWqJp+
 u9CjdHE5SRn5iwoGO9MQMdiQd5EF9zQJ4BdgVQr+6vBTidGjDBOKgr43tSEMDyPYfJGdphwxQU
 3UAkAlKzRG+seW/F8eXOYm5tRU87kRevCNPjndhlp3n3qh796pJhgYTWzpKFQanGSnd6roUO5H
 dmvXf7bLNnMaqgJCNCy/Nrrur4A+2rD/PwAAAA=
X-Change-ID: 20260713-kb9002-upstream-06c686e37833
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615506; l=2675;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=iLj5HgtenDHXi0SHFSIAeJJT74tSyCYXvam8/Z5ATYM=;
 b=PeGkpAI3vkm7UOrD7MxNaZSGzbfEdsTgGrgcQdxx5pERdJGnbHRJWI2aPReQwuf/45hQIEgxa
 pwpZL8ExVjIA5gNN2KmeG6JhkxAj7apwBPAaaJZOtEdj17InF04hzVV
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer with an integrated
microcontroller that exposes an SMBus 3.0 target (with mandatory PEC)
on its sideband interface. Its firmware aggregates per-lane die
temperatures and publishes the maximum through a register window.

This series adds a hwmon driver for it. The driver reports the
aggregated maximum die temperature as temp1_input, and exposes the
running firmware version and boot status under debugfs.

The series is organised as:

  1/4  add the "kandou" vendor prefix
  2/4  device tree binding for the retimer
  3/4  the driver, Kconfig/Makefile and MAINTAINERS entry
  4/4  hwmon documentation

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
Changes in v3:
- Drop the private register-access mutex. The temperature read is
  already serialised by the hwmon core lock; the debugfs files
  (fw_ver, fw_load_status) now take hwmon_lock() to serialise
  against it, since they are read outside the core lock.
- Use a named initialiser for the i2c_device_id entry.
- dt-bindings: constrain the reg address range under 'items' rather
  than applying minimum/maximum to the array.
- Link to v2: https://patch.msgid.link/20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com

Changes in v2:
- Drop the unconditional I2C_FUNC_I2C requirement at probe; require raw
  I2C only in the host-interface switch path, so the driver loads on
  SMBus-only adapters when the chip is already strapped to SMBus.
- kb9002_read_revid(): return immediately on a hard I2C read error
  instead of retrying the FIFO drain, avoiding needless bus traffic when
  the device is absent.
- Link to v1: https://lore.kernel.org/all/20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com

---
Andy Chung (4):
      dt-bindings: Add vendor prefix for Kandou
      dt-bindings: hwmon: Add Kandou KB9002
      hwmon: (kb9002) Add driver for Kandou KB9002 retimer
      hwmon: (kb9002) Add documentation

 .../devicetree/bindings/hwmon/kandou,kb9002.yaml   |  46 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/kb9002.rst                     |  65 +++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/kb9002.c                             | 469 +++++++++++++++++++++
 8 files changed, 603 insertions(+)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-kb9002-upstream-06c686e37833

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>


