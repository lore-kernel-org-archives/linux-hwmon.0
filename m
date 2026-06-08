Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534DF3DB32F;
	Mon,  8 Jun 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932233; cv=none; b=jBrvKpdb148RbGRWfHL34N1cRNhVpqpwZyH340yaxEv11O7pwfA5ixwA9NA4e2GFg6P5nkad48fgsHg0nWX4lMA50diwKNozRg4Jd8hjeRDlmHPRZByZM7JHK/EEchUXC0mdO4j7MiaSuwoLkJ9eIE7hJfbIb2WCU8+3n6/8VPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932233; c=relaxed/simple;
	bh=6iYnBDV4iVcwL8NFuxUb1kTuavbOZffQAAOs2IsNims=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MRXSymtIi1WXZSqRRHy4gBoIFMJRxPJY0Dy55ud8hvmPqtcp3RsaM5Jt3wg4EdVIIvK2LOS2JH8oJzD+wZRTz95J3dN6QaMy6RNkEiuWHJyk7ttVaLKvJMAs78Rj53G/5bcdin8LFaBjYngtZktO6zDe9Wqyo9JPbExBuZayBuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h/KNA8xc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h/KNA8xc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F3FB04E41766;
	Mon,  8 Jun 2026 15:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C62AE5FFB7;
	Mon,  8 Jun 2026 15:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75E5C106A1C15;
	Mon,  8 Jun 2026 17:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780932230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HYgzaOxcRR5g0TGzoKhR3EdQSwmVxtF3AnLJdNyukXk=;
	b=h/KNA8xcV/hPO7d5vbq7Y8bY8Im4qvAwVsiGbd4CFY9CYhMXrj/+UdmfqE4YSRbPzyZck7
	gn/Yv6QG9B2GOX8YCVSJ/IzvujRnEI5weZ47S0YiZJmACFqWcKGrbxxic9XFctTh/+y+0+
	Mo6vpsJG2TgdMJkMWUAFoS/OyPM2jtCtab0tY7W0VFqk/JJPM2ak8vFiq+NWZec4mWQcZL
	3BiEc9LUeNNHLpS5/hnzL/CpLwkPq4N0pbFHQYDyS+pUlVe8/nluPFVGSBOwpP9BIWr5q2
	zkuHLs0TJXD9d7ZVPN8KZpfGdxBf8WftNay2HIttS7BRawu0nMZpQHvq9OYxng==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 08 Jun 2026 17:23:43 +0200
Subject: [PATCH v2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jmbc3QVpq48h6GBS1TGKOtaSvRE
 O4u4N7lS95/f4ZMiSnDuZoh0cSZY1hBHipwYxcGEtyvDBJlgw0q0fXF6EYKy6HnMGRxIucVKoM
 aPayzZyLP7z15bX+cX/ZGrmydzRg5l5g+++dUb96f/FQLFAprhdo6b4y+2BjLncPRxQe0y7J8A
 XiP5sjEAAAA
X-Change-ID: 20260603-adt7462-bindings-5ecf3037040f
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

From: Kory Maincent <kory.maincent@bootlin.com>

Add of_match_table to add support of devicetree probing.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[rgantois: Removed of_match_ptr().]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
Changes in v2:
- Dropped usage of of_match_ptr().
- Removed redundant device tree bindings.
- Link to v1: https://patch.msgid.link/20260603-adt7462-bindings-v1-0-301304bcf774@bootlin.com

To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/hwmon/adt7462.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 174dfee47f7a7..f935c3477b364 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -12,6 +12,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/log2.h>
 #include <linux/slab.h>
@@ -1814,10 +1815,17 @@ static const struct i2c_device_id adt7462_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7462_id);
 
+static const struct of_device_id adt7462_of_match[] = {
+	{ .compatible = "onnn,adt7462" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adt7462_of_match);
+
 static struct i2c_driver adt7462_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "adt7462",
+		.of_match_table = adt7462_of_match,
 	},
 	.probe		= adt7462_probe,
 	.id_table	= adt7462_id,

---
base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
change-id: 20260603-adt7462-bindings-5ecf3037040f

Best regards,
--  
Romain Gantois <romain.gantois@bootlin.com>

