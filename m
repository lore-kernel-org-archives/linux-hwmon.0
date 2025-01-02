Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A638E77F1B
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Jan 2025 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837495; cv=none; b=Bds1YgP+ne8eVU2QkOtLD5cJg1vIqiP5wcAhuVKPiFwRCHdhIviYDxzdfHQtooALaw27p8UCnUMVLq0lOARBN+ysRDiMq5oE2z8JoW1smGat8f7inpwZVTF6TCNyhoc2teosrR/TcNOXYoI+f37M8f6NZUxcv2RG+nZ5j99x00I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837495; c=relaxed/simple;
	bh=HJRq4n//ZSvKoHz+7nErKKI1wu2HaMHop+mr7rFT0FU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b04nDqwfP56QYJjkbvLbFdQ4tL+UVnoaIOlODS0r+MUqrIscVG4U4MRvbY1iZmCV+Mm/9nHR0lJx3+LD/TkJmuXc8uMVkMTD6yYTaD9lBRSl3yQas+psXJ6dHxiMqNKJtjXNGy9SvLH8aSIHA8lh0KelWQgT9CEzbpdZ7P2K8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 919E5240003;
	Thu,  2 Jan 2025 17:04:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tTOch-003K19-26;
	Thu, 02 Jan 2025 18:04:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marex@denx.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH] hwmon: (pwm-fan): Make use of device properties everywhere
Date: Thu,  2 Jan 2025 18:04:29 +0100
Message-Id: <20250102170429.791912-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

Commit 255ab27a0743 ("hwmon: (pwm-fan) Introduce start from stopped state
handling") added two of_property_read_u32() calls after the driver was
reworked to use device_property_* in commit dfd977d85b15 ("hwmon: (pwm-fan)
Make use of device properties"), so convert those as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/hwmon/pwm-fan.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 53a1a968d00d..231b3b348263 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -638,16 +638,16 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		channels[1] = &ctx->fan_channel;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "fan-stop-to-start-percent",
-				   &pwm_min_from_stopped);
+	ret = device_property_read_u32(dev, "fan-stop-to-start-percent",
+				       &pwm_min_from_stopped);
 	if (!ret && pwm_min_from_stopped) {
 		ctx->pwm_duty_cycle_from_stopped =
 			DIV_ROUND_UP_ULL(pwm_min_from_stopped *
 					 (ctx->pwm_state.period - 1),
 					 100);
 	}
-	ret = of_property_read_u32(dev->of_node, "fan-stop-to-start-us",
-				   &ctx->pwm_usec_from_stopped);
+	ret = device_property_read_u32(dev, "fan-stop-to-start-us",
+				       &ctx->pwm_usec_from_stopped);
 	if (ret)
 		ctx->pwm_usec_from_stopped = 250000;
 
-- 
2.39.5

