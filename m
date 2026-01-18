Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127C2627F9;
	Sun, 18 Jan 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729566; cv=none; b=Y0sRz2hEKWAKAFGJ20AC3x0OxzCQfeO1/Wbi8T303tS8dYwuJKVvGhTAYYqC0+xlt1tJQnHIHsOe3UPI0wdwUL7MAcmTawidMzpTOBi1SJqj02AEY895SaG//JoUvoHoJBBrawuim2FFHl5aR2nfvHoA6SKrcUMXp0OXbzSeEpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729566; c=relaxed/simple;
	bh=j9teSg/CW499Ay/SXpjrSx3XeprimzCE6iPiqSHY5uw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VTgLaAvNaMT5IdYi8rKlq0AfCEOn7g2yEkC1Z54TRRj3NUlUgb8F0nw4IXCfFOeNx8RbqdXb0pixo3WacUVh43FYmwbMT9ylUy2EneDu7RV3EFHIg2cuzSoMZkNu+aTFvFFwyxpEnZePU38nW9TXqrygYpVER9N4i1OOw0fjJtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JsIn2dj1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JsIn2dj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768729562;
	bh=j9teSg/CW499Ay/SXpjrSx3XeprimzCE6iPiqSHY5uw=;
	h=From:Subject:Date:To:Cc:From;
	b=JsIn2dj1eVs7wxwkmFSDAdFDG2owyfVUyuYmFdwSqTkIi3IUsK+uCGYif7LONKkSS
	 oeXEVgi+r/eVDTBBluCGh/gYkqAMiR0NAXqvX+NJmGDfA3Ztub1dEshnXxXNpc0kgc
	 auvO/2w1bdrOJag02TtaWtZZ2TdbshI7GA7AmSSM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/4] hwmon: (cros_ec) Fan target and temperature
 thresholds
Date: Sun, 18 Jan 2026 10:45:54 +0100
Message-Id: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2ZpSlYgn/8MQA9vF7oGWdJFqC
 P9uxau3eZPMmwWEIpPApVgg0szCwWcwuwLQtf5Bim1mMNoc9cnUCmOQO6FyaQhejWlQ2iJWpe7
 aHCDvxkg9vzbnrcnsWKYQ39vFXH7bn63S5z+2uVRaWVPbHk3Vd3i4JmIRQfd0e08TNOu6fgCGn
 XLBtwAAAA==
X-Change-ID: 20240529-cros_ec-hwmon-pwm-0dcc610ba0dc
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Stephen Horvath <s.horvath@outlook.com.au>, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>, linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768729562; l=1238;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=j9teSg/CW499Ay/SXpjrSx3XeprimzCE6iPiqSHY5uw=;
 b=2c7QAb4fz3t66wC76dHGvWktEERqTCgx83zFd9mc3kCI7c0jVp7l4cB7YTyAtI5JRvgmXcIHc
 PaycsLbme2uCk+agQ/SldM/p/3TkRASVt6xWCAQs2P3HWaGv+LdEMRu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add read-only support to cros_ec_hwmon for
* fan target speed for fan 1
* fan temperature thresholds  for all temp sensors

This series is meant to be merged through the hwmon tree.

Tested on a Framework 13 AMD.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase onto hwmon-next
- Drop already applied cros_ec_cmd_versions().
- Drop PWM control patch as it is already implemented.
- Drop write-access to temperature thresholds.
- Link to v1: https://lore.kernel.org/r/20240608-cros_ec-hwmon-pwm-v1-0-d29dfc26fbc3@weissschuh.net

---
Thomas Weißschuh (4):
      hwmon: (cros_ec) Split up supported features in the documentation
      hwmon: (cros_ec) Add support for fan target speed
      hwmon: (cros_ec) Move temperature channel params to a macro
      hwmon: (cros_ec) Add support for temperature thresholds

 Documentation/hwmon/cros_ec_hwmon.rst |  29 ++++++--
 drivers/hwmon/cros_ec_hwmon.c         | 133 +++++++++++++++++++++++++++-------
 2 files changed, 129 insertions(+), 33 deletions(-)
---
base-commit: cd9625d235b6e42b0430f828f1d2a0b688923872
change-id: 20240529-cros_ec-hwmon-pwm-0dcc610ba0dc

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

