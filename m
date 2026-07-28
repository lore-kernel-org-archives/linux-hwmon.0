Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D9F157A5A;
	Tue, 28 Jul 2026 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208299; cv=none; b=eNkJ/uUz7EVZ5XpsnP3nrD36R80B7+u0ImQ/rm6R+FUovK9j7+8djmXkWVs+lo3dnwX5GJRYhxK16A0ZxZ21DjF2iws4zgNF/Du58b2xKOVmbznKd9OKYFnp5Z8yb+8tI60PeWJP7xHUIx+VxN8fMjLs0MKMw7dJ/bqvU350DSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208299; c=relaxed/simple;
	bh=PdoihRm1e7vxvvPOOFVCVQKhrcvkQ8ZgWThDglDacgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0Eb0MU3ZQ/vR/iS1IVFJdVozDl6NG9vnUUB5SortbK8+fLWCggEkegtGijbZtoC3AbDRqAdf4q/1gJjIxy3mKnMbM/GFz8GRSjftYYEYJmIvfkxJlqiKiUQ9cU6dm/hp+F6WFtMa21xwMqQ9+NvtqiipB4Yr0E7QgHDF57YLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seanlyon.dev; spf=pass smtp.mailfrom=seanlyon.dev; dkim=pass (2048-bit key) header.d=seanlyon.dev header.i=@seanlyon.dev header.b=pZ6/Owxu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gCaSapKR; arc=none smtp.client-ip=103.168.172.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seanlyon.dev header.i=@seanlyon.dev header.b="pZ6/Owxu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gCaSapKR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 5C2111380110;
	Mon, 27 Jul 2026 23:11:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 27 Jul 2026 23:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seanlyon.dev; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1785208296; x=1785211896; bh=SqQ2CsDCggvfgd4Lrhhai
	B509sLjt1YqIswq0JsSXG4=; b=pZ6/OwxuMe5/4MNgzGXGa6BiXwXkSO2azFbuU
	YvlTKohwSwGrpdRvxpUHvS/+GVEYYBnH25ZiOeKBTgUZGAm+gxK0XIysb3BE3yFs
	7/Ycmc0+CTMeZ/nuBkiD6Mcb8ZZww3HK2tGo1wq3lluZWOiSWw8abMXfG/MG1JVV
	AX7v/tjJRX6UFlfoV2a74+XJyDjluC2VF6TlUHT13ZcI0qmXPYYzWolPFNBHn/VP
	K33xBKxBbc1ipOl3KhZOPj9QQc69vmYArzW/YNKJPexD0KQxRIYwzudmHtO4rk4C
	uDC/i7pH0iOZrX18R7/xZ3iv/DCL/Dye2vS8mkqYjX3F+JzCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785208296; x=1785211896; bh=SqQ2CsDCggvfgd4LrhhaiB509sLjt1YqIsw
	q0JsSXG4=; b=gCaSapKRq+VAwVq9R6kKGrg9AGS2SJmqG9f2Z3lTuBg34f3yZNq
	wuz76/J/oURg61cxsRJfn8se70qP+/UnSyjU+0EcfyaSMKhRqN5HkRgClJX8IpLE
	4SkYVCp0RADCBRLRG5b7pYXOdMPUAwEJ1MEIqGicN5TEeJQmJlSY2ThKMMFPnTFT
	iFBtECNIwjUAJ7/UON6nBJBiISLbDHJMG9SZGSzUfQPhaXz29eGwQ/31Koa/tblB
	26rigcYQ/f1opYna9y6ImcuisMcRo9sPrvdlVgi9THVmWED80IjsiW2EaxQ+FiHA
	jUT0koiII9o+IAOk0uO+EGJmiBLkduRi+bw==
X-ME-Sender: <xms:5x1oagOSEuzEMG1Dn1gAFOtZawE9EU39kVRM-FmmRgnVokPkTtJRwA>
    <xme:5x1oanaTfHkIWQmI4jkI48K5j2V4ZiOuAGfsA4v80waMe-2TvsEJdlc7CXKYUwRBz
    pfE7weFaRBkbUwAGuE3R9n6Z9dt5eliEsbhBkbN6FuthgK5ZIELBAg>
X-ME-Received: <xmr:5x1oan_JVbTn1nAwHChDwWhAnwgksHhEK7aV8SC7CWmIE0BBBvX5gtPFYAsj7vQtIP9tGgC0QGRAqDVpXSlENqIRJ_3sKsByPUtiJigs54XPLnzxkNpfaw0ha3Vx>
X-ME-Proxy-Cause: dmFkZTG2RvY6Y8e3m4BKqz8YmHvWgwre9lz/IhRRTwVPEeTHZ5P6tPkwcduRS/R+7WB3pR
    FZyhCchHq7t9hgO+/eR8lFd6I7rvG1HpRrIpPZLQ6ismvFvxDrx9ZA5XdThHg2Xdgi0S1G
    JkvOe6dHS3/w7RzlsPGCvQQ/1MqBmItNENFDO4Fr+BL+kaIHARdnZINEldPKIQEH93nYPJ
    G2NHycNnOXPH/WnVZ2j3W4GKSNEv0igUz+o6t1wM0K8y+MwMLIQahIIYi1jcfGW4IMaX6w
    nimyZOr2NjQBYkbiz6McF6ahp2lF5WjogAYAYZZcKsXOgxAUpeRlWYtabx72NZ7gD09bQx
    eENHQ3JZcb4jyOEQrY43I8PBwd7ZT4THQyWs/fqMf9OxDLvtZM+c025pJrfnKOT0RH+X5d
    KCItN+OdOhn53fSgVt73Nj70Zk/LGoM4TMr2K3YAjoNY1/ZvwnaVAKA3XyaZd5O/BbiRmq
    rOfXY5wuGNe5SrpT/VA8iTCRso3N9ivqn2QAitlEJ71t184w9BxIpHaE2YlqmUsCA/16Dw
    ulVQTWHI5sUT5DltHbbAsQdgIK6q4pRGgAoQQXs6H3iRTEm4LRR17awYfnsRZst5qwRlVo
    pJVNFw4FuWqcvTkNdL9OJhB7d4R2sRp1q91T3xCVgblNjKIEUwwcF4yfUKZA
X-ME-Proxy: <xmx:5x1oagTMbjYR6gwpJ_6iG0CPKeE5AjYFdJG7D20oxFdRRVdbX50F5Q>
    <xmx:5x1oapeuzreUHeRh9b88dzHD1FXU1lPLoSng3tpStzD24qPADjxRQg>
    <xmx:5x1oaqQBhQmFkb7q8B4MTdVJI6KfMJVLMUhr7GxpO1bRDSJ-J1u_fg>
    <xmx:5x1oatLiaKTUpu-PkwaG9h8wv91dCJy0NLypokD83IzzYQRORI_gYg>
    <xmx:6B1oarIIW7-lQdNUPiWEx-XGyh3xKCQ_Uu72fnvH1PzOCa55mdhX7csp>
Feedback-ID: i07c64b5b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 23:11:35 -0400 (EDT)
From: Sean Lyon <sean@seanlyon.dev>
To: Jonas Malaco <jonas@protocubo.io>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Sean Lyon <sean@seanlyon.dev>
Subject: [PATCH] hwmon: (nzxt-kraken3) Add support for NZXT Kraken 2024 Elite
Date: Mon, 27 Jul 2026 23:11:24 -0400
Message-ID: <20260728031127.26553-1-sean@seanlyon.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kraken 2024 Elite (USB ID 1e71:3012) is protocol-compatible with the
existing Kraken 2023 devices and works with the current Z53 code paths.
Add its USB product ID and map it to the KRAKEN2023 kind.

Tested on hardware: liquid temperature and pump/fan speeds read
correctly (cross-checked against liquidctl), and PWM control of both the
pump and fan channels works as expected.

Signed-off-by: Sean Lyon <sean@seanlyon.dev>
---
Note: the Kconfig prompt and help text currently list only the
X/Z-series and do not mention the already-supported Kraken 2023
(standard and Elite) models. I've left Kconfig unchanged here to keep
this patch to a single device addition. If preferred, I'm happy to
send a separate patch updating the Kconfig text for the 2023 and 2024
models together.

 Documentation/hwmon/nzxt-kraken3.rst | 1 +
 drivers/hwmon/nzxt-kraken3.c         | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/nzxt-kraken3.rst b/Documentation/hwmon/nzxt-kraken3.rst
index 57fe99d23301..ee2d5d535fe7 100644
--- a/Documentation/hwmon/nzxt-kraken3.rst
+++ b/Documentation/hwmon/nzxt-kraken3.rst
@@ -13,6 +13,7 @@ Supported devices:
 * NZXT Kraken Z73
 * NZXT Kraken 2023
 * NZXT Kraken 2023 Elite
+* NZXT Kraken 2024 Elite
 
 Author: Jonas Malaco, Aleksa Savic
 
diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index 05525406c5fb..a185e8b27532 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * hwmon driver for NZXT Kraken X53/X63/X73, Z53/Z63/Z73 and 2023/2023 Elite all in one coolers.
+ * hwmon driver for NZXT Kraken X53/X63/X73, Z53/Z63/Z73, 2023/2023 Elite, and
+ * 2024 Elite all in one coolers.
  * X53 and Z53 in code refer to all models in their respective series (shortened for brevity).
  * 2023 models use the Z53 code paths.
  *
@@ -25,6 +26,7 @@
 #define USB_PRODUCT_ID_Z53		0x3008
 #define USB_PRODUCT_ID_KRAKEN2023	0x300E
 #define USB_PRODUCT_ID_KRAKEN2023_ELITE	0x300C
+#define USB_PRODUCT_ID_KRAKEN2024_ELITE	0x3012
 
 enum kinds { X53, Z53, KRAKEN2023 } __packed;
 enum pwm_enable { off, manual, curve } __packed;
@@ -927,6 +929,10 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 		priv->kind = KRAKEN2023;
 		device_name = "kraken2023elite";
 		break;
+	case USB_PRODUCT_ID_KRAKEN2024_ELITE:
+		priv->kind = KRAKEN2023;
+		device_name = "kraken2024elite";
+		break;
 	default:
 		ret = -ENODEV;
 		goto fail_and_close;
@@ -994,6 +1000,7 @@ static const struct hid_device_id kraken3_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NZXT, USB_PRODUCT_ID_Z53) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NZXT, USB_PRODUCT_ID_KRAKEN2023) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NZXT, USB_PRODUCT_ID_KRAKEN2023_ELITE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NZXT, USB_PRODUCT_ID_KRAKEN2024_ELITE) },
 	{ }
 };
 

base-commit: 858071a1ca5f9a3330b4559dab41565086ab4862
-- 
2.55.0

