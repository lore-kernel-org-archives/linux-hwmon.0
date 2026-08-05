Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676903D47A0;
	Wed,  5 Aug 2026 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956678; cv=none; b=QcqwUHTE+pyPAEvIR4FuVRL+KBQG9VYtiF79gNBipEKYUfdtzZCvy9/7IUOf93ZktplCCUeiHx8BWsUTUTtFP1j1SvrnmA24iS8aZDr7izDItIfPgYyBwPap3WwZggBBx5OuNvglfRv1HAW0xZGeH0+Cc6mt5pUHkNgeULM1Oic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956678; c=relaxed/simple;
	bh=hOR1T775ofVcH8arb7Vd0lW6mldP5yfQgdSPBSRI9KU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAczUKfeQ0J1bUFbEmCi2bIWCCQ0336dNRiIQVVzEdUX2qz0Fpiy6mqrvbBKDCRT+zxIJFHUiLNk26NbxIpJf+ikPhZVF3IClUMUvIn9a2ubcAtyqpV28IDjQQQ3pFII31JUaJNvEshmlqh0IlpCctZyzIRyd101ZCl95i3ugUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WKH9edpY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WKH9edpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785956665;
	bh=hOR1T775ofVcH8arb7Vd0lW6mldP5yfQgdSPBSRI9KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WKH9edpYIEaPZhIdQxvXaWVVrS3IYfu9NpTB84Fc4Nv9qEjNJdHJbZfkCY4srJ3Od
	 DzpQAi9uI5ZCLS9UgoXfRZneOfmviaG6o2w0LF7pC4us1Nr+goxcSgdATa4As1EytL
	 zTsunb+geDH3rMiYXo1OSnUJU/fe/VvQVP5pfSVA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 05 Aug 2026 21:04:20 +0200
Subject: [PATCH 2/3] hwmon: (core) Use const APIs for the dynamically
 allocated sysfs attributes
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260805-sysfs-const-attr-hwmon-v1-2-4c0cb2b290a1@weissschuh.net>
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
In-Reply-To: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785956663; l=5961;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hOR1T775ofVcH8arb7Vd0lW6mldP5yfQgdSPBSRI9KU=;
 b=LeQykBdDPZ1ngsJ4/jyoLb8EE+mZYZhfTO4AiuPeps9llC4xPsH1EjUOrtXBqkK/IgQhveSQI
 W9eUOuzjbmwDiOi6a1pfXzrURVvf+vOw0uewGW4l54D9coJCretY7R5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The non-const sysfs attribute APIs are going to go away at some point.

Switch to the const variants to prepare for that.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/hwmon.c | 54 +++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 84108a16ef60..90ceb815f43e 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -57,8 +57,8 @@ struct hwmon_device_attribute {
 };
 
 #define to_hwmon_attr(d) \
-	container_of(d, struct hwmon_device_attribute, dev_attr)
-#define to_dev_attr(a) container_of(a, struct device_attribute, attr)
+	container_of_const(d, struct hwmon_device_attribute, dev_attr)
+#define to_dev_attr(a) container_of_const(a, struct device_attribute, attr)
 
 /*
  * Thermal zone information
@@ -115,13 +115,13 @@ static const struct attribute_group *hwmon_dev_attr_groups[] = {
 	NULL
 };
 
-static void hwmon_free_attrs(struct attribute **attrs)
+static void hwmon_free_attrs(const struct attribute *const *attrs)
 {
 	int i;
 
 	for (i = 0; attrs[i]; i++) {
-		struct device_attribute *dattr = to_dev_attr(attrs[i]);
-		struct hwmon_device_attribute *hattr = to_hwmon_attr(dattr);
+		const struct device_attribute *dattr = to_dev_attr(attrs[i]);
+		const struct hwmon_device_attribute *hattr = to_hwmon_attr(dattr);
 
 		kfree(hattr);
 	}
@@ -132,8 +132,8 @@ static void hwmon_dev_release(struct device *dev)
 {
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 
-	if (hwdev->group.attrs)
-		hwmon_free_attrs(hwdev->group.attrs);
+	if (hwdev->group.attrs_const)
+		hwmon_free_attrs(hwdev->group.attrs_const);
 	kfree(hwdev->groups);
 	kfree(hwdev->label);
 	kfree(hwdev);
@@ -425,9 +425,9 @@ static int hwmon_pec_register(struct device *hdev)
 /* sysfs attribute management */
 
 static ssize_t hwmon_attr_show(struct device *dev,
-			       struct device_attribute *devattr, char *buf)
+			       const struct device_attribute *devattr, char *buf)
 {
-	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	const struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	s64 val64;
 	long val;
@@ -450,10 +450,10 @@ static ssize_t hwmon_attr_show(struct device *dev,
 }
 
 static ssize_t hwmon_attr_show_string(struct device *dev,
-				      struct device_attribute *devattr,
+				      const struct device_attribute *devattr,
 				      char *buf)
 {
-	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	const struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	enum hwmon_sensor_types type = hattr->type;
 	const char *s;
@@ -473,10 +473,10 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
 }
 
 static ssize_t hwmon_attr_store(struct device *dev,
-				struct device_attribute *devattr,
+				const struct device_attribute *devattr,
 				const char *buf, size_t count)
 {
-	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	const struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	long val;
 	int ret;
@@ -510,12 +510,12 @@ static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
 	       (type == hwmon_fan && attr == hwmon_fan_label);
 }
 
-static struct attribute *hwmon_genattr(const void *drvdata,
-				       enum hwmon_sensor_types type,
-				       u32 attr,
-				       int index,
-				       const char *template,
-				       const struct hwmon_ops *ops)
+static const struct attribute *hwmon_genattr(const void *drvdata,
+					     enum hwmon_sensor_types type,
+					     u32 attr,
+					     int index,
+					     const char *template,
+					     const struct hwmon_ops *ops)
 {
 	struct hwmon_device_attribute *hattr;
 	struct device_attribute *dattr;
@@ -552,8 +552,8 @@ static struct attribute *hwmon_genattr(const void *drvdata,
 	hattr->ops = ops;
 
 	dattr = &hattr->dev_attr;
-	dattr->show = is_string ? hwmon_attr_show_string : hwmon_attr_show;
-	dattr->store = hwmon_attr_store;
+	dattr->show_const = is_string ? hwmon_attr_show_string : hwmon_attr_show;
+	dattr->store_const = hwmon_attr_store;
 
 	a = &dattr->attr;
 	sysfs_attr_init(a);
@@ -831,7 +831,7 @@ static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
 }
 
 static int hwmon_genattrs(const void *drvdata,
-			  struct attribute **attrs,
+			  const struct attribute **attrs,
 			  const struct hwmon_ops *ops,
 			  const struct hwmon_channel_info *info)
 {
@@ -850,7 +850,7 @@ static int hwmon_genattrs(const void *drvdata,
 		u32 attr;
 
 		while (attr_mask) {
-			struct attribute *a;
+			const struct attribute *a;
 
 			attr = __ffs(attr_mask);
 			attr_mask &= ~BIT(attr);
@@ -869,11 +869,11 @@ static int hwmon_genattrs(const void *drvdata,
 	return aindex;
 }
 
-static struct attribute **
+static const struct attribute **
 __hwmon_create_attrs(const void *drvdata, const struct hwmon_chip_info *chip)
 {
 	int ret, i, aindex = 0, nattrs = 0;
-	struct attribute **attrs;
+	const struct attribute **attrs;
 
 	for (i = 0; chip->info[i]; i++)
 		nattrs += hwmon_num_channel_attrs(chip->info[i]);
@@ -928,7 +928,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	hdev = &hwdev->dev;
 
 	if (chip) {
-		struct attribute **attrs;
+		const struct attribute **attrs;
 		int ngroups = 2; /* terminating NULL plus &hwdev->groups */
 
 		if (groups)
@@ -947,7 +947,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 			goto free_hwmon;
 		}
 
-		hwdev->group.attrs = attrs;
+		hwdev->group.attrs_const = attrs;
 		ngroups = 0;
 		hwdev->groups[ngroups++] = &hwdev->group;
 

-- 
2.55.0

