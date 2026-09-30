Received: from outbound.st.icloud.com (st-2004h-snip4-11.eps.apple.com [57.103.78.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE853E4119
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 22:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807230; cv=none; b=jtA5dTLKgEIzHmVUvIUOa0V76NF+VDuCoT9EKadEZKucZcKxSP3729KRwZMfDAXkJk80HYMJVosxIexefFFUa699Ug/eJwQJT3uWyHclpQoOlElcxwSYf4vL8iEdIBbcTUOO1UrcLpHwa/PMgJDiL0ynFgRiBB1FbDsWWlttyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807230; c=relaxed/simple;
	bh=sgBHt4gFv144xt0m+0Sq1AarU7FDh7Jo4QCy+dnEHbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XE94Qbuq4o6bckJwPDLackmo/w04Xz4GEFgqifY/ohs1ljpT7dPBl23cmHN7o9M+u5nuY2QIjATsqoxgeWQd2BexIp2SLtKBCxXGudRYrMsNWWWy55gekAN6oieIEBdlH7jsqWRiojUiYWGKlVaZtmTmoys+o6MTqmOdp05/Vtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=jbK26C5b; arc=none smtp.client-ip=57.103.78.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="jbK26C5b"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-0 (Postfix) with ESMTPS id 105FE180025F;
	Wed, 30 Sep 2026 22:27:04 +0000 (UTC)
X-ICL-RepId: 01a0f46d-b2b4-7ac8-9081-b2e52a6d771a
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAAS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKCUAfTB9bQ1gZVVBUEVdQC1kCQg9ICl4HWQBCD00DQwZTCkMBSAZAA0ZYH0scUgN3CUAfTB9bQ1gZVU4ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1790807226; x=1793399226; bh=mgVvsq7LzDzSHCCuBhl9XoTil42XNfuG1k/OPmgDwaw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=jbK26C5b0ohzdM+myAjhTtOneOmCdNUsiQsGggwtP9gDC9dVyLm9RWZlPlkP5FYM6fRC9R6EGPiGTPEjCXBA4PRVRnEQAN/oN6NQrxch8QacorXRQRkL5Ri2yvT2wnxEJPidQqSEa9+ik11wWN+8kXo6l/NmCw4NpVrcqRgL3OsNR5OQmYezFai5yb8neGaE4SPjo8Q+PshS//T7dzxJyZlLRAE4gjQyet6tMbOIbi76LI5FuxSPFl0CujdX6Bk3dxYbjJjZMfR7vf97mrjjKHf8y8yzCV2XdybvGfIJbyXAkXQ/L45K8NQ5WbNZoDStZmQndM9IGWD2SQD/KMVSAg==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-0 (Postfix) with ESMTPSA id F16CF180016B;
	Wed, 30 Sep 2026 22:27:03 +0000 (UTC)
From: Jordan Brough <jordan@brough.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: Jordan Brough <jordan@brough.org>,
	Michal Szpakowski <michi.szpakowski@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v3 3/3] hwmon: (applesmc) add charge_control_end_threshold support
Date: Wed, 30 Sep 2026 16:26:35 -0600
Message-ID: <20260930222650.1883805-4-jordan@brough.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260930222650.1883805-1-jordan@brough.org>
References: <20260930222650.1883805-1-jordan@brough.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1JzW8SxVsrhzLhK2bUEIofA0uZtQmlBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA5MSBTYWx0ZWRfX+/Y7kgWVjlKx
 dsXbx/FMs2RJyY84IVWTQ2XC8auR3FMKHcHsO6GQI9ViaW9B/gKG8VllXV33dtkOiEqLJruKcT0
 107faTjmrJ/M8Kj1JoEz2pFkf6i/00lIq/y48dSdsS/mQ+8UH0scgFO8HUxzyVllQ0qck+atAxW
 oCM82X9lUBbAEGXt+C2nbVvZh9Sz3VYJsgQB++djFFi837T+JBmOHvuBxGWlpuOJRYwjJQb+XOP
 bBTJuLyo+zOXrcITXNzj7Km6zUOXl4lPC0rltNtg1RMvJKtzz1MzXrFDu30vQLJI3IKGk79Gihf
 FEMTaoG3CG9OLSeoK6suXNII6DxaPReRFVdj9uIgH3A94LNWBbAsPTTzgrsLr8=
X-Authority-Info-Out: v=2.4 cv=P883RyAu c=1 sm=1 tr=0 ts=6abd8cb9
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=gFGppuTrAAAA:8 a=2l61nVbx42uKPaCmiS4A:9
 a=_Y0xhhAoguY4gwfEQMhp:22
X-Proofpoint-ORIG-GUID: 1JzW8SxVsrhzLhK2bUEIofA0uZtQmlBa
X-JNJ: AAAAAAABpI6Fj0b9DALEgh72JkHXR+U6I7SAg/myBpzJpPybmdubU8mFnIsS3xHVr+/9MtIxekBkoR5+UcTsboHht746MltXqgfq00E9jRgxTUYnz3099MmzwSbhRt2V/txqrXwHzZR9c6U55rfEqpNav8tWZqxbuQ51gBFBmCOdyuwhhkFn/est6t8tziXB8rCjuCLeMdKumYJa3CkWSjafmBrUI+umy8I0OT3cag6+B0QOgZ1IhlTDyIFSuE/Aq9dOsiFdGwTbMtdZ5VhIOOcmQH/lYJnS44KElCjdMnGTU4ih6b97BxfQL6u4Jakw7SU8DyXwB2DGxD4GKCXNlOvW1A+IDJbnM0JSg9nkrGdq71m5RH2t0tCOYZgI4nFxO7tZzREQQkGmMW2KQWJTPrls1GtQHICa3BArPqcRrE05887kQ+upveWP5TK2emRnlOQpvNRFmW2/TLW1yjYjkeBVBIKkrfXyQgoJHd9/G0WrzhdYOfGr04YTTzI70Mc38LyhrVeyxM/Xs+TZeUbLZjgZSQuezXv6u9NYXVPpZ+WeI5df4gi/iU/sr/zIdh9e1c1fc1c9/xfd5DsNXFIfSXXTh3zCRBXsu96eruzFzae0GN/pGUYbt91RrVScLEB45lOGD+5aP6plBSBAz9JoH6TryL7xMw/jfUJUDqZ7hOW4hU/w2/ske1v4rjBD/3XBO91uUYwSSTCbkk5ho29hRUKP0m8hxU7vVYHXYpGOWDqBNJHiK1JxnAbfy28Xm0gmc38kiV89Ucr0mX9jBhQaCjQPpVYbtBtvaqt0HZNG8sW6R70AOs1JXby8m1zSsJs4eXuAEmYGYmN5/LA7wYAdyb96

Intel MacBooks keep the battery charge limit in the SMC key BCLM, and
some also have BFCL, which sets the threshold for the MagSafe LED.

Expose BCLM as charge_control_end_threshold through the power_supply
extension API, attached to the battery with the ACPI battery hooks.

Below 100%, BFCL is set 3 points below BCLM so that the LED turns green
before charging stops. On a MacBookAir6,2 the LED turns green about 0.75
points above BFCL and charging stops about 0.25 points below BCLM, so
this leaves about 2 points; other models were not measured. BFCL is only
written if the SMC has the key, and a failure to write it is only logged.

The SMC ignores BCLM values it does not accept but still reports
success, so read the value back and return -EINVAL if it was not applied.

Limits below 20 are rejected. 20 is known to work and 10 is not accepted
by the SMC on the hardware tested; the exact floor in between was not
determined.

Serialize the writes with applesmc_bat_lock, and notify userspace of
changes with power_supply_changed().

Tested-by: Michal Szpakowski <michi.szpakowski@gmail.com>
Signed-off-by: Jordan Brough <jordan@brough.org>
---
 drivers/hwmon/Kconfig    |   1 +
 drivers/hwmon/applesmc.c | 146 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fecff8610ea8..d627b4cf11e5 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -380,6 +380,7 @@ config SENSORS_FAM15H_POWER
 config SENSORS_APPLESMC
 	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
 	depends on INPUT && X86
+	depends on POWER_SUPPLY || POWER_SUPPLY=n
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index d0baa10502f7..b6d9ca302730 100644
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
@@ -76,6 +78,20 @@
 
 #define TEMP_SENSOR_TYPE	"sp78"
 
+/*
+ * BCLM caps charging at a percentage. BFCL only sets when the charging LED
+ * switches from orange to green.
+ */
+#define BATTERY_CHARGE_LIMIT_KEY	"BCLM" /* r/w ui8 */
+#define BATTERY_CHARGE_LIMIT_LED_KEY	"BFCL" /* r/w ui8 */
+
+/*
+ * Points kept between BCLM and BFCL so the LED turns green before charging
+ * stops. Measured on a MacBookAir6,2, where a margin of 1 only just ties;
+ * 3 leaves headroom for other models.
+ */
+#define APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN 3
+
 /* List of keys used to read/write fan speeds */
 static const char *const fan_speed_fmt[] = {
 	"F%dAc",		/* actual speed */
@@ -131,6 +147,8 @@ static struct applesmc_registers {
 	int num_light_sensors;		/* number of light sensors */
 	bool has_accelerometer;		/* has motion sensor */
 	bool has_key_backlight;		/* has keyboard backlight */
+	bool has_battery_charge_limit;	/* has BCLM battery charge limit */
+	bool has_battery_charge_limit_led; /* has BFCL MagSafe LED charge limit */
 	bool init_complete;		/* true when fully initialized */
 	struct applesmc_entry *cache;	/* cached key entries */
 	const char **index;		/* temperature key index */
@@ -633,6 +651,12 @@ static int applesmc_init_smcreg_try(void)
 	if (ret)
 		return ret;
 	ret = applesmc_has_key(BACKLIGHT_KEY, &s->has_key_backlight);
+	if (ret)
+		return ret;
+	ret = applesmc_has_key(BATTERY_CHARGE_LIMIT_KEY, &s->has_battery_charge_limit);
+	if (ret)
+		return ret;
+	ret = applesmc_has_key(BATTERY_CHARGE_LIMIT_LED_KEY, &s->has_battery_charge_limit_led);
 	if (ret)
 		return ret;
 
@@ -724,6 +748,120 @@ static struct platform_driver applesmc_driver = {
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
+		scoped_guard(mutex, &applesmc_bat_lock)
+			ret = applesmc_read_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
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
+	u8 limit, led_limit, readback;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		/* 20 is known to work and 10 is not accepted; the floor is unknown. */
+		if (val->intval < 20 || val->intval > 100)
+			return -EINVAL;
+
+		limit = val->intval;
+		/* At 100% charging is never cut short, so no margin is needed. */
+		led_limit = limit < 100 ?
+			limit - APPLESMC_BATTERY_CHARGE_LIMIT_LED_MARGIN : limit;
+
+		scoped_guard(mutex, &applesmc_bat_lock) {
+			ret = applesmc_write_key(BATTERY_CHARGE_LIMIT_KEY, &limit, 1);
+			if (ret)
+				return ret;
+
+			/*
+			 * The SMC silently ignores values it does not accept and
+			 * still reports success, so read the limit back.
+			 */
+			ret = applesmc_read_key(BATTERY_CHARGE_LIMIT_KEY, &readback, 1);
+			if (ret)
+				return ret;
+			if (readback != limit)
+				return -EINVAL;
+
+			if (smcreg.has_battery_charge_limit_led) {
+				ret = applesmc_write_key(BATTERY_CHARGE_LIMIT_LED_KEY,
+							 &led_limit, 1);
+				/* BCLM is already applied, so this is not an error. */
+				if (ret)
+					pr_warn("failed to update MagSafe LED threshold (BFCL): %d\n",
+						ret);
+			}
+		}
+
+		power_supply_changed(psy);
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
+static int applesmc_bat_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	return power_supply_register_extension(battery, &applesmc_bat_ext, &pdev->dev, NULL);
+}
+
+static int applesmc_bat_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &applesmc_bat_ext);
+	return 0;
+}
+
+static struct acpi_battery_hook applesmc_bat_hook = {
+	.name = "Apple SMC Battery Charge Control",
+	.add_battery = applesmc_bat_add,
+	.remove_battery = applesmc_bat_remove,
+};
+
 /*
  * applesmc_calibrate - Set our "resting" values.  Callers must
  * hold applesmc_lock.
@@ -1563,6 +1701,10 @@ static int __init applesmc_init(void)
 		goto out_light_ledclass;
 	}
 
+	if (smcreg.has_battery_charge_limit &&
+	    IS_REACHABLE(CONFIG_ACPI_BATTERY_HOOKS))
+		acpi_battery_hook_register(&applesmc_bat_hook);
+
 	return 0;
 
 out_light_ledclass:
@@ -1589,6 +1731,10 @@ static int __init applesmc_init(void)
 
 static void __exit applesmc_exit(void)
 {
+	if (smcreg.has_battery_charge_limit &&
+	    IS_REACHABLE(CONFIG_ACPI_BATTERY_HOOKS))
+		acpi_battery_hook_unregister(&applesmc_bat_hook);
+
 	hwmon_device_unregister(hwmon_dev);
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
-- 
2.56.0

