Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C115CD49
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Dec 2024 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734166730; cv=none; b=A+V0mPerEf1ZyXlnOBeaWv74UCfu9GrqaaBTnur4x4df/lgUXVP/oEHMsDLMDwSvr56hFs+u8r80cDYyzlHnjlu7oJuYAX+8luBlrL1lROovHEtAVoVnzZMhw0UXETRxN800WLthWksEsaJq0la9Xw1XetXiwzENCb+LhGyXTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734166730; c=relaxed/simple;
	bh=AmlVvrQ8iOfKbH3YXZgneXCCi7K2VfqQc3W7DMkumpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FduIfzAbW5oHs7e6dq/tuxjMqvahV/DqxtrCvM7QzVL7mNDOEvHG1uwg7BdRUbb4YdqYxD5gic1UXs3Ln5ya7hulQbMpspgDnihHRM914bFc6AeR10Bcxefh9Gh4MylGQTgtNaDT3ABe62uYLqqSuLjTyKlRFB58p4ncD+SrSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ch0UNMRd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ch0UNMRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V/U1WDJaY7VuSaVdnDsrNgusQyOaSAv9Mkt7sm9FcRo=; b=ch0UNM
	RdctcsuKdT0jzhUWxGFPyqjFXA+nUbxMmmHzwUtm0u5pHecp5wepmPxC50xs3qfw
	DAPCoCcoaoa+7xQmGlQszhrvL9rpPGEZF4tX7XRrciGNCEmJ2UEqp0Qiy0clDAF3
	iMygep41I/j74Aq0ml9RfscLW4M52qIXFpglqDxcJBJ5jjIy2q/HO4HQyf+yG4a5
	q1P+D1ItmouATvjDIO0hx2fu1bwk1ABKCVWdkmSRLEfhHdLxZhPZIvfVu8OJKZDY
	ti6RrFKx8HxgdDr8aiauA1BNqaLh0rLq/F7ZPomUncnclfWnmMKr74M1NZ2ICGe3
	zqXg/C3+DYnjyE5w==
Received: (qmail 3036721 invoked from network); 14 Dec 2024 09:58:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2024 09:58:39 +0100
X-UD-Smtp-Session: l3s3148p1@zTtCJzcp3oFehhtJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 2/2] hwmon: (spd5118) Use generic parity calculation
Date: Sat, 14 Dec 2024 09:58:32 +0100
Message-ID: <20241214085833.8695-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of the new generic helper for calculating the parity.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/spd5118.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6cee48a3e5c3..07ab3a47b00c 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
 	}
 }
 
-static inline bool spd5118_parity8(u8 w)
-{
-	w ^= w >> 4;
-	return (0x6996 >> (w & 0xf)) & 1;
-}
-
 /*
  * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
  * Vendor IDs 0 and 0x7f are invalid.
@@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
  */
 static bool spd5118_vendor_valid(u8 bank, u8 id)
 {
-	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
+	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
 		return false;
 
 	id &= 0x7f;
-- 
2.45.2

