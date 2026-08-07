Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C195C42C4E8;
	Fri,  7 Aug 2026 20:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133192; cv=none; b=LGuw+8mOlxq3JT2WyfcJFoRA7UMCKtvjUYhvNqEIOhlCUKhQ7JejOFrsNCumrhHKtmm5gtg9rDEJkpD2cuySUZytfBxaGIkMv4k8k+wH7GgdlH/iYfys+tZixnhK6qNGOczat03d4uT/pP+MuuBljwEIhussgKEuNpCdKQNKoEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133192; c=relaxed/simple;
	bh=LAESJVcN2vzP0XvbMzZ5Si/UoHtpVV60aypYJvi4z38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GZFy1YvQ6iq/eYSeKP2h6/90chmBwiGpbjI6RsaEt+I9tiI4XUXKDd74anurGOeynZ/kEkgWpXZbrUGVj/Q8D7hr9AQjM1MCKvLncHItrQyFoXlyVkQSJ47tCni4l+l3zalWuMCVrSQSlHD9Fqa8Xi/PceUcCOF7sIZa8AZXnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QJwPgXRY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QJwPgXRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1786133179;
	bh=LAESJVcN2vzP0XvbMzZ5Si/UoHtpVV60aypYJvi4z38=;
	h=From:Date:Subject:To:Cc:From;
	b=QJwPgXRY2pfwAPy146tv0b8C2twoiPBt1sAMDWEInp9EOZcvindDgjlyUY52jJOho
	 1gvUBYuDwOm6GuttD4Az5nH/QqoETIAQgdjYbxKXcR5us92PV+9S/9p9+bCH74E29w
	 0Mi3o6576qYvpXm3QBTRT84oTmDIS/3QF/7mMegQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 07 Aug 2026 22:06:17 +0200
Subject: [PATCH] hwmon: (core) Constify PEC device attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-sysfs-const-attr-hwmon-2-v1-1-d16341379a97@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NSw7CMAwFr1J5jaUQqhRxFcSidV0aJBKwXT6qe
 ncCdDnSvHkzKEtkhUM1g/AjasypwHZTAY1tOjPGvjB454Pbuwb1rYMi5aSGrZng+LzmhB7rXde
 HOpCj0ECZ34SH+Pqlj6c/69RdmOzbWw3h+1Q+bdWW5QNdFDvPkQAAAA==
X-Change-ID: 20260807-sysfs-const-attr-hwmon-2-43bd646c0c67
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786133178; l=1768;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LAESJVcN2vzP0XvbMzZ5Si/UoHtpVV60aypYJvi4z38=;
 b=wXk1wwKwIzpw+i7HsEDDXEf0yyrn+nLuQ+m6IVGNiYoZ0U0/hRMcFN9j49Gx94jQo409foU9n
 s1L3rd8+f5ZDHnb+Sj81beOWEQJlW/iSp8tabBmadtoHwK3UAX0PqE6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Mark the attribute structure as const, as it is never modified.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
This should have been part of commit 5d27101b6f1c ("hwmon: (core)
Constify device attributes"). If you do a rebase anyways, maybe you
could fold them together.
---
 drivers/hwmon/hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 90ceb815f43e..3297ed6daec1 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -341,7 +341,7 @@ static int hwmon_match_device(struct device *dev, const void *data)
 	return dev->class == &hwmon_class;
 }
 
-static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
+static ssize_t pec_show(struct device *dev, const struct device_attribute *dummy,
 			char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -349,7 +349,7 @@ static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
 	return sysfs_emit(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
 }
 
-static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
+static ssize_t pec_store(struct device *dev, const struct device_attribute *devattr,
 			 const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -390,7 +390,7 @@ static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
 	return err;
 }
 
-static DEVICE_ATTR_RW(pec);
+static const DEVICE_ATTR_RW(pec);
 
 static void hwmon_remove_pec(void *dev)
 {

---
base-commit: 611f4cbac429c09a7db4bb2aebf64e3423109639
change-id: 20260807-sysfs-const-attr-hwmon-2-43bd646c0c67

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

