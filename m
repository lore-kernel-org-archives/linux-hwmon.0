Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64943AD512;
	Thu,  6 Aug 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996557; cv=none; b=ugWW/ilNJgObIdg3PwB2sPxoHzYgiOOjLVoM45xfxsC+DaMy++bzqath+eidzU/AONaphUi0Y3888SW9kEVPKhA23cDet336iLIg+1ymN2H/gO6Bs60BnVW4K7TiHwAnmh4YDzy7OSEKGNh566YRpsUEi1hhwLYEYX83MSZvMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996557; c=relaxed/simple;
	bh=6xUUJfvoEfXULuBw5XctDVku6yzV5Bm7RvuwwUO/dkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMDhwUKwpVsMVV8Xh5ad8j4W08TwvB8aTREofE1wsM7o8W0Xox7GMwC7beKnLcRXSEp1lWUkxITvpoyjYf83s4CUukiGjvou3U7lskRCrBq/pqY0YbQS+TCKexiUEPtFdZI2A/qTpxkYlwFIe0qnFQoxwS8d56G9aQqaY8sJHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OsflkV76; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OsflkV76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785996553;
	bh=6xUUJfvoEfXULuBw5XctDVku6yzV5Bm7RvuwwUO/dkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OsflkV76TD/v03vVvkq7YE3khEdBq9hx2XgGGtlv2sBtGPTE8wNgUSMJYjKaz31rq
	 +dlEDcoR15XhC3v60c1v/rVtJNxseKRFiqKFm3MiS3QWYjT1bw0cRYiL7hi/fjD/ZM
	 ZbMFz4C3a6uurxiTILtVklubU17bpewa9VEhV4PM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 06 Aug 2026 08:09:13 +0200
Subject: [PATCH v2 3/3] hwmon: (sysfs) Allow drivers to register const
 attributes
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260806-sysfs-const-attr-hwmon-v2-3-22fee8b85509@weissschuh.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785996552; l=1879;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6xUUJfvoEfXULuBw5XctDVku6yzV5Bm7RvuwwUO/dkQ=;
 b=iX7aj/mnDl/hacYBjnQRq7z2GjVTnua4nuKlrZOYMmoBWRnX7cMymfZSZE7h1eDxUSeY4p7Z0
 h0yBm9D/TdaA0ElZDTHauL9FyioNRFMa+6Q9zswF+2VQceO2vMwUlhJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Switch to the __DEVICE_ATTR() macro which can handle callbacks taking
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

