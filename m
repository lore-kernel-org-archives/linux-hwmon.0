Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32333DDAE9;
	Wed,  5 Aug 2026 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956677; cv=none; b=GUXHjlCk0Cu/eCXGuYQGbta5rBPz66cGdbOZ4E1b0Z8J0oGtkDt9BzdrdDknm1NGv/DYMDTFBMrgrrOw14qx4m8UKWbGOKew4C8r+n+xBEpre7zgtaTlVckzyA+UzBAECbA8SIApeUgb1g9WXIH8zpCssE9Rpa+vmCBun1KXQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956677; c=relaxed/simple;
	bh=w8HLxVeC+ACI5IzjFnRJnYUvMvL0Bb6o/OQEbZd3Ba4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPfvbJ7Jpj4pk8NPS3YHf4YzgYEi3yjiH1d7J5TPf5E1Bf9UzgjIHn+ug2L/Mf1apX/bGEUujFdwzOMaqDwm1PVKohuwmzGm7udNvhnmrDoJatpeIYCxk3XqHhJrt32eMb+Of/ltK3ssZKu/vObb+lYWs4hklmuFSWXgT3PnH9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=q0OZfGC4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="q0OZfGC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785956665;
	bh=w8HLxVeC+ACI5IzjFnRJnYUvMvL0Bb6o/OQEbZd3Ba4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q0OZfGC4ExKBIC8/EgJsmZ+Xz6IPLq1hQmnWex7IZdl7J/ZVN/eLp3bUoC28mH4Tf
	 Y1/54TlyvC2Kop3TX/ddkB1eKNp+tvrzR6ptQROz623aEqFEvTFtEtFdQ5DwfLt4uY
	 ZqClidw6v5JCzeQE/SIpFVwclQRWCeWAwoI7y67Q=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 05 Aug 2026 21:04:21 +0200
Subject: [PATCH 3/3] hwmon: (sysfs) Allow drivers to register const
 attributes
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260805-sysfs-const-attr-hwmon-v1-3-4c0cb2b290a1@weissschuh.net>
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
In-Reply-To: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785956663; l=1879;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=w8HLxVeC+ACI5IzjFnRJnYUvMvL0Bb6o/OQEbZd3Ba4=;
 b=gI/n2hpXOECojnyAsdGKCQgm0ZA07ABhe0m7QKRxJv3Op36rNg39xFhwy06TC2h/mXOsBA+T0
 SEvTztYELJoDhVSKIIGqLHwHSKH20XEjkjj4YktP67huqmY0SobhvEM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Switch to the __DRIVER_ATTR() macro which can handle callbacks taking
both const and non-const attribute structure arguments.
Allow the step-wise migration of the drivers.

Also use container_of_const() over container_of() to avoid casting away
the constness accidentally.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/hwmon-sysfs.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/hwmon-sysfs.h b/include/linux/hwmon-sysfs.h
index d896713359cd..ee5b33185b2d 100644
--- a/include/linux/hwmon-sysfs.h
+++ b/include/linux/hwmon-sysfs.h
@@ -15,10 +15,10 @@ struct sensor_device_attribute{
 	int index;
 };
 #define to_sensor_dev_attr(_dev_attr) \
-	container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
+	container_of_const(_dev_attr, struct sensor_device_attribute, dev_attr)
 
-#define SENSOR_ATTR(_name, _mode, _show, _store, _index)	\
-	{ .dev_attr = __ATTR(_name, _mode, _show, _store),	\
+#define SENSOR_ATTR(_name, _mode, _show, _store, _index)		\
+	{ .dev_attr = __DEVICE_ATTR(_name, _mode, _show, _store),	\
 	  .index = _index }
 
 #define SENSOR_ATTR_RO(_name, _func, _index)			\
@@ -49,11 +49,11 @@ struct sensor_device_attribute_2 {
 	u8 nr;
 };
 #define to_sensor_dev_attr_2(_dev_attr) \
-	container_of(_dev_attr, struct sensor_device_attribute_2, dev_attr)
+	container_of_const(_dev_attr, struct sensor_device_attribute_2, dev_attr)
 
-#define SENSOR_ATTR_2(_name, _mode, _show, _store, _nr, _index)	\
-	{ .dev_attr = __ATTR(_name, _mode, _show, _store),	\
-	  .index = _index,					\
+#define SENSOR_ATTR_2(_name, _mode, _show, _store, _nr, _index)		\
+	{ .dev_attr = __DEVICE_ATTR(_name, _mode, _show, _store),	\
+	  .index = _index,						\
 	  .nr = _nr }
 
 #define SENSOR_ATTR_2_RO(_name, _func, _nr, _index)		\

-- 
2.55.0

