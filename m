Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652A3AD51C;
	Thu,  6 Aug 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996558; cv=none; b=lDO+NWfY6bYJTjxvF10VHJFqSdPtNWLHBXLFwolBAXbeb0GyZJxep8fvWjd49YBn3pkm/t6WXr9IjjnnHTca+QvlQdc/6aIvxJsAhsBdRNgP7SJ5lNu1CaZYun6qr8Kln+YRo0q3nU3qTkkiAANyNs7a60efKJADcYfWi/DZsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996558; c=relaxed/simple;
	bh=rCxRUSaMWLbQLn6N+pcEVJwlZ0QBqb1hNTJLsJijcLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8iT46n9D2eF3kD5uuNH37Ffz5im5JIYvhRw/tB1SSymO1BfmYbT+vFG34xabgFPNXDHm+YZuMYR/4pnd43WHK7YQRGeO/xbbmL/UAgvwzCXqZTaHwTtd9HRFkXbijXjC06ezcmddMXYX0IDhQsgEMFvT+RX62uBYgoZ0IeBOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YH0risMH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YH0risMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785996553;
	bh=rCxRUSaMWLbQLn6N+pcEVJwlZ0QBqb1hNTJLsJijcLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YH0risMHeeQhrmpzOseiDakql/XCjxfc5+9+TVfP3U8KqBkypPTh2+yNiC13ELgaL
	 9TO/khvXmMp4qoZhpna69siOaYDgXAhw3t9dRN7tnkK2cpH90a1IS0tYY6N7lltE+9
	 Xki3k7axs6DqgshOW76s5hdtHdqKgWG31Z5/d3vE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 06 Aug 2026 08:09:11 +0200
Subject: [PATCH v2 1/3] hwmon: (core) Constify device attributes
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260806-sysfs-const-attr-hwmon-v2-1-22fee8b85509@weissschuh.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785996552; l=1906;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rCxRUSaMWLbQLn6N+pcEVJwlZ0QBqb1hNTJLsJijcLU=;
 b=QemP7Krd0Py7t4hamT7LzPfJr8XxJKJ9LIT8pt+NZs0wNwNYUIfZqmdVarvgZZTleTcYc1OZf
 MP8Mydh89QrDBdRidg4ylGrBI1mLz+gHsYB5A7cAtJhQVSZIFDS6RR2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Mark the attribute structures as const, as they are never modified.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/hwmon.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 55a9a3ddd4aa..84108a16ef60 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -71,27 +71,27 @@ struct hwmon_thermal_data {
 };
 
 static ssize_t
-name_show(struct device *dev, struct device_attribute *attr, char *buf)
+name_show(struct device *dev, const struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%s\n", to_hwmon_device(dev)->name);
 }
-static DEVICE_ATTR_RO(name);
+static const DEVICE_ATTR_RO(name);
 
 static ssize_t
-label_show(struct device *dev, struct device_attribute *attr, char *buf)
+label_show(struct device *dev, const struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%s\n", to_hwmon_device(dev)->label);
 }
-static DEVICE_ATTR_RO(label);
+static const DEVICE_ATTR_RO(label);
 
-static struct attribute *hwmon_dev_attrs[] = {
+static const struct attribute *const hwmon_dev_attrs[] = {
 	&dev_attr_name.attr,
 	&dev_attr_label.attr,
 	NULL
 };
 
 static umode_t hwmon_dev_attr_is_visible(struct kobject *kobj,
-					 struct attribute *attr, int n)
+					 const struct attribute *attr, int n)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct hwmon_device *hdev = to_hwmon_device(dev);
@@ -106,8 +106,8 @@ static umode_t hwmon_dev_attr_is_visible(struct kobject *kobj,
 }
 
 static const struct attribute_group hwmon_dev_attr_group = {
-	.attrs		= hwmon_dev_attrs,
-	.is_visible	= hwmon_dev_attr_is_visible,
+	.attrs_const		= hwmon_dev_attrs,
+	.is_visible_const	= hwmon_dev_attr_is_visible,
 };
 
 static const struct attribute_group *hwmon_dev_attr_groups[] = {

-- 
2.55.0

