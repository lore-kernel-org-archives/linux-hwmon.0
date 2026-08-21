Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0303F660F
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 05:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288893; cv=none; b=LMOBNtNIDdKRe9H+zoP5uYo/8JTwuXVK4j4y3fX2+gEY5EKIGfknCnMwDynXIpCEbntTIxLjt27grcwtDvEBlWfy+dLlfWi40CZ6U2FFKjq2PfuZLF5jjMmRuw0De9bFJnkRM3yA3CkhHndQKnghy5O5gc27P6XY6uSggZQ38qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288893; c=relaxed/simple;
	bh=apNHdOz0D6kP5ZwoRNHwy771wtssNv25FDf7x8TevRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBo3fUXsjUqdDcKZQ6JctQcP1ZB6S/JPmHLfZKFGUodb9QcBrtcH2JGp6oEL3JgOKy2yAE7zCoQxw5fi1soo5kzOnU38lG3zc9cJHTm0ixgwKe+U+pe1hVGCTuvmeWCr7Ltj2kkEnCa19DoHdAxjZfPjcmVEx/gEodKzmNxaqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpN+g2EW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpN+g2EW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso489761a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288891; x=1787893691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WCOtfN6KHCY6hxhtBY9n31IZgr7FKt2IYgOpmlpkDM=;
        b=TpN+g2EWGbV7XYVS5IuKUehsB/S9yMLtn44FVe2/7a93jWZNscRd8AlqO6L5n9XIJ4
         a7/vp4mGIloi+LcXi7HmNQvrD3w9sRyzTOHOPLab80OlKdoa91wyT/XAI0OXYOmErQ7Y
         2Qfj82ieuAjeDPibV9KIRvD+qFlXE0Mc0o8snqrId1WElS1wJKwX3tXfC1TirtciPV6t
         vlWH/IKG6Dx9BVyZmobBEprokjqMVhwl5pWoZXq5viMxEohigyB91QxmebtjJUMC8mGJ
         vJPqR78FtgwWzi+a4jTQJcRkDasQd9Z3Nx9p2ZJY+ASCttOEjJiqGqQq9X969X/d5aAn
         ik4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288891; x=1787893691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WCOtfN6KHCY6hxhtBY9n31IZgr7FKt2IYgOpmlpkDM=;
        b=jhEVah5GlLiWvO5kKQ49uGLOB6jg9nb+j0c+KEJEXRn84pmrZIbLtx+kn4k395+kYU
         WisQ766xd4+VxJFkwkeM3LwUPS9bhI2OY/77Iey5IvzFo8feFb5j5n8VbRFoT9LPla40
         2OPT/6ZlcYS2Vy47S7L8ES+3CgCZ9b/IliOmcKuiLZASOjTUQ8qyZcpcuRjMqsp8HkkB
         IRV/zUGdRgTAbj5BCbQvJ3/XQnVRBcXV5vWxPu2pEo2SLgXp/niOiT3b1F0CHvLZO+TI
         NbRSceueUAqD+FQGbxtodNJ/e48OQx69mg6L8seZGGToURgNNR9iS60mo7b9RBjN7jvy
         C4cQ==
X-Gm-Message-State: AFuF++m9NP3pEBPA/tlXR+A263gfyFnRdcyOktDVaQTiV2xRVFmy/guK
	i6E7UwV/EP/xP86bqNcJwdEMIOhLNOeK+A9cslwKJOEz2zBLjIk5yspHqMaAwg==
X-Gm-Gg: AR+sD11Gj031fistAlfGpVYlvHTft/UMzjFi00fvgYLKQwl9ojj1LnQBqrS0rAdYm0C
	pye9y4TjXQwtqmpDEVBTFidrAhO75RFbVTQ7yBC5LBo6QSktNZZyUuvuZ4wimhcrakLLuYfUHjk
	VT+3KYvS8d58WjES1f+4SC9RZqgMQ0KzLyhgvzChiLsMGkeDlFXLCdQ1ewrbRx1QVKHcxVYnXfM
	HNA4Oz0ZUDT4IzOGbpjMRQGFkcz+/ntzW77+8mjpa74U8k7RPBcq2y+6RaaAKZ0bzGeucsjJV54
	GyJsQLJA1CjCejpNDw/+CXwNsDBasI5Eq1wvSR+8hpNWsqzTHIx+Kc8QYGaryhUCjKQpH1bEMYt
	/fcSEuNDsULMqKgR1ATiCb7/EkRIRcM82RPtjk8lTcD54/IDBKrAk4or3am4klHAQRAlZJkF24l
	DeT4xEU3n+oaeEbWvRVYv07EvTb9HlfHCXbex+arRadCgB0bJ8PCBxJ96ZTBeL2puCs3uy4epxf
	mVmGW/MPTxO
X-Received: by 2002:a17:90b:1b05:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-395c3502d8emr5010695a91.7.1787288891444;
        Thu, 20 Aug 2026 22:08:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm34770413c88.13.2026.08.20.22.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:08:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Fix potential UAF in pec_store
Date: Thu, 20 Aug 2026 22:08:08 -0700
Message-ID: <20260821050808.667204-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

In pec_store(), a guard(mutex)(&hwdev->lock) is taken. If the chip write
operation returns an error other than -EOPNOTSUPP, the code jumps to the
put label, which calls put_device(hdev). If this drops the final reference,
the device is freed. When the function then returns, the guard cleanup
function runs and attempts to unlock the freed mutex.

Use scoped_guard() instead of guard() to avoid the problem.

Fixes: 3ad2a7b9b15d5 ("hwmon: Serialize accesses in hwmon core")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 41755910a25a..3e65fc6d25eb 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -371,18 +371,17 @@ static ssize_t pec_store(struct device *dev, const struct device_attribute *deva
 	 * handling is not required.
 	 */
 	hwdev = to_hwmon_device(hdev);
-	guard(mutex)(&hwdev->lock);
-	if (hwdev->chip->ops->write) {
-		err = hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chip_pec, 0, val);
-		if (err && err != -EOPNOTSUPP)
-			goto put;
+	scoped_guard(mutex, &hwdev->lock) {
+		if (hwdev->chip->ops->write) {
+			err = hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chip_pec, 0, val);
+			if (err && err != -EOPNOTSUPP)
+				goto put;
+		}
+		if (!val)
+			client->flags &= ~I2C_CLIENT_PEC;
+		else
+			client->flags |= I2C_CLIENT_PEC;
 	}
-
-	if (!val)
-		client->flags &= ~I2C_CLIENT_PEC;
-	else
-		client->flags |= I2C_CLIENT_PEC;
-
 	err = count;
 put:
 	put_device(hdev);
-- 
2.45.2

