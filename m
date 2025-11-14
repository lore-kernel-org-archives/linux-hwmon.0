Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B33346E64;
	Fri, 14 Nov 2025 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763143211; cv=pass; b=qHZf98IpulPK4wG8hfD4/fLdPzYlo9gZYrEmNesstedmfXkua2w7mX+a+kR4r7AJD6CxiWTv0+QloYgc/umsSfrvLKfAP1L1ulYvw34rVS7zTuevY77KtYL+iKI6tpMfmVyVY9w6F4eitSee59oGjjub6BlhjiEVT+ZIdy7tPyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763143211; c=relaxed/simple;
	bh=s9Be6EXRM5de0d4JJGSEP7iZ/x661MgYSJ7RHCJoBYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKR3zmxBS9gzZJAwCMCz1GdWVWhgwvONEzckQyG1+R+Womn4MiUvyoT19XD+Ek8sK32qYjRaafjJLc029eQJIz1fyu6SI8Vq/T9oMFjFozpVQ9T2N0TC+8RNChLDD90AzkySzpkxl8YfwstwAyi0NPVCV0WQtcWL+9gxYN51/Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=0GRoKceG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="0GRoKceG"
ARC-Seal: i=1; a=rsa-sha256; t=1763143186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ij2Ji37shdi0uGmDAGBU76Gpxj2i8wrABgGiOA7WNr/vPrpNzJvdqWaWdxPKsR6t36yIqAeuIho8AgD4sqR3GuJrhfPaoTMzZe1kJTo+9sIfsc0RcHWvs7Hea76xY0neC/UbBKWnYWGt8JBWbmNsQFQ5AnEzciJStmfoC3KquOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763143186; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0t/+T9AGBR6c5v0tYdhzj7xx2XUBMzaiiQph4zMyKXQ=; 
	b=Ywvslv4xR/YoXn7za22riM51Kjbb+sMYwtAsWjwnyJeKkOUq9fvMj6sl/eCWiUapKDJmaz4rbf60YgSeAgweEi64/BJf6gg4DpJFpymlsbW2AgH9RdoI6ka27OkeiKriF88vkxWd+QHJtij4s9rxczLe9xDzJe84F60yl1EYotI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763143186;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0t/+T9AGBR6c5v0tYdhzj7xx2XUBMzaiiQph4zMyKXQ=;
	b=0GRoKceGbRqFf4Nsu+uHPXvx/yv463zi6WQ1ePb7bIBXPRwPGT/jvBq/DXyP5aXs
	yBsCAhOzuqN4Hci3w/riGjWFX3tLJ5F1YeD3BxnhK0oS9KUkwUkzyp+kwlA+6WKdRfY
	YBdAp+pCx3pmvzwNE4dXiRCTqtUbpBkorRbyLOOA=
Received: by mx.zohomail.com with SMTPS id 1763143184070236.41383877017995;
	Fri, 14 Nov 2025 09:59:44 -0800 (PST)
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
Subject: [PATCH v5 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
Date: Sat, 15 Nov 2025 01:59:15 +0800
Message-ID: <20251114175927.52533-4-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114175927.52533-1-i@rong.moe>
References: <20251114175927.52533-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The current implementation are heavily bound to capdata01. Rewrite it so
that it is suitable to utilize other Capability Data as well.

No functional change intended.

Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v5:
- Do not cast pointer to non-pointer or vice versa (thanks kernel test
  robot)

Changes in v4:
- Get rid of wmi_has_guid() (thanks Armin Wolf)
  - More changes in [PATCH v4 6/7]
- Prepare for [PATCH v4 6/7]
  - Move lwmi_cd_match*() forward
  - Use switch-case in lwmi_cd_remove()

Changes in v2:
- Fix function parameter 'type' not described in 'lwmi_cd_match' (thanks
  kernel test bot)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 225 +++++++++++++++++-----
 drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
 drivers/platform/x86/lenovo/wmi-other.c   |  16 +-
 3 files changed, 189 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index c5e74b2bfeb3..910cbe8ca001 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -12,8 +12,13 @@
  *
  * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
  *   - Initial implementation (formerly named lenovo-wmi-capdata01)
+ *
+ * Copyright (C) 2025 Rong Zhang <i@rong.moe>
+ *   - Unified implementation
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/acpi.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
@@ -36,6 +41,23 @@
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
 
+enum lwmi_cd_type {
+	LENOVO_CAPABILITY_DATA_01,
+};
+
+#define LWMI_CD_TABLE_ITEM(_type)		\
+	[_type] = {				\
+		.name = #_type,			\
+		.type = _type,			\
+	}
+
+static const struct lwmi_cd_info {
+	const char *name;
+	enum lwmi_cd_type type;
+} lwmi_cd_table[] = {
+	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
+};
+
 struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
 	struct wmi_device *wdev;
@@ -44,15 +66,63 @@ struct lwmi_cd_priv {
 
 struct cd_list {
 	struct mutex list_mutex; /* list R/W mutex */
+	enum lwmi_cd_type type;
 	u8 count;
-	struct capdata01 data[];
+
+	union {
+		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
+	};
 };
 
+static struct wmi_driver lwmi_cd_driver;
+
+/**
+ * lwmi_cd_match() - Match rule for the master driver.
+ * @dev: Pointer to the capability data parent device.
+ * @type: Pointer to capability data type (enum lwmi_cd_type *) to match.
+ *
+ * Return: int.
+ */
+static int lwmi_cd_match(struct device *dev, void *type)
+{
+	struct lwmi_cd_priv *priv;
+
+	if (dev->driver != &lwmi_cd_driver.driver)
+		return false;
+
+	priv = dev_get_drvdata(dev);
+	return priv->list->type == *(enum lwmi_cd_type *)type;
+}
+
+/**
+ * lwmi_cd_match_add_all() - Add all match rule for the master driver.
+ * @master: Pointer to the master device.
+ * @matchptr: Pointer to the returned component_match pointer.
+ *
+ * Adds all component matches to the list stored in @matchptr for the @master
+ * device. @matchptr must be initialized to NULL.
+ */
+void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr)
+{
+	int i;
+
+	if (WARN_ON(*matchptr))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
+		component_match_add(master, matchptr, lwmi_cd_match,
+				    (void *)&lwmi_cd_table[i].type);
+		if (IS_ERR(matchptr))
+			return;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
+
 /**
  * lwmi_cd_component_bind() - Bind component to master device.
  * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
  * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
- * @data: cd_list object pointer used to return the capability data.
+ * @data: lwmi_cd_binder object pointer used to return the capability data.
  *
  * On lenovo-wmi-other's master bind, provide a pointer to the local capdata
  * list. This is used to call lwmi_cd*_get_data to look up attribute data
@@ -64,9 +134,15 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 				  struct device *om_dev, void *data)
 {
 	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
-	struct cd_list **cd_list = data;
+	struct lwmi_cd_binder *binder = data;
 
-	*cd_list = priv->list;
+	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		binder->cd01_list = priv->list;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
@@ -76,30 +152,33 @@ static const struct component_ops lwmi_cd_component_ops = {
 };
 
 /**
- * lwmi_cd01_get_data - Get the data of the specified attribute
+ * lwmi_cd*_get_data - Get the data of the specified attribute
  * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
  * @attribute_id: The capdata attribute ID to be found.
- * @output: Pointer to a capdata01 struct to return the data.
+ * @output: Pointer to a capdata* struct to return the data.
  *
- * Retrieves the capability data 01 struct pointer for the given
- * attribute for its specified thermal mode.
+ * Retrieves the capability data struct pointer for the given
+ * attribute.
  *
  * Return: 0 on success, or -EINVAL.
  */
-int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output)
-{
-	u8 idx;
-
-	guard(mutex)(&list->list_mutex);
-	for (idx = 0; idx < list->count; idx++) {
-		if (list->data[idx].id != attribute_id)
-			continue;
-		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
-		return 0;
+#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
+	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id, _output_t *output)	\
+	{											\
+		u8 idx;										\
+		if (WARN_ON(list->type != _cd_type))						\
+			return -EINVAL;								\
+		guard(mutex)(&list->list_mutex);						\
+		for (idx = 0; idx < list->count; idx++) {					\
+			if (list->_cdxx[idx].id != attribute_id)				\
+				continue;							\
+			memcpy(output, &list->_cdxx[idx], sizeof(list->_cdxx[idx]));		\
+			return 0;								\
+		}										\
+		return -EINVAL;									\
 	}
 
-	return -EINVAL;
-}
+DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
 
 /**
@@ -112,10 +191,21 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
  */
 static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
+	size_t size;
 	int idx;
+	void *p;
+
+	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		p = &priv->list->cd01[0];
+		size = sizeof(priv->list->cd01[0]);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	guard(mutex)(&priv->list->list_mutex);
-	for (idx = 0; idx < priv->list->count; idx++) {
+	for (idx = 0; idx < priv->list->count; idx++, p += size) {
 		union acpi_object *ret_obj __free(kfree) = NULL;
 
 		ret_obj = wmidev_block_query(priv->wdev, idx);
@@ -123,11 +213,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 			return -ENODEV;
 
 		if (ret_obj->type != ACPI_TYPE_BUFFER ||
-		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
+		    ret_obj->buffer.length < size)
 			continue;
 
-		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
-		       ret_obj->buffer.length);
+		memcpy(p, ret_obj->buffer.pointer, size);
 	}
 
 	return 0;
@@ -136,20 +225,28 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 /**
  * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
  * @priv: lenovo-wmi-capdata driver data.
+ * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface.
  *
  * Return: 0 on success, or an error.
  */
-static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
+static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 {
 	struct cd_list *list;
 	size_t list_size;
 	int count, ret;
 
 	count = wmidev_instance_count(priv->wdev);
-	list_size = struct_size(list, data, count);
+
+	switch (type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		list_size = struct_size(list, cd01, count);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	list = devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
 	if (!list)
@@ -159,6 +256,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 	if (ret)
 		return ret;
 
+	list->type = type;
 	list->count = count;
 	priv->list = list;
 
@@ -168,6 +266,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 /**
  * lwmi_cd_setup() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
+ * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface. Then loop through each data block and
@@ -175,11 +274,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
  *
  * Return: 0 on success, or an error code.
  */
-static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
+static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 {
 	int ret;
 
-	ret = lwmi_cd_alloc(priv);
+	ret = lwmi_cd_alloc(priv, type);
 	if (ret)
 		return ret;
 
@@ -235,9 +334,13 @@ static void lwmi_cd01_unregister(void *data)
 
 static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 {
+	const struct lwmi_cd_info *info = context;
 	struct lwmi_cd_priv *priv;
 	int ret;
 
+	if (!info)
+		return -EINVAL;
+
 	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -245,30 +348,58 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	ret = lwmi_cd_setup(priv);
+	ret = lwmi_cd_setup(priv, info->type);
 	if (ret)
-		return ret;
+		goto out;
 
-	priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
+	switch (info->type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
 
-	ret = register_acpi_notifier(&priv->acpi_nb);
-	if (ret)
-		return ret;
+		ret = register_acpi_notifier(&priv->acpi_nb);
+		if (ret)
+			goto out;
 
-	ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &priv->acpi_nb);
-	if (ret)
-		return ret;
+		ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
+					       &priv->acpi_nb);
+		if (ret)
+			goto out;
 
-	return component_add(&wdev->dev, &lwmi_cd_component_ops);
+		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
+		goto out;
+	default:
+		return -EINVAL;
+	}
+out:
+	if (ret) {
+		dev_err(&wdev->dev, "failed to register %s: %d\n",
+			info->name, ret);
+	} else {
+		dev_info(&wdev->dev, "registered %s with %u items\n",
+			 info->name, priv->list->count);
+	}
+	return ret;
 }
 
 static void lwmi_cd_remove(struct wmi_device *wdev)
 {
-	component_del(&wdev->dev, &lwmi_cd_component_ops);
+	struct lwmi_cd_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		component_del(&wdev->dev, &lwmi_cd_component_ops);
+		break;
+	default:
+		WARN_ON(1);
+	}
 }
 
+#define LWMI_CD_WDEV_ID(_type)				\
+	.guid_string = _type##_GUID,			\
+	.context = &lwmi_cd_table[_type]
+
 static const struct wmi_device_id lwmi_cd_id_table[] = {
-	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
+	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
 	{}
 };
 
@@ -283,22 +414,10 @@ static struct wmi_driver lwmi_cd_driver = {
 	.no_singleton = true,
 };
 
-/**
- * lwmi_cd01_match() - Match rule for the master driver.
- * @dev: Pointer to the capability data 01 parent device.
- * @data: Unused void pointer for passing match criteria.
- *
- * Return: int.
- */
-int lwmi_cd01_match(struct device *dev, void *data)
-{
-	return dev->driver == &lwmi_cd_driver.driver;
-}
-EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
-
 module_wmi_driver(lwmi_cd_driver);
 
 MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
 MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 2a4746e38ad4..d326f9d2d165 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 
+struct component_match;
 struct device;
 struct cd_list;
 
@@ -19,7 +20,11 @@ struct capdata01 {
 	u32 max_value;
 };
 
+struct lwmi_cd_binder {
+	struct cd_list *cd01_list;
+};
+
+void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
-int lwmi_cd01_match(struct device *dev, void *data);
 
 #endif /* !_LENOVO_WMI_CAPDATA_H_ */
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c6dc1b4cff84..f2e1e34d58a9 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -579,14 +579,14 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
 static int lwmi_om_master_bind(struct device *dev)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
-	struct cd_list *tmp_list;
+	struct lwmi_cd_binder binder = { 0 };
 	int ret;
 
-	ret = component_bind_all(dev, &tmp_list);
+	ret = component_bind_all(dev, &binder);
 	if (ret)
 		return ret;
 
-	priv->cd01_list = tmp_list;
+	priv->cd01_list = binder.cd01_list;
 	if (!priv->cd01_list)
 		return -ENODEV;
 
@@ -623,10 +623,13 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 	if (!priv)
 		return -ENOMEM;
 
+	/* Sentinel for on-demand ida_free(). */
+	priv->ida_id = -EIDRM;
+
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL);
+	lwmi_cd_match_add_all(&wdev->dev, &master_match);
 	if (IS_ERR(master_match))
 		return PTR_ERR(master_match);
 
@@ -639,7 +642,10 @@ static void lwmi_other_remove(struct wmi_device *wdev)
 	struct lwmi_om_priv *priv = dev_get_drvdata(&wdev->dev);
 
 	component_master_del(&wdev->dev, &lwmi_om_master_ops);
-	ida_free(&lwmi_om_ida, priv->ida_id);
+
+	/* No IDA to free if the driver is never bound to its components. */
+	if (priv->ida_id >= 0)
+		ida_free(&lwmi_om_ida, priv->ida_id);
 }
 
 static const struct wmi_device_id lwmi_other_id_table[] = {
-- 
2.51.0

