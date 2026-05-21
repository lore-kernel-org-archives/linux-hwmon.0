Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7A3630AD;
	Thu, 21 May 2026 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386648; cv=none; b=qiVXnLGijqrDSPJyEkara/1wSPFDtRZuVeo51EwW8wWydHKHwCRzGm8n2sEUfxunMU3NZdOab9Wr4YruWd8mh6G2tGKG0WPoqdfTf65TpZpmSIaJ9IIpEh9u23NrWMj/ey0NA8a3qLFS4FN5IPfVJOWKiqp6CmiobwwBGdXDnvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386648; c=relaxed/simple;
	bh=IV/1L/Rj7qMwpngEZcxEoQroL40wwhkoCZUkW3msxew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQ+jMacwPgfrREJ19+xTUHYyosR86poiYe6g2hXT3cdpFpQHhqjqZo6gV+ou7vbnn7j1ROTDr8nr/6J0MccpmjZ8glmD7j08D7EGPMeXxDBTPOR7BrcC1jG1QcA/9VOkq0xV75HCZytYDGf5aNIoc4sCb7NMwQFtg8BCbCiU0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=Q30D93bx; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="Q30D93bx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=IV/1L/Rj7qMw
	pngEZcxEoQroL40wwhkoCZUkW3msxew=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=Q30D93bxUhe5/x+GIcPpv80ZoBQHru0iiYvkSKGcX0gJ1ic5PdKC
	tuXbB3IP+a7LMR4X2dloWJG/psl/r4iZTUvKzFhJbJ0+znjk1XMTuLdu24EEt04hqCWUm9
	CqTlqjsnZT5BixwM1jHiXezrp/E1xRjTybRzuvUF0pPP/9PP3qU0N1rtr+VdB0QFCpaCbf
	+DVzsWiZc8HKjg0/aoV350TFSlB0OqPYV6CXGP7PtXQdbvXrcuzJr3HTJYJcCkll+7MPUR
	6u8fVCSBCdK+7D1ZGEaKFKu5RaZ6kyloY/rk+NlNwUp2IjMt4HlauZDYoLEjbOuDBJJ+ds
	DYUZBgo4tQ==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 6c7f6f1e (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 18:03:53 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] hwmon: (emc2305) update of_emc2305_match_table
Date: Thu, 21 May 2026 20:03:33 +0200
Message-ID: <20260521180334.19706-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Latter was added with only emc2305, in contrast to emc2305_ids
which also listed emc2301, emc2302 and emc2303.
So these three devices couldn't be probed based on device tree contents
until now. I fixed this.

Fixes: 882bd6de1a5b ("hwmon: emc2305: Add OF support")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/hwmon/emc2305.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..4c99018d0575 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -716,6 +716,9 @@ static int emc2305_probe(struct i2c_client *client)
 
 static const struct of_device_id of_emc2305_match_table[] = {
 	{ .compatible = "microchip,emc2305", },
+	{ .compatible = "microchip,emc2303", },
+	{ .compatible = "microchip,emc2302", },
+	{ .compatible = "microchip,emc2301", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_emc2305_match_table);
-- 
2.54.0

