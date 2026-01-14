Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1E39901E;
	Wed, 14 Jan 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393721; cv=pass; b=EN5CM39DJ0RMa9SigTfIkwGc5WOEpEJPL2UB2wChEEQle0sma6+KMx0vSPEnj15f2rUgvWKd3aORf6HlnY8etdy6U9IeVEsM0GMrvwqrLa6vN6aQych0coKLrmQZFD/mywv/9kQacLMsWSgmNwFaoKWQ8QVQtWySq8+Dj+4PDgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393721; c=relaxed/simple;
	bh=nEEspYnyLlUAKqh4uVynoj7CcQfD+O9HYuXuEXbyhYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFWDOVCowvDnDM5OwmH+xtrJJIB5hq3WR+iE1DoByfssPZKmTx78sy4tmnOOY2fH0S4HwTIAdLiq6JFYf4d7F4Qol1xWET5RjOBVRAjQDJ0fxjnb8R1E0NTGaLnCR/d2GzI8XoDF05nekrl1FkbmMxqg6VS5ptIgXGreyIJNE8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=x1L2+6xk; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="x1L2+6xk"
ARC-Seal: i=1; a=rsa-sha256; t=1768393700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eW77sxIJm1cGQq+wbE7AvHP0fz63uE9PfCAeKZZNzL9C9dywkT7bqhNRKnmBw9ivj+gr1J/zwVNSzDpN1wTvrhxHRDW3zq85tedZtxoHFAQG1Bn6jhMda6DTIu/NiDFVpxOhda4sHFIiLjwVeePUNgJ56tvlMEWJ8JC2Kku1GqY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768393700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AXxSYjbiKL4t8TkHG4QUF3vd3T49Mek4305UJdIZmMU=; 
	b=X4uJtG1h+l0PUUF87IuFs54ai5Elv0uFZtggyRelj8Co2eOAHAkJegUlJ5hJQVhdAGgosynMpytS3qrlk1g2EX2mIWRKgvoLmkIlAidhMWz8uBe2OT3c+57jfk0GLA6tmy3d4TZkcKrnKddKabRlMzzINxzppeoorg3t4lmwPyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768393700;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AXxSYjbiKL4t8TkHG4QUF3vd3T49Mek4305UJdIZmMU=;
	b=x1L2+6xkVDFQEYk6xBPHXsecy9UgdPagFvS7quurqqLeotrLiWTeq1zOP5KVJNSx
	/EVrI9IIarUauih8XsFuyS3msSfxCNMMVJFFmj9fi+vekMlIlHSaub0UPcHoXFA2GkD
	qLb2Q+jR027RGMfskWGwUDnFy+zoMY33+Q4sA3Cg=
Received: by mx.zohomail.com with SMTPS id 1768393697392565.8959695700412;
	Wed, 14 Jan 2026 04:28:17 -0800 (PST)
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
Subject: [PATCH v9 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
Date: Wed, 14 Jan 2026 20:27:10 +0800
Message-ID: <20260114122745.986699-7-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260114122745.986699-1-i@rong.moe>
References: <20260114122745.986699-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A capdata00 attribute (0x04050000) describes the presence of Fan Test
Data. Query it, and bind Fan Test Data as a component of capdata00
accordingly. The component master of capdata00 may pass a callback while
binding to retrieve fan info from Fan Test Data.

Summarizing this scheme:

	lenovo-wmi-other <-> capdata00 <-> capdata_fan
	|- master            |- component
	                     |- sub-master
	                                   |- sub-component

The callback will be called once both the master and the sub-component
are bound to the sub-master (component).

This scheme is essential to solve these issues:
- The component framework only supports one aggregation per master
- A binding is only established until all components are found
- The Fan Test Data interface may be missing on some devices
- To get rid of queries for the presence of WMI GUIDs
- The notifier framework cannot cleanly connect capdata_fan to
  lenovo-wmi-other without introducing assumptions on probing sequence

capdata00 is registered as a component and a sub-master on probe,
instead of chaining the registrations in one's bind callback. This is
because calling (un)registration methods of the component framework
causes deadlock in (un)bind callbacks, i.e., it's impossible to register
capdata00 as a sub-master/component in its component/sub-master bind
callback, and vice versa.

Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v7:
- Improve the readability of error paths (thanks Ilpo Järvinen)
- Prevent back-and-forth changes (ditto)
- Fix typo

Changes in v6:
- Fix the error path of component_add(capdata00)
- Elaborate the design in commit message

Changes in v5:
- Fix missing include (thanks kernel test robot)

Changes in v4:
- New patch in the series (thanks Armin Wolf's inspiration)
  - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 264 +++++++++++++++++++++-
 drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
 drivers/platform/x86/lenovo/wmi-other.c   |   5 -
 3 files changed, 283 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index e0a6524d1b6d9..592e46c1feb6f 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -27,6 +27,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
@@ -55,10 +56,17 @@
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
 
+#define LWMI_FEATURE_ID_FAN_TEST 0x05
+
+#define LWMI_ATTR_ID_FAN_TEST							\
+	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
+	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
+
 enum lwmi_cd_type {
 	LENOVO_CAPABILITY_DATA_00,
 	LENOVO_CAPABILITY_DATA_01,
 	LENOVO_FAN_TEST_DATA,
+	CD_TYPE_NONE = -1,
 };
 
 #define LWMI_CD_TABLE_ITEM(_type)		\
@@ -80,6 +88,20 @@ struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
 	struct wmi_device *wdev;
 	struct cd_list *list;
+
+	/*
+	 * A capdata device may be a component master of another capdata device.
+	 * E.g., lenovo-wmi-other <-> capdata00 <-> capdata_fan
+	 *       |- master            |- component
+	 *                            |- sub-master
+	 *                                          |- sub-component
+	 */
+	struct lwmi_cd_sub_master_priv {
+		struct device *master_dev;
+		cd_list_cb_t master_cb;
+		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no sub-component. */
+		bool registered;                    /* Has the sub-master been registered? */
+	} *sub_master;
 };
 
 struct cd_list {
@@ -142,6 +164,56 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
 }
 EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
 
+/**
+ * lwmi_cd_call_master_cb() - Call the master callback for the sub-component.
+ * @priv: Pointer to the capability data private data.
+ *
+ * Call the master callback and pass the sub-component list to it if the
+ * dependency chain (master <-> sub-master <-> sub-component) is complete.
+ */
+static void lwmi_cd_call_master_cb(struct lwmi_cd_priv *priv)
+{
+	struct cd_list *sub_component_list = priv->sub_master->sub_component_list;
+
+	/*
+	 * Call the callback only if the dependency chain is ready:
+	 * - Binding between master and sub-master: fills master_dev and master_cb
+	 * - Binding between sub-master and sub-component: fills sub_component_list
+	 *
+	 * If a binding has been unbound before the other binding is bound, the
+	 * corresponding members filled by the former are guaranteed to be cleared.
+	 *
+	 * This function is only called in bind callbacks, and the component
+	 * framework guarantees bind/unbind callbacks may never execute
+	 * simultaneously, which implies that it's impossible to have a race
+	 * condition.
+	 *
+	 * Hence, this check is sufficient to ensure that the callback is called
+	 * at most once and with the correct state, without relying on a specific
+	 * sequence of binding establishment.
+	 */
+	if (!sub_component_list ||
+	    !priv->sub_master->master_dev ||
+	    !priv->sub_master->master_cb)
+		return;
+
+	if (PTR_ERR(sub_component_list) == -ENODEV)
+		sub_component_list = NULL;
+	else if (WARN_ON(IS_ERR(sub_component_list)))
+		return;
+
+	priv->sub_master->master_cb(priv->sub_master->master_dev,
+				    sub_component_list);
+
+	/*
+	 * Prevent "unbind and rebind" sequences from userspace from calling the
+	 * callback twice.
+	 */
+	priv->sub_master->master_cb = NULL;
+	priv->sub_master->master_dev = NULL;
+	priv->sub_master->sub_component_list = NULL;
+}
+
 /**
  * lwmi_cd_component_bind() - Bind component to master device.
  * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
@@ -152,6 +224,8 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
  * list. This is used to call lwmi_cd*_get_data to look up attribute data
  * from the lenovo-wmi-other driver.
  *
+ * If cd_dev is a sub-master, try to call the master callback.
+ *
  * Return: 0
  */
 static int lwmi_cd_component_bind(struct device *cd_dev,
@@ -163,6 +237,11 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	switch (priv->list->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		binder->cd00_list = priv->list;
+
+		priv->sub_master->master_dev = om_dev;
+		priv->sub_master->master_cb = binder->cd_fan_list_cb;
+		lwmi_cd_call_master_cb(priv);
+
 		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		binder->cd01_list = priv->list;
@@ -174,8 +253,168 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	return 0;
 }
 
+/**
+ * lwmi_cd_component_unbind() - Unbind component to master device.
+ * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
+ * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
+ * @data: Unused.
+ *
+ * If cd_dev is a sub-master, clear the collected data from the master device to
+ * prevent the binding establishment between the sub-master and the sub-
+ * component (if it's about to happen) from calling the master callback.
+ */
+static void lwmi_cd_component_unbind(struct device *cd_dev,
+				     struct device *om_dev, void *data)
+{
+	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
+
+	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		priv->sub_master->master_dev = NULL;
+		priv->sub_master->master_cb = NULL;
+		return;
+	default:
+		return;
+	}
+}
+
 static const struct component_ops lwmi_cd_component_ops = {
 	.bind = lwmi_cd_component_bind,
+	.unbind = lwmi_cd_component_unbind,
+};
+
+/**
+ * lwmi_cd_sub_master_bind() - Bind sub-component of sub-master device
+ * @dev: The sub-master capdata basic device.
+ *
+ * Call component_bind_all to bind the sub-component device to the sub-master
+ * device. On success, collect the pointer to the sub-component list and try
+ * to call the master callback.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_cd_sub_master_bind(struct device *dev)
+{
+	struct lwmi_cd_priv *priv = dev_get_drvdata(dev);
+	struct cd_list *sub_component_list;
+	int ret;
+
+	ret = component_bind_all(dev, &sub_component_list);
+	if (ret)
+		return ret;
+
+	priv->sub_master->sub_component_list = sub_component_list;
+	lwmi_cd_call_master_cb(priv);
+
+	return 0;
+}
+
+/**
+ * lwmi_cd_sub_master_unbind() - Unbind sub-component of sub-master device
+ * @dev: The sub-master capdata basic device
+ *
+ * Clear the collected pointer to the sub-component list to prevent the binding
+ * establishment between the sub-master and the sub-component (if it's about to
+ * happen) from calling the master callback. Then, call component_unbind_all to
+ * unbind the sub-component device from the sub-master device.
+ */
+static void lwmi_cd_sub_master_unbind(struct device *dev)
+{
+	struct lwmi_cd_priv *priv = dev_get_drvdata(dev);
+
+	priv->sub_master->sub_component_list = NULL;
+
+	component_unbind_all(dev, NULL);
+}
+
+static const struct component_master_ops lwmi_cd_sub_master_ops = {
+	.bind = lwmi_cd_sub_master_bind,
+	.unbind = lwmi_cd_sub_master_unbind,
+};
+
+/**
+ * lwmi_cd_sub_master_add() - Register a sub-master with its sub-component
+ * @priv: Pointer to the sub-master capdata device private data.
+ * @sub_component_type: Type of the sub-component.
+ *
+ * Match the sub-component type and register the current capdata device as a
+ * sub-master. If the given sub-component type is CD_TYPE_NONE, mark the sub-
+ * component as non-existent without registering sub-master.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
+				  enum lwmi_cd_type sub_component_type)
+{
+	struct component_match *master_match = NULL;
+	int ret;
+
+	priv->sub_master = devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_master), GFP_KERNEL);
+	if (!priv->sub_master)
+		return -ENOMEM;
+
+	if (sub_component_type == CD_TYPE_NONE) {
+		/* The master callback will be called with NULL on bind. */
+		priv->sub_master->sub_component_list = ERR_PTR(-ENODEV);
+		priv->sub_master->registered = false;
+		return 0;
+	}
+
+	/*
+	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
+	 * data cannot be used here. Steal one from lwmi_cd_table.
+	 */
+	component_match_add(&priv->wdev->dev, &master_match, lwmi_cd_match,
+			    (void *)&lwmi_cd_table[sub_component_type].type);
+	if (IS_ERR(master_match))
+		return PTR_ERR(master_match);
+
+	ret = component_master_add_with_match(&priv->wdev->dev, &lwmi_cd_sub_master_ops,
+					      master_match);
+	if (ret)
+		return ret;
+
+	priv->sub_master->registered = true;
+	return 0;
+}
+
+/**
+ * lwmi_cd_sub_master_del() - Unregister a sub-master if it's registered
+ * @priv: Pointer to the sub-master capdata device private data.
+ */
+static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
+{
+	if (!priv->sub_master->registered)
+		return;
+
+	component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
+	priv->sub_master->registered = false;
+}
+
+/**
+ * lwmi_cd_sub_component_bind() - Bind sub-component to sub-master device.
+ * @sc_dev: Pointer to the sub-component capdata parent device.
+ * @sm_dev: Pointer to the sub-master capdata parent device.
+ * @data: Pointer used to return the capability data list pointer.
+ *
+ * On sub-master's bind, provide a pointer to the local capdata list.
+ * This is used by the sub-master to call the master callback.
+ *
+ * Return: 0
+ */
+static int lwmi_cd_sub_component_bind(struct device *sc_dev,
+				      struct device *sm_dev, void *data)
+{
+	struct lwmi_cd_priv *priv = dev_get_drvdata(sc_dev);
+	struct cd_list **listp = data;
+
+	*listp = priv->list;
+
+	return 0;
+}
+
+static const struct component_ops lwmi_cd_sub_component_ops = {
+	.bind = lwmi_cd_sub_component_bind,
 };
 
 /*
@@ -471,9 +710,28 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		goto out;
 
 	switch (info->type) {
-	case LENOVO_CAPABILITY_DATA_00:
+	case LENOVO_CAPABILITY_DATA_00: {
+		enum lwmi_cd_type sub_component_type = LENOVO_FAN_TEST_DATA;
+		struct capdata00 capdata00;
+
+		ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
+		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
+			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
+			sub_component_type = CD_TYPE_NONE;
+		}
+
+		/* Sub-master (capdata00) <-> sub-component (capdata_fan) */
+		ret = lwmi_cd_sub_master_add(priv, sub_component_type);
+		if (ret)
+			goto out;
+
+		/* Master (lenovo-wmi-other) <-> sub-master (capdata00) */
 		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
+		if (ret)
+			lwmi_cd_sub_master_del(priv);
+
 		goto out;
+	}
 	case LENOVO_CAPABILITY_DATA_01:
 		priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
 
@@ -489,6 +747,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
 		goto out;
 	case LENOVO_FAN_TEST_DATA:
+		ret = component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
 		goto out;
 	default:
 		return -EINVAL;
@@ -510,10 +769,13 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 
 	switch (priv->list->type) {
 	case LENOVO_CAPABILITY_DATA_00:
+		lwmi_cd_sub_master_del(priv);
+		fallthrough;
 	case LENOVO_CAPABILITY_DATA_01:
 		component_del(&wdev->dev, &lwmi_cd_component_ops);
 		break;
 	case LENOVO_FAN_TEST_DATA:
+		component_del(&wdev->dev, &lwmi_cd_sub_component_ops);
 		break;
 	default:
 		WARN_ON(1);
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 38af4c4e4ef4b..59ca3b3e5760b 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -5,8 +5,20 @@
 #ifndef _LENOVO_WMI_CAPDATA_H_
 #define _LENOVO_WMI_CAPDATA_H_
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
+#define LWMI_SUPP_VALID		BIT(0)
+#define LWMI_SUPP_MAY_GET	(LWMI_SUPP_VALID | BIT(1))
+#define LWMI_SUPP_MAY_SET	(LWMI_SUPP_VALID | BIT(2))
+
+#define LWMI_ATTR_DEV_ID_MASK	GENMASK(31, 24)
+#define LWMI_ATTR_FEAT_ID_MASK	GENMASK(23, 16)
+#define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
+#define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
+
+#define LWMI_DEVICE_ID_FAN	0x04
+
 struct component_match;
 struct device;
 struct cd_list;
@@ -32,9 +44,17 @@ struct capdata_fan {
 	u32 max_rpm;
 };
 
+typedef void (*cd_list_cb_t)(struct device *master_dev, struct cd_list *cd_list);
+
 struct lwmi_cd_binder {
 	struct cd_list *cd00_list;
 	struct cd_list *cd01_list;
+	/*
+	 * May be called during or after the bind callback.
+	 * Will be called with NULL if capdata_fan does not exist.
+	 * The pointer is only valid in the callback; never keep it for later use!
+	 */
+	cd_list_cb_t cd_fan_list_cb;
 };
 
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index a2325b5ec608a..c1cf2278369e1 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -54,11 +54,6 @@
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
-#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
-#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
-#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
-#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
-
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
-- 
2.51.0

