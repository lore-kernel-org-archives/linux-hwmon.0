Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6DF2EEE63
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444350; cv=none; b=hAoYaOWhL9XJe+/tRIr3ZAKNcJw/3GAurHi2HTuBSOQ1xA2zKumJWtINQ0YGg7MNH5HUV7vov4zGci4T58KcnH/Jwm+0BswB1KeqLpdTHcW1mnEra4WTLsA8Pm5zIiru+w5CWZiZiw2Sq+J0eUv8OOKTpbz/eHIUeMr2MDd/7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444350; c=relaxed/simple;
	bh=FFwSEsg1+CCsqSARMkFz1McRZ9Xy1ZsuLpCviISDXdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbinlUpz3EZrNjVOafcnwmmCkhDPZm/4UxMCovPOBVwk6x7CEGKiXv7PwvqwNV37XSA9kKRBRShmmSLBpw/lYCgHvhozfSTMb2bYFi6A5btm97Z4eWcS6POWqCSaAErqyvKyiklBXUGDcz3Ueaq4NhZkJddi/P46u1QAzYDcFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYB4QS9c; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYB4QS9c"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7f1db3ad4so5067305ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782444347; x=1783049147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO8MSVlPG8+pMXhx/skRfiq74zAUENzqQIndUcYWMHo=;
        b=DYB4QS9cfHKqOTD0miVacv1SxsqTteH3wcXaM3abJevNSLO6W7DBTBBB5wu7lMBVHO
         2T0GsIjOY7iL9j1EFJie+a3CcUp6L/Ay1UzahOWbo5oH/2kKrFBKq1mXn82MV6baJt3z
         xozN1tKU0qpjTFTpWTBCJYR5uhsJsa5RoNRzmU4Lcu5j60MYkyApB2NOhM1ZGWZQsEbW
         R8CRZAfJagIc/wR/DiHFXuVl4SUGroYsOb9DG/KAfQSp3Y/ub2AFeVwUpPgMyGDZmC7a
         WGBrXsW52oqErT0KankAxgi3uCiUOT62LuinLm6Qf259EEqTUIFY+Pwt4jbE0w5pfTiD
         fJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782444347; x=1783049147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gO8MSVlPG8+pMXhx/skRfiq74zAUENzqQIndUcYWMHo=;
        b=ICCNtEGbzhYMNpDIrcx9VUzEcoO9q5bFFxYMtq3Vey1/GdcZFnI+2lsQKVsxuWmDfS
         GPorGdigatG3VYis1jHSHyViNz/+SU6X6jdh9zagmOmi8EEPaolO0i+CmqKa4EASzfKZ
         MXteKRscxKjRe6vDEo8KKorMoGRABaPVKWnpSJrblMlC2M28upoAQxZq8vTdLYvF0jBH
         D5cpwOKpIbnQknOkcRskjoklcbeUvtaViaTPdGaMdNcj/uVNo0V9h3YwzweJSfbWejNy
         LvMTo7Gek94v50qWM7bMCFUJGNyDjVueCx7OOg/oIXD0V+32aR7BUGsBaBbwjAK9wwss
         7/Pg==
X-Forwarded-Encrypted: i=1; AHgh+RrkUDXYQNQdewNHCqMatzz4Z4L/I4r/D/VeDr/VKTCGoBj60O4XSlPhz7fgL+SygwiPE1OfofdSC/5imw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyj6hf4CU7WmVjrt/kAzCsErXgBwegruakFMa/pcMblw/7RnsR
	GssEqo1XEbIsSNZEJYMBviXq0Y97hjdRhXptBUleL3m7CI+Z8w3PEKtf
X-Gm-Gg: AfdE7cmSd6Mi+Zcy2OGHopSJt5EurAfna+8SMyu+MfZliIA4TAiwa57Tv/yeyLuGjfF
	F9aW/vZ9Jmu6LBEujlgqhdccnhsBfeQBy+eFIy9YMdmIkUg3zxClHFW0TdlAkCjMQRP5jP/y91O
	qVMtus9C4K+JO4aPAzn/wwQ8vbsXeNknH+RPb63f6cQmLHznrxvN1Awh5CWuRo+OgA9qi15jaXH
	Znx4XelEvdjByvi7tTYo/eGY00MgquCsi+jDkYXGR9FHMiX8NQhDuoLeyPUNiy32GVe4aTMEy6j
	cpK/UKPgpSxCpNHyYCA+T0fGhlXlxeH4A7bslM7zji5lLUH7+EC6iTR1Xi047vXDKbQ5DUXzPAL
	6WKJzBIRTHVs+xdoaoSP5GSxEkk1+JEj5H4oobTsR4NjuszUV58VEtqIoRcxrticAke7t007c/K
	tcsVVoUulvd8UpmS1kOnkUHvUfbLaAKCsdtX8VLY0gPBxP
X-Received: by 2002:a17:902:e806:b0:2c0:c262:b91f with SMTP id d9443c01a7336-2c7fc9bfc63mr55345955ad.8.1782444347293;
        Thu, 25 Jun 2026 20:25:47 -0700 (PDT)
Received: from localhost ([112.204.126.243])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c92bc1df042sm2468510a12.18.2026.06.25.20.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 20:25:46 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH v4] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Fri, 26 Jun 2026 11:25:22 +0800
Message-ID: <20260626032524.22530-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625120432.BB3D21F000E9@smtp.kernel.org>
References: <20260625120432.BB3D21F000E9@smtp.kernel.org>
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
> - [High] Unconditional NULL pointer dereference on hardware without DMI quirks.
> - [High] Resource leak and potential Use-After-Free due to direct return on probe error.
> - [High] Race condition between hwmon sysfs and thermal cooling device operations.
> - [Medium] Violation of hwmon ABI for 'pwm_enable' attribute.
> - [Low] Compilation error due to missing 'quirks' field in 'struct pcc_acpi'.
> - [Low] Always-false boundary check due to unsigned comparison.
> - [Low] Idiomatically incorrect header inclusion for errno.

I have made changes to the code based on the feedback from sashiko-bot.

> > diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> > index b83113c26f885..7774620b27635 100644
> > --- a/drivers/platform/x86/panasonic-laptop.c
> > +++ b/drivers/platform/x86/panasonic-laptop.c
> > @@ -136,6 +139,12 @@
> >  #include <linux/types.h>
> >  #include <linux/uaccess.h>
> >  #include <acpi/video.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/thermal.h>
> > +#include <linux/dmi.h>
> > +#include <asm-generic/errno.h>
> 
> [Severity: Low]
> Should this include <linux/errno.h> instead? It is usually preferred for
> device drivers to use the generic linux header rather than the
> architecture-specific one to ensure cross-architecture compatibility.

The following change has been made:

> +#include <linux/errno.h>

> > diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> > index b83113c26f885..7774620b27635 100644
> > --- a/drivers/platform/x86/panasonic-laptop.c
> > +++ b/drivers/platform/x86/panasonic-laptop.c
> > @@ -136,6 +139,12 @@
> >  #include <linux/types.h>
> >  #include <linux/uaccess.h>
> >  #include <acpi/video.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/thermal.h>
> > +#include <linux/dmi.h>
> > +#include <asm-generic/errno.h>
> 
> [Severity: Low]
> Should this include <linux/errno.h> instead? It is usually preferred for
> device drivers to use the generic linux header rather than the
> architecture-specific one to ensure cross-architecture compatibility.

For this one, this has been corrected by adding the missing variable
and has been tested to compile and install.

> +	struct quirk_entry		*quirks;

> > +static int pcc_pwm_fan_speed_set(int set_pwm_speed)
> > +{
> > +     struct acpi_object_list input;
> > +     union acpi_object param[1];
> > +     acpi_status status;
> > +     int pwm_mode;
> > +     int result;
> > +
> > +     /* Get fan status. set to manual if not set */
> > +     status = pcc_pwm_fan_mode_read(&pwm_mode);
> [ ... ]
> > +     if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> > +             status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
> [ ... ]
> > +     status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
> > +                                   &input, NULL);
> 
> [Severity: High]
> Could this sequence race with other operations? This multi-step process
> of reading the mode, changing it, and setting the speed isn't protected
> by a lock. Since the thermal subsystem might poll this while userspace
> writes to hwmon sysfs concurrently, could this interleave and corrupt the
> hardware state?

For this one I have implemented a mutex to make sure hwmon and thermal
don't conflict with each other.

> +	struct thermal_cooling_device	*pwm_fan_cdev;
> +	struct device			*pwm_fan_hwmon;
> +	struct mutex			pwm_fan_lock;

To ensure the hwmon device is unregistered before the mutex is
destroyed, it has been re-written to use hwmon_device_register_with_info
instead of devm_hwmon_device_register_with_info:

> @@ -1124,6 +1631,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
>  	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
>  	struct pcc_acpi *pcc = acpi_driver_data(device);
>  
> +	if (pcc->pwm_fan_hwmon)
> +		hwmon_device_unregister(pcc->pwm_fan_hwmon);
> +	if (pcc->pwm_fan_cdev)
> +		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
> +	if (pcc->pwm_fan_hwmon || pcc->pwm_fan_cdev)
> +		mutex_destroy(&pcc->pwm_fan_lock);

The mutex is only initialized if either hwmon or thermal device
registration succeeds.

> +			/* cleanup: destroy mutex if both hwmon and thermal failed */
> +			if (!pcc->pwm_fan_hwmon && !pcc->pwm_fan_cdev)
> +				mutex_destroy(&pcc->pwm_fan_lock);

So there is no unnecessary mutex in memory if both fail, this was added to
the probe function. This should ensure it is present if at least one of
the devices are registered (hwmon or thermal) but destroyed if both
fail.

> > +static int pcc_pwm_fan_hwmon_read(struct device *dev,
> > +                               enum hwmon_sensor_types type, u32 attr,
> > +                               int channel, long *val)
> > +{
> [ ... ]
> > +     case hwmon_pwm_enable:
> > +             status = pcc_pwm_fan_mode_read(&pwm_mode);
> [ ... ]
> > +             if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> > +                     *val = HWMON_PCC_FAN_PWM_AUTO;
> > +             } else if (pwm_mode == HWMON_PCC_FAN_PWM_MANUAL) {
> 
> [Severity: Medium]
> Is this returning the correct hwmon ABI value for automatic mode?
> HWMON_PCC_FAN_PWM_AUTO is defined as 0, but the standard hwmon ABI expects
> 2 for automatic mode (and 1 for manual). This might confuse standard
> userspace tools like fancontrol. This same ABI mismatch appears in
> pcc_pwm_fan_hwmon_write() as well.

I have made the following changes:

> +/* Define fan PWM modes */
> +#define ACPI_PCC_FAN_PWM_AUTO	0x00
> +#define ACPI_PCC_FAN_PWM_MANUAL	0x01
> +#define HWMON_PCC_FAN_PWM_AUTO	0x02
> +#define HWMON_PCC_FAN_PWM_MANUAL	0x01

so for hwmon, EC control maps to 2 and manual control is 1.
Thus,

$ echo 2 | sudo tee /sys/class/hwmon/hwmon6/pwm1_enable # EC mode
$ echo 1 | sudo tee /sys/class/hwmon/hwmon6/pwm1_enable # manual mode

would now be the case to enable/disable manual control.

> > +static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
> > +                                        unsigned long state)
> > +{
> > +     acpi_status status;
> > +     int set_pwm;
> > +
> > +     if (state > 100 || state < 0)
> > +             return -EINVAL;
> 
> [Severity: Low]
> Can 'state < 0' ever evaluate to true here? Since 'state' is an unsigned
> long, it cannot be negative, making this check mathematically impossible.

This was removed. This is now:

> +static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
> +					   unsigned long state)
> +{
> +	struct pcc_acpi *pcc;
> +	acpi_status status;
> +	int set_pwm;
> +	int result;
> +
> +	pcc = cdev->devdata;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);
> +
> +	if (state > 100) {
> +		result = -EINVAL;
> +		goto out;
> +	}


> > @@ -981,8 +1377,10 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
> > 
> >  static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
> >  {
> [ ... ]
> > +     /*
> > +      * Perform quirk detection
> > +      */
> > +     dmi_id = dmi_first_match(pcc_quirks);
> > +     if (dmi_id) {
> > +             pcc->quirks = dmi_id->driver_data;
> > +             pr_info("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
> > +     } else {
> > +             pcc->quirks = NULL;
> > +     }
> 
> [ ... ]
> 
> > +     /* has_ospm_pwm_fan - add hwmon and thermal if present */
> > +     if (pcc->quirks->has_ospm_pwm_fan) {
> 
> [Severity: High]
> Will this dereference a NULL pointer on unsupported models? If the DMI
> match fails, pcc->quirks is explicitly set to NULL above. Checking
> pcc->quirks->has_ospm_pwm_fan right after will cause a kernel panic
> during the device probe on those unquirked devices.

This was fixed by checking if the quirk structure is null first before
probing for specific quirks:

> > @@ -1097,6 +1571,39 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	i8042_install_filter(panasonic_i8042_filter, NULL);
> > +
> > +	/* check quirks */
> > +	if (pcc->quirks) {
> > +		/* has_ospm_pwm_fan - add hwmon and thermal if present */
> > +		if (pcc->quirks->has_ospm_pwm_fan) {
> > +			mutex_init(&pcc->pwm_fan_lock);
> 
> > +             pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
> > +             hwmon_dev = devm_hwmon_device_register_with_info(
> > +                     &pdev->dev, "panasonic_pwm_fan", NULL,
> > +                     &pcc_pwm_fan_hwmon_chip_info, NULL);
> > +             if (IS_ERR(hwmon_dev)) {
> > +                     pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
> > +                     return PTR_ERR(hwmon_dev);
> > +             }
> 
> [Severity: High]
> Does this direct return bypass the error cleanup sequence? Standard failure
> paths in this function use 'goto out_notify_handler;' (and other labels) to
> clean up resources. Returning directly leaks memory and leaves the ACPI
> notify handler and input devices registered. If the module is later
> unloaded, could this trigger a use-after-free when ACPI events fire?

For this one, while the other failure methods call for the driver being
unloaded entirely, I treat adding of the OSPM PWM fan as an optional
thing. The errors are handled in code, however an error in hwmon or
thermal will not cause the driver to fail.

> > +
> > +             pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
> > +             pcc->pwm_fan_cdev = thermal_cooling_device_register(
> > +                     "Panasonic_PWM_Fan", NULL, &pcc_pwm_fan_cdev_ops);
> 
> [Severity: High]
> Does registering the thermal cooling device directly bypass the hwmon core
> serialization? The subsystem guidelines indicate that thermal and sysfs
> operations are serialized by the hwmon core if attributes are registered
> via the 'info' parameter. Registering this manually out-of-band seems to
> leave the thermal polling operations unprotected, exposing the race
> condition in pcc_pwm_fan_speed_set() mentioned earlier.

While this needs review,
1. I do think the mutex locks added should prevent hwmon and thermal from
stepping over each other.
2. I have put the hwmon and thermal struct pointers on the main struct
of the driver (pcc_acpi). This is so the devices can be manually unregistered
in order before the mutex is destroyed.

 drivers/platform/x86/panasonic-laptop.c | 542 +++++++++++++++++++++++-
 1 file changed, 528 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..1a360272060c 100644
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
@@ -136,6 +139,12 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <acpi/video.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/thermal.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
 
 MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
 MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
@@ -164,6 +173,17 @@ MODULE_LICENSE("GPL");
 
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
+/* Define fan PWM modes */
+#define ACPI_PCC_FAN_PWM_AUTO		0x00
+#define ACPI_PCC_FAN_PWM_MANUAL	0x01
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
@@ -238,19 +258,53 @@ static const struct key_entry panasonic_keymap[] = {
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
+	struct mutex			pwm_fan_lock;
+};
+
+/*
+ * Declare quirks and apply matches
+ */
+static struct quirk_entry *quirks;
+
+static struct quirk_entry quirk_cf_sr4 = {
+	.has_ospm_pwm_fan = true,
+};
+
+/* DMI matching for quirks copied from asus-nb-wmi.c */
+static int dmi_matched(const struct dmi_system_id *dmi)
+{
+	pr_info("Identified laptop model '%s'\n", dmi->ident);
+	quirks = dmi->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id pcc_quirks[] = {
+	{
+		.callback = dmi_matched,
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
@@ -415,7 +469,6 @@ static const struct backlight_ops pcc_backlight_ops = {
 	.update_status	= bl_set_status,
 };
 
-
 /* returns ACPI_SUCCESS if methods to control optical drive are present */
 
 static acpi_status check_optd_present(void)
@@ -507,6 +560,179 @@ static int set_optd_power_state(int new_state)
 	return result;
 }
 
+/* get OSPM fan mode */
+
+static int pcc_pwm_fan_mode_read(int *pwm_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+	int result;
+
+	/* BIOS default is zero which seems to be some sort of failsafe mode */
+	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
+				       &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("error: cannot get fan mode via CEFM\n");
+		result = -EIO;
+		goto out;
+	}
+
+	/* use hwmon convention for pwm_mode */
+	if (state == ACPI_PCC_FAN_PWM_AUTO) {
+		*pwm_mode = HWMON_PCC_FAN_PWM_AUTO;
+	} else if (state != 0 && state > 0) {
+		*pwm_mode = HWMON_PCC_FAN_PWM_MANUAL;
+	} else {
+		/* unknown */
+		result = -EINVAL;
+		goto out;
+	}
+
+	result = AE_OK;
+
+out:
+	return result;
+}
+
+/* set OSPM fan mode */
+
+static int pcc_pwm_fan_mode_set(int pwm_mode)
+{
+	acpi_status status;
+	int result;
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
+		pr_err("error: cannot set fan mode via SEFM\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	result = AE_OK;
+
+out:
+	return result;
+}
+
+/* read PWM fan speed */
+
+static int pcc_pwm_fan_speed_read(int *pwm_speed)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int pwm_mode;
+	int result;
+
+
+	/* Get fan status first */
+	/* If fan is not in manual mode, it will return a bogus value */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan status\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		result = -ENODATA; /* Indeterminate value */
+		goto out;
+	}
+
+	/* get pwm speed */
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
+				      NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get pwm speed\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	obj = buffer.pointer;
+
+	/* the structure should have 3 values */
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
+		pr_err("Invalid _FST package structure (expected 3)\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	/* the second element should be the pwm speed as an int */
+	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
+		pr_err("_FST element at index 1 is not an integer\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	*pwm_speed = obj->package.elements[1].integer.value;
+	result = AE_OK;
+
+out:
+	kfree(buffer.pointer);
+	return result;
+}
+
+/* set PWM fan speed */
+
+static int pcc_pwm_fan_speed_set(int set_pwm_speed)
+{
+	struct acpi_object_list input;
+	union acpi_object param[1];
+	acpi_status status;
+	int pwm_mode;
+	int result;
+
+	/* Get fan status. set to manual if not set */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan status\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: set fan PWM to manual failed\n", __func__);
+			result = -EIO;
+			goto out;
+		}
+	}
+
+	/* check if within bounds */
+	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
+		pr_err("%s: error: fan speed level out of bounds\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = set_pwm_speed;
+	input.count = 1; /* takes one arg */
+	input.pointer = param;
+
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
+				      &input, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Setting of fan speed via ._FSL failed.\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	result = AE_OK;
+
+out:
+	return result;
+}
 
 /* sysfs user interface functions */
 
@@ -676,6 +902,7 @@ static ssize_t ac_brightness_show(struct device *dev, struct device_attribute *a
 	return sysfs_emit(buf, "%u\n", pcc->sinf[SINF_AC_CUR_BRIGHT]);
 }
 
+
 static ssize_t ac_brightness_store(struct device *dev, struct device_attribute *attr,
 				   const char *buf, size_t count)
 {
@@ -825,6 +1052,240 @@ static const struct attribute_group pcc_attr_group = {
 	.is_visible	= pcc_sysfs_is_visible,
 };
 
+/* hwmon */
+
+static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE), NULL
+};
+
+static int pcc_pwm_fan_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long *val)
+{
+	struct pcc_acpi *pcc;
+	acpi_status status;
+	int pwm_speed;
+	int pwm_mode;
+	int result;
+
+	pcc = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		mutex_lock(&pcc->pwm_fan_lock);
+
+		status = pcc_pwm_fan_speed_read(&pwm_speed);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: failed to get fan pwm speed\n", __func__);
+			result = -ENODATA;
+		} else {
+			*val = (pwm_speed * 255) / 100;
+			result = 0;
+		}
+
+		mutex_unlock(&pcc->pwm_fan_lock);
+		return result;
+	case hwmon_pwm_enable:
+		mutex_lock(&pcc->pwm_fan_lock);
+
+		status = pcc_pwm_fan_mode_read(&pwm_mode);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: failed to get fan pwm mode\n", __func__);
+			result = -ENODATA;
+		}
+		if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+			*val = HWMON_PCC_FAN_PWM_AUTO;
+			result = 0;
+		} else if (pwm_mode == HWMON_PCC_FAN_PWM_MANUAL) {
+			*val = HWMON_PCC_FAN_PWM_MANUAL;
+			result = 0;
+		} else { /* Invalid value */
+			result = -EIO;
+		}
+
+		mutex_unlock(&pcc->pwm_fan_lock);
+		return result;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int pcc_pwm_fan_hwmon_write(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, long val)
+{
+	int pwm_speed_vendor_val;
+	struct pcc_acpi *pcc;
+	acpi_status status;
+	int result;
+
+	pcc = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val == HWMON_PCC_FAN_PWM_AUTO) {
+			mutex_lock(&pcc->pwm_fan_lock);
+			status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_AUTO);
+			if (ACPI_FAILURE(status)) {
+				pr_err("%s: failed to set fan to auto mode\n", __func__);
+				result = -EIO;
+			} else {
+				result = 0;
+			}
+			mutex_unlock(&pcc->pwm_fan_lock);
+			return result;
+		} else if (val == HWMON_PCC_FAN_PWM_MANUAL) {
+			mutex_lock(&pcc->pwm_fan_lock);
+			status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
+			if (ACPI_FAILURE(status)) {
+				pr_err("%s: failed to set fan to manual mode\n", __func__);
+				result = -EIO;
+			} else {
+				result = 0;
+			}
+			mutex_unlock(&pcc->pwm_fan_lock);
+			return result;
+		}
+		return -EINVAL;
+	case hwmon_pwm_input:
+		val = clamp_val(val, 0, 255);
+		pwm_speed_vendor_val = (val * 100) / 255;
+
+		mutex_lock(&pcc->pwm_fan_lock);
+
+		status = pcc_pwm_fan_speed_set(pwm_speed_vendor_val);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: failed to set fan pwm\n", __func__);
+			result = -EIO;
+		} else {
+			result = 0;
+		}
+
+		mutex_unlock(&pcc->pwm_fan_lock);
+
+		return result;
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
+	struct pcc_acpi *pcc;
+	acpi_status status;
+	int current_pwm;
+	int pwm_mode;
+	int result;
+
+	pcc = cdev->devdata;
+
+	mutex_lock(&pcc->pwm_fan_lock);
+
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan pwm mode\n", __func__);
+		result = -ENODATA;
+		goto out;
+	}
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		*state = 100; /* Return failsafe value on EC mode */
+		result = 0;
+		goto out;
+	}
+
+	status = pcc_pwm_fan_speed_read(&current_pwm);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan pwm mode\n", __func__);
+		result = -ENODATA;
+		goto out;
+	}
+
+	if (current_pwm > 100)
+		current_pwm = 100;
+	if (current_pwm < 0) {
+		result = -EINVAL;
+		goto out;
+	}
+
+	*state = current_pwm;
+	result = 0;
+
+out:
+	mutex_unlock(&pcc->pwm_fan_lock);
+	return result;
+}
+static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct pcc_acpi *pcc;
+	acpi_status status;
+	int set_pwm;
+	int result;
+
+	pcc = cdev->devdata;
+
+	mutex_lock(&pcc->pwm_fan_lock);
+
+	if (state > 100) {
+		result = -EINVAL;
+		goto out;
+	}
+
+	set_pwm = state;
+	status = pcc_pwm_fan_speed_set(set_pwm);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to set fan speed pwm\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	result = 0;
+
+out:
+	mutex_unlock(&pcc->pwm_fan_lock);
+	return result;
+}
+static const struct thermal_cooling_device_ops pcc_pwm_fan_cdev_ops = {
+	.get_max_state = pcc_pwm_fan_thermal_max_state,
+	.get_cur_state = pcc_pwm_fan_thermal_get_current_pwm,
+	.set_cur_state = pcc_pwm_fan_thermal_set_fan_pwm,
+};
 
 /* hotkey input device driver */
 
@@ -981,8 +1442,10 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 
 static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct backlight_properties props;
 	struct acpi_device *device;
+	struct device *hwmon_dev;
 	struct pcc_acpi *pcc;
 	int num_sifr, result;
 
@@ -1026,6 +1489,17 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
 
+	/*
+	 * Perform quirk detection
+	 */
+	dmi_id = dmi_first_match(pcc_quirks);
+	if (dmi_id) {
+		pcc->quirks = dmi_id->driver_data;
+		pr_info("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
+	} else {
+		pcc->quirks = NULL;
+	}
+
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
@@ -1097,6 +1571,39 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	}
 
 	i8042_install_filter(panasonic_i8042_filter, NULL);
+
+	/* check quirks */
+	if (pcc->quirks) {
+		/* has_ospm_pwm_fan - add hwmon and thermal if present */
+		if (pcc->quirks->has_ospm_pwm_fan) {
+			mutex_init(&pcc->pwm_fan_lock);
+
+			pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
+
+			hwmon_dev = hwmon_device_register_with_info(
+				&pdev->dev, "panasonic_pwm_fan", pcc,
+				&pcc_pwm_fan_hwmon_chip_info, NULL);
+			if (IS_ERR(hwmon_dev)) {
+				pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
+				/* not a critical error. just skip if error */
+				pcc->pwm_fan_hwmon = NULL;
+			}
+
+			/* proceed with thermal */
+			pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
+			pcc->pwm_fan_cdev = thermal_cooling_device_register(
+				"Panasonic_PWM_Fan", pcc, &pcc_pwm_fan_cdev_ops);
+			if (IS_ERR(pcc->pwm_fan_cdev)) {
+				pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
+				pcc->pwm_fan_cdev = NULL;
+			}
+
+			/* cleanup: destroy mutex if both hwmon and thermal failed */
+			if (!pcc->pwm_fan_hwmon && !pcc->pwm_fan_cdev)
+				mutex_destroy(&pcc->pwm_fan_lock);
+		}
+	}
+
 	return 0;
 
 out_platform:
@@ -1124,6 +1631,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	struct pcc_acpi *pcc = acpi_driver_data(device);
 
+	if (pcc->pwm_fan_hwmon)
+		hwmon_device_unregister(pcc->pwm_fan_hwmon);
+	if (pcc->pwm_fan_cdev)
+		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
+	if (pcc->pwm_fan_hwmon || pcc->pwm_fan_cdev)
+		mutex_destroy(&pcc->pwm_fan_lock);
+
 	i8042_remove_filter(panasonic_i8042_filter);
 
 	if (pcc->platform) {
-- 
2.54.0

