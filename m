Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB45314D07;
	Fri, 20 Mar 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017812; cv=none; b=NZO5cWpYTOMaXj7YdSnm28/p5hRJURzF5x1q3a2yvarmd6q6SFM32aiNsf3UrX9gWr8+pmLF3DsXNIPKzWxX/tiH4L48sXecabt9JMRKwikOGI8gnOmkxJbIOmDrcT08nqJ4HcXeO6dDeAeXALxTw8zoHZnEsPD2A9W8fFXf3kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017812; c=relaxed/simple;
	bh=aZOolxXmyzsUWTVxIa7mFru8XwRtRMeQrDDY2IpVfaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3cEDTCYB+Yu5ZTl2ZNJ8aMH2erV5WY1oo6GDhujatZw1tWXMjL4nndi1Q9LAd7oZoaH2FuBBGg/oW3W4O12YCIcgSSpmeTwkkZw3tixy+QkVelIeboJWFOnDo/jiJzUlfLldc9V4MWMlXb5OmtTcgv2IXfCl0X0IWYCJYQdjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thehoffs.at; spf=pass smtp.mailfrom=thehoffs.at; dkim=pass (2048-bit key) header.d=thehoffs.at header.i=@thehoffs.at header.b=yZ4B0EuI; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thehoffs.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thehoffs.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thehoffs.at header.i=@thehoffs.at header.b="yZ4B0EuI"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fclg22KPvz9twg;
	Fri, 20 Mar 2026 15:43:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thehoffs.at; s=MBO0001;
	t=1774017806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvRDEAPoEj+mOyyGDFsSFrHBx6F21WwSFqvNkUqGIWE=;
	b=yZ4B0EuISR1EOVXXFEzdQTpSPZGfDnwc+AeWHiy17HWrGJwGnm0rx9q8nZPe3wNq43fVhC
	ZMaVRkBCu15DpVh80kylmUcJE/5VoBm4FBLgoHMDZNbMr4b4BlE4qn4VkwHqMXBiKbks3/
	/M+FcNa6VQ5Qz698ATAc9imds01dweSC+e5DNQli89AhTH47OcO8UM7V+8eEGMrM+1M7YH
	u9AHV9idDF850f4EzWazPt6v+0qyx8ka4eCo9woCLxSSKmsKsS2SAFtEkF2JWi4nMPoVYo
	n6CwDuzDPNRHYuqOAML0WkcCccu8LTwRgro4TRWAHSSS0CsO4tNbIZFdKdgqQQ==
From: Markus Hoffmann <markus@thehoffs.at>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Markus Hoffmann <markus@thehoffs.at>
Subject: [PATCH v2] hwmon: (it87) Add support for IT8689E
Date: Fri, 20 Mar 2026 14:43:23 +0000
Message-ID: <20260320144323.4870-1-markus@thehoffs.at>
In-Reply-To: <20260309223103.175443-1-markus@thehoffs.at>
References: <20260309223103.175443-1-markus@thehoffs.at>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
PWM frequency 2, six temperature inputs, and AVCC3.

Signed-off-by: Markus Hoffmann <markus@thehoffs.at>
---
Changes in v2:
  - Add it8689 to the it8620/it8628 GPIO pin multiplexing checks in
    it87_find() to avoid exposing ghost fans, garbage tachometer data,
    and non-functional PWM controls on boards where those pins are
    multiplexed as general-purpose I/O.

 drivers/hwmon/it87.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5cfb98a05..0dcf6bbac 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -16,6 +16,7 @@
  *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
  *            IT8628E  Super I/O chip w/LPC interface
+ *            IT8689E  Super I/O chip w/LPC interface
  *            IT8705F  Super I/O chip w/LPC interface
  *            IT8712F  Super I/O chip w/LPC interface
  *            IT8716F  Super I/O chip w/LPC interface
@@ -64,7 +65,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it87952 };
+	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -162,6 +163,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
+#define IT8689E_DEVID 0x8689
 #define IT87952E_DEVID 0x8695
 
 /* Logical device 4 (Environmental Monitor) registers */
@@ -502,6 +504,14 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
+	[it8689] = {
+		.name = "it8689",
+		.model = "IT8689E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL | FEAT_SIX_PWM
+		  | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3,
+		.smbus_bitmap = BIT(1) | BIT(2),
+	},
 	[it87952] = {
 		.name = "it87952",
 		.model = "IT87952E",
@@ -2785,6 +2795,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8628E_DEVID:
 		sio_data->type = it8628;
 		break;
+	case IT8689E_DEVID:
+		sio_data->type = it8689;
+		break;
 	case IT87952E_DEVID:
 		sio_data->type = it87952;
 		break;
@@ -2952,7 +2965,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
-	} else if (sio_data->type == it8620 || sio_data->type == it8628) {
+	} else if (sio_data->type == it8620 || sio_data->type == it8628 ||
+		   sio_data->type == it8689) {
 		int reg;
 
 		superio_select(sioaddr, GPIO);
-- 
2.53.0

