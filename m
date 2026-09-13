Received: from outbound.mr.icloud.com (mr-2006f-snip4-11.eps.apple.com [57.103.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C943E1D05
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341260; cv=none; b=a9CCZRF+qpp3je4WoNSizllnvqvViKia7qTaJCYkuXw2NR+2bOGEnoKAOVl4oClyveCNplCWRqTvsTozJ3ntPEtMT9+gznL01klhc16QC1nMdUh2qNYM8o7WgpZxjEBBV88q4VK0hg+VYfedLFTB1DcPJe1R/NQxbX0zpGgNtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341260; c=relaxed/simple;
	bh=dlW9ZAR0IbGBRHH7lrs5MMmhRgC5Snm58uA1DU2sT8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQNH2Q7MzsEZE+Qs6bisGaCPm7kHuXhDxbGT9049N2lUZQiMmsIqjyDNQrGGt6ZGDRvIbql/BX8ncp3C2jo7Hc+VcDwtlxv5ofMXufTtLeB2M/arqXgA3RRWzE4Akig85tOf0hmX2Y8zw80lLE10J1LD1qaYo7UzOHk4Nvn+Iac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=hfLsYTzB; arc=none smtp.client-ip=57.103.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="hfLsYTzB"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPS id 81A1F18003C6;
	Sun, 13 Sep 2026 23:14:12 +0000 (UTC)
X-ICL-RepId: 01a09d0c-bb61-7eec-b510-3ad7747e85f1
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAGWxIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlACVg1UBRkEQBcZFVoJClcAQAtOA1QGWABDCEwCXRlfA0YASgFABUZYH0scUgN3CUAfTB9bQ1gZVU4ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1789341255; x=1791933255; bh=ApvqrzqiuAetXstUSKvkfMR2Zu+HwcCmcYY2HROSg+M=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=hfLsYTzBJX0U1CYcTpFEy54QJ6VhiIZW3LlX07QWYx9Lr/4Nk2kOEnUEZ9lkuihUdu74oA3icGbnozpdtsDNntdI8WVp8xSjytVKZFD74ppViEA248TxxwhKGhGoNSDEV8GSigM03hXJWqQtv4tMPRKlzjzgOC6m17Krv+ebPgsJC/Ltnw17/+7MzyR82DxNdXpRGcZvm8vqbf0Hm3R2ufYVySOLUHgQg12wk1CmjauBKVUJks+bXrWym779NyGOikElE5vozuRRjK/jORVhylVEwW4YimXV+J7azlL+pEAHAGuv7QMfgDGyixZg95tGjllrKquEqC4irCRf9osSJg==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPSA id 9EF9D18002AD;
	Sun, 13 Sep 2026 23:14:11 +0000 (UTC)
From: Jordan Brough <jordan@brough.org>
To: rafael@kernel.org,
	rydberg@bitmath.org,
	linux@roeck-us.net
Cc: lenb@kernel.org,
	maciej.wieczor-retman@intel.com,
	pawel.chmielewski@intel.com,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ACPI: sbs: add battery hook mechanism for SBS-registered batteries
Date: Sun, 13 Sep 2026 17:14:09 -0600
Message-ID: <20260913231410.416922-2-jordan@brough.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913231410.416922-1-jordan@brough.org>
References: <20260913231410.416922-1-jordan@brough.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=Q5DfIo2a c=1 sm=1 tr=0 ts=6aa72e45
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gFGppuTrAAAA:8 a=9ZG6tJcGPwO3Ozu3yHEA:9 a=_Y0xhhAoguY4gwfEQMhp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzMyBTYWx0ZWRfXwWivDplbJuFv
 vIZbWrYeYQBAxexNO4Hypcu7V7Tvk9O2XXOWVYDukOM19TV+Ab72T7CzyZwYWvLwwc/8j8Edh1f
 0AHeYeFwOW0B25d83Cfigg7Gb8XgI6Yh/jpwtaidwZbyZJXV6K1IOWiaEjbTvfOjZPMBvY0tSJl
 tljYS+tT7joS8S2cMb778y9u5DU4e4nqyU3R2YrgI+6zkF/uIfPtKmRKhEXh1prppqCZVoX/1GK
 JXPO7DETYCRGEO1KBNj8YHrxPy9aHzfEpj2OXM5HH9qQdzvMh3tttqGS6ZccqxB/5S/R06ajGZW
 UrgN0EHENY3gHtP+bp+ObKKHxeiyOubHMCtmd7sVk3pQo1jXa+DSgX3SCkV+Tg=
X-Proofpoint-ORIG-GUID: AWtmS5vvUN46HZTO4-DBswCSboc_DLqs
X-Proofpoint-GUID: AWtmS5vvUN46HZTO4-DBswCSboc_DLqs
X-JNJ: AAAAAAABf1q1lXFTDr1IuhUyCBHPRWwNY8MrD7khVDGbTKrZgUaXgAiIicurQkKV2OOaCQSroVtVaZBNADmxwHgEZ6+rbYW3tuVhhHIzsiaMpsCl7pVyAnSSIxKlH7Ci20QPwB6nRUyJ+NYtNWtQKYAMxs+8td8c9VrnnRp7b/1EqAvkKGXTE+NidOP9fIPtMX4ZHuXwZN2WpM8FB/ElViTUvKU3pW7n2lWDiOOlFzlES2nTOWSG6vv8RaCldRMSsdyzRoWQBPm3lq4As10Ly+TJWt6EKX+J5zr9FVWfmeobtwT81M/Qtx+jVv2YnyrPVXLnIx5IynO4GLCDFiC0MYXVNbu5wlKWvsEjKAhkjuJur/C2htq4lkh9KxusB3M7JVVzLTd8vFaFBioe8pP3yk4kyNN+b56Dck0sAVb5z+Av49hJ1g/pDlpx3ctivi6zqsoIJc/c9LrXOghnCuWytAecH2G24/hguTubYp6CardEhkUEtfU30YHqug0dLAvDg6WGEgRGtbvvOWbWyml+MSfCgs4cr2DQpf7qd77sTCvbisnFeHoOUSxw7IUOdPjXtod1zMKwswWazoX+vUYMWHtpnZpTfH5mvUoGG0suwCgB088nRiBHEsFbmVg5laF2ve5rT4VQTXlYPhtWMRMCSvy+lhhMeQedxs+s3VaINRHm47/SxzY4B3IxDRC6B/yEAsfB5oVBa+73lhmHzEEvqq2Nwiwn2t0rB0YkohC7yB/Ss3pMH7opZd3+VH5HQ8i4fIGHdOc2l8hRse/kewnFmgGlm/bqwX0DMO5M1K+mC3FovUkVi2M1ZctMCSi/mKpH6CcJkUeciDZM7HtbleSmd660vUA1WMlzWG0mjYQ=

drivers/acpi/battery.c provides a battery_hook_register()/unregister()
mechanism that lets other drivers (e.g. hwmon drivers exposing vendor-
specific charge control) attach extra power_supply properties to an
ACPI Control Method Battery (HID PNP0C0A, "CmBatt").

Some machines instead expose their battery through the ACPI Smart
Battery System (HID ACPI0002, "SBS") driver in drivers/acpi/sbs.c,
which has no equivalent hook point. On these machines a hwmon driver
has no supported way to attach additional properties to the battery's
power_supply device.

Add a parallel sbs_battery_hook_register()/unregister() mechanism to
drivers/acpi/sbs.c, mirroring the existing CmBatt hook API in name and
behavior so that callers can support both battery registration paths
symmetrically. This is purely additive: no existing hook consumer or
code path in drivers/acpi/battery.c is touched, and sbs.c's own
behavior is unchanged for any driver that does not call the new API.

This is a prerequisite for hwmon/applesmc gaining
charge_control_end_threshold support, since the Intel MacBook hardware
being targeted registers its battery via SBS, not CmBatt.

Signed-off-by: Jordan Brough <jordan@brough.org>
---
 drivers/acpi/sbs.c     | 147 ++++++++++++++++++++++++++++++++++++++++-
 include/acpi/battery.h |  16 +++++
 2 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 86b7c797585..305bf62eae3 100644
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
+	struct list_head list;		/* node in sbs_hook_battery_list */
 	unsigned long update_time;
 	char name[8];
 	char manufacturer_name[ACPI_SBS_BLOCK_MAX];
@@ -518,6 +520,145 @@ static int acpi_battery_read(struct acpi_battery *battery)
 	return result;
 }
 
+/*
+ * Battery hook support, mirroring the mechanism in drivers/acpi/battery.c
+ * for batteries registered there. That mechanism only sees batteries
+ * added via drivers/acpi/battery.c, not the ones this driver registers,
+ * so drivers wanting to attach optional functionality (e.g. an extra
+ * power_supply_ext) to an SBS battery need this separate copy; see the
+ * comment above the declarations in include/acpi/battery.h.
+ */
+static LIST_HEAD(sbs_hook_list);
+static LIST_HEAD(sbs_hook_battery_list);
+static DEFINE_MUTEX(sbs_hook_mutex);
+
+static void sbs_battery_hook_unregister_unlocked(struct acpi_battery_hook *hook)
+{
+	struct acpi_battery *battery;
+
+	/*
+	 * In order to remove a hook, we first need to
+	 * de-register all the batteries that are registered.
+	 */
+	list_for_each_entry(battery, &sbs_hook_battery_list, list) {
+		if (!hook->remove_battery(battery->bat, hook))
+			power_supply_changed(battery->bat);
+	}
+	list_del_init(&hook->list);
+}
+
+void sbs_battery_hook_unregister(struct acpi_battery_hook *hook)
+{
+	mutex_lock(&sbs_hook_mutex);
+	/*
+	 * Ignore already unregistered battery hooks. This might happen
+	 * if a battery hook was previously unloaded due to an error when
+	 * adding a new battery.
+	 */
+	if (!list_empty(&hook->list))
+		sbs_battery_hook_unregister_unlocked(hook);
+	mutex_unlock(&sbs_hook_mutex);
+}
+EXPORT_SYMBOL_GPL(sbs_battery_hook_unregister);
+
+void sbs_battery_hook_register(struct acpi_battery_hook *hook)
+{
+	struct acpi_battery *battery;
+
+	mutex_lock(&sbs_hook_mutex);
+	list_add(&hook->list, &sbs_hook_list);
+	/*
+	 * Now that the driver is registered, we need
+	 * to notify the hook that a battery is available
+	 * for each battery, so that the driver may add
+	 * its attributes.
+	 */
+	list_for_each_entry(battery, &sbs_hook_battery_list, list) {
+		if (hook->add_battery(battery->bat, hook)) {
+			/*
+			 * If a add-battery returns non-zero,
+			 * the registration of the hook has failed,
+			 * and we will not add it to the list of loaded
+			 * hooks.
+			 */
+			pr_err("hook failed to load: %s", hook->name);
+			sbs_battery_hook_unregister_unlocked(hook);
+			goto end;
+		}
+
+		power_supply_changed(battery->bat);
+	}
+	pr_info("new hook: %s\n", hook->name);
+end:
+	mutex_unlock(&sbs_hook_mutex);
+}
+EXPORT_SYMBOL_GPL(sbs_battery_hook_register);
+
+static void devm_sbs_battery_hook_unregister(void *data)
+{
+	struct acpi_battery_hook *hook = data;
+
+	sbs_battery_hook_unregister(hook);
+}
+
+int devm_sbs_battery_hook_register(struct device *dev, struct acpi_battery_hook *hook)
+{
+	sbs_battery_hook_register(hook);
+
+	return devm_add_action_or_reset(dev, devm_sbs_battery_hook_unregister, hook);
+}
+EXPORT_SYMBOL_GPL(devm_sbs_battery_hook_register);
+
+/*
+ * This function gets called right after the battery sysfs
+ * attributes have been added, so that the drivers that
+ * define custom sysfs attributes can add their own.
+ */
+static void sbs_battery_hook_add_battery(struct acpi_battery *battery)
+{
+	struct acpi_battery_hook *hook_node, *tmp;
+
+	mutex_lock(&sbs_hook_mutex);
+	INIT_LIST_HEAD(&battery->list);
+	list_add(&battery->list, &sbs_hook_battery_list);
+	/*
+	 * Since we added a new battery to the list, we need to
+	 * iterate over the hooks and call add_battery for each
+	 * hook that was registered. This usually happens
+	 * when a battery gets hotplugged or initialized
+	 * during the battery module initialization.
+	 */
+	list_for_each_entry_safe(hook_node, tmp, &sbs_hook_list, list) {
+		if (hook_node->add_battery(battery->bat, hook_node)) {
+			/*
+			 * The notification of the hook has failed, to
+			 * prevent further errors we will unload the hook.
+			 */
+			pr_err("error in hook, unloading: %s",
+			       hook_node->name);
+			sbs_battery_hook_unregister_unlocked(hook_node);
+		}
+	}
+	mutex_unlock(&sbs_hook_mutex);
+}
+
+static void sbs_battery_hook_remove_battery(struct acpi_battery *battery)
+{
+	struct acpi_battery_hook *hook;
+
+	mutex_lock(&sbs_hook_mutex);
+	/*
+	 * Before removing the hook, we need to remove all
+	 * custom attributes from the battery.
+	 */
+	list_for_each_entry(hook, &sbs_hook_list, list) {
+		hook->remove_battery(battery->bat, hook);
+	}
+	/* Then, just remove the battery from the list */
+	list_del(&battery->list);
+	mutex_unlock(&sbs_hook_mutex);
+}
+
 /* Smart Battery */
 static int acpi_battery_add(struct acpi_sbs *sbs, int id)
 {
@@ -555,6 +696,8 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int id)
 		goto end;
 	}
 
+	sbs_battery_hook_add_battery(battery);
+
       end:
 	pr_info("%s [%s]: Battery Slot [%s] (battery %s)\n",
 	       ACPI_SBS_DEVICE_NAME, acpi_device_bid(sbs->device),
@@ -566,8 +709,10 @@ static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
 {
 	struct acpi_battery *battery = &sbs->battery[id];
 
-	if (battery->bat)
+	if (battery->bat) {
+		sbs_battery_hook_remove_battery(battery);
 		power_supply_unregister(battery->bat);
+	}
 }
 
 static int acpi_charger_add(struct acpi_sbs *sbs)
diff --git a/include/acpi/battery.h b/include/acpi/battery.h
index c93f16dfb94..ddbfa4ed135 100644
--- a/include/acpi/battery.h
+++ b/include/acpi/battery.h
@@ -18,8 +18,24 @@ struct acpi_battery_hook {
 	struct list_head list;
 };
 
+/*
+ * battery_hook_register() and friends only see batteries registered by
+ * drivers/acpi/battery.c, the ACPI Control Method Battery driver (ACPI HID
+ * "PNP0C0A"). Batteries registered by drivers/acpi/sbs.c, the ACPI Smart
+ * Battery System driver (ACPI HID "ACPI0002", common on hardware with
+ * SMBus/SBS fuel-gauge chips such as many Intel MacBooks), are invisible
+ * to them; use the sbs_battery_hook_* equivalents below for those. A
+ * caller wanting to support both kinds of hardware needs two separate
+ * struct acpi_battery_hook instances, one per registration call, since a
+ * given instance's embedded list node can only belong to one list at a
+ * time.
+ */
 void battery_hook_register(struct acpi_battery_hook *hook);
 void battery_hook_unregister(struct acpi_battery_hook *hook);
 int devm_battery_hook_register(struct device *dev, struct acpi_battery_hook *hook);
 
+void sbs_battery_hook_register(struct acpi_battery_hook *hook);
+void sbs_battery_hook_unregister(struct acpi_battery_hook *hook);
+int devm_sbs_battery_hook_register(struct device *dev, struct acpi_battery_hook *hook);
+
 #endif
-- 
2.55.0

