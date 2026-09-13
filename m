Received: from outbound.mr.icloud.com (mr-2006h-snip4-11.eps.apple.com [57.103.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCC3E168C
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 23:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341257; cv=none; b=MvDbJwFKj2EIEhCDf0h4cxtgBZHnkxMOxhYoTquX/SWKhpWPXfCCQ0mBRD4miYQ1jxYNBkYtAjpd4WoZ1LCLPbfTa4TjUPVB5QNw7h0As/a5omRCBZ6PCIzeqFuqAHXlspWSklDcAAQW6Z9IYCd1ZniT/phpjaqvIOjLP3S3ztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341257; c=relaxed/simple;
	bh=bnSkmaWuXatZvhpJzFRbFNs7tJg2h1mzIergUF6+rqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgB2qf88DZP2DgAxj8b+FOr1sNomm8+pbz8+K75sYNu5W3RPObGAK+z0XtMPDYew8z7G7qX9+A24sRstqtp5Z35GkSD/QD4BZJxCsNaEKCgqiNvjF1XYjFZbzD2Gb9dESWWnHmnlmyJskJPrCKrergy/a7EsF7jKyXoR5yxe0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=zPUe4xMk; arc=none smtp.client-ip=57.103.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="zPUe4xMk"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPS id B92DB18000F7;
	Sun, 13 Sep 2026 23:14:12 +0000 (UTC)
X-ICL-RepId: 01a09d0c-bc54-7a79-84de-f173b26aca1f
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAGWxIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlACVg1UBRkEQBcZFVoJClcAQAtOA1QGWABDCEwCXRlfA0YASgFABEZYH0scUgN3CUAfTB9bQ1gZVU4ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1789341254; x=1791933254; bh=cj/fhADZ2zjZtvXL9yjl1t+Ug89ENPAw07jdlhd1+ss=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=zPUe4xMk/DjiH5AwF1u+tAl+agMQaSkU3Z6Owvu4QLoOMtDpqxXfZ5MkHxkCHYlhrJWTycRaiwBkP2HctYDYNwZwuIkhALGLIG1U6WQGsAw/Zs3VfU0rfmF0ftSW30Xa+vMKIAgET71r5HwUl38jQlG8GpA4JxuBwElLP4XkL9zMtKQ/8iDWqNgRoEaAEaaSONrNOzbDlLYPf87rbx+mRQ5kwQKbWcO1Au6HaTCUw8qDz6Ol1//A/nwReIYztmgr93TuV0gBgFlDB4uhuwpdtKX1kBgeOC8cdBd8gHlVsHUBr3SzkhmSnz9sYg9A0XEZ1Zlr9pe01j572G+WF/lnIQ==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPSA id F381318002BC;
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
Subject: [PATCH 2/2] hwmon: (applesmc) add charge_control_end_threshold support
Date: Sun, 13 Sep 2026 17:14:10 -0600
Message-ID: <20260913231410.416922-3-jordan@brough.org>
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
X-Proofpoint-ORIG-GUID: I0UtamjwptGDrqdn_T_3LoC5GgpkKv2b
X-Proofpoint-GUID: I0UtamjwptGDrqdn_T_3LoC5GgpkKv2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzMyBTYWx0ZWRfX8oKgogVRCJSU
 Eq9h0J/wm8VxPBQ+y5EiGPq5Wj7b9b9MfRWQo/JeoWiDY7nxCtFP1kWB995GmYIV7MUDU8lIhBQ
 10Nu0EX9IEOAkCCeXAKJwjUMEjOwP0Sjkig4KAszBTkwpI0Nt/Wksnv3h8NKU9ZcY1PdW/oNwnp
 6Ps8cfJwb7K36mSutxEA/ik4qlj2u+C+rMQOk6s0J3WaTLABNYjwH94FF58l3hdWKnXWEkvgcFU
 6Wyjo8GGsxpZeRaeg1nWgG9sOKD/KxEsV85YpBrtLtAEg+5VimzDt+nafiFPZhpKU9QvJ/Z2bde
 78aF/coO0rBl9yuPhq27bFxiGVOr6AqPmpqwNF0z7lPXBC9/bK/sQWbpfeNsz0=
X-Authority-Info-Out: v=2.4 cv=NvDcssdJ c=1 sm=1 tr=0 ts=6aa72e45
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gFGppuTrAAAA:8 a=_qiZed2BUF8c7og7XssA:9 a=_Y0xhhAoguY4gwfEQMhp:22
X-JNJ: AAAAAAAB6B96uLboEv/K0/PuIITrRM26v5rl89l/GGukEQbmSBL0beNXXYxpG5qMgqzCTfY3ZtLPhSVoeQYhCAxr7OSs48uk5aBh+wdF4SdbilDJf8s/uoOHveekYMzsopujjtpN9w3OQZkSlQ7QTL46Lo5x7cJV0hXkmZlvEad3OpW9A7FTeskcznIDIniPGhBWHEQZkrreykURiucj14bTnLFpA0tJsAfN0vxptNR/vLLvtHdT77e3dMeHpin1TX6zwiYOOvBCdDgrNTVNhW3EKkvdrCLlOyFVrR1toDTvsryH1f4GxJUtAfglloY+cPs2lOAoHCQdEt0iYXORldtZMD75hU282DfxjE3VHZKU24d8tmNCEAsNRxhN3g7q/7gpRzwBt1VWNvCgPwUFJz3aTKkZpFCYMX+aN+LysnPWEyILDXGmFrGn3WMfx0Ec+aNhb/jCFxW2HRR0EMAmA3gSFuifcGwsDK2FHFy2C6c7tNE7fBw9qMKKUu8UATotCV1E9YGBkV/HrSrAiNfrVIu821rp+P4M3qpdpoKN5h/cpFcPzrh/BlS489ECc8wrz1/tCtYN+t0SIC+2VsEhZ852fEEuYZuIN6A5KNLXV53dDg/Nr4ApW5EeWfVkMoagK2PUFxsRg5DWjbF3tiUTRtqcRa48BL6qvsULp81aWO+gGcYs6JH51BwwebhEb2EFVtCvenpVccGjY61YcG9h81zJtsT9n5DuVeH0bT0Vi8IRKumFSq0ka4x+wlUOlGshUQ143cps/x/p8cj5og/s2Rkjlni0vF26dTuilNqVeDz2m8MMqmJoBIwSGEF0YBppAfJ9Fvlrwd/SWfbb5X7ppCaYPFS9kMh94KOucJb/Ik4ADkcXGQLYjYGdN48vSOABVTRgf86UZTCnKVI=

Apple's SMC firmware exposes a real charging-cutoff control via the
BCLM (Battery Charge Limit Max) key, and a separate cosmetic BFCL
(Battery Final Charge Level) key that only controls when the MagSafe
LED switches from orange to green. Userspace tools and out-of-tree
kernel patches have historically conflated the two or exposed neither
through a standard interface, leaving desktop environments unable to
offer a native charge-limit control on Intel MacBooks.

Add native charge_control_end_threshold support to applesmc using the
power_supply_ext extension API, so that generic userspace (UPower,
KDE Powerdevil, GNOME Settings) can read and write the threshold
through the standard sysfs attribute with no vendor-specific daemon.
BFCL is kept in sync automatically (BCLM - 5) purely so the MagSafe
LED still changes color at a sensible point relative to the real
cutoff; it is not independently exposed.

Apple MacBooks register their battery through either the ACPI Control
Method Battery driver (CmBatt, drivers/acpi/battery.c) or the ACPI
Smart Battery System driver (SBS, drivers/acpi/sbs.c), depending on
model. Register against both hook mechanisms, guarded at compile/link
time with IS_REACHABLE() so this stays a no-op when the corresponding
subsystem isn't built in, and at runtime with a probe of the BCLM SMC
key so this is a no-op on any Mac (or non-Mac, given applesmc's DMI
match table) that doesn't actually implement it.

Tested on a MacBookAir6,2 (SBS-registered battery): the sysfs
attribute appears, reads/writes correctly propagate to the real SMC
BCLM key end-to-end via KDE's charge-limit slider, and BFCL tracks
BCLM - 5 as designed. Tested on a non-Mac laptop (CmBatt-registered
battery, no BCLM key) to confirm both new hook registrations are
true no-ops there: no new sysfs attributes, no behavioral change,
clean module load/unload.

Signed-off-by: Jordan Brough <jordan@brough.org>
---
 drivers/hwmon/applesmc.c | 164 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 159 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index d0baa10502f..39276cdba3d 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -33,6 +33,8 @@
 #include <linux/workqueue.h>
 #include <linux/err.h>
 #include <linux/bits.h>
+#include <linux/power_supply.h>
+#include <acpi/battery.h>
 #include <asm/barrier.h>
 
 /* data port used by Apple SMC */
@@ -76,6 +78,26 @@
 
 #define TEMP_SENSOR_TYPE	"sp78"
 
+/*
+ * BCLM caps charging at a percentage; it is the only key that affects
+ * charging behavior. BFCL only controls when the charging LED switches
+ * from orange to green and has no effect on charging itself.
+ */
+#define BATTERY_CHARGE_LIMIT_KEY	"BCLM" /* r/w ui8 */
+#define BATTERY_CHARGE_LIMIT_LED_KEY	"BFCL" /* r/w ui8 */
+
+/*
+ * Margin kept between BCLM and BFCL so the charging LED still reports
+ * "done" once BCLM halts charging below 100%. Left equal to BCLM, the
+ * two can race: charging can stop a moment before the SMC's internal
+ * (sub-percent) charge counter actually reaches BFCL, leaving the LED
+ * stuck on "charging" indefinitely since no further current ever flows
+ * to push it over the threshold. A margin of 1 was sufficient to avoid
+ * this on a MacBookAir6,2; 5 matches Apple's own firmware convention and
+ * gives headroom on hardware we haven't tested.
+ */
+#define APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN 5
+
 /* List of keys used to read/write fan speeds */
 static const char *const fan_speed_fmt[] = {
 	"F%dAc",		/* actual speed */
@@ -131,6 +153,7 @@ static struct applesmc_registers {
 	int num_light_sensors;		/* number of light sensors */
 	bool has_accelerometer;		/* has motion sensor */
 	bool has_key_backlight;		/* has keyboard backlight */
+	bool has_battery_charge_limit;	/* has BCLM battery charge limit */
 	bool init_complete;		/* true when fully initialized */
 	struct applesmc_entry *cache;	/* cached key entries */
 	const char **index;		/* temperature key index */
@@ -633,17 +656,21 @@ static int applesmc_init_smcreg_try(void)
 	if (ret)
 		return ret;
 	ret = applesmc_has_key(BACKLIGHT_KEY, &s->has_key_backlight);
+	if (ret)
+		return ret;
+	ret = applesmc_has_key(BATTERY_CHARGE_LIMIT_KEY, &s->has_battery_charge_limit);
 	if (ret)
 		return ret;
 
 	s->num_light_sensors = left_light_sensor + right_light_sensor;
 	s->init_complete = true;
 
-	pr_info("key=%d fan=%d temp=%d index=%d acc=%d lux=%d kbd=%d\n",
-	       s->key_count, s->fan_count, s->temp_count, s->index_count,
-	       s->has_accelerometer,
-	       s->num_light_sensors,
-	       s->has_key_backlight);
+	pr_info("key=%d fan=%d temp=%d index=%d acc=%d lux=%d kbd=%d bat=%d\n",
+		s->key_count, s->fan_count, s->temp_count, s->index_count,
+		s->has_accelerometer,
+		s->num_light_sensors,
+		s->has_key_backlight,
+		s->has_battery_charge_limit);
 
 	return 0;
 }
@@ -724,6 +751,120 @@ static struct platform_driver applesmc_driver = {
 	},
 };
 
+static int applesmc_bat_get_property(struct power_supply *psy,
+				     const struct power_supply_ext *ext,
+				     void *data,
+				     enum power_supply_property psp,
+				     union power_supply_propval *val)
+{
+	u8 limit;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		ret = applesmc_read_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
+		if (ret)
+			return ret;
+		val->intval = limit;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int applesmc_bat_set_property(struct power_supply *psy,
+				     const struct power_supply_ext *ext,
+				     void *data,
+				     enum power_supply_property psp,
+				     const union power_supply_propval *val)
+{
+	u8 limit, led_limit;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		if (val->intval < 20 || val->intval > 100)
+			return -EINVAL;
+
+		limit = val->intval;
+		ret = applesmc_write_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
+		if (ret)
+			return ret;
+
+		led_limit = limit > APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN ?
+			limit - APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN : limit;
+		applesmc_write_key(BATTERY_CHARGE_LIMIT_LED_KEY, &led_limit, 1);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int applesmc_bat_property_is_writeable(struct power_supply *psy,
+					      const struct power_supply_ext *ext,
+					      void *data,
+					      enum power_supply_property psp)
+{
+	return psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD;
+}
+
+static const enum power_supply_property applesmc_bat_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+};
+
+static const struct power_supply_ext applesmc_bat_ext = {
+	.name			= "applesmc-charge-control",
+	.properties		= applesmc_bat_props,
+	.num_properties		= ARRAY_SIZE(applesmc_bat_props),
+	.get_property		= applesmc_bat_get_property,
+	.set_property		= applesmc_bat_set_property,
+	.property_is_writeable	= applesmc_bat_property_is_writeable,
+};
+
+static struct power_supply *applesmc_hooked_battery;
+
+static int applesmc_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	if (applesmc_hooked_battery)
+		return 0;
+
+	applesmc_hooked_battery = battery;
+	return power_supply_register_extension(battery, &applesmc_bat_ext, &pdev->dev, NULL);
+}
+
+static int applesmc_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	if (applesmc_hooked_battery != battery)
+		return 0;
+
+	power_supply_unregister_extension(battery, &applesmc_bat_ext);
+	applesmc_hooked_battery = NULL;
+	return 0;
+}
+
+/*
+ * Two separate hook registrations are required: Intel Macs register
+ * their battery through either drivers/acpi/battery.c (ACPI Control
+ * Method Battery) or drivers/acpi/sbs.c (ACPI Smart Battery System,
+ * common on hardware with SMBus/SBS fuel-gauge chips), depending on
+ * model, and each mechanism only sees batteries registered through
+ * itself. A single struct acpi_battery_hook cannot be registered with
+ * both, since its embedded list node can only belong to one list at a
+ * time. Whichever mechanism matches the actual hardware will hook the
+ * battery; the other simply never finds one to call back for.
+ */
+static struct acpi_battery_hook applesmc_battery_hook = {
+	.name = "Apple SMC Battery Charge Control",
+	.add_battery = applesmc_battery_add,
+	.remove_battery = applesmc_battery_remove,
+};
+
+static struct acpi_battery_hook applesmc_sbs_battery_hook = {
+	.name = "Apple SMC Battery Charge Control (SBS)",
+	.add_battery = applesmc_battery_add,
+	.remove_battery = applesmc_battery_remove,
+};
+
 /*
  * applesmc_calibrate - Set our "resting" values.  Callers must
  * hold applesmc_lock.
@@ -1563,6 +1704,13 @@ static int __init applesmc_init(void)
 		goto out_light_ledclass;
 	}
 
+	if (smcreg.has_battery_charge_limit) {
+		if (IS_REACHABLE(CONFIG_ACPI_BATTERY))
+			battery_hook_register(&applesmc_battery_hook);
+		if (IS_REACHABLE(CONFIG_ACPI_SBS))
+			sbs_battery_hook_register(&applesmc_sbs_battery_hook);
+	}
+
 	return 0;
 
 out_light_ledclass:
@@ -1589,6 +1737,12 @@ static int __init applesmc_init(void)
 
 static void __exit applesmc_exit(void)
 {
+	if (smcreg.has_battery_charge_limit) {
+		if (IS_REACHABLE(CONFIG_ACPI_BATTERY))
+			battery_hook_unregister(&applesmc_battery_hook);
+		if (IS_REACHABLE(CONFIG_ACPI_SBS))
+			sbs_battery_hook_unregister(&applesmc_sbs_battery_hook);
+	}
 	hwmon_device_unregister(hwmon_dev);
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
-- 
2.55.0

