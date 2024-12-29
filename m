Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA33126F0A
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Dec 2024 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467169; cv=none; b=PhUr2jsiQoa/W23L1qqpC02ANa/9w7TITw+a2yZgEkkuCMToNjanNYoiBs6eU7ee4oKeaERLvOQIohUyuCIDfTOvlndv8EVS+I9PcTXUnwD04vUw9+UhzHwvehU95ftzrdgYM7hBbRj79sOrwM9v+kp8iFLWFPBJWiLkkU7Vo9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467169; c=relaxed/simple;
	bh=v22f0loiNwAuiMzdHCIr0vy7Rq85k5BvrrfF+boD7Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b08vTYqXXYdplrAHrTWwSkHGc8zMm6fOGDvpZYnHGn5bdQk9ReMcSTwoq5x+g1IqGuuqU8TtScgC5XavxLJFOQZwu06wUTNGxjd0ixeC1+Vm7iqDij4F/tREkyOXJtU861UT1+bfzI+nXHKFlqSz7J/fzaLOtLUfdmQHH80xq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XigPu+vK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XigPu+vK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=G6kjFPdUe1j2cdg63XDSQh38HU3Hz3YIpXujxIBwTkE=; b=XigPu+
	vK9Pm9D6f0m9k8kozSFU3T5K5XAAUzC26cxSpb0c9t7dELQR+obbJ9Huf/vJW8NW
	I3+YlWioX3ABGVClKJxu6LL7xg60LDdXCCVJ/E69ntTLxRt4IzP1qIySBModBGBC
	3makzX9s5MFOgLEF83OnKWydHy+6rkN8g7Opp+Y7LiivI5/D1kImYNqFVwlgwG/L
	jgPgL7N2Kmy3kBfjbUlvOZodrMv+0+mioaEMYqUNbw7UUJs5hIImJk9vcIOX3d4N
	hP1Vhf5EC2kuhig2S3aOKQBJwtJzpOoQDjypLMZZoYL+hgBLQ6f7NOo4bGUxV1nM
	EGZbPEUxgk1VTGUA==
Received: (qmail 3656676 invoked from network); 29 Dec 2024 11:12:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:37 +0100
X-UD-Smtp-Session: l3s3148p1@qSNn72UqjLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT v2 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Sun, 29 Dec 2024 11:12:30 +0100
Message-Id: <20241229101234.2896-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
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
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* added tag from Guenter (thanks!)
* rebased to 6.13-rc4

 drivers/hwmon/spd5118.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6cee48a3e5c3..358152868d96 100644
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
+	if (parity8(bank) == 0 || parity8(id) == 0)
 		return false;
 
 	id &= 0x7f;
-- 
2.39.2

