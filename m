Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86F7271A6D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772479772; cv=none; b=s8hHqHD44iWzHU7jWU8i0918QLiNKZSzUyVZSqqAgOoV56wITEhVyo7glX2zAUV8oifBtr+Mz48SeEjoNhBHSUkm1SlF/x68tGIAVbh2ZTjeZp+Rxha50J+IDT2+v6+Rwie1Wiepq8kclil1ugG+6uwX3zdPDudnq/JcpH63Iuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772479772; c=relaxed/simple;
	bh=4zz7uFtsu1LJ5kukubEeSBLNCO2QNr5MOAVb1kpNZj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYXyLG+8pqI19hSGZ95RJGaat7ydD8Yxbjki4ce64OTChpuhFDHQNMZ/NixWgHXzZG8DABFJ1LTbwjuK3eGPU++GMIQCpUu2VBMzvErh7HgM785466WBv85xYgwX6Vi+by0ugvM2uB5aqK8sh807YUetef2HM7gQtxf8ERaXVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=lSBE/29G; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=K1cgP9dQ; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="lSBE/29G";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="K1cgP9dQ"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=lSBE/29GTbvtpiSor90w1GIaPBMHRXMIC5E4VYULVQr0hoQjMGMr9Ri0/mkGbBWbuL7e0Bh1nuk2+wba6McwgTxXSe082K3GG/3SpLB3USjOhWah/0YGe+k/KTbkDf9l5tdK1aLkU5cRSYq9iG2wJnJH7QvtSe7eYMV4tb1CcOqwtSXCFxwqcyCS71G1VAtP7AT7s1/MyVSv2ACwA3br4fYxWYvepqTrX1mkvz5Od57kmTPTSXPZR/oJnr++8zfgS/sDqDoH9hYHeXMkV4MrzjfT/ilQiyj9N29JPO4u7pRib1IJtvqv19dRpqdJVQYc4AtWur75/nB3mEzC7q5MZA==; s=purelymail3; d=turingtested.xyz; v=1; bh=4zz7uFtsu1LJ5kukubEeSBLNCO2QNr5MOAVb1kpNZj4=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=K1cgP9dQ+yi+ZvgiJ6AoqLarA0MDt4/kRbFUErVPwzm6WcnbcJh+0P7i/yxeHmHH062fvBpnrZZZxjWjoULffOtpx5pVeerzt6kpH1C+ickKXr3bZFzCXBDG49rk5zj75cCXv7d3TdbEn8NmyyZm1RMt/N5ZXlAsLcakASVOJ6BrfMjjFLmDoXzWBkhAzXXxXQkdzRdBU4KQzZpQLIvRh6bUlTWm7IxgHgmRaJvhy8rDt4VvQvSzypW5ox+2IcigZMwullbJxeACp2aMNYaiK7ZLx0vPtrDeGhYWLC4gLf5Kj8CtDwzYuqhobNQLnar/VGgjSewxfUrXEzYlUf2T9A==; s=purelymail3; d=purelymail.com; v=1; bh=4zz7uFtsu1LJ5kukubEeSBLNCO2QNr5MOAVb1kpNZj4=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -8130386;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Mar 2026 19:29:29 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH 2/5] hwmon: max31722: use sysfs_emit() instead of sprintf()
Date: Tue,  3 Mar 2026 00:58:13 +0530
Message-ID: <20260302192813.10625-6-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302192813.10625-3-tt@turingtested.xyz>
References: <20260302192813.10625-3-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Replacing sprintf() with sysfs_emit() for drivers/hwmon/max31722.c since
it is the preferred helper for formatting sysfs outputs and preventing
buffer overflows.

Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
---
 drivers/hwmon/max31722.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31722.c b/drivers/hwmon/max31722.c
index 9a31ef388396..6c5c86c75c36 100644
--- a/drivers/hwmon/max31722.c
+++ b/drivers/hwmon/max31722.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
+#include <linux/sysfs.h>
=20
 #define MAX31722_REG_CFG=09=09=09=090x00
 #define MAX31722_REG_TEMP_LSB=09=09=09=090x01
@@ -56,7 +57,7 @@ static ssize_t max31722_temp_show(struct device *dev,
 =09if (ret < 0)
 =09=09return ret;
 =09/* Keep 12 bits and multiply by the scale of 62.5 millidegrees/bit. */
-=09return sprintf(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
+=09return sysfs_emit(buf, "%d\n", (s16)le16_to_cpu(ret) * 125 / 32);
 }
=20
 static SENSOR_DEVICE_ATTR_RO(temp1_input, max31722_temp, 0);
--=20
2.53.0

