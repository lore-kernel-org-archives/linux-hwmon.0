Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE18833BBBB;
	Tue, 25 Nov 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100248; cv=pass; b=jDTaTD0gCG4XQa7Ofwh9Xrhl+yk6rJwS1Y3vqb7dNtkQAXsmMfND0o4rgA3iRe0nozf5RhEflIDr1FhI3ll3RDtR3L5HDar2B/WVroW5FBwVbzDOQfPtN/4DL4ICqvEtsxgC/S7qNCjrqrIYwFzlY3ArljX2t5bomF1wdjm7/0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100248; c=relaxed/simple;
	bh=hogx5ZLzDNrhJOr9qZSEV1vNO6m9x+wfpdBQeYJwgPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcwjokoNSQ9lEQZm0Bxhi+9G/ZLBhsdEkKGq3uOp7t1Aq6ae5E4R1kKsrXEwadpB/2HExKe5VAf1DnZhmuRAx6e+rWgomVEQrZ1MQmFrVM509Goo4YOiaii0gduti+t8m8R3z4VzH6MZ2qGRO9Vd91pLZIlzNAduZSmeyZ51Cy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WcWh/Eih; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WcWh/Eih"
ARC-Seal: i=1; a=rsa-sha256; t=1764100225; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XhVB6IaNqXTYT4FZCiAaXNbsBafkUcYCjSlyNMFZHhxJcf5akAJ8cD35lortUW3UYgGL2A5BM3A5NTCgZYa4OVM3lk9eXmHDuqtoZWY9stqANA0pU57kYM8s1Q5leNBBxiMTsDb31CiiJGFit4GKLTmzWOnYcOqUXc76KFWaNs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764100225; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vydyMEfPFPne60ojM/YwY8wiU97Gilokfj8xssZjNQ4=; 
	b=C21VYtyrH3Xy0b/8ZuoPFKlAvIdE3XlV9+kNkEzJ7faX6MFL84LZZ2z+J2t8fseBkjipMy02YbHN7oCt2+U3ZIGTNMjDZQh2k0qBvTcSWRSbwoiqxnEed5ieF6o29unwFkCH4wNWShu/h2WF+qBCG/YNFpwUa1btRPMMIIhbVS0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764100225;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vydyMEfPFPne60ojM/YwY8wiU97Gilokfj8xssZjNQ4=;
	b=WcWh/EihjgKNF/j+MAm4m0eynNYXI6xQvH5A5bVlasNTvZQ887GszqOd+JZvQ32k
	oHiCcQagyVr2OF+sGGcSO73rEhwvqz4+h2eWpiubaZ0/Ck0QjupRlcCTxTNW2snyZHL
	/oa5/iC5PRcGBUZ7af/LE+PbuYPXTZG0GafFIuIU=
Received: by mx.zohomail.com with SMTPS id 17641002238291005.808726707105;
	Tue, 25 Nov 2025 11:50:23 -0800 (PST)
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
Subject: [PATCH v7 5/7] platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
Date: Wed, 26 Nov 2025 03:49:26 +0800
Message-ID: <20251125194959.157524-6-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125194959.157524-1-i@rong.moe>
References: <20251125194959.157524-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
interface for querying the min/max fan speed RPM (reference data) of a
given fan ID.

This interface is optional. Hence, it does not bind to lenovo-wmi-other
and is not registered as a component for the moment. Appropriate binding
will be implemented in the subsequent patch.

Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v7:
- Rearrange lwmi_cd_fan_list_alloc_cache() to drop gotos (thanks Ilpo
  Järvinen)
- Move the declarations of __free()-managed variablesto where thet are
  assigned (ditto)
- Prevent back-and-forth changes (ditto)
- Improve the readablity of struct definition (ditto)
- Emit unaligned access to the WMI block
- Properly calculate array index when we truncate the data

Changes in v4:
- Rebase on top of changes made to [PATCH v4 3/7]
- Do not register it as a component until [PATCH v4 6/7]

Changes in v2:
- Reword documentation
---
 .../wmi/devices/lenovo-wmi-other.rst          | 17 ++++
 drivers/platform/x86/lenovo/wmi-capdata.c     | 96 +++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  7 ++
 3 files changed, 120 insertions(+)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index fcad595d49af..821282e07d93 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
  - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
  - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
 
+LENOVO_FAN_TEST_DATA
+-------------------------
+
+WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
+
+The LENOVO_FAN_TEST_DATA interface provides reference data for self-test of
+cooling fans.
 
 WMI interface description
 =========================
@@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
     [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSize")] uint8 DefaultValue[];
   };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F164FB21}")]
+  class LENOVO_FAN_TEST_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
+    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
+    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
+    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+  };
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 08a78dc490f6..9fed162abd17 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -13,6 +13,10 @@
  * attribute has multiple pages, one for each of the thermal modes managed by
  * the Gamezone interface.
  *
+ * Fan Test Data includes the max/min fan speed RPM for each fan. This is
+ * reference data for self-test. If the fan is in good condition, it is capable
+ * to spin faster than max RPM or slower than min RPM.
+ *
  * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
  *   - Initial implementation (formerly named lenovo-wmi-capdata01)
  *
@@ -45,6 +49,7 @@
 
 #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
+#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB21"
 
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
@@ -52,6 +57,7 @@
 enum lwmi_cd_type {
 	LENOVO_CAPABILITY_DATA_00,
 	LENOVO_CAPABILITY_DATA_01,
+	LENOVO_FAN_TEST_DATA,
 };
 
 #define LWMI_CD_TABLE_ITEM(_type)		\
@@ -66,6 +72,7 @@ static const struct lwmi_cd_info {
 } lwmi_cd_table[] = {
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
+	LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
 };
 
 struct lwmi_cd_priv {
@@ -82,6 +89,7 @@ struct cd_list {
 	union {
 		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
 		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
+		DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
 	};
 };
 
@@ -121,6 +129,10 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
+		/* Skip sub-components. */
+		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
+			continue;
+
 		component_match_add(master, matchptr, lwmi_cd_match,
 				    (void *)&lwmi_cd_table[i].type);
 		if (IS_ERR(*matchptr))
@@ -200,6 +212,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CD");
 DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
 
+DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
+EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
+
 /**
  * lwmi_cd_cache() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
@@ -223,6 +238,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		p = &priv->list->cd01[0];
 		size = sizeof(priv->list->cd01[0]);
 		break;
+	case LENOVO_FAN_TEST_DATA:
+		/* Done by lwmi_cd_alloc() => lwmi_cd_fan_list_alloc_cache(). */
+		return 0;
 	default:
 		return -EINVAL;
 	}
@@ -245,6 +263,72 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	return 0;
 }
 
+/**
+ * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
+ * @priv: lenovo-wmi-capdata driver data.
+ * @listptr: Pointer to returned cd_list pointer.
+ *
+ * Return: count of fans found, or an error.
+ */
+static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_list **listptr)
+{
+	struct cd_list *list;
+	size_t size;
+	u32 count;
+	int idx;
+
+	/* Emit unaligned access to u8 buffer with __packed. */
+	struct cd_fan_block {
+		u32 nr;
+		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
+	} __packed * block;
+
+	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
+	if (!ret_obj)
+		return -ENODEV;
+
+	if (ret_obj->type == ACPI_TYPE_BUFFER) {
+		block = (struct cd_fan_block *)ret_obj->buffer.pointer;
+		size = ret_obj->buffer.length;
+
+		count = size >= sizeof(*block) ? block->nr : 0;
+		if (size < struct_size(block, data, count * 3)) {
+			dev_warn(&priv->wdev->dev,
+				 "incomplete fan test data block: %zu < %zu, ignoring\n",
+				 size, struct_size(block, data, count * 3));
+			count = 0;
+		} else if (count > U8_MAX) {
+			dev_warn(&priv->wdev->dev,
+				 "too many fans reported: %u > %u, truncating\n",
+				 count, U8_MAX);
+			count = U8_MAX;
+		}
+	} else {
+		/*
+		 * This is usually caused by a dummy ACPI method. Do not return an error
+		 * as failing to probe this device will result in sub-master device being
+		 * unbound. This behavior aligns with lwmi_cd_cache().
+		 */
+		count = 0;
+	}
+
+	list = devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, count), GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	for (idx = 0; idx < count; idx++) {
+		/* Do not calculate array index using count, as it may be truncated. */
+		list->cd_fan[idx] = (struct capdata_fan) {
+			.id      = block->data[idx],
+			.max_rpm = block->data[idx + block->nr],
+			.min_rpm = block->data[idx + (2 * block->nr)],
+		};
+	}
+
+	*listptr = list;
+	return count;
+}
+
 /**
  * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
  * @priv: lenovo-wmi-capdata driver data.
@@ -270,6 +354,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	case LENOVO_CAPABILITY_DATA_01:
 		list_size = struct_size(list, cd01, count);
 		break;
+	case LENOVO_FAN_TEST_DATA:
+		count = lwmi_cd_fan_list_alloc_cache(priv, &list);
+		if (count < 0)
+			return count;
+
+		goto got_list;
 	default:
 		return -EINVAL;
 	}
@@ -278,6 +368,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	if (!list)
 		return -ENOMEM;
 
+got_list:
 	ret = devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
 	if (ret)
 		return ret;
@@ -396,6 +487,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 
 		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
 		goto out;
+	case LENOVO_FAN_TEST_DATA:
+		goto out;
 	default:
 		return -EINVAL;
 	}
@@ -419,6 +512,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 	case LENOVO_CAPABILITY_DATA_01:
 		component_del(&wdev->dev, &lwmi_cd_component_ops);
 		break;
+	case LENOVO_FAN_TEST_DATA:
+		break;
 	default:
 		WARN_ON(1);
 	}
@@ -431,6 +526,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 static const struct wmi_device_id lwmi_cd_id_table[] = {
 	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
 	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
+	{ LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
 	{}
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index a6d006ef458f..38af4c4e4ef4 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -26,6 +26,12 @@ struct capdata01 {
 	u32 max_value;
 };
 
+struct capdata_fan {
+	u32 id;
+	u32 min_rpm;
+	u32 max_rpm;
+};
+
 struct lwmi_cd_binder {
 	struct cd_list *cd00_list;
 	struct cd_list *cd01_list;
@@ -34,5 +40,6 @@ struct lwmi_cd_binder {
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
 int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
+int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id, struct capdata_fan *output);
 
 #endif /* !_LENOVO_WMI_CAPDATA_H_ */
-- 
2.51.0

