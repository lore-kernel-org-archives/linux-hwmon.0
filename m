Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED62C11F1;
	Sat, 22 Nov 2025 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763837174; cv=pass; b=uI8F+ozgKRARJOVdrW42p4bFxdA6uahXcXB248ca4xkPMkGE+r4pp/MHQOMe3PNPtVFVC2D+HNk29yUrAiKJzy0KkaqxoZVWoKieYatvdimBMud3dp/LPCKavsvs6b+SCRmgRwzfQtN0h62SyKESZxZhx7Asc8B9lK1nfaDKQSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763837174; c=relaxed/simple;
	bh=FyaVm+F5VOyDUz6saSgEHymw9kC3+V7QvQE0ZwZGPfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gshGgjRy9s13SYX/kmUKMAvEJ/pZ8Fe7514lM2mC6Gsm/LHBhogYu4Ky/WZoJJE7ASHGtoE6ez6YsMkD++oQBqTssCge+TcPi4cju9SNZBIZsU3yybeepmCIxMBkww0ZpAysOEyo6bCt8z13BCGpboCsyRJAFn1RGVVeR2S5tqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=H5tL8AR4; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="H5tL8AR4"
ARC-Seal: i=1; a=rsa-sha256; t=1763837147; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bh5CcABJgeAR3ZMGt5LtayNcrEmcg+fuG3morpwgARVA35xW8WGwhBmakaJ3tXgS5ufMrNV86JLn920s4vr33ynYugMm9SaxOAmzXedozbNTTlrvbgKGUqYkEH0sREqvE5Y1RyPMx19rIgWJYpOCx+xUfIZrMf0PhkLDaIzQ2R0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763837147; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uvtEgNi6kx9+J0uSb5Xup8TbPptYJP87UBd98n9c4ZA=; 
	b=m9quDEZRiJ7FLlsxS+dUStI82kgJqb6PqWoprD1wxY0wRzLNk+al5u5vg8vcFDcvIht3eBrkVkQ8xhHBS9Kq8t0GVvxfA9s03Dk0z8DpwfGbhszrsSnXD1ovwaO4hecjkQnHOOWR3JgHJKy5oB+K8RmYBl2UtylEDQwlpEumTas=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763837147;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uvtEgNi6kx9+J0uSb5Xup8TbPptYJP87UBd98n9c4ZA=;
	b=H5tL8AR4SiVnsIdmz459aP37LIN3ZWNe5ocVgTlWYEztC3OzTw/pzwUswlUxCpS6
	lZRPCkKPvjdbjo8srlxIU66s9naZxBcJreQ3ElkIIAqslagqUJAPLeX63fgf2+7sr+i
	SI8Nwk6+hlptCoVYVZmqFfP8bSsR0S+bezQ/Dw00=
Received: by mx.zohomail.com with SMTPS id 1763837144173759.0532838583723;
	Sat, 22 Nov 2025 10:45:44 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v6 4/7] platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
Date: Sun, 23 Nov 2025 02:44:44 +0800
Message-ID: <20251122184522.18677-5-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251122184522.18677-1-i@rong.moe>
References: <20251122184522.18677-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for LENOVO_CAPABILITY_DATA_00 WMI data block that comes on
"Other Mode" enabled hardware. Provides an interface for querying if a
given attribute is supported by the hardware, as well as its default
value.

capdata00 always presents on devices with capdata01. lenovo-wmi-other
now binds to both (no functional change intended).

Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v4:
- Rebase on top of changes made to [PATCH v4 3/7]

Changes in v2:
- Reword documentation (thanks Derek J. Clark)
---
 .../wmi/devices/lenovo-wmi-other.rst          | 15 ++++++++---
 drivers/platform/x86/lenovo/wmi-capdata.c     | 25 +++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  8 ++++++
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index d7928b8dfb4b..fcad595d49af 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -31,13 +31,22 @@ under the following path:
 
   /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
 
+LENOVO_CAPABILITY_DATA_00
+-------------------------
+
+WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
+
+The LENOVO_CAPABILITY_DATA_00 interface provides various information that
+does not rely on the gamezone thermal mode.
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
 WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
 
-The LENOVO_CAPABILITY_DATA_01 interface provides information on various
-power limits of integrated CPU and GPU components.
+The LENOVO_CAPABILITY_DATA_01 interface provides various information that
+relies on the gamezone thermal mode, including power limits of integrated
+CPU and GPU components.
 
 Each attribute has the following properties:
  - current_value
@@ -48,7 +57,7 @@ Each attribute has the following properties:
  - scalar_increment
  - type
 
-The following attributes are implemented:
+The following firmware-attributes are implemented:
  - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
  - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
  - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index e0710354278a..29267c373ab3 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -5,6 +5,9 @@
  * Lenovo Capability Data provides information on tunable attributes used by
  * the "Other Mode" WMI interface.
  *
+ * Capability Data 00 includes if the attribute is supported by the hardware,
+ * and the default_value. All attributes are independent of thermal modes.
+ *
  * Capability Data 01 includes if the attribute is supported by the hardware,
  * and the default_value, max_value, min_value, and step increment. Each
  * attribute has multiple pages, one for each of the thermal modes managed by
@@ -36,12 +39,14 @@
 
 #include "wmi-capdata.h"
 
+#define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
 
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
 
 enum lwmi_cd_type {
+	LENOVO_CAPABILITY_DATA_00,
 	LENOVO_CAPABILITY_DATA_01,
 };
 
@@ -55,6 +60,7 @@ static const struct lwmi_cd_info {
 	const char *name;
 	enum lwmi_cd_type type;
 } lwmi_cd_table[] = {
+	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
 };
 
@@ -70,6 +76,7 @@ struct cd_list {
 	u8 count;
 
 	union {
+		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
 		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
 	};
 };
@@ -137,6 +144,9 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	struct lwmi_cd_binder *binder = data;
 
 	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		binder->cd00_list = priv->list;
+		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		binder->cd01_list = priv->list;
 		break;
@@ -178,6 +188,9 @@ static const struct component_ops lwmi_cd_component_ops = {
 		return -EINVAL;									\
 	}
 
+DEF_LWMI_CDXX_GET_DATA(cd00, LENOVO_CAPABILITY_DATA_00, struct capdata00);
+EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CD");
+
 DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
 
@@ -196,6 +209,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	void *p;
 
 	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		p = &priv->list->cd00[0];
+		size = sizeof(priv->list->cd00[0]);
+		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		p = &priv->list->cd01[0];
 		size = sizeof(priv->list->cd01[0]);
@@ -241,6 +258,9 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	count = wmidev_instance_count(priv->wdev);
 
 	switch (type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		list_size = struct_size(list, cd00, count);
+		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		list_size = struct_size(list, cd01, count);
 		break;
@@ -353,6 +373,9 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		goto out;
 
 	switch (info->type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
+		goto out;
 	case LENOVO_CAPABILITY_DATA_01:
 		priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
 
@@ -386,6 +409,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 	struct lwmi_cd_priv *priv = dev_get_drvdata(&wdev->dev);
 
 	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_00:
 	case LENOVO_CAPABILITY_DATA_01:
 		component_del(&wdev->dev, &lwmi_cd_component_ops);
 		break;
@@ -399,6 +423,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 	.context = &lwmi_cd_table[_type]
 
 static const struct wmi_device_id lwmi_cd_id_table[] = {
+	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
 	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
 	{}
 };
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index d326f9d2d165..a6d006ef458f 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -11,6 +11,12 @@ struct component_match;
 struct device;
 struct cd_list;
 
+struct capdata00 {
+	u32 id;
+	u32 supported;
+	u32 default_value;
+};
+
 struct capdata01 {
 	u32 id;
 	u32 supported;
@@ -21,10 +27,12 @@ struct capdata01 {
 };
 
 struct lwmi_cd_binder {
+	struct cd_list *cd00_list;
 	struct cd_list *cd01_list;
 };
 
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
+int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
 
 #endif /* !_LENOVO_WMI_CAPDATA_H_ */
-- 
2.51.0

