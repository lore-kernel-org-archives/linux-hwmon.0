Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CBA3ED12B;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106561; cv=none; b=oAShU8jZrBiYO6D7CQ5eeYHibrWNNkGYYXm29AzZPIUH8ZzDqbQq022ojtXtaWAZYNKgeoZZh3HmunH/dul2zjpjubGy1YxhtMI19T4CwPQ57YztksVjMESfwVkkMOC26yFgpPfO/FlV9jqoYrd8yqvKue0uipUh9cbpdGVwLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106561; c=relaxed/simple;
	bh=vC3o2yDg4cPfi+aCF/o5s/JFel3QNjfYZLOecDVvGmY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eTmiX8AMiM5HbITMYIZ+Muv+WbbNWKZBaHpZcO1fZvDjXRoztLwHMYME8KBs8w0MPFIN7szKtUZgBL0oe49XbOIg40fXtLiXRKJdORpgY069SH9dqacT9NIeaE1gQC9/1xJRtW0r7Cqpd5WTKnaGHzwBQMDpUykLHPw3g8poXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izir0+MK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izir0+MK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3944BC2BCB9;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784106561;
	bh=vC3o2yDg4cPfi+aCF/o5s/JFel3QNjfYZLOecDVvGmY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=izir0+MKBhk7cdc+yvowepsEnazWTlM13Dbh2L9tDG5/rNyybBnxFV7bn1scSL/UO
	 k44chRYWCCkGkuNPwJnt7l+Q+qQBpoGqqbZOVLThLKQAS7xX28dDSkgOtRK/SSeYjf
	 kIxuaRipmU+By1IsRP6TU0fHa9YuyF/phCAxZ0dSn5f6f7Idu5gliO7gnnulUKkMSy
	 xpaOpwApdkqmkOMgvQ9HdNquLUiylL7N01kHpFVf/Jix5fszjS+UdYgm7TFwZ16Man
	 lUI/Y0zSYVkAVOFoU0z0G1eOLigS+f0MGUj+LRY93dGZpmpQjDWWCMkeXykLW69zev
	 IruXOQNU/ur7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EECC44508;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH v2 0/4] hwmon: Add Kandou KB9002 PCIe retimer driver
Date: Wed, 15 Jul 2026 17:08:34 +0800
Message-Id: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJOV2oC/2WNyw6CMBBFf4XM2pppq6Wy8j8MC2gHqYZHWmg0h
 H+XYly5PMm55y4QyDsKUGQLeIouuKHfQBwyMG3V34k5uzEIFApzLtmzviAKNo9h8lR1DJVRWpH
 MtZSwrUZPjXvtxVv55TDXDzJTyiSjdWEa/Hu/jDx5v/rprx45Q6YbKxqsuTxbfa06ezRDB+W6r
 h9s2LZcvgAAAA==
X-Change-ID: 20260713-kb9002-upstream-06c686e37833
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784106525; l=2142;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=vC3o2yDg4cPfi+aCF/o5s/JFel3QNjfYZLOecDVvGmY=;
 b=bNmQvG+9i9OnCw94zCgThjTPu/vZW6Nl5GOCTN0j1YUeLcJ7GWgZjf+8QLM5sq57IAeGs5cxi
 1Dbvqzi5eA3DlkeJfEMo2vyvodULTlY6Dwnb3sa7mjqluuGiyWYVRmg
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

 .../devicetree/bindings/hwmon/kandou,kb9002.yaml   |  45 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/kb9002.rst                     |  65 +++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/kb9002.c                             | 479 +++++++++++++++++++++
 8 files changed, 612 insertions(+)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-kb9002-upstream-06c686e37833

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>


