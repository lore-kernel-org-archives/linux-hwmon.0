Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567911F8723
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Jul 2026 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784401076; cv=none; b=PE1rHGZBbzRwTLi7ddc1n7ofOBb5zzp05SjLhv3R+YlT0mzgBMVZW3Eh972MPk8Z8/Cuf1XdR9YcnJ+QD7PmzUtQ+1B8FIta2aOQpuy1wBG8/UQZvKb673CxlhPMAlklXjaPWdJoDgCf+qFY0GMvE3ZneFyEkrBy8shEwNxFvsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784401076; c=relaxed/simple;
	bh=15qCRaMVvvbPzKxF4yMHUMgbHqktQVfFz1JYrx4+AcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbuJf/8iXtVJLFeAsraMaJ+HDaJDCMfChZxuma8MYuQDh0BuGCDzCocOJLTQQQTG8o9YARVH3XCvP1J/9qegGVPoMU5oVF28FGgCLdOOhRyYNRxsold9h9h2f90/Vpa9k+RH5d4WzjIWk6x7x11FCEgg8Ds1zaRanouppP2YK1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6A8c4H1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6A8c4H1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-caf707e3a70so1550745a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Jul 2026 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784401073; x=1785005873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZXaacjitBshadV5mXLB+AT6XJI+GMiorDrDtET8m5g=;
        b=i6A8c4H1YsANom/dUYbj6JeLYXknSnfhUvbGEfRD27Bb/sUf2TpAsjqcszXmEfo3+S
         y4+DrZ8JwPSKtD8jc6v0HUb4PaveK+nYQ44HW2ea5MWiPKN6nkOU+opyzrES9UrKmI1D
         IHn6foCYp+iiEWFtIgs2mBGEw3aupRZJdSgBEX5djuzK1ja2826te4GWnStZ+mmSngEM
         4s2CQDngtOaWl6guk1A+saxOoGjrRvhWBaM6TIXylsBd8QIuqt3iMdP3yGJ86WWi+FGg
         BN4msqSwWhyPTiqgo7V1byEosB7u0Hph9igznVHTfCzinpPrRfq87ajJ6pkyx/RRXEnE
         j/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784401073; x=1785005873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZXaacjitBshadV5mXLB+AT6XJI+GMiorDrDtET8m5g=;
        b=WbJTB8L/Dw+6ieeTfgOF38dOu6kKW7d6B43LRWTPVE3YUdYl1asgaoS1cCtgd8Y+8O
         ENZ2HDaM9KTgTIwKXFkSmAg3gHAnxQ0mI7B9NbEK3hx16r0h5Gkozb2GmATzV1CA0Qc6
         wKVPrWempREgJpKfXzTUItM4AaDCcgHO7mTfXq8tnG+Eco/vydlV9vWslhLzLnKQmxhn
         767WD5VHZfsR7voeFtpkEwF3XE5N9cwaOUvVxH0gFW4FknIQs9dXd9X5+Hz2QTDd0a7M
         +jy6bGafTS8L7jh1mGN57w2ex553Do//DSFm6G1GOewNFmZcP55Nuqknqm8Tz0g/Wczj
         /kAg==
X-Forwarded-Encrypted: i=1; AHgh+RqVdyE/+Z8Wlvf/9z8/flNGythBK/tyJuENh7b6hT8xBqUhVxVG+Pg4imvPLbk/tO2TxefE43PK3mJKqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVS9gGd1dCLUAae/96RHgnqXZLpi7y2Oa8avdJm23pd9wn4bD3
	WROpfFdqmIiTw2tOCBmqtJ/Hru0+O+FEBGo/+CLo/cVqErhk9IUFfL61
X-Gm-Gg: AfdE7clrH9SABGd3AmsdoRpGXt38MuviW8YboXwyz2FCwjrISuRzvAdhK8tNjQqE45Z
	vZF6qOrpWsTWkYxpMHQhHJnR1BE4ZXsab1J0JMmYNq68qi0qbGecArwfY1SAqexwwyxQWHI+Cpk
	61h4G22aV9cHQiPDp8f4C5l3ZKSvO9P2ng5JBy5NRH9VoCLrzfc2uNk2kFJRG8iWxguGS59YETS
	/ZVRjmgQ0TBapiR4x+BF0M2herYDtIUpFLYbwq6hvox2S6hyFGsMCg4kSAoany/NeAfteYM6+IM
	zUca0BeWGkFTeCbQFNcbn22SAe8jBL/YBo4jaCKzP3leC8zFKHvPjF92xF65gJUBVdVpm6BDw3o
	t3kjh/qjCGbLc7UCA4g1aU0MMjHrN8vnCV3IcidZCG1c3Sv9wI1gNw3jFwe8Y4VudGn5PAfD5Kj
	gMWqd7yyH67jePLnWGDU4Xpk1mSYjcSwnS33oq48j41N+d
X-Received: by 2002:a17:90b:3f44:b0:38e:5962:8e5a with SMTP id 98e67ed59e1d1-38e5962b085mr4232864a91.5.1784401072478;
        Sat, 18 Jul 2026 11:57:52 -0700 (PDT)
Received: from localhost ([112.204.126.243])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-38e3a0d82d1sm4838730a91.10.2026.07.18.11.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:57:51 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Sun, 19 Jul 2026 02:57:02 +0800
Message-ID: <20260718185704.3466-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have a CF-SR4 and Linux works out of the box. Compared to
previous models, this one seems to have the fans running at high speed
by default when the computer starts.

When Windows 11 is booted up, the high fan speeds persist just until the
login screen. Once the login screen shows up, the fan spins down.

I had suspected that this might be the laptop ramping down the fans when
the OS declares that it is Windows but this does not seem to be the
case.

After analyzing the DSDT and SSDT of the computer, I have found the
following:

File ssdt10.dsl under \_SB.PC00.LPCB.EC0:

Name (CEFM, Zero)
Method (SEFM, 1, Serialized)
{
    CEFM = Arg0
    REFM ()
}

Method (REFM, 0, Serialized)
{
    If ((\S0IX == 0x03))
    {
        Local0 = 0x05
    }
    ElseIf ((CEFM == Zero))
    {
        Local0 = Zero
    }
    Else
    {
        Local0 = 0x02
    }

    \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Local0, Zero)
}

\_SB.PC00.LPCB.EC0.CEFM would seem be the current value
for the fan profile. On startup, this is set to 0.

Based on the code SEFM seems the be the method to set the fan
profile and REFM is executed right after.

I don't have access to information as to what the argument officially
means but based on testing, any number above zero makes the fans spin
down and behave like the older models where it stops or runs at low
speed when its cool and ramps up when the processor gets hot.

The only relevant values for CEFM seem to be just 0 and any number above
that just gets treated the same. I personally use just 0 and 1.
0 seems to be the high fan speed mode and 1 makes it behave like
Windows.

Giving 0 as an argument reverts the fan back to the way it was during
startup where the lowest fan speed is quite high and when load is
applied, it seems to ramp up to an even higher speed which I think would
be its 100%.

A value of 1 seems to have its max speed capped lower than 0.

For both modes, fan management is still automatic.

fan_mode only shows up in sysfs only if \_SB.PC00.LPCB.EC0.CEFM and
\_SB.PC00.LPCB.EC0.SEFM are both present which should mean it should not
show up on unsupported models. I have tried not hiding it and it just
outputs a generic error when the value is read.

I also saw that variables such as eco_mode are kept in memory, however
for fan_mode I rely on getting and setting the value via ACPI.

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 500 +++++++++++++++++++++++-
 1 file changed, 486 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..2d67188de2a9 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -119,6 +119,9 @@
  *		- v0.1  start from toshiba_acpi driver written by John Belmonte
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/printk.h>
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
@@ -136,6 +139,14 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <acpi/video.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/thermal.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/cleanup.h>
+#include <linux/minmax.h>
 
 MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
 MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
@@ -164,6 +175,17 @@ MODULE_LICENSE("GPL");
 
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
+/* Define fan PWM modes */
+#define ACPI_PCC_FAN_PWM_AUTO		0x00
+#define ACPI_PCC_FAN_PWM_MANUAL		0x01
+#define HWMON_PCC_FAN_PWM_AUTO		0x02
+#define HWMON_PCC_FAN_PWM_MANUAL	0x01
+
+/* Define quirks for this driver */
+struct quirk_entry {
+	bool has_ospm_pwm_fan;
+};
+
 /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
    ECO_MODEs: 0x03 = off, 0x83 = on
 */
@@ -238,19 +260,50 @@ static const struct key_entry panasonic_keymap[] = {
 };
 
 struct pcc_acpi {
-	acpi_handle		handle;
-	unsigned long		num_sifr;
-	int			sticky_key;
-	int			eco_mode;
-	int			mute;
-	int			ac_brightness;
-	int			dc_brightness;
-	int			current_brightness;
-	u32			*sinf;
-	struct acpi_device	*device;
-	struct input_dev	*input_dev;
-	struct backlight_device	*backlight;
-	struct platform_device	*platform;
+	acpi_handle			handle;
+	unsigned long			num_sifr;
+	int				sticky_key;
+	int				eco_mode;
+	int				mute;
+	int				ac_brightness;
+	int				dc_brightness;
+	int				current_brightness;
+	u32				*sinf;
+	struct quirk_entry		*quirks;
+	struct acpi_device		*device;
+	struct input_dev		*input_dev;
+	struct backlight_device		*backlight;
+	struct platform_device		*platform;
+	struct thermal_cooling_device	*pwm_fan_cdev;
+	struct device			*pwm_fan_hwmon;
+
+	/*
+	 * This mutex ensures that the hwmon and thermal functions
+	 * for fan operations do not conflict as the PWM fan is
+	 * exposed to both.
+	 */
+	struct mutex			pwm_fan_lock;
+};
+
+/*
+ * Declare quirks
+ */
+
+static struct quirk_entry quirk_cf_sr4 = {
+	.has_ospm_pwm_fan = true,
+};
+
+/* DMI matching for quirks copied from asus-nb-wmi.c */
+static const struct dmi_system_id pcc_quirks[] = {
+	{
+		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
+		},
+		.driver_data = &quirk_cf_sr4,
+	},
+	{},
 };
 
 /*
@@ -415,7 +468,6 @@ static const struct backlight_ops pcc_backlight_ops = {
 	.update_status	= bl_set_status,
 };
 
-
 /* returns ACPI_SUCCESS if methods to control optical drive are present */
 
 static acpi_status check_optd_present(void)
@@ -507,6 +559,155 @@ static int set_optd_power_state(int new_state)
 	return result;
 }
 
+/* get OSPM fan mode */
+
+static int pcc_pwm_fan_mode_read(int *pwm_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+
+	/* BIOS default is zero which seems to be some sort of failsafe mode */
+	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
+				       &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("cannot get fan mode via CEFM\n");
+		return -EIO;
+	}
+
+	/* use hwmon convention for pwm_mode */
+	if (state == ACPI_PCC_FAN_PWM_AUTO) {
+		*pwm_mode = HWMON_PCC_FAN_PWM_AUTO;
+	} else if (state != 0 && state > 0) {
+		*pwm_mode = HWMON_PCC_FAN_PWM_MANUAL;
+	} else {
+		/* unknown */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* set OSPM fan mode */
+
+static int pcc_pwm_fan_mode_set(int pwm_mode)
+{
+	acpi_status status;
+
+	union acpi_object param[1];
+	struct acpi_object_list input;
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = pwm_mode;
+	input.count = 1; /* takes one arg */
+	input.pointer = param;
+
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &input,
+				      NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("cannot set fan mode via SEFM\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* read PWM fan speed */
+
+static int pcc_pwm_fan_speed_read(int *pwm_speed)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int pwm_mode;
+
+
+	/* Get fan status first */
+	/* If fan is not in manual mode, it will return a bogus value */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan status\n");
+		return status;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO)
+		return -ENODATA; /* Indeterminate value */
+
+	/* get pwm speed */
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
+				      NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		pr_err("failed to get pwm speed\n");
+		return -EIO;
+	}
+
+	union acpi_object *obj __free(kfree) = buffer.pointer;
+
+	/* the structure should have 3 values */
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
+		pr_err("Invalid _FST package structure (expected 3)\n");
+		return -EINVAL;
+	}
+
+	/* the second element should be the pwm speed as an int */
+	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
+		pr_err("_FST element at index 1 is not an integer\n");
+		return -EINVAL;
+	}
+
+	/* prevent out-of-bounds */
+	if (obj->package.elements[1].integer.value > 100) {
+		pr_err("_FST element at index 1 is an integer out of bounds\n");
+		return -EINVAL;
+	}
+
+	*pwm_speed = obj->package.elements[1].integer.value;
+	return 0;
+}
+
+/* set PWM fan speed */
+
+static int pcc_pwm_fan_speed_set(int set_pwm_speed)
+{
+	struct acpi_object_list input;
+	union acpi_object param[1];
+	acpi_status fsl_status;
+	int pwm_mode;
+	int status;
+
+	/* Get fan status. set to manual if not set */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan status\n");
+		return status;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
+		if (status < 0) {
+			pr_err("set fan PWM to manual failed\n");
+			return status;
+		}
+	}
+
+	/* check if within bounds */
+	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
+		pr_err("fan speed level out of bounds\n");
+		return -EIO;
+	}
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = set_pwm_speed;
+	input.count = 1; /* takes one arg */
+	input.pointer = param;
+
+	fsl_status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
+				      &input, NULL);
+	if (ACPI_FAILURE(fsl_status)) {
+		pr_err("Setting of fan speed via ._FSL failed.\n");
+		return -EIO;
+	}
+
+	return 0;
+}
 
 /* sysfs user interface functions */
 
@@ -825,6 +1026,228 @@ static const struct attribute_group pcc_attr_group = {
 	.is_visible	= pcc_sysfs_is_visible,
 };
 
+/* hwmon */
+
+static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	NULL
+};
+
+static int pcc_pwm_fan_hwmon_speed_read(struct pcc_acpi *pcc, long *val)
+{
+	int pwm_speed;
+	int status;
+
+	guard(mutex)(&pcc->pwm_fan_lock);
+
+	status = pcc_pwm_fan_speed_read(&pwm_speed);
+	if (status < 0)
+		return status;
+
+	/* protect against out-of-bounds */
+	if (pwm_speed < 0 || pwm_speed > 100)
+		return -EINVAL;
+
+	*val = (pwm_speed * 255) / 100;
+	return 0;
+}
+
+static int pcc_pwm_fan_hwmon_mode_read(struct pcc_acpi *pcc, long *val)
+{
+	int pwm_mode;
+	int status;
+
+	guard(mutex)(&pcc->pwm_fan_lock);
+
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan pwm mode\n");
+		return status;
+	}
+
+	switch (pwm_mode) {
+	case HWMON_PCC_FAN_PWM_AUTO:
+		*val = HWMON_PCC_FAN_PWM_AUTO;
+		return 0;
+	case HWMON_PCC_FAN_PWM_MANUAL:
+		*val = HWMON_PCC_FAN_PWM_MANUAL;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int pcc_pwm_fan_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long *val)
+{
+	struct pcc_acpi *pcc = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return pcc_pwm_fan_hwmon_speed_read(pcc, val);
+	case hwmon_pwm_enable:
+		return pcc_pwm_fan_hwmon_mode_read(pcc, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int pcc_pwm_fan_hwmon_mode_set(struct pcc_acpi *pcc, long val)
+{
+	switch (val) {
+	case HWMON_PCC_FAN_PWM_AUTO:
+		guard(mutex)(&pcc->pwm_fan_lock);
+		return pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
+	case HWMON_PCC_FAN_PWM_MANUAL:
+		guard(mutex)(&pcc->pwm_fan_lock);
+		return pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int pcc_pwm_fan_hwmon_speed_set(struct pcc_acpi *pcc, long val)
+{
+	int pwm_speed_vendor_val;
+	int pwm_mode;
+	int status;
+
+	val = clamp_val(val, 0, 255);
+	pwm_speed_vendor_val = (val * 100) / 255;
+
+	guard(mutex)(&pcc->pwm_fan_lock);
+
+	/* check first if manual control is enabled */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan pwm mode\n");
+		return status;
+	}
+
+	/* do not allow settings speeds if not manual mode */
+	if (pwm_mode != HWMON_PCC_FAN_PWM_MANUAL)
+		return -EOPNOTSUPP;
+
+	status = pcc_pwm_fan_speed_set(pwm_speed_vendor_val);
+	if (status < 0) {
+		pr_err("failed to set fan pwm\n");
+		return status;
+	}
+	return 0;
+}
+
+static int pcc_pwm_fan_hwmon_write(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, long val)
+{
+	struct pcc_acpi *pcc;
+
+	pcc = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		return pcc_pwm_fan_hwmon_mode_set(pcc, val);
+	case hwmon_pwm_input:
+		return pcc_pwm_fan_hwmon_speed_set(pcc, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t pcc_pwm_fan_hwmon_is_visible(const void *data,
+					    enum hwmon_sensor_types type,
+					    u32 attr, int channel)
+{
+	if (type != hwmon_pwm)
+		return 0;
+
+	return 0644;
+}
+
+static const struct hwmon_ops pcc_pwm_fan_hwmon_ops = {
+	.is_visible = pcc_pwm_fan_hwmon_is_visible,
+	.read = pcc_pwm_fan_hwmon_read,
+	.write = pcc_pwm_fan_hwmon_write,
+};
+
+static const struct hwmon_chip_info pcc_pwm_fan_hwmon_chip_info = {
+	.ops = &pcc_pwm_fan_hwmon_ops,
+	.info = pcc_pwm_fan_hwmon_info,
+};
+
+/* thermal interface */
+static int pcc_pwm_fan_thermal_max_state(struct thermal_cooling_device *cdev,
+					 unsigned long *state)
+{
+	*state = 100; /* range of 0-100 as per UEFI spec */
+	return 0;
+}
+static int
+pcc_pwm_fan_thermal_get_current_pwm(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct pcc_acpi *pcc = cdev->devdata;
+	int current_pwm;
+	int pwm_mode;
+	int status;
+
+	guard(mutex)(&pcc->pwm_fan_lock);
+
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (status < 0) {
+		pr_err("%s: failed to get fan pwm mode\n", __func__);
+		return status;
+	}
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		*state = 100; /* Return failsafe value on EC mode */
+		return 0;
+	}
+
+	status = pcc_pwm_fan_speed_read(&current_pwm);
+	if (status < 0)
+		return status; /* pass error code */
+
+	if (current_pwm > 100)
+		current_pwm = 100;
+	if (current_pwm < 0)
+		return -EINVAL;
+
+	*state = current_pwm;
+	return 0;
+}
+static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct pcc_acpi *pcc = cdev->devdata;
+	int status;
+	int set_pwm;
+
+	guard(mutex)(&pcc->pwm_fan_lock);
+
+	if (state > 100)
+		return -EINVAL;
+
+	set_pwm = state;
+	status = pcc_pwm_fan_speed_set(set_pwm);
+	if (status < 0) {
+		pr_err("%s: failed to set fan speed pwm\n", __func__);
+		return status;
+	}
+
+	return 0;
+}
+static const struct thermal_cooling_device_ops pcc_pwm_fan_cdev_ops = {
+	.get_max_state = pcc_pwm_fan_thermal_max_state,
+	.get_cur_state = pcc_pwm_fan_thermal_get_current_pwm,
+	.set_cur_state = pcc_pwm_fan_thermal_set_fan_pwm,
+};
 
 /* hotkey input device driver */
 
@@ -981,6 +1404,7 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 
 static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct backlight_properties props;
 	struct acpi_device *device;
 	struct pcc_acpi *pcc;
@@ -1013,6 +1437,9 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	/* Initialize mutex */
+	mutex_init(&pcc->pwm_fan_lock);
+
 	pcc->sinf = kcalloc(num_sifr + 1, sizeof(u32), GFP_KERNEL);
 	if (!pcc->sinf) {
 		result = -ENOMEM;
@@ -1026,6 +1453,15 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
 
+	/*
+	 * Perform quirk detection
+	 */
+	dmi_id = dmi_first_match(pcc_quirks);
+	if (dmi_id) {
+		pcc->quirks = dmi_id->driver_data;
+		pr_debug("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
+	}
+
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
@@ -1097,6 +1533,35 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	}
 
 	i8042_install_filter(panasonic_i8042_filter, NULL);
+
+	/* skip if no quirks */
+	if (!pcc->quirks)
+		goto out_no_quirks;
+
+	/* has_ospm_pwm_fan - add hwmon and thermal if present */
+	if (pcc->quirks->has_ospm_pwm_fan) {
+		pr_debug("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
+
+		pcc->pwm_fan_hwmon = hwmon_device_register_with_info(
+			&pdev->dev, "panasonic_pwm_fan", pcc,
+			&pcc_pwm_fan_hwmon_chip_info, NULL);
+		if (IS_ERR(pcc->pwm_fan_hwmon)) {
+			pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
+			/* not a critical error. just skip if error */
+			pcc->pwm_fan_hwmon = NULL;
+		}
+
+		/* proceed with thermal */
+		pr_debug("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
+		pcc->pwm_fan_cdev = thermal_cooling_device_register(
+			"Panasonic_PWM_Fan", pcc, &pcc_pwm_fan_cdev_ops);
+		if (IS_ERR(pcc->pwm_fan_cdev)) {
+			pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
+			pcc->pwm_fan_cdev = NULL;
+		}
+	}
+
+out_no_quirks:
 	return 0;
 
 out_platform:
@@ -1124,6 +1589,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	struct pcc_acpi *pcc = acpi_driver_data(device);
 
+	if (pcc->pwm_fan_hwmon)
+		hwmon_device_unregister(pcc->pwm_fan_hwmon);
+	if (pcc->pwm_fan_cdev)
+		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
+
+	mutex_destroy(&pcc->pwm_fan_lock);
+
 	i8042_remove_filter(panasonic_i8042_filter);
 
 	if (pcc->platform) {
-- 
New in v7:
 - Added commend to explain mutex pwm_fan_lock
 - Address spurious changes and other comments
 - Removed redundant "error:" when using pr_err
 - Removed __func__ when calling pr_err
 - Drop out label to return directly
 - Use guard via cleanup.h for mutexes (eliminate goto)
 - Used __free() in place of kfree(buffer.pointer)
 - Put NULL on new line for HWMON_CHANNEL_INFO

> Please add a comment to explain what the mutex protects.

I have made the changes here:

> +     /*
> +      * This mutex ensures that the hwmon and thermal functions
> +      * for fan operations do not conflict as the PWM fan is
> +      * exposed to both.
> +      */
> +     struct mutex                    pwm_fan_lock;

For the spurious change referenced here:

>> +/*
>> + * Declare quirks and apply matches
>> + */
>> +
>> +static struct quirk_entry quirk_cf_sr4 = {
>> +     .has_ospm_pwm_fan = true,
>> +};
>> +
>> +/* DMI matching for quirks copied from asus-nb-wmi.c */
>> +static const struct dmi_system_id pcc_quirks[] = {
>> +     {
>> +             .ident = "Panasonic Connect Co., Ltd. CFSR4-1",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
>> +             },
>> +             .driver_data = &quirk_cf_sr4,
>> +     },
>> +     {},
>>  };
>>
>>  /*
>> @@ -415,7 +460,6 @@ static const struct backlight_ops pcc_backlight_ops = {
>>       .update_status  = bl_set_status,
>>  };
>>
>> -
>
>Spurious change.

The previous sashiko bot code review pointed out that a global variable
related to quirks was unused as there was previously a callback that set
a global variable. As keeping the driver data within the driver struct
is best practice, I have removed that in favor of doing the quirk
detection inside the driver's probe function.

Also, as the callback has now been removed, I have also clarified the
comment to just say "Declare quirks":

>+/*
>+ * Declare quirks
>+ */

>> +/* get OSPM fan mode */
>> +
>> +static int pcc_pwm_fan_mode_read(int *pwm_mode)
>> +{
>> +     unsigned long long state;
>> +     acpi_status status;
>> +     int result;
>> +
>> +     /* BIOS default is zero which seems to be some sort of failsafe mode */
>> +     status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
>> +                                    &state);
>> +     if (ACPI_FAILURE(status)) {
>> +             pr_err("error: cannot get fan mode via CEFM\n");
>
>This is already pr_err so printing also "error:" seems unnecessary.

I have removed all instances in the patch of passing "error:" when
calling pr_err

>> +             result = -EIO;
>> +             goto out;
>> +     }
>> +
>> +     result = 0;
>> +
>> +out:
>> +     return result;
>
>Drop the label and result variable, and do returns directly:
>                return -EIO;
>        }
>
>        return 0;

I have implemented the change to all functions within this patch that
match that pattern. Returns are now direct.

> > +     /* Get fan status first */
> > +     /* If fan is not in manual mode, it will return a bogus value */
> > +     status = pcc_pwm_fan_mode_read(&pwm_mode);
> > +     if (status < 0) {
> > +             pr_err("%s: failed to get fan status\n", __func__);
> 
> Don't print __func__ in anything meant for normal user consumption, write
> the messages without C "oddities" for normal users.

I have removed all __func__ from pr_err in this patch. I have found
additional instances of this that were not quoted. I have made the
change for those too (as indicated) here:

>> +     result = 0;
>> +
>> +out:
>> +     return result;
>
>Please apply similar return + goto removal transitions as mentioned for
>the other functions.


>> +     /* get pwm speed */
>> +     status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
>> +                                   NULL, &buffer);
>> +     if (ACPI_FAILURE(status)) {
>> +             pr_err("%s: failed to get pwm speed\n", __func__);
>> +             result = -EIO;
>> +             goto out;
>
>These should all just return directly.

Implemented for this instance and the other functions that can just
return directly.

>> +     }
>> +
>> +     obj = buffer.pointer;
>
>Please use __free() (move variable declaration here mid-function as
>explained in cleanup.h) and remove out label entirely.

This has been implemented:

> +	/* get pwm speed */
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
> +				      NULL, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("failed to get pwm speed\n");
> +		return -EIO;
> +	}
> +
> +	union acpi_object *obj __free(kfree) = buffer.pointer;
> +

>> +}
>> 
>>  /* sysfs user interface functions */
>> 
>> @@ -676,6 +901,7 @@ static ssize_t ac_brightness_show(struct device *dev, struct device_attribute *a
>>       return sysfs_emit(buf, "%u\n", pcc->sinf[SINF_AC_CUR_BRIGHT]);
>>  }
>> 
>> +
>
>Spurious change.

This was an unintended change that has now been fixed.

>> 
>> +/* hwmon */
>> +
>> +static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
>> +     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE), NULL
>
>Put NULL on own line for clarity.

Done here:

> +/* hwmon */
> +
> +static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL
> +};


>> +static int pcc_pwm_fan_hwmon_speed_read(struct pcc_acpi *pcc, long *val)
>> +{
>> +     int pwm_speed;
>> +     int result;
>> +     int status;
>> +
>> +     mutex_lock(&pcc->pwm_fan_lock);
>
>Please use guard() and remove all gotos.

This has been implemented here and on other functions that it applies
to.

>> +static int pcc_pwm_fan_hwmon_read(struct device *dev,
>> +                               enum hwmon_sensor_types type, u32 attr,
>> +                               int channel, long *val)
>> +{
>> +     struct pcc_acpi *pcc;
>> +
>> +     pcc = dev_get_drvdata(dev);
>
>Put this assignment to the variable declaration line.

This has been done:

>+static int pcc_pwm_fan_hwmon_read(struct device *dev,
>+				  enum hwmon_sensor_types type, u32 attr,
>+				  int channel, long *val)
>+{
>+	struct pcc_acpi *pcc = dev_get_drvdata(dev);
>+
>+	if (type != hwmon_pwm)
>+		return -EOPNOTSUPP;


>> +static int pcc_pwm_fan_hwmon_speed_set(struct pcc_acpi *pcc, long val)
>> +{
>> +     int pwm_speed_vendor_val;
>> +     int pwm_mode;
>> +     int status;
>> +     int result;
>> +
>> +     val = clamp_val(val, 0, 255);
>
>Add include for clamp_val().
>
>Many earlier comments apply to this function as well and some others
>below as well.

I have added this:

> +#include <linux/minmax.h>

For this function, I have also eliminated the goto and just used return
directly. guard(mutex) was also used.

> +static int pcc_pwm_fan_hwmon_speed_set(struct pcc_acpi *pcc, long val)
> +{
> +	int pwm_speed_vendor_val;
> +	int pwm_mode;
> +	int status;
> +
> +	val = clamp_val(val, 0, 255);
> +	pwm_speed_vendor_val = (val * 100) / 255;
> +
> +	guard(mutex)(&pcc->pwm_fan_lock);
> +
> +	/* check first if manual control is enabled */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("failed to get fan pwm mode\n");
> +		return status;
> +	}
> +
> +	/* do not allow settings speeds if not manual mode */
> +	if (pwm_mode != HWMON_PCC_FAN_PWM_MANUAL) {
> +		return -EOPNOTSUPP;
> +	}
> +
> +	status = pcc_pwm_fan_speed_set(pwm_speed_vendor_val);
> +	if (status < 0) {
> +		pr_err("failed to set fan pwm\n");
> +		return status;
> +	}
> +	return 0;
> +}


>> +     /*
>> +      * Perform quirk detection
>> +      */
>> +     dmi_id = dmi_first_match(pcc_quirks);
>> +     if (dmi_id) {
>> +             pcc->quirks = dmi_id->driver_data;
>> +             pr_info("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
>
>IMO, this should be debug level if useful at all.

I have used pr_debug instead:

> +	/*
> +	 * Perform quirk detection
> +	 */
> +	dmi_id = dmi_first_match(pcc_quirks);
> +	if (dmi_id) {
> +		pcc->quirks = dmi_id->driver_data;
> +		pr_debug("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
> +	} 
> +

Going further, I have also made changes to the following two instances:

> +	/* has_ospm_pwm_fan - add hwmon and thermal if present */
> +	if (pcc->quirks->has_ospm_pwm_fan) {
> +		pr_debug("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);

and

> +
> +		/* proceed with thermal */
> +		pr_debug("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
> +		pcc->pwm_fan_cdev = thermal_cooling_device_register(


>> +     } else {
>> +             pcc->quirks = NULL;
>
>Isn't the default/initialization value NULL anyway so why you need to set
>it here?

I had gone a bit overboard after the previous rounds of the sashiko bot
review. I have undone that as I do agree it is not necessary.

>> +
>> +     /* skip if no quirks */
>> +     if (!pcc->quirks)
>> +             goto out_no_quirks;
>> +
>> +     /* has_ospm_pwm_fan - add hwmon and thermal if present */
>> +     if (pcc->quirks->has_ospm_pwm_fan) {
>> +             mutex_init(&pcc->pwm_fan_lock);
>
>I suggest you always initialize the mutex. Doing it conditionally it made
>your cleanup trickier (and more prone to corner cases if somebody changes
>some of the checks). What's the benefit for doing in conditionally?

My original mindset was since this is a quirk for this particular model,
I should avoid executing code for older models in order to not break
compatibility. After thinking it trough I do agree that just
initializing the mutex every time is much simpler and makes the code
more readable.

I have placed the mutex declaration after the struct was allocated
memory:

>@@ -1012,6 +1442,9 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
> 		pr_err("Couldn't allocate mem for pcc");
> 		return -ENOMEM;
> 	}
>+	
>+	/* Initialize mutex */
>+	mutex_init(&pcc->pwm_fan_lock);

As this was changed, the conditional mutex initialization is now gone.
And the cleanup code was simplified:

> +	if (pcc->pwm_fan_hwmon)
> +		hwmon_device_unregister(pcc->pwm_fan_hwmon);
> +	if (pcc->pwm_fan_cdev)
> +		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
> +	
> +	mutex_destroy(&pcc->pwm_fan_lock);
> +

Thanks for taking the time to review the code.

2.54.0

