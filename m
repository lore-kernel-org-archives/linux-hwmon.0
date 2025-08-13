Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2123B63F
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Aug 2025 19:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112058; cv=none; b=jP4RUlRzfugRQpYkECpGC7lswjzsZXqliUZX5Mjvx03bmQOR13E2WGUE1EllfvhsntpHYWHb8lyLWygsYcaotqTytOtthjyEQ37lUun7+KCquJaJoHmt7+AWTlzHkIlblMGPt33DZYq8PO4IawfntJ7NT8CJgPd9pQKiTrIrQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112058; c=relaxed/simple;
	bh=LqS5Rq8kqBkSYWftdfGUiMrziCug3C+AFVKjJxayJbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yu2Fvquv9xfY9IyKDK41HJCI9y3KxemxVeP4q4r9wfrWlOFGLH7bxxZTDsvlklYfGf4f61V1xwcxRG6Cc/pu2i17/WzYCo0Ji3ZkZqOCf+D+/sgX3HRlmwAzNi6ujdZAvXAqg+bUlzN1QmvHcyFMc80WCFE1W1SYsQjx0TPJoiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XCfLZQoN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XCfLZQoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IIewZwGhHexGWo
	EzRV5MHmSDBZj6lOLvpL2Y7HwaSYQ=; b=XCfLZQoNLLkTwvTQEEDa7p2mYTXzKp
	7A7DpeDFG5tK/wqiE6uScXKHU3Oe0lpSeLgzzyO5I8lY/dc6QuP9brgWFPLW/uCl
	hV4Yk7NNPoSM2Qb7+xPhtU/hO/vd2v1sz4Dk+s6be2jQ2rY+hyvJ4vKAn6SOlQaE
	fknHOZbpTxmrBdL+QRZltVln20k7SjNJR4lhdHa3480Is073rOnGPcQoF4FrWE2w
	bFwJSd+Uj5cj7U3Al1JglsKuTyQcEP0fbkGjwlUSZebjI+Miw2THCZAZsHyuwt0G
	xY+eMKP4RN90SsBGpe+x69fIQadQPgO3W7nal6LZ41yV0EoZ/6bzNrRA==
Received: (qmail 733210 invoked from network); 13 Aug 2025 21:07:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:07:34 +0200
X-UD-Smtp-Session: l3s3148p1@Ix993kM8XMNtKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (sch56xx-common) don't print superfluous errors
Date: Wed, 13 Aug 2025 21:07:28 +0200
Message-ID: <20250813190728.3682-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog core will handle error messages already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/sch56xx-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
index 71941b1bb573..98e075e54e9d 100644
--- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -544,10 +544,8 @@ void sch56xx_watchdog_register(struct device *parent, u16 addr, u32 revision,
 
 	watchdog_set_drvdata(&data->wddev, data);
 	err = devm_watchdog_register_device(parent, &data->wddev);
-	if (err) {
-		pr_err("Registering watchdog chardev: %d\n", err);
+	if (err)
 		devm_kfree(parent, data);
-	}
 }
 EXPORT_SYMBOL(sch56xx_watchdog_register);
 
-- 
2.47.2

