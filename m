Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53CF1E521A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659165; cv=none; b=u0+2C+tklduGBc3T8v4APYVWCT7nMTbKuqhbzIxmb11NimiLkhoIM7EbsNAr2T9RnsUVZeS5VnlGA59AlfxJFpkZb30IBuXX6ANtuEzS8uJ0q5Vd3OctlIWHlA1u7M8/niPQq3Z8gXrlTs6+FsYdIfW2oVhZD/vs53usxo2OQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659165; c=relaxed/simple;
	bh=8NUh+WWU+lYIRelmF9ADVq/Rn/xwr19ma2oghoWUp7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9cPFW8OGRj8QAPcFPOkWZObFvxtc20Ac2JqqxgRR15Oy4Cq7o1TQ1IgpbFd9TRPlhT99fX2FCtcJKsjOiRQUUrEqIsfHV4A3CXPNm0EQ4Twt+H+HOWeDjKTnUquTRq8W0ymyj+7C1ddKlQkDrpxlRsEMQHDbZS9NA6odrV9eHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4NPwMWo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4NPwMWo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 943C4C4CEEA;
	Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659165;
	bh=8NUh+WWU+lYIRelmF9ADVq/Rn/xwr19ma2oghoWUp7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s4NPwMWoQxP66hSoM2apnMI9KQm58Bj1VOLM8qR0/vty+vstRm+qbGv5DrNWo7uYl
	 GBN8Jq0YJkjYSP6rFvyEu0UWvFEsvprJfk8vz1aVEPeD0otU+Okf7i2U7Ot+LCC1qK
	 uDfTQDaUlHuMPWMq7XZ6QwhlQpJUYZvv9YA1RDwEleX2ydFKdcZY2ctljGvAzFavyT
	 5eFHlI+rCxowM0C3UtjaBL/mNmGy/40snLzfHr9HKSV1VzRWL8JV49bFRzVwhVjyIS
	 j0ZbbYMrwKX0Eg6SbmX/ij28Rn0tGAHNtB1sEY/sB0+PTRQkX5BMEUnQkCS70t8Odp
	 KXZ4UrBwNuqow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88952C71137;
	Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 11 Jun 2025 17:26:12 +0100
Subject: [PATCH 1/2] hwmon: ltc4282: avoid repeated register write
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-fix-ltc4282-repetead-write-v1-1-fe46edd08cf1@analog.com>
References: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
In-Reply-To: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749659172; l=1018;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=BLNIO1ilzbGQmaH4UUriCna8h5c9+a/6ajPl5KE0E58=;
 b=5rthojdXxUsrIK9oo+gos74eZGG/e+X4rE5scXJYPUOKwpEp1op7eoxu5CJt0zv3vKDu0+May
 JipsatGCUCJBgFeqP7k/1yvQUKWq5AFlg+c9wZrLHVkpeMZJNuDZLib
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The fault enabled bits were being mistankenly enabled twice in case the FW
property is present. Remove one of the writes.

Fixes: cbc29538dbf7 ("hwmon: Add driver for LTC4282")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/ltc4282.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 7f38d269623965c22424dea837ff451bb880f81e..f607fe8f793702da534902d3c3878581ac2bca1f 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1511,13 +1511,6 @@ static int ltc4282_setup(struct ltc4282_state *st, struct device *dev)
 			return ret;
 	}
 
-	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
-		ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL,
-				      LTC4282_FAULT_LOG_EN_MASK);
-		if (ret)
-			return ret;
-	}
-
 	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
 		ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL, LTC4282_FAULT_LOG_EN_MASK);
 		if (ret)

-- 
2.49.0


