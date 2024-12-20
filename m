Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11201C5F1A
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Dec 2024 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694233; cv=none; b=Ua6/TK6iZDoryj6WeCHVuzvU8z+fYkMNm2SqAF+v/ya86QoKQsivPIjlEjWxWIw1UvEDFy5ANtWUE8GBpMlUOwQx78Q84mgBJ5nO/gxrOkSEvpfBUbV2kQBlzMYDuN6INWRebWtiGUvBowI8AX+Vu2/+Yst4SAHD7qz03jTbhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694233; c=relaxed/simple;
	bh=wLie45FQJjevoqTvATT1Bwc7/Ik+763kNu0o5MBnW6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtY++ODR1omkNr52WyAZul7aYCQXyN8NtWBShCwdAiDTzM97M4yELLG1H9soCfqnrVgEYxabTqD5oLpZtDtCOxQsPlJTg6Atljaed452d49zwLO2SQNO6eMRVHiF4pdYHwoKs/pRLJGpGhfk0WPWEe/A6t9IZL3GXVXbWYrNuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=asJFXhRs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="asJFXhRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7urdFe4hc0mW5T0rNDU1jZWJ1H72Kr3Yh3vXW+VAdRs=; b=asJFXh
	RsolHAL7/ixEyPnyfszqd0gs0UyZhTnTcglfgwvcuOwri5BhHiK5oyKANkkZ5qL7
	Ufot87xiJQbhl6J6bQMOSGCsmGw9IjIGq3tETtLd9Ko6xVrCVAQHuH3CTjbH9l/I
	4rsuZHkIzhsWwZ5gdO98vxSJG4qZMlMOLWZLz8RTFbs4elg3EE6eeRpULXvnv4GV
	GDWOulYA3jOF1v9pyr4e26ab4KbaoK9NSBI/TlO6Rpepg3e0L1ia1U5kzDP4nZkQ
	mXEhzLkYySRAxnQMUSzzy0eLHY7jhn9mhZ0BECit4OsPmiQwTaPPtDPR1aaDfpb5
	4d3Bp1UMlJpIR/QQ==
Received: (qmail 989714 invoked from network); 20 Dec 2024 12:30:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:20 +0100
X-UD-Smtp-Session: l3s3148p1@YFHG+LEpCJ8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Fri, 20 Dec 2024 12:29:56 +0100
Message-Id: <20241220113000.17537-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of the new generic helper for calculating the parity.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
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
2.39.2

