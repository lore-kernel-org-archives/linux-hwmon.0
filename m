Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C81D90B9
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155658; cv=none; b=gtR5SxbMdO1mMB0j5coBJEEakr2EcUsKAvSGDyXIsa4XHVtg65IvqCs63Evh/WkubrKJ5vneRoPXDlhyjRDBVwif1P/CsKSTQIUOC6bMkCiX1gHSKfLrKEWUw4Fp49Ad/Kvb8cuto0CmvAiPnwoSoHjT4XPo+ec2sSa34Xungwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155658; c=relaxed/simple;
	bh=m4dZUh60u/mP9K/YIW4a9JOlkH+HgpGeePQd9+q1fYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QK9pPsNepvC7dhHNmljc/BjzLR0xsGDPMeOSo5IksJJfRZ8AQCkj+nX2H22K+0/dePADuOrJ3Me6ypTrOj5XNzjYMbvH37dnsTEoCJ5ZUns72MfVj4jztU47Wl+ygKz+tRFMD/wIxanF9XOQWhi1MOQYqCX4SDPoy8PbR0RBgc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TPWk4NfP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TPWk4NfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3esdoiFUb3AEevKBNMcpAJ6KfgvtuQ7LV32gNwqiGFg=; b=TPWk4N
	fPZcFA8m1Gjf3bWSln46VsZOp5vMeZKXNGqo+2aLWg5gfieLCa+BfBNX3ty3Ls7N
	E7GWKLWrww3BOUql2/X00NYG6maKN6aHoPkf64myWHYMdRgJBU1oFw1vJYxRdram
	XhLhz/Sx+LYpnzkxaySdxU6Fpn298bvr6wwxz0WIzu1EE84CpVdLjiS29QeRHxHg
	iugPAFkwqrAPQb5uIxAGNQJqoeDbPR+LxlNcD8VMOi8elZJ+VWtR0pYftGhS9PdK
	UQzmQ2hvi8ZH7RAGv61mzSOTG/Gs0VE/rbXkmQi89evDat94dqkWVdpmlmh1dRki
	a+M0i0qKYqzqgi+w==
Received: (qmail 1727852 invoked from network); 6 Jan 2025 10:27:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:27 +0100
X-UD-Smtp-Session: l3s3148p1@/zGjPAYr4JsgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Mon,  6 Jan 2025 10:27:20 +0100
Message-ID: <20250106092725.22869-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
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
2.45.2

