Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D9C70816;
	Mon,  4 Nov 2024 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735309; cv=none; b=ucjX/36LvDUUwU7bGM7ZfXVtCREYsPNBDOfUzmn2LRD+cteOYCk9e8Zy+b0IuvmoFiWcFnStsZ1mAXFhJ2ZUC8sXDiqA3juSJfY+IR8FCCNaN5uFCIFgAZgExZigg7j22T4xislsr9kAmQtaM17AQtcbISpC4Nlvkr9O2EEp8XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735309; c=relaxed/simple;
	bh=bggjSsff92I5nfqkHZKLXAtnYfyMCNcWpoDAFa1s/UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEJ9YdXp1mOaxNGJ7pyC0PlGvNJSJag5RZABomuq1KfH4SUpa6g4HJD3TyllF7njFw7vxejJz4R9lI0PQcM7pqJ7/cjaRGPEOJSWeCEYtDVS2dDaKMh+HgrlV376bVYR8civyCZNRuRFRaL8thMnsRYVfYTE0SGWMENA0oaNUoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lsLqCTsY; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lsLqCTsY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FC3C6000C;
	Mon,  4 Nov 2024 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730735300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWKzQLDi1P0e2NgDvgc4yHfOyzr35Ho5+wgbJLaL+w0=;
	b=lsLqCTsYOXiqpGyaY0s8b0IrYsMHGrgefc5xY3Zp8Gu+0j6Vqa5EQxYSTBUZN3Y7Ruw58a
	ZfCqd3fqTkEsv6EJf0kH0F7MGpzbm6cybdT4hmMr5X44csOQYGKg0mig1G8C3A1BtBS3fr
	jyXAYkrY6ONkKfi/r7EVXVxIc+G2+DNHI6q1fBP/cpNUBehwiy0E7GCfsqm2a52COAM7lH
	l7J5DbKpS/P3d/38dnGUgai2Mw+Fm6yphsxQsBxf0JlNPON3NiFDbrErsPAxvGDAXrRZvd
	bCmxWJUUfNycGGq9MSws1egP0OUB9CtbFnYKFrlAd1+IPULLjDENoZeuvKRcaQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 04 Nov 2024 16:48:08 +0100
Subject: [PATCH 2/2] mfd: cgbc: add a hwmon cell
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-congatec-board-controller-hwmon-v1-2-871e4cd59d8e@bootlin.com>
References: <20241104-congatec-board-controller-hwmon-v1-0-871e4cd59d8e@bootlin.com>
In-Reply-To: <20241104-congatec-board-controller-hwmon-v1-0-871e4cd59d8e@bootlin.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

The Board Controller has some internal sensors.
Add a hwmon cell for the cgbc-hwmon driver which adds support for
temperature, voltage, current and fan sensors.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 93004a6b29c1..7cc2872235ac 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -236,6 +236,7 @@ static struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-gpio"	},
 	{ .name = "cgbc-i2c", .id = 1 },
 	{ .name = "cgbc-i2c", .id = 2 },
+	{ .name = "cgbc-hwmon"	},
 };
 
 static int cgbc_map(struct cgbc_device_data *cgbc)

-- 
2.39.5

