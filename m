Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A73DB328;
	Wed,  5 Aug 2026 19:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956678; cv=none; b=OFygB5rVoENv1UZrSLh7fgwhCxaXYBLYZkW12iVl5U+jy95jNwXCiGq5Qvrb7SegNTkwsgwvpaGj89y2XXZtmHouza/8FNHhQj29ZNMFl/etBWYUfjtZKtBcp+/jhOgNchkUk6EVLe5UiCv58i6+komOdDWyVrN9hhsHYisaH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956678; c=relaxed/simple;
	bh=rCxRUSaMWLbQLn6N+pcEVJwlZ0QBqb1hNTJLsJijcLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N93ayJnIV3jbkH5je1VBq9VedUvd9L6qqiJLZAMMBiMPg01vxhKrAJBSULEtP4ANfAyN3HAwIX2bWF3fBgB1l2yP8y6AzVqeyRT0glQMAiBvHgvSk5GD6n1IKuaBlcRPesOKf3t/C4wo9brb6tkrRk0IZwd95IoSj4OnElqcQys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FcIuDDLz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FcIuDDLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785956664;
	bh=rCxRUSaMWLbQLn6N+pcEVJwlZ0QBqb1hNTJLsJijcLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FcIuDDLzMnMIPXvH2ZFrICPNZh7d0dzJqmtWoJHHm7oa9Nb+ATT4w9zpDguCtjslX
	 pZwN+ldWuE8HHL1MjYQxW1n40saGhI9w1Iz+gDNaCuyQSsGJJryD1AHlaCHHWxq9Az
	 7aBsp8QQ9CRQvLOaFoXPuYHfPc6NI1p6fbP9Q7SA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 05 Aug 2026 21:04:19 +0200
Subject: [PATCH 1/3] hwmon: (core) Constify device attributes
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260805-sysfs-const-attr-hwmon-v1-1-4c0cb2b290a1@weissschuh.net>
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
In-Reply-To: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785956663; l=1906;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rCxRUSaMWLbQLn6N+pcEVJwlZ0QBqb1hNTJLsJijcLU=;
 b=igc69XbCqosSuLK7Dcbn4ea3/6jDhzaXYtJOIaS1vrv0hBIR2kkndM41XTtPs2uD6OYMmkpjS
 PpUG+gt2FuWAsmkl60HnXJ9o2y8q72g6q25tY5Me3kd6Nj6HrcQpZTh
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

