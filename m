Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF31347BDB;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034239; cv=none; b=kXl+69JdtnhNMp9ZoFFtlC0SlgHxgjhHofJNWaWp5pw1MbD+ZWfEB4rwZ1G0gfVSC4N8s7TtOEJlLUopp++aBNplEGvcsEy4jNc1nai9dO0vdIblJlJ+NPT7jlMA/uoMq8XNEWO3NZCQ50XxQeTUA1tiblq70c43rO+Prf+R+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034239; c=relaxed/simple;
	bh=gT5kQYzi74VXseWgN8ByZg8SfihbenXmwfoq4uOUNY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lrhj4+LgRvIZWawo01AEl3YvBBw7VNtucfNNkI+qh4qCk3XZGTKf9xTmE0ZoNTW3bEX71gZnPX2X0aH5/FUkmXx66T0GBqi7nKSDkw5ylerNZqXDRcfksUQ8UL0Gwe/l/LngGClKBb11hgtUL8WuYeLYqcmejLJL3TpcLfgALRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHxWQgPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHxWQgPP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42114C2BCB4;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781034239;
	bh=gT5kQYzi74VXseWgN8ByZg8SfihbenXmwfoq4uOUNY4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tHxWQgPP56DAyHI1CERIXrswAM/M9fTnvu/DAYV7nBW5onbj7XDJWDH8fmkJCFg9l
	 7AIgZ1tQ/YPHqSxG+5VxQoP4fPdR8XXqald8fr8oxnsZl47X5GB/YqRTpdKiPkbBBV
	 4eZNT6AkVoB76fQebr4t/h5eYajYS8YChdr1Gzi1KSaanJqkqfv/NaCWDTpfSsA1uj
	 IwhOi9PtXcG4c+rKM6klSgeAmYCnj59vDt/rIDRPlm1AfeZUT11b5D/A8vgc4OinqZ
	 UcOVdTt79olzQLwyUdq7mS0ZJukXxWnBZDb3425sih4xoS7wXD3kEDTfdV71wTZpFY
	 qcgU0yg/D9YGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25412CD8CB2;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Subject: [PATCH v3 0/3] hwmon: ina238: add samples and update_interval_us
 support
Date: Tue, 09 Jun 2026 21:43:09 +0200
Message-Id: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQqDMBBFryKz7pSYiMSueo/iYjRjDdREEk1bx
 Ls3eoPC37zP5/0NIgfLEW7FBoGTjda7DOpSQD+SezJakxmkkLWohcbxPXmH1pFUGtfZ0JInbuG
 Q6IVrxCSxVFWlDQsSWkEWzYEH+zlPHm3m0cbFh+/5meTR/qXPEShNo5qh6yRTeSeT6FDytfcTt
 Pu+/wBJqqF72AAAAA==
X-Change-ID: 20260608-hwmon-ina238-update-interval-us-v2-13448de0a083
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, richard.leitner@linux.dev, 
 Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781034237; l=2405;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=gT5kQYzi74VXseWgN8ByZg8SfihbenXmwfoq4uOUNY4=;
 b=c4uQqJ7U4SObhSh2bVdmellH+HP3d2cFbYq6P0Xprx2pqSWS2dPR57gq0tZ52cfBjdCDk6Yrd
 ZVPYZfE7shZCvhxU7usmG/BUv3L5HhQOziB9Eet+Z2j2RlwAO5G3Ua+
X-Developer-Key: i=ferdinand.schwenk@advastore.com; a=ed25519;
 pk=HyA9NdHJ7NystP+1SyuWJeyXNH2EO4A09FXli9mfs9Q=
X-Endpoint-Received: by B4 Relay for
 ferdinand.schwenk@advastore.com/default with auth_id=788
X-Original-From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Reply-To: ferdinand.schwenk@advastore.com

The INA238 family exposes ADC averaging and conversion timing controls
through ADC_CONFIG. Add support for the samples and update_interval
chip attributes and introduce a generic update_interval_us companion
attribute for devices that need sub-millisecond resolution.

The shortest INA238 conversion time steps are below 1 ms, so several
valid hardware settings collapse to the same update_interval value when
reported only in milliseconds. Keep update_interval in milliseconds as
required by the existing hwmon ABI and provide update_interval_us to
report and program the same total conversion cycle time with microsecond
resolution.

Patch 1 adds samples and update_interval support for the INA238 family.
Patch 2 adds the generic hwmon update_interval_us attribute and
documents it.
Patch 3 wires the new attribute up in the INA238 driver.

Link: https://lore.kernel.org/all/20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com/
---
v2:
- keep update_interval in milliseconds to preserve the existing ABI
- add the generic update_interval_us hwmon chip attribute and documentation
- implement update_interval_us for ina238
- report and program intervals using the active averaging count

v3:
- add missing Signed-off-by trailer to all patches
- address truncation concern by tightening update_interval input clamping in patch 1/3
- preserve equivalent clamping in patch 3/3 after introducing update_interval_us
- Link to v2: https://lore.kernel.org/r/20260608-hwmon-ina238-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com

---
Ferdinand Schwenk (3):
      hwmon: ina238: add support for samples and update_interval
      hwmon: Add update_interval_us chip attribute
      hwmon: ina238: add update_interval_us attribute

 Documentation/ABI/testing/sysfs-class-hwmon |  14 +++
 Documentation/hwmon/ina238.rst              |   4 +
 Documentation/hwmon/sysfs-interface.rst     |   4 +
 drivers/hwmon/hwmon.c                       |   1 +
 drivers/hwmon/ina238.c                      | 162 +++++++++++++++++++++++++++-
 include/linux/hwmon.h                       |   2 +
 6 files changed, 185 insertions(+), 2 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260608-hwmon-ina238-update-interval-us-v2-13448de0a083

Best regards,
-- 
Ferdinand Schwenk <ferdinand.schwenk@advastore.com>


