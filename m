Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F5213E89;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868506; cv=none; b=rtWXXj47uV0gpfFMlLHUO+gZDD+IMeN5muIGQ5EA3Bpjn/gzeKG32T+a8x+f5r0tJLkhrgWVGLyExnjG8tb8ejAbqjzWve0lTexAEe9LjaWZ1S699N1nEGOTVSpiRrWrOVuhHREsXcqvOcdT3Is4VhaAMa/4k9f7PsriwH03bW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868506; c=relaxed/simple;
	bh=WrYmtFSv69g2rHb9BzbI+ws5+dzonFtY8wqNljldwPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=to2xOPASMTh2OYgTkmCmQ++3l1nbUf6MMZaeUeh4HbcGBuL9BGCsJ4iNQFQYuBIYVDNoEZOzPCRySln62190cSp/4x1s2DRZAgvb+oevlPnwEp3EKdnxrre91k/WOeZgdy8diSXsnmTAcZxYSN8zmbt6dAlM978UZ4Zs+E/zNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB0sefZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB0sefZM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E91A6C19425;
	Fri, 24 Jul 2026 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784868506;
	bh=WrYmtFSv69g2rHb9BzbI+ws5+dzonFtY8wqNljldwPc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BB0sefZMX+V2i010jN/SOgeImaFdAJgx+wT8WZ2Y5aR30kEWK6HDNy6wVh834Krks
	 h9n0pmTwlKc+hE5SL7jFdEQ+CAkG0SzrbN3O5Ps4EuXvruKym9ve32crM7DceUVild
	 qQZJBeRZ3HeRtzW2X513GV4Kx1dO9pfLiILeozOleceLCHrqehacHERwkGer8HQiBi
	 zpZyowyYvVaMiomxEEz2mkFwV5cZjxiHW+9Evt70Ol2xZbL4sNV9+tFbc3pDhY8QlT
	 mWJqksqz9+IcCmpZmj5LV2y4nYj6JjuhF4hmTbDVJZiL5T6xRtkcmjFI/sOx9ghAO5
	 GRxSlMflRa3Xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BC7C531FF;
	Fri, 24 Jul 2026 04:48:25 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH v5 0/4] hwmon: Add Kandou KB9002 PCIe retimer driver
Date: Fri, 24 Jul 2026 12:47:36 +0800
Message-Id: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnuYmoC/2XNQQ6CMBCF4auYrq2ZzthSXHkP4wLooNUApkWiM
 dzdojFqWL5kvn8eInLwHMVm8RCBBx9916ahlwtRHYv2wNK7tAUCGsgUyXOZA6C8XmIfuGgkmMp
 Yw5RZIpHUJXDtb6/ibv/e8VqeuOqnzHRx9LHvwv31clDT3ae+ntUHJUHa2mENpSLt7LZo3KrqG
 jG1B/zVeq4xaawd5UCWXKH/Nf1oVHNNSWegDeWIJVv31eM4PgHtw/BuOgEAAA==
X-Change-ID: 20260713-kb9002-upstream-06c686e37833
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784868474; l=3387;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=WrYmtFSv69g2rHb9BzbI+ws5+dzonFtY8wqNljldwPc=;
 b=Ii+LOd6xeXTcwS9nyxFgDGcwOUIsvKjFnG558qrtHPY88k6kcyvtyQgn/e98yyUsLnlfmGp+W
 0jWt7BOFoucAdNfckSWUmoU/gb5VIqzenNGDmL0qt0+w2IMriDD9+KE
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
  2/4  trivial-devices entry for the retimer
  3/4  the driver, Kconfig/Makefile and MAINTAINERS entry
  4/4  hwmon documentation

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
Changes in v5:
- Resend; v4 did not fully reach the lists.
- Fix the patch 1 commit message to say "Kandou AI", matching the
  vendor-prefix description.

Changes in v4:
- dt-bindings: move the binding into trivial-devices.yaml; the device
  has no device-specific properties beyond its address.
- dt-bindings: describe the vendor prefix as "Kandou AI", the current
  company name.
- Document the register endianness at the top of the driver.
- Simplify kb9002_is_visible() to return 0444.
- Drop the temp1_label attribute; the chip name is already exposed via
  the hwmon "name" attribute.
- Link to v3: https://lore.kernel.org/all/20260721-kb9002-upstream-v3-0-70563922be8d@amd.com

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
      dt-bindings: trivial-devices: Add Kandou KB9002
      hwmon: (kb9002) Add driver for Kandou KB9002 retimer
      hwmon: (kb9002) Add documentation

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/kb9002.rst                     |  64 +++
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/kb9002.c                             | 460 +++++++++++++++++++++
 8 files changed, 548 insertions(+)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-kb9002-upstream-06c686e37833

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>


