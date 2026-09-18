Received: from outbound.mr.icloud.com (mr-2006i-snip4-5.eps.apple.com [57.103.70.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5DF44C508
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753867; cv=none; b=XCUHQy8A038aQpWtYxf6khScjpLSYPXvye4DFII7NwlGdizHoU2hVr1+6cBhyr5RBUf/OTHKjtsi4InkVab1bMOihNtU+/IrQC7lBzaAzui6BweshrAIANDoQgABuptouK50lwZv/buXt0b2q9DldV5Db/C2I8ZmSyPIuSNCGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753867; c=relaxed/simple;
	bh=sxiR99n3y1JZKOk8T9tovfx493S+kVt5P20eDddbX24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKD20dDBOPnLFN12PT28RsNJFXbxBQwkfAYKK4O5hKy0s42YcZN7qWoLYPkOQbK5Nxao4L7KuxthCYyrVDqfshbqBYzogCr4xjP70297/Sl/bTTM3UB0eKQIRq+9lqlnV74Of1pjNy5Jpx3tUMHpjBaOZouZ3PlBQ51vLp4MKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=AkYzDpiT; arc=none smtp.client-ip=57.103.70.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="AkYzDpiT"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id E6FE318003EA;
	Fri, 18 Sep 2026 17:50:54 +0000 (UTC)
X-ICL-RepId: 01a0b5a4-8b85-7f0e-8892-2a59b642fdf4
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAOS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKCUAfTB9bQ1gZVVBUEVdQC1kCQg9IClwPWgVFCU0BQw9eBkYIVQFAXQRAFFgWcw9FBEcXUVZcH1BVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1789753857; x=1792345857; bh=eXMTzmVUZwdBfkdHlDOLsbmve4Fe9DR9tNia7yXFXB4=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=AkYzDpiTnjU1icItecPlCcUNULqb+1qF8Vcug5ePTE6320r6DiYDL0st2YfRQpeKYi4iQjOx3cgrfu5/9byQUW8Mc5aEl9Hud5pfDcTH1In3v1vlJBBX8AqSn48rqPCgkaOeIsEqukQ9wbrpnt8/5YRWx7iSZV1zWIE1D+EVo0WiQ3hYOY2kD/2ZSo40rYQxaNTO8njL++pCITUg3XlYwDFT6UxHJm5LDykKQJ5RXkudPKlgFsAbEPdtKcl/8wNHZFSJMUvZ4tFlAQds7fBXa5CVL3rVq+qmGiTjjZFGCjVX8xTJLfqHoiLaNBewN2OSC399Z7q8aEJvlixAaIEFMA==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id C0FCB18003DB;
	Fri, 18 Sep 2026 17:50:53 +0000 (UTC)
From: Jordan Brough <jordan@brough.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Henrik Rydberg <rydberg@bitmath.se>,
	linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jordan Brough <jordan@brough.org>
Subject: [PATCH v2 1/2] ACPI: battery: add unified battery hook mechanism for ACPI and SBS batteries
Date: Fri, 18 Sep 2026 11:50:51 -0600
Message-ID: <20260918175052.85461-2-jordan@brough.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918175052.85461-1-jordan@brough.org>
References: <20260918175052.85461-1-jordan@brough.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI1NiBTYWx0ZWRfXwCt21MwV8eEQ
 HgjhLuJmXwok656mso1kmGyhbWZUwUWIJ5MD067qBf/zZQH0YaU7krevAAc7Pxcy/4dJVnp9SqP
 17x9rcH/dJLmJLEMmmLQhDbwoHdVwRyputbKVIgAFSf/4Lg1fDzKRTPgkTGvT4uAjyffmEMwQ8x
 Y157FdyY7Cw0SXZvsQb1ojPZiv/3JVjs+tTq+HpHf9PpzOCD2N+xvx63T9dB66YuqmMp6X2GLGL
 sXXsz6yWk27X2eclHs2drxaUWc93fOjZfrMSh3yf1qXCdbevRorGYyZ9skei72rtrILvGwpOwE8
 btv4AhwdG61mGDmyckajL8VSxjYUIMcl5fpSDGUBJHxE6HIrh36l4aj82KeZ7Y=
X-Proofpoint-ORIG-GUID: QD5UN3K4W3E6WuZaCYmve2gsv-VNNLg_
X-Proofpoint-GUID: QD5UN3K4W3E6WuZaCYmve2gsv-VNNLg_
X-Authority-Info-Out: v=2.4 cv=KPNXzVFo c=1 sm=1 tr=0 ts=6aad79ff
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VTue-mJiAAAA:8 a=gFGppuTrAAAA:8
 a=RVpIhFylycjLt7sJNT0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=S9YjYK_EKPFYWS37g-LV:22 a=_Y0xhhAoguY4gwfEQMhp:22
X-JNJ: AAAAAAABjBux64a55YpsQaGW3m21zw1iEAQ2MArxPsgVTDittJk2MCBYWqTLFEquH2BePltsgB02il+1XJr/FoSSP4SVcyxZCtXs6Pv7sk/C9eKCi4JtPfCVZS3//v/BOyGaycwX1I5D5xdpYR/mDV+TN+SkkWuZuDtBrnBTdfr5LuEj2IKSVrM0opWB5WXAPfsBxwobGYB3j9YflOyuY7ECeQ+Cga3xloxx6573IUIY5mNM3tjKgDgvCGPCl+XTxbfyDIsQObMWFEA4zUXVhe2/OZc2K8ehpG4rYPMnNbpbu8NfkFr0WXAgyX/+TajR8L+YyrooxrBVDF9W8YaQbVVnjWKpanFvM3C/COOngqwxlNWVgR4Nu7hs7R49Q+7FMvFu7nJCVEFPJ4Oxlp8URwC2CL0a3sB26fIxzroi3T1jA1qneL7428AyoCu36MoU/XgsQ8m3ho8e3eCUCEHFvz2tudJrxiojANy/OJrxDWUxeMEMUKqun3jgBUdzUHySrFmnatUh+Y2e/L9rnqEYj9O2THngFAmbisrIpzTLsE7ozRcc5OGq5zUdy0FsoEwMnuIS1zs/eIbKHK4n6MW+o5Tqz7+ZI4T6uBtNzHZpZRGedU3VJ2gGK3aoURSuF3smCllN4LmIsroGcwQ/TKUYYpbIBs8QUVG/cKMjkLF0mYY7Y5g9kBQa1nfL36sZ6HRu4/lUMLTbPHG9QLr5qxolRZTsRpfSBNcsR2x1xOHzSQYIo4eBRBlEvO0ajN1CEbNtFC58o+sS/JBcO/RpGvlK54bq8FYlzHEUVyno3l4XNcV1VbdD0v3hirVWlNeZQ56fz3oPIhec3Mo=

drivers/acpi/battery.c provides a battery_hook_register()/unregister()
mechanism that lets other drivers (e.g. platform and hwmon drivers
exposing vendor-specific charge control) attach extra power_supply
properties to an ACPI Control Method Battery (HID PNP0C0A).

Some machines instead expose their battery through the ACPI Smart
Battery System (HID ACPI0002, "SBS") driver in drivers/acpi/sbs.c,
which has had no equivalent hook point.

Extract the battery hooking implementation out of drivers/acpi/battery.c
into a shared helper in drivers/acpi/battery_hook.c, built directly into
the ACPI core (acpi.o). Both drivers/acpi/battery.c and drivers/acpi/sbs.c
now register their power_supply devices with this shared hook
infrastructure via battery_hook_add_battery() and
battery_hook_remove_battery().

This unifies the hooking interface across both battery drivers so
callers only need to register a single struct acpi_battery_hook without
needing to know or care whether the underlying hardware exposes a Control
Method Battery or an SBS battery.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Jordan Brough <jordan@brough.org>
---
 drivers/acpi/Makefile       |   1 +
 drivers/acpi/battery.c      | 165 +-----------------------------------
 drivers/acpi/battery_hook.c | 112 ++++++++++++++++++++++++
 drivers/acpi/sbs.c          |   8 +-
 include/acpi/battery.h      |  10 +++
 5 files changed, 133 insertions(+), 163 deletions(-)
 create mode 100644 drivers/acpi/battery_hook.c

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index d1b0affb844..57413f2a09e 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_ACPI)		+= acpi.o \
 # All the builtin files are in the "acpi." module_param namespace.
 acpi-y				+= osi.o osl.o utils.o reboot.o
 acpi-y				+= nvs.o
+acpi-y				+= battery_hook.o
 
 # Power management related files
 acpi-y				+= wakeup.o
diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
index 670853ec3a4..9b6af528bfe 100644
--- a/drivers/acpi/battery.c
+++ b/drivers/acpi/battery.c
@@ -105,7 +105,7 @@ struct acpi_battery {
 	struct kfifo acpi_notif_fifo;
 	struct delayed_work acpi_notif_dwork;
 	struct notifier_block pm_nb;
-	struct list_head list;
+	struct acpi_battery_hook_device hook_dev;
 	unsigned long flags;
 
 	struct mutex property_lock; /* Protects properties below. */
@@ -744,164 +744,6 @@ static struct attribute *acpi_battery_attrs[] = {
 };
 ATTRIBUTE_GROUPS(acpi_battery);
 
-/*
- * The Battery Hooking API
- *
- * This API is used inside other drivers that need to expose
- * platform-specific behaviour within the generic driver in a
- * generic way.
- *
- */
-
-static LIST_HEAD(acpi_battery_list);
-static LIST_HEAD(battery_hook_list);
-static DEFINE_MUTEX(hook_mutex);
-
-static void battery_hook_unregister_unlocked(struct acpi_battery_hook *hook)
-{
-	struct acpi_battery *battery;
-
-	/*
-	 * In order to remove a hook, we first need to
-	 * de-register all the batteries that are registered.
-	 */
-	list_for_each_entry(battery, &acpi_battery_list, list) {
-		if (!hook->remove_battery(battery->bat, hook))
-			power_supply_changed(battery->bat);
-	}
-	list_del_init(&hook->list);
-
-	pr_info("hook unregistered: %s\n", hook->name);
-}
-
-void battery_hook_unregister(struct acpi_battery_hook *hook)
-{
-	mutex_lock(&hook_mutex);
-	/*
-	 * Ignore already unregistered battery hooks. This might happen
-	 * if a battery hook was previously unloaded due to an error when
-	 * adding a new battery.
-	 */
-	if (!list_empty(&hook->list))
-		battery_hook_unregister_unlocked(hook);
-
-	mutex_unlock(&hook_mutex);
-}
-EXPORT_SYMBOL_GPL(battery_hook_unregister);
-
-void battery_hook_register(struct acpi_battery_hook *hook)
-{
-	struct acpi_battery *battery;
-
-	mutex_lock(&hook_mutex);
-	list_add(&hook->list, &battery_hook_list);
-	/*
-	 * Now that the driver is registered, we need
-	 * to notify the hook that a battery is available
-	 * for each battery, so that the driver may add
-	 * its attributes.
-	 */
-	list_for_each_entry(battery, &acpi_battery_list, list) {
-		if (hook->add_battery(battery->bat, hook)) {
-			/*
-			 * If a add-battery returns non-zero,
-			 * the registration of the hook has failed,
-			 * and we will not add it to the list of loaded
-			 * hooks.
-			 */
-			pr_err("hook failed to load: %s", hook->name);
-			battery_hook_unregister_unlocked(hook);
-			goto end;
-		}
-
-		power_supply_changed(battery->bat);
-	}
-	pr_info("new hook: %s\n", hook->name);
-end:
-	mutex_unlock(&hook_mutex);
-}
-EXPORT_SYMBOL_GPL(battery_hook_register);
-
-static void devm_battery_hook_unregister(void *data)
-{
-	struct acpi_battery_hook *hook = data;
-
-	battery_hook_unregister(hook);
-}
-
-int devm_battery_hook_register(struct device *dev, struct acpi_battery_hook *hook)
-{
-	battery_hook_register(hook);
-
-	return devm_add_action_or_reset(dev, devm_battery_hook_unregister, hook);
-}
-EXPORT_SYMBOL_GPL(devm_battery_hook_register);
-
-/*
- * This function gets called right after the battery sysfs
- * attributes have been added, so that the drivers that
- * define custom sysfs attributes can add their own.
- */
-static void battery_hook_add_battery(struct acpi_battery *battery)
-{
-	struct acpi_battery_hook *hook_node, *tmp;
-
-	mutex_lock(&hook_mutex);
-	INIT_LIST_HEAD(&battery->list);
-	list_add(&battery->list, &acpi_battery_list);
-	/*
-	 * Since we added a new battery to the list, we need to
-	 * iterate over the hooks and call add_battery for each
-	 * hook that was registered. This usually happens
-	 * when a battery gets hotplugged or initialized
-	 * during the battery module initialization.
-	 */
-	list_for_each_entry_safe(hook_node, tmp, &battery_hook_list, list) {
-		if (hook_node->add_battery(battery->bat, hook_node)) {
-			/*
-			 * The notification of the hook has failed, to
-			 * prevent further errors we will unload the hook.
-			 */
-			pr_err("error in hook, unloading: %s",
-					hook_node->name);
-			battery_hook_unregister_unlocked(hook_node);
-		}
-	}
-	mutex_unlock(&hook_mutex);
-}
-
-static void battery_hook_remove_battery(struct acpi_battery *battery)
-{
-	struct acpi_battery_hook *hook;
-
-	mutex_lock(&hook_mutex);
-	/*
-	 * Before removing the hook, we need to remove all
-	 * custom attributes from the battery.
-	 */
-	list_for_each_entry(hook, &battery_hook_list, list) {
-		hook->remove_battery(battery->bat, hook);
-	}
-	/* Then, just remove the battery from the list */
-	list_del(&battery->list);
-	mutex_unlock(&hook_mutex);
-}
-
-static void __exit battery_hook_exit(void)
-{
-	struct acpi_battery_hook *hook;
-	struct acpi_battery_hook *ptr;
-	/*
-	 * At this point, the acpi_bus_unregister_driver()
-	 * has called remove for all batteries. We just
-	 * need to remove the hooks.
-	 */
-	list_for_each_entry_safe(hook, ptr, &battery_hook_list, list) {
-		battery_hook_unregister(hook);
-	}
-	mutex_destroy(&hook_mutex);
-}
-
 static int sysfs_add_battery(struct acpi_battery *battery)
 {
 	struct power_supply_config psy_cfg = {
@@ -957,7 +799,7 @@ static int sysfs_add_battery(struct acpi_battery *battery)
 		battery->bat = NULL;
 		return result;
 	}
-	battery_hook_add_battery(battery);
+	battery_hook_add_battery(&battery->hook_dev, battery->bat);
 	return 0;
 }
 
@@ -966,7 +808,7 @@ static void sysfs_remove_battery(struct acpi_battery *battery)
 	if (!battery->bat)
 		return;
 
-	battery_hook_remove_battery(battery);
+	battery_hook_remove_battery(&battery->hook_dev);
 	power_supply_unregister(battery->bat);
 	battery->bat = NULL;
 }
@@ -1476,7 +1318,6 @@ static int __init acpi_battery_init(void)
 static void __exit acpi_battery_exit(void)
 {
 	platform_driver_unregister(&acpi_battery_driver);
-	battery_hook_exit();
 }
 
 module_init(acpi_battery_init);
diff --git a/drivers/acpi/battery_hook.c b/drivers/acpi/battery_hook.c
new file mode 100644
index 00000000000..308d10c940e
--- /dev/null
+++ b/drivers/acpi/battery_hook.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ACPI Battery Hooking API
+ *
+ * Provides a common registration and notification framework for drivers
+ * that attach platform-specific properties or extensions to ACPI-registered
+ * batteries (both ACPI Control Method batteries and Smart Battery Systems).
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/power_supply.h>
+#include <acpi/battery.h>
+
+static LIST_HEAD(acpi_battery_list);
+static LIST_HEAD(battery_hook_list);
+static DEFINE_MUTEX(hook_mutex);
+
+static void battery_hook_unregister_unlocked(struct acpi_battery_hook *hook)
+{
+	struct acpi_battery_hook_device *hook_dev;
+
+	list_for_each_entry(hook_dev, &acpi_battery_list, list) {
+		if (!hook->remove_battery(hook_dev->battery, hook))
+			power_supply_changed(hook_dev->battery);
+	}
+	list_del_init(&hook->list);
+
+	pr_info("hook unregistered: %s\n", hook->name);
+}
+
+void battery_hook_unregister(struct acpi_battery_hook *hook)
+{
+	mutex_lock(&hook_mutex);
+	if (!list_empty(&hook->list))
+		battery_hook_unregister_unlocked(hook);
+	mutex_unlock(&hook_mutex);
+}
+EXPORT_SYMBOL_GPL(battery_hook_unregister);
+
+void battery_hook_register(struct acpi_battery_hook *hook)
+{
+	struct acpi_battery_hook_device *hook_dev;
+
+	mutex_lock(&hook_mutex);
+	list_add(&hook->list, &battery_hook_list);
+
+	list_for_each_entry(hook_dev, &acpi_battery_list, list) {
+		if (hook->add_battery(hook_dev->battery, hook)) {
+			pr_err("hook failed to load: %s\n", hook->name);
+			battery_hook_unregister_unlocked(hook);
+			goto end;
+		}
+
+		power_supply_changed(hook_dev->battery);
+	}
+	pr_info("new hook: %s\n", hook->name);
+end:
+	mutex_unlock(&hook_mutex);
+}
+EXPORT_SYMBOL_GPL(battery_hook_register);
+
+static void devm_battery_hook_unregister(void *data)
+{
+	struct acpi_battery_hook *hook = data;
+
+	battery_hook_unregister(hook);
+}
+
+int devm_battery_hook_register(struct device *dev, struct acpi_battery_hook *hook)
+{
+	battery_hook_register(hook);
+
+	return devm_add_action_or_reset(dev, devm_battery_hook_unregister, hook);
+}
+EXPORT_SYMBOL_GPL(devm_battery_hook_register);
+
+void battery_hook_add_battery(struct acpi_battery_hook_device *hook_dev,
+			      struct power_supply *battery)
+{
+	struct acpi_battery_hook *hook_node, *tmp;
+
+	hook_dev->battery = battery;
+	mutex_lock(&hook_mutex);
+	INIT_LIST_HEAD(&hook_dev->list);
+	list_add(&hook_dev->list, &acpi_battery_list);
+
+	list_for_each_entry_safe(hook_node, tmp, &battery_hook_list, list) {
+		if (hook_node->add_battery(hook_dev->battery, hook_node)) {
+			pr_err("error in hook, unloading: %s\n", hook_node->name);
+			battery_hook_unregister_unlocked(hook_node);
+		}
+	}
+	mutex_unlock(&hook_mutex);
+}
+EXPORT_SYMBOL_GPL(battery_hook_add_battery);
+
+void battery_hook_remove_battery(struct acpi_battery_hook_device *hook_dev)
+{
+	struct acpi_battery_hook *hook;
+
+	mutex_lock(&hook_mutex);
+	list_for_each_entry(hook, &battery_hook_list, list)
+		hook->remove_battery(hook_dev->battery, hook);
+
+	list_del(&hook_dev->list);
+	hook_dev->battery = NULL;
+	mutex_unlock(&hook_mutex);
+}
+EXPORT_SYMBOL_GPL(battery_hook_remove_battery);
diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 86b7c797585..a2f27c0d233 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) "ACPI: " fmt
 
 #include <linux/init.h>
+#include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -54,6 +55,7 @@ struct acpi_battery {
 	struct power_supply *bat;
 	struct power_supply_desc bat_desc;
 	struct acpi_sbs *sbs;
+	struct acpi_battery_hook_device hook_dev;
 	unsigned long update_time;
 	char name[8];
 	char manufacturer_name[ACPI_SBS_BLOCK_MAX];
@@ -555,6 +557,8 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int id)
 		goto end;
 	}
 
+	battery_hook_add_battery(&battery->hook_dev, battery->bat);
+
       end:
 	pr_info("%s [%s]: Battery Slot [%s] (battery %s)\n",
 	       ACPI_SBS_DEVICE_NAME, acpi_device_bid(sbs->device),
@@ -566,8 +570,10 @@ static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
 {
 	struct acpi_battery *battery = &sbs->battery[id];
 
-	if (battery->bat)
+	if (battery->bat) {
+		battery_hook_remove_battery(&battery->hook_dev);
 		power_supply_unregister(battery->bat);
+	}
 }
 
 static int acpi_charger_add(struct acpi_sbs *sbs)
diff --git a/include/acpi/battery.h b/include/acpi/battery.h
index c93f16dfb94..df5087c0529 100644
--- a/include/acpi/battery.h
+++ b/include/acpi/battery.h
@@ -3,6 +3,7 @@
 #define __ACPI_BATTERY_H
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/power_supply.h>
 
 #define ACPI_BATTERY_CLASS "battery"
@@ -18,8 +19,17 @@ struct acpi_battery_hook {
 	struct list_head list;
 };
 
+struct acpi_battery_hook_device {
+	struct power_supply *battery;
+	struct list_head list;
+};
+
 void battery_hook_register(struct acpi_battery_hook *hook);
 void battery_hook_unregister(struct acpi_battery_hook *hook);
 int devm_battery_hook_register(struct device *dev, struct acpi_battery_hook *hook);
 
+void battery_hook_add_battery(struct acpi_battery_hook_device *hook_dev,
+			      struct power_supply *battery);
+void battery_hook_remove_battery(struct acpi_battery_hook_device *hook_dev);
+
 #endif
-- 
2.55.0

