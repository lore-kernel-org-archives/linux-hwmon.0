Received: from outbound.mr.icloud.com (mr-2006g-snip4-5.eps.apple.com [57.103.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B444C4FC
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753863; cv=none; b=I8z9TX+tFvEg1d7NU8x/4QjO5+VECmSwavhGZrgNlJeDLvBZCI9GtHZBzB14NtpYFkTyf+oTVZeUATt1H9VYThB7KeP3Ee69wuacyhXFQl87CKJA7aLQqdeYCCV6vH+MxT29XKEbkgAeaGsXqvLrLJFptTpCon3I5LhjmrCNY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753863; c=relaxed/simple;
	bh=zK3HI4oFIKYO7ZwYEEweepXlQf8zxbJeBP09u6mdeJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNxiINWrlwclZVS5UGsMdzIGamkyeAdYLA5HS+MYq170zCA9QJu56U2TvJysSm/Y8I8at0vgPwLPoronPzYI+thLKXXp2cLe3KR7mePc/LVKTLWpPUAueTUr/Cyckok6RFaHOeJuzMLbHpHtzTTOpesSP0LJQ1H4ut9i/twfqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=Qd6DNG3c; arc=none smtp.client-ip=57.103.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="Qd6DNG3c"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id E0DBF180014D;
	Fri, 18 Sep 2026 17:50:54 +0000 (UTC)
X-ICL-RepId: 01a0b5a4-8b7c-7a95-bb8b-610e0bdb5043
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAOS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKCUAfTB9bQ1gZVVBUEVdQC1kCQg9IClwPWgVFCU0BQw9eBkYIVQBAXQRAFFgWcw9FBEcXUVZcH1BVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1789753856; x=1792345856; bh=pdL0PqfH7DKZ51gON4XGwP0Jy9yuRDaiVWJ2yHHKulw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Qd6DNG3cQ78ce8lZU6QniHxicLgig70s0Jignq2+KCpBSZc9a4lq3jdRr1Wb71nAkcbedCHUOjP8Pj9A05HXqxjiqF4SN+C/ia+8hiYuBDQzmQUbglsXPDFtB0TM+CJtvy3b2tugoZTCLqFZ4OMvyCVbt1NSowHev6OhTIM5nDmY6e4et2hMIjUDWqZk4oJm/9Rb3KSj6HaG0Hg1vwGYeeQm9i3P7rDYr+/NO0V+YfkxgsdFZCNwpfw7/k5d/CY8DZG7BcAj98hHa53xyYcNzG1VsXvj/GcI6Xxf3ugPFIreolmhyfEUjNnsanzCgtrObfxRJcTnQu0z5254Etkt9g==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id 1CF9E18004A6;
	Fri, 18 Sep 2026 17:50:54 +0000 (UTC)
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
Subject: [PATCH v2 2/2] hwmon: (applesmc) add charge_control_end_threshold support
Date: Fri, 18 Sep 2026 11:50:52 -0600
Message-ID: <20260918175052.85461-3-jordan@brough.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918175052.85461-1-jordan@brough.org>
References: <20260918175052.85461-1-jordan@brough.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UAeiWB2lLmunz6j2n9O1XsAcnUfhwCPX
X-Proofpoint-ORIG-GUID: UAeiWB2lLmunz6j2n9O1XsAcnUfhwCPX
X-Authority-Info-Out: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6aad79ff
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gFGppuTrAAAA:8 a=I-B3jAGmQHfedbMlY8IA:9 a=_Y0xhhAoguY4gwfEQMhp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI1NiBTYWx0ZWRfX7MRgcvamMqC6
 KzJxZj0mGWJQ4kL+c44B/f4oqyNaMNgzWEau+WqzzQrUdROy1bemrUogA1ANR5Bdpy9qEqwvZTr
 6ZhNB4o6LMcsO3Y2TIomry8zdOR4tnrvVoEYD4i+XGcqq/uCMpbVqAxTp2kCybF23JIAGIVROU5
 AbOr64J6k2nEVndnhjvZJuDc40lUs4vqIet1H/XsYBZo1a471SMKHnC0n+1vCImYbtCXisIk2Ya
 6zb15OsXCjm1ig3ZoH/bpO0McW5GKkMt7SOu5wiDI8jPzqh43Z3k2KSGpxHZ5Xa+mbpo8KBbHZo
 fJ4mARmLKHcizYYiRY+ZHT/b16zj+L2iqZRsPc9xQAThoe8NcFwn3xiVQniGDc=
X-JNJ: AAAAAAABnrxMS2/BXYgkCE8SJP00FJk1Ey9Ga/wpXcb5yJa9VPQSjcdOjm79m3gk/l9N2x9tW725Ih0SmFjZCfw+O/lKW6g8tBMO8bTF1dp2KfaCcmvFv1IN376rsZVg6bshCWqwh8KlH7uwsbVTbj48x2cuo67wrHjrDOTSDAGXSrOD4YvZXSiI/NKyMvzdjzk0R80YNVuRJ3u1ooDVkwzhMK55vApWJ+1Bbrw7kLjnLnGLHQTVtUEB4ocMnaU5PawvmxgiV1C4QFF5TzWIO0qxLTQpuBcvHdQ6ZBhzhqpVgXbkjXZD6RblqfOVcIH2SfRhQzBspnNR2bfW3n5SChfSIWpWYo+eEzo7ktsqqm9cWdo1YK3ubtLxqQwh/U8u20h11FQfnKvyhnFcgx1MDAGOomjO7HzGvc69t8KFtXBsI2fX2GP/Qvs5E7b6IUvviNm7rbtkzkYToNPxJA7W+idPBslEZY+BzcqpLhbJpGyKGxOKCcoBK7oMmED14p3gm5EnqtIJaKfoa9vEv29zPHziSNpnQeHVe8bzX4zokZnDsAINoLLVAEpJzRbvxxtwwqWWsVRB7bmH1+X998IUPpvY0KNzTBnuwReqU6/G//OpLOp8sBjh+o+9JzHRrkyzFTPArL4e2n+rbMM6Qp7X+URgRwx95wRwAqWK/SKCK3cl05ViQsOXK3sDuftXoORGNYmIa2d/06Yy+MvRo2d6tNQFtNLzH0Kv+eSyAd97xdoxoSZsuDf/Dqf6a3u9Ckv9PF0N971VeJaPqdY/NRAppG/LozPsDzyRMS6ANywmDqvefYxg9Qnwnz+6R/wwPSVqMDlXHh/LfIfd5pb4cK4lf+UeccO3wmc=

Intel MacBooks with Apple SMC expose battery charge control threshold
registers (BCLM) and MagSafe LED thresholds (BFCL).

Add native charge_control_end_threshold support to the applesmc driver
using the power_supply_ext extension API and the ACPI battery hook
infrastructure.

Hardware testing on Intel MacBooks shows that setting BCLM to a given
threshold requires keeping BFCL set to a margin (5%) below BCLM to
prevent a race where charging halts just before the SMC's sub-percent
counter reaches BFCL, leaving the MagSafe LED stuck in amber ("charging").

Serialize SMC register writes and power_supply extension registration under
applesmc_bat_lock to prevent concurrent write desynchronization and ensure
clean rollback if extension registration fails.

Signed-off-by: Jordan Brough <jordan@brough.org>
---
 drivers/hwmon/applesmc.c | 157 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 152 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index d0baa10502f..2444bea8a0f 100644
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
@@ -724,6 +751,119 @@ static struct platform_driver applesmc_driver = {
 	},
 };
 
+static DEFINE_MUTEX(applesmc_bat_lock);
+
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
+		scoped_guard(mutex, &applesmc_bat_lock) {
+			ret = applesmc_read_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
+			if (ret)
+				return ret;
+			val->intval = limit;
+			return 0;
+		}
+		break;
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
+		led_limit = limit > APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN ?
+			limit - APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN : limit;
+
+		scoped_guard(mutex, &applesmc_bat_lock) {
+			ret = applesmc_write_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
+			if (ret)
+				return ret;
+
+			return applesmc_write_key(BATTERY_CHARGE_LIMIT_LED_KEY, &led_limit, 1);
+		}
+		break;
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
+	int ret;
+
+	guard(mutex)(&applesmc_bat_lock);
+	if (applesmc_hooked_battery)
+		return 0;
+
+	ret = power_supply_register_extension(battery, &applesmc_bat_ext, &pdev->dev, NULL);
+	if (ret)
+		return ret;
+
+	applesmc_hooked_battery = battery;
+	return 0;
+}
+
+static int applesmc_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	guard(mutex)(&applesmc_bat_lock);
+	if (applesmc_hooked_battery != battery)
+		return 0;
+
+	power_supply_unregister_extension(battery, &applesmc_bat_ext);
+	applesmc_hooked_battery = NULL;
+	return 0;
+}
+
+static struct acpi_battery_hook applesmc_battery_hook = {
+	.name = "Apple SMC Battery Charge Control",
+	.add_battery = applesmc_battery_add,
+	.remove_battery = applesmc_battery_remove,
+};
+
 /*
  * applesmc_calibrate - Set our "resting" values.  Callers must
  * hold applesmc_lock.
@@ -1563,6 +1703,10 @@ static int __init applesmc_init(void)
 		goto out_light_ledclass;
 	}
 
+	if (smcreg.has_battery_charge_limit &&
+	    (IS_REACHABLE(CONFIG_ACPI_BATTERY) || IS_REACHABLE(CONFIG_ACPI_SBS)))
+		battery_hook_register(&applesmc_battery_hook);
+
 	return 0;
 
 out_light_ledclass:
@@ -1589,6 +1733,9 @@ static int __init applesmc_init(void)
 
 static void __exit applesmc_exit(void)
 {
+	if (smcreg.has_battery_charge_limit &&
+	    (IS_REACHABLE(CONFIG_ACPI_BATTERY) || IS_REACHABLE(CONFIG_ACPI_SBS)))
+		battery_hook_unregister(&applesmc_battery_hook);
 	hwmon_device_unregister(hwmon_dev);
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
-- 
2.55.0

