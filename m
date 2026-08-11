Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7646426431;
	Tue, 11 Aug 2026 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441099; cv=none; b=obn/hWN6gHNATkiEkt2RqlaF/dxdFh0eDAho8jumGKbajsASm4MPvdVWY7O+6Nyco46dpv/KR8K+hd2REFVNHKi1P6pa3wI8Wt85XO8CG34SvD+mbL38aLwx6TBMmmDrUh4NQGF993Ttn9hf41WdIoHllYyc2CmRDK114Dp6i40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441099; c=relaxed/simple;
	bh=VWBeNoPW2DobQTPyEmfafxOt8jEm+aLZ4VqSUv4TB9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNUoIo9ezxkYvw56b73pztVPihkPA/4bp0yR+2IwqpA3EBZsXsu7ihsdWzDKa9XMCfRVGIvdHsP6Ah5ZFuatpQEbh6BaEcGG8WMSZtbzVHdA+ozFZL0FZCTgYXnU+yyEc7+QrHiJglgOa2UkyAyWgTiQvWtYt3uA5nTBjigz7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NH3UD2qt; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NH3UD2qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mR
	JVcYNlYvPAspGmAIuZli+WZ/rjHS+JtGDYsdxFPng=; b=NH3UD2qtGLwJ8EK9FC
	TlBoptSYY7418SC8WN1dahhbAvuqCHzoxdTT+T9MJX3IJ+FRqGVIgVXVOvU1HZu0
	WtC+N4gMER+k7Nr3UMtTgbe9+1CdMCulXbvPL7WszOBKMr39eebtgUvHoqXg/LO5
	rocg3Y0CiuqUGvObRc6HacusQ=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHysZy7XpqJ77_OQ--.33587S4;
	Tue, 11 Aug 2026 17:37:56 +0800 (CST)
From: huangjia2hi@163.com
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiazhi Huang <huangjia2hi@163.com>
Subject: [PATCH 2/2] hwmon: (nct6775) Add NCT5585D to list of supported chips
Date: Tue, 11 Aug 2026 17:37:44 +0800
Message-ID: <20260811093744.12199-3-huangjia2hi@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811093744.12199-1-huangjia2hi@163.com>
References: <20260811093744.12199-1-huangjia2hi@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHysZy7XpqJ77_OQ--.33587S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWkXFWDGrWfuF17Zw13Jwb_yoW8CrWDpa
	4kJw4fCry5X3ZrXr1UJanxZay3XF1fWrWxCr4qk34YvF1DZF9F9F4fKry5A3ZrtFyrAay3
	WrykJryrC3WfZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEYhFDUUUUU=
X-CM-SenderInfo: xkxd0whmldjxrl6rljoofrz/xtbCxBTRCGp67XSgXAAA38

From: Jiazhi Huang <huangjia2hi@163.com>

NCT5585D uses the same chip ID (0xd428) as NCT6798D and is fully
compatible with it. Tested on an ASUS PRIME H610M-D motherboard.

Signed-off-by: Jiazhi Huang <huangjia2hi@163.com>
---
 Documentation/hwmon/nct6775.rst  | 8 ++++++++
 drivers/hwmon/nct6775-core.c     | 1 +
 drivers/hwmon/nct6775-platform.c | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
index 6725f8ff98e0..41b21bed7e27 100644
--- a/Documentation/hwmon/nct6775.rst
+++ b/Documentation/hwmon/nct6775.rst
@@ -96,6 +96,14 @@ Supported chips:
 
     Datasheet: Available from Nuvoton upon request
 
+  * Nuvoton NCT5585D (compatible to NCT6798D)
+
+    Prefix: 'nct6798'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Not available
+
   * Nuvoton NCT6796D-S/NCT6799D-R
 
     Prefix: 'nct6799'
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 94482c8092cd..759ea3d1286e 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -33,6 +33,7 @@
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  *                                           (0xd429)
+ * nct5585d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  * nct6796d-s  18      7       7       6+2    0xd801 0xc1    0x5ca3
  * nct6799d-r  18      7       7       6+2    0xd802 0xc1    0x5ca3
  *
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 1975399ac440..d394376e4306 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -34,7 +34,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	[nct6795] = "NCT6795D",
 	[nct6796] = "NCT6796D",
 	[nct6797] = "NCT6797D",
-	[nct6798] = "NCT6798D",
+	[nct6798] = "NCT6798D/NCT5585D",
 	[nct6799] = "NCT6796D-S/NCT6799D-R",
 };
 
-- 
2.55.0

