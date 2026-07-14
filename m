Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F23FBEBC;
	Tue, 14 Jul 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017273; cv=none; b=SE7ZC/h+4z5MJQq7WWUGEGXWFD9t35pR49Rxb5sP0OtjhmWHzveXTAReD9FAFEsSQrgA/H76y9HNWyQ0LxyhWtv0iTOZI56z738MtJe9j8tQN0p/zCP6S6nb7isoiGHvAHl+zLGdVKTxG/xwKKhFJrIwxx71mDSk/70OcYULJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017273; c=relaxed/simple;
	bh=YRQiObYZV7j4K+B9X4FSjAje/rXs+OimtUFNe3Mc5DU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hDCnGwcZzahyy1D5dln/T/3nMxz1ZAr0tmGquIaaznv0KsbMuP+Pb4spYN/VlC5cw0yoo1LD5SQ3ah1/CMtVu2+aCAORmisKUAss78hj2jMrkrycFT0GRa5+9G90haqdFTDA+ZAzhiXq8V6gPDP6YMG/KPrrD6YtPcadFDyoIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPMvh/AR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPMvh/AR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31127C2BCB8;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784017271;
	bh=YRQiObYZV7j4K+B9X4FSjAje/rXs+OimtUFNe3Mc5DU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XPMvh/ARLF279uK9RBvp5K1LgdyJibk0yujjbS7sXtC+lbSGIlb5KlmTSgS0m/TK5
	 jkR2ZlZ/Xkrtxmr1Vxxg/LvHtLEdQwSzN9xMwGRvIxDB3CVxuD3Co/4AB9Opaupe9c
	 NSqyOk9NyqIUc8GTm+wauiY3ODC/m+4qvj0nFcO6l4UtdT2fD84flnDVlVdxJdD1Fz
	 rDaja6m5WMzKzLxJf4MUcpiTdUNTqq1kw6vq0XcnKHH4Fzmst0n1+8rS9oM+kTi9V3
	 6bYssbrKVSCDkCsehfhvm89c0hL+/cAIZk1ajbFzKLt6Dttnh0PAGjjjl42dn++//8
	 ZDi8cip5nlD2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2B9C44501;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH 0/4] hwmon: Add Kandou KB9002 PCIe retimer driver
Date: Tue, 14 Jul 2026 16:19:31 +0800
Message-Id: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPxVWoC/yXMTQqEMAxA4atI1hZiC9XxKuKi1oxmxB8aFUG8u
 9VZfov3ThAKTAJlckKgnYXnKSJLE/C9mzpS3EaDRm0xz4wamg+iVtsiayA3KrTeFpZMXhgDsVo
 Cffl4j1X9t2zNj/z6bOC6btc+znpzAAAA
X-Change-ID: 20260713-kb9002-upstream-06c686e37833
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784017234; l=1648;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=YRQiObYZV7j4K+B9X4FSjAje/rXs+OimtUFNe3Mc5DU=;
 b=JKeIf8l4EpvoK7p0e3AeHEUfiK61el0DEgPKJanCxa3HUQ4wvp2Ik8CYyxiuiYxGC+KMAYZD/
 iPn5stRt2DABJQdy8BTswG1gdHXRocWel+YJXvZ5m88hXiNqPcFuMSf
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
 drivers/hwmon/kb9002.c                             | 473 +++++++++++++++++++++
 8 files changed, 606 insertions(+)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-kb9002-upstream-06c686e37833

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>


