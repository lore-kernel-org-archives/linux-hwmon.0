Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B630EF86
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 04:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300364; cv=none; b=IRaR4h75mtKNhvp/AQaIRCxgE85fhUjIHCtkQ1E50jiH3fu03Z7cMOBMhrGqypkWmIiP3/7N3ofOHNQY2f0Ajtf8hZIkGliaby+X3O00ma5tKNG/kN573kuYS6pSCd0kwm5AHzq81Zg5vXG9hfw69A5G5h/RY2dFFH/F2eY9/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300364; c=relaxed/simple;
	bh=6XkbK0+T0V6QVDBsFh/wV4AR1s5PUSojrdEWSbNU7A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DatNCG/ssh3Ngw7ur+zALUydGeG2phU7h47X7l8kCIxT+4hlalTaoLS6H3VR/rbYMb1ZauescFvkuxKUZ37mY6DwNRoAgYZ54CFF/MDII9Z1TJiF+HvFUPlWmXJjaG4oPluQqsV5aEv9VftGjEDjJSV4kOlduaWzIzbIWv5dFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE2kOPfx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE2kOPfx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso6385105ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300360; x=1785905160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QeHZfm5vRvOsKclPrij/OdGrKhaiZ9j8mCQkR9PaENc=;
        b=mE2kOPfxBS7EBWL9QKNMzIuiwGoguZ/X0C6cjV0DaUbiaHJ1DBCB6xY4JKs/HOHQSV
         UITCQ/YWANig2QANYb2095wdXAO+QQNXulD91w+3yAypdty9WKL3GR0VXu+JG22aebQt
         CrkdRPlb2rfmuIHdc0CwT+phK7xwh5jN9ZWjNLRTvypq5YQQ6fUbED9TBvoEoM5sHL1F
         bPgA4ckEcSw1EaK9pm40I5IFAMxYLalwYQlqCx9+LmSFIj+lQPRcRGbgmqYxugqE7Euj
         WSSkDhb9z8Kl2wL2cDeqfX4RE/jc669zsAkATI2JOlKuXKzvRumlgCLsD1s3A9ihYIZI
         ITWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300360; x=1785905160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeHZfm5vRvOsKclPrij/OdGrKhaiZ9j8mCQkR9PaENc=;
        b=GV6Nx/XTxKBVSyKCk1Amh2so1kP4Gj3tBsvsL9bpiskY8uXpsrb0DuXMm7sBRtDKYG
         fUAxiHt2dVsOUtvDzDSg24qo2X+RVfalege52S0Ry/y2W0rKMSsX6b3QI4e+F/cnZDB4
         /yVUT8BmjoWtGan3FG7+0vsUsAjQcAI4bSAAETkoXujg0chDWldCaZUqKAN/ccuc9KjW
         z9SmF0OfuLv/KYq8kPA+IyiqSYi0b7nOrbv3KmfmcrmxCU8gtTDbT0PfoPTKHmzjDCmz
         K9mT3Yc8B5jint6YRmwyGDd1gQ++EDyFIJbIF8mfKBkhlpnrTFKwzlxdvdvcUNwQzCav
         Bznw==
X-Forwarded-Encrypted: i=1; AHgh+RqeBXBOwH1nFlCbSabVpOvKFbbH4bzG05hj9rfd34iFUKXsDKAgbmUWBDGgNYzbBCoq6nUycVzb+aDC8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1sNdqjjq0XHi1TlSZo6/ELo8ftpIsFEB+ITvK36sQ3kN1BJuW
	AqhoIjG2tjVoycIhzbo4GX9ZJcPPjOrSTYYCRnKTACk/LkzYwT94jTF2
X-Gm-Gg: AR+sD11IEiudJYn5zCWKWdahUvmJq23gzb7duIWlMXi9rAq+9uhoDWOi5Kin/bjBcPY
	1+QOnmnToNja6I/lJKQsvDQ6oAv1yVf5qQcPJ8M6eZlHaP9r8x4H09aG0gRZIQO2oEBSynoqk1C
	6FXPVdS6blBtnpqUL3Fv7MP+179ZALkvcOKIPVWv/+TAR7utREs9wqsTAsvBMqeE4vgUWWibYyA
	WAaBUUVsG4ZBC9N/zH4HtSNgMEjC/aYZEQKbPBni9JQMOsIzFnJMDNYZjoO2tgfOtuYUEotrRbU
	7nfn0UnK1ur2KqxUFAOLSDkjvLxjktr0NqGkOifYs+BF/rcZImrKX0FYcpipXzFgCOdBekGpd9V
	Dd3ZSG1FrFZxWH/zjEdeydNG5fq3e6lid/CHtLQ8N7abSGk5AN2k+22UMxlhIgIaBcl0STD8Yhg
	S5dZTlpnEkfFVkGmuOqM8E2SaIO6+rx0LGO6ILHcW2UYFQmQs9MfiQBo5Zhctff+2LTy3eE371k
	hrZ1bECtquQOgz/cOri
X-Received: by 2002:a17:903:1b07:b0:2ce:b43e:44da with SMTP id d9443c01a7336-2d02672bacbmr8394535ad.17.1785300359576;
        Tue, 28 Jul 2026 21:45:59 -0700 (PDT)
Received: from localhost ([112.204.126.243])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2d022a4af04sm5097755ad.31.2026.07.28.21.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 21:45:59 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH v8] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Wed, 29 Jul 2026 12:43:31 +0800
Message-ID: <20260729044332.382862-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following is divided into 2 sections:
 - (DRIVER) Driver and testing details
 - (REVERSE ENGINEERING NOTES) To explain and document
   basis for the driver code.

DRIVER:

I have a CF-SR4 and Linux works out of the box. Compared to
previous models, this one runs the fans at high speed by default
when the computer starts.

When the EC controls the fan, the minimum speed is somewhere
between 70-80% and is a lot higher than it needs to be.

This issue is not present when using Windows 11 as it takes control over
the fan and ramps it down to an appropriate speed.

Implementation:

 - fan mode: the driver does not cache state. It relies on querying
   via ACPI every time the fan mode is read. If other code like IPF were to
   change anything outside of the driver, it should not conflict.
 - ownership: hwmon owns the fan. If any other part of the code
   including callbacks to other subsystems such as thermal want to
   interact with the fan, it uses the hwmon lock.
 - hwmon lock: guard() used instead of manual mutex lock/unlock
 - hwmon lock is used for the entire duration the hwmon device exists
 - quirks are used as I cannot guarantee this feature or implementation
   is the same across all models. This is to be on the safe side as the
   Let's Note line goes back a long time and changes may have unintended
   effects on older models.
 - suspend: the laptop only supports s2idle. Since the driver cannot
   run during this state, it hands control back to the EC (auto mode) on
   suspend. It is expected that any fan control daemon retake control
   when waking up from suspend.
 - thermal: while the hwmon code expects pwm1_enable before it can set
   the speed, calling thermal on a specific speed will automatically set
   the fan mode to manual (in addition to setting the speed).
 - name: both hwmon and thermal expose the fan as "panasonic_pwm_fan"
 - driver unload: set fan back to auto mode when driver is unloaded
 - logging: added: +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
   so logs on dmesg are easier to read and grep

Testing:
 - tested on a real CF-SR4
 - tested without thermald
 - tested with thermald (needs XML config for fan)
 - tested hwmon pwm and thermal via "echo xxx | tee"
 - tested suspend-resume
 - tested on an older model (CF-QV9) to verify changes did not break
   older models
 - builds cleanly on v7.2-rc4 with W=1 C=1
 - backported and tested on stable v7.0.12 (daily-use system)

REVERSE ENGINEERING NOTES:

The following notes are included for completeness and to document the
firmware behavior that motivated the resulting code.
They are not required to review the driver itself.

When Windows 11 is booted up, the high fan speeds persist just until the
login screen. Once the login screen shows up, the fan spins down.

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
for the current fan mode. On startup, this is set to 0.

Based on the code SEFM seems the be the method to set the fan
mode to manual.

An interesting thing to note in this snippet is that the EC expects
the OS to talk to it during S0IX in order to set a special mode
for the fan. While setting 0x05 as a fan mode is possible from
the OS by calling EC88 directly, I am restricting the driver
to only use the following values when calling SEFM():

0x00 - automatic
0x01 - manual / OSPM

Methods to talk to the EC directly (ex: EC88()) are not used in this
patch.

I had tested out booting Windows 11 to check as to why the firmware
implements the fan this way.
It appears that Intel IPF (Innovation Platform Framework)
being used by the vendor in order to control the fan at the OS level.

Once SEFM is called, there is a function with a standard name _FSL
that does exist in the UEFI spec that defines an OSPM fan, but it
is under a non-standard path that is not declared on ACPI.

I did check if specific functions related to the fan are gated by
OS-specific checks via methods like _OSI, but this does not seem
to be the case. The highest version of Windows the ACPI code checks
for is "Windows 2015" and spoofing the OS did not unlock the fan.

Upon closer inspection on Windows, Intel IPF has a file here
that is of particular interest:
C:\Windows\system32\drivers\DriverData\Intel\IPF\dv\override.dv

Extracting strings here reveals:
\_SB_.PC00.LPCB.EC0_.TFN1

Which is the correct path of the fan on ACPI (as opposed to the one
defined on ACPI by the device itself).

With this path, functions such as _FSL (\_SB.PC00.LPCB.EC0.TFN1._FSL)
can be called to set the fan speed.
Note that SEFM (\_SB.PC00.LPCB.EC0.SEFM) must be called first
with 0x02 before manual control is allowed.

Looking into the ACPI code for Intel IPF
Specifically at "b23ba85d-c8b7-3542-88de-8de2ffcfd698" the vendor
appears to have inserted bespoke instructions for the EC.

If IPF is not running, the fan mode is 0 and system power is locked
to around ~20W (measured from the wall) when a dummy load is run on the
CPU. If IPF is running it takes control of the fan and unlocks higher
power limits from the platform. (\_SB.PC00.LPCB.EC0.SEPL)

In my case, it allowed the system to consume ~40W from the wall when
running a dummy load. At boot, the system is basically capped to around
half power. As the laptop was designed for OSPM (via IPF) SEFM appears
to be part of a handoff procedure meant for the OS to take control.

Interestingly enough, running thermald actually completes this handoff
and allows the system to consume the full range of power.
If thermald is not installed and SEPL is not called,
the system would restrict itself to half power.
Once thermald has a chance to run once, it leaves the power "unlocked".

While thermald can potentially run the SEFM() method as it is coded in
ACPI, the lack of override for the correct fan path means it cannot
control the fan to implement active thermal policy. This is why thermal
is also exposed in addition to hwmon. If thermald is used, this allows
it to set the fan speed. For Windows, the override is in the form of
specifying the correct ACPI path of the fan so it can call _FSL itself.

While the point of the patch is exposing the OSPM fan via standard
kernel interfaces (hwmon and thermal), I do note both the fan and the
platform power limit here as it is part of its OSPM specific quirks.

When the fan is in manual mode, the EC itself can still intervene if the
processor gets too hot. Based on observation the trip point for this is
at around 90C. When this happens, it does not touch the fan mode and fan
speed setting. If any fan control program were to be running, it would
not detect an external change if it were to read back those values.

The fan is PWM controlled and does not support reading RPM. Its current
speed cannot be read if the fan control is automatic / handed off
to the EC.

It may also be interesting to note that on Windows 11, the OS still has
control of the fan even during S0IX. I have observed the fan to run at a
higher minimum speed than what the EC sets on auto mode during S0IX.

When Linux enters s2idle and the fan is on auto mode, the EC detects
the new power state and lowers the minimum fan speed to around 10%.
In short, it appears the vendor did design the system fan to still be
running during modern standby.

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---

Changes in v8:
 - Complete rework of the cover letter. Incorporated new findings and
   restructured to explain code changes and findings.
 - Significant rework of the code from v7
 - Used hwmon mutex for locking together with guard
 - Organized imports in alphabetical order
 - Removed unnecessary comments
 - Put fan on auto mode when entering suspend and when unloading the
   driver
 - Reviewed comments since v1 and apply past feedback to the entire
   patch
 - Removed unnecessary pr messages and reformatted messages to have
   consistent case + a more end-user oriented format (e.g. do not use
   internal function names as part of the message).
 - Removed unnecessary gotos and replace with return

v7:
 - Added comment to explain mutex pwm_fan_lock
 - Address spurious changes and other comments
 - Removed redundant "error:" when using pr_err
 - Removed __func__ when calling pr_err
 - Drop out label to return directly
 - Use guard via cleanup.h for mutexes (eliminate goto)
 - Used __free() in place of kfree(buffer.pointer)
 - Put NULL on new line for HWMON_CHANNEL_INFO
 - Unconditionally initialize the fan mutex

v4-v6:
 - addressed sashiko bot feedback regarding code bugs and hwmon ABI violations

v3:
 - use hwmon and thermal instead of sysfs
 - include missing imports
 - implemented quriks and quirk matching

v2:
 - fix style errors
 - fix malformed error messages

> Includes should be added in alphabetical order (per each subdirectory
> block).

This was done

> Don't leave empty lines in between variable declarations. Please use
> reverse-xmas tree order when you can (when no internal dependencies
> between local var don't force your hand).

This was applied

>> +    param[0].integer.value = pwm_mode;
>> +    input.count = 1; /* takes one arg */
>
> Remove comment.

Unnecessary comments such as these were removed throughout the entire patch

> I'm not sure if clang is happy with how scoping is here so these should
> have {} around each case.

As I have used the hwmon lock instead of a driver-level mutex, the code
that needs this change does not exist anymore.

As per Guenter's feedback, the hwmon lock was used with guard for this
patch. As a consequence, hwmon is now the primary owner of the PWM fan.

I have redone the cover letter to incorporate previous findings and
additional details that explains the code in this patch. The
implementation section should describe the current code in this v8
patch.

One additional thing I have noticed is that once the fan speed is set
manually, the same speed setting persists even during standby. The
laptop is only capable of s2idle and there appears to be an expectation
by the firmware that the OS will still talk do it during. To remedy this, I
have put in code that puts the fan on auto mode when entering suspend:

>+static int acpi_pcc_hotkey_suspend(struct device *dev)
>+{
>+	struct pcc_acpi *pcc = acpi_driver_data(ACPI_COMPANION(dev));
>+	int error;
>+
>+	if (!pcc->pwm_fan_hwmon)
>+		return 0;
>+
>+	guard(hwmon_lock)(pcc->pwm_fan_hwmon);
>+
>+	error = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
>+	if (error)
>+		pr_warn("failed to set fan to auto mode on suspend\n");
>+
>+	return 0;
>+}

I do not restore state on wakeup as I expect the userspace fan daemon to
retake control of the fan. This is so the system is not put in an
unintended state should the userspace fan control daemon fail to come
back.

While not prompted, I have also added code to put the fan on automatic
mode when the driver is removed / unloaded:

>+	int error;
>+
>+	if (pcc->pwm_fan_cdev)
>+		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
>+	if (pcc->pwm_fan_hwmon)
>+		hwmon_device_unregister(pcc->pwm_fan_hwmon);
>+
>+	if (pcc->quirks && pcc->quirks->has_ospm_pwm_fan) {
>+		error = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
>+		if (error)
>+			pr_warn("failed to set fan to auto mode on driver unload\n");
>+	}

As this is executed after the thermal and hwmon devices are removed, it
does not use the hwmon lock.
In this section, the thermal device is unloaded first before hwmon.

Several minor changes have also been made to correct bugs and compiler
warnings and potential issues.

>+static umode_t pcc_pwm_fan_hwmon_is_visible(const void *data,
>+					    enum hwmon_sensor_types type,
>+					    u32 attr, int channel)
>+{
>+	if (type != hwmon_pwm)
>+		return 0;
>+
>+	switch (attr) {
>+	case hwmon_pwm_input:
>+	case hwmon_pwm_enable:
>+		return 0644;
>+	default:
>+		return 0;
>+	}
>+}

For example, this function was updated to also check attr.

>+	int status;
>+
>+	status = pcc_pwm_fan_mode_get(&pwm_mode);
>+	if (status < 0) {
>+		pr_err("failed to get fan status\n");
>+		return status;
>+	}

This code had mistakenly used acpi_status for status instead of an int,
which made the conditional impossible. This was corrected.

>+	if (pcc->quirks && pcc->quirks->has_ospm_pwm_fan) {
>+		pcc->pwm_fan_hwmon = hwmon_device_register_with_info(&pdev->dev,
>+								     "panasonic_pwm_fan",
>+								     pcc,
>+								     &pcc_pwm_fan_hwmon_chip_info,
>+								     NULL);
>+		if (IS_ERR(pcc->pwm_fan_hwmon)) {
>+			pr_err("failed to register hwmon device\n");
>+			pcc->pwm_fan_hwmon = NULL;
>+			return 0;
>+		}
>+
>+		pcc->pwm_fan_cdev = thermal_cooling_device_register("panasonic_pwm_fan",
>+								    pcc, &pcc_pwm_fan_cdev_ops);
>+		if (IS_ERR(pcc->pwm_fan_cdev)) {
>+			pr_err("failed to register thermal cooling device\n");
>+			pcc->pwm_fan_cdev = NULL;
>+		}
>+	}

Incorporating previous comments, this section was further simplified to
remove the unnecessary gotos and use returns instead. I will note that
as the fan is not a critical part of the driver, it treats errors with
creating the hwmon and thermal devices as warnings.

>+#define ACPI_PCC_FAN_PWM_AUTO		0x00
>+#define ACPI_PCC_FAN_PWM_MANUAL		0x01
>+#define HWMON_PCC_FAN_ENABLE_AUTO	0x02
>+#define HWMON_PCC_FAN_ENABLE_MANUAL	0x01

The comment here was removed and
HWMON_PCC_FAN_PWM_AUTO and HWMON_PCC_FAN_PWM_MANUAL
was replaced to:
HWMON_PCC_FAN_ENABLE_AUTO and HWMON_PCC_FAN_ENABLE_MANUAL
so the name itself describes what its for.


I hope this addresses the concerns and feedback raised thus far.

Thank you

 drivers/platform/x86/panasonic-laptop.c | 468 +++++++++++++++++++++++-
 1 file changed, 454 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..24ac1793be05 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -119,22 +119,33 @@
  *		- v0.1  start from toshiba_acpi driver written by John Belmonte
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
 #include <linux/ctype.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/printk.h>
 #include <linux/seq_file.h>
 #include <linux/serio.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+
 #include <acpi/video.h>
 
 MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
@@ -164,6 +175,15 @@ MODULE_LICENSE("GPL");
 
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
+#define ACPI_PCC_FAN_PWM_AUTO		0x00
+#define ACPI_PCC_FAN_PWM_MANUAL		0x01
+#define HWMON_PCC_FAN_ENABLE_AUTO	0x02
+#define HWMON_PCC_FAN_ENABLE_MANUAL	0x01
+
+struct quirk_entry {
+	bool has_ospm_pwm_fan;
+};
+
 /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
    ECO_MODEs: 0x03 = off, 0x83 = on
 */
@@ -197,9 +217,11 @@ static const struct acpi_device_id pcc_device_ids[] = {
 MODULE_DEVICE_TABLE(acpi, pcc_device_ids);
 
 #ifdef CONFIG_PM_SLEEP
+static int acpi_pcc_hotkey_suspend(struct device *dev);
 static int acpi_pcc_hotkey_resume(struct device *dev);
 #endif
-static SIMPLE_DEV_PM_OPS(acpi_pcc_hotkey_pm, NULL, acpi_pcc_hotkey_resume);
+static SIMPLE_DEV_PM_OPS(acpi_pcc_hotkey_pm,
+			 acpi_pcc_hotkey_suspend, acpi_pcc_hotkey_resume);
 
 static struct platform_driver acpi_pcc_driver = {
 	.probe = acpi_pcc_hotkey_probe,
@@ -238,19 +260,38 @@ static const struct key_entry panasonic_keymap[] = {
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
+};
+
+static struct quirk_entry quirk_cf_sr4 = {
+	.has_ospm_pwm_fan = true,
+};
+
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
@@ -507,6 +548,135 @@ static int set_optd_power_state(int new_state)
 	return result;
 }
 
+static int pcc_pwm_fan_mode_get(int *pwm_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
+				       &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("cannot get fan mode via CEFM\n");
+		return -EIO;
+	}
+
+	if (state == ACPI_PCC_FAN_PWM_AUTO)
+		*pwm_mode = HWMON_PCC_FAN_ENABLE_AUTO;
+	else if (state > 0)
+		*pwm_mode = HWMON_PCC_FAN_ENABLE_MANUAL;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int pcc_pwm_fan_mode_set(int acpi_pwm_mode)
+{
+	struct acpi_object_list input;
+	union acpi_object param[1];
+	acpi_status status;
+
+	param[0].integer.value = acpi_pwm_mode;
+	param[0].type = ACPI_TYPE_INTEGER;
+	input.pointer = param;
+	input.count = 1;
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
+static int pcc_pwm_fan_speed_read(int *acpi_pwm_speed)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int pwm_mode;
+	int result;
+
+	result = pcc_pwm_fan_mode_get(&pwm_mode);
+	if (result < 0) {
+		pr_err("failed to get fan status\n");
+		return result;
+	}
+
+	/* If fan is in auto mode, it will return a bogus value */
+	if (pwm_mode == HWMON_PCC_FAN_ENABLE_AUTO)
+		return -ENODATA;
+
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
+				      NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		pr_err("failed to get pwm speed\n");
+		return -EIO;
+	}
+
+	union acpi_object *obj __free(kfree) = buffer.pointer;
+
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 3) {
+		pr_err("invalid _FST package structure (expected 3)\n");
+		return -EINVAL;
+	}
+
+	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
+		pr_err("_FST element at index 1 is not an integer\n");
+		return -EINVAL;
+	}
+
+	if (obj->package.elements[1].integer.value > 100) {
+		pr_err("_FST element at index 1 is an integer out of bounds\n");
+		return -EINVAL;
+	}
+
+	*acpi_pwm_speed = obj->package.elements[1].integer.value;
+	return 0;
+}
+
+static int pcc_pwm_fan_speed_set(int set_pwm_speed)
+{
+	struct acpi_object_list input;
+	union acpi_object param[1];
+	acpi_status fsl_status;
+	int pwm_mode;
+	int status;
+
+	status = pcc_pwm_fan_mode_get(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan status\n");
+		return status;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_ENABLE_AUTO) {
+		status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
+		if (status < 0) {
+			pr_err("set fan PWM to manual failed\n");
+			return status;
+		}
+	}
+
+	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
+		pr_err("fan speed level out of bounds\n");
+		return -EINVAL;
+	}
+
+	param[0].integer.value = set_pwm_speed;
+	param[0].type = ACPI_TYPE_INTEGER;
+	input.pointer = param;
+	input.count = 1;
+
+	fsl_status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
+					  &input, NULL);
+	if (ACPI_FAILURE(fsl_status)) {
+		pr_err("setting of fan speed via ._FSL failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
 
 /* sysfs user interface functions */
 
@@ -825,6 +995,219 @@ static const struct attribute_group pcc_attr_group = {
 	.is_visible	= pcc_sysfs_is_visible,
 };
 
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
+	status = pcc_pwm_fan_speed_read(&pwm_speed);
+	if (status < 0)
+		return status;
+
+	/* ACPI PWM range is 0-100 */
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
+	status = pcc_pwm_fan_mode_get(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan pwm mode\n");
+		return status;
+	}
+
+	switch (pwm_mode) {
+	case HWMON_PCC_FAN_ENABLE_AUTO:
+		*val = HWMON_PCC_FAN_ENABLE_AUTO;
+		return 0;
+	case HWMON_PCC_FAN_ENABLE_MANUAL:
+		*val = HWMON_PCC_FAN_ENABLE_MANUAL;
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
+	case HWMON_PCC_FAN_ENABLE_AUTO:
+		return pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
+	case HWMON_PCC_FAN_ENABLE_MANUAL:
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
+	status = pcc_pwm_fan_mode_get(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan pwm mode\n");
+		return status;
+	}
+
+	if (pwm_mode != HWMON_PCC_FAN_ENABLE_MANUAL)
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
+	struct pcc_acpi *pcc = dev_get_drvdata(dev);
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
+	switch (attr) {
+	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
+		return 0644;
+	default:
+		return 0;
+	}
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
+static int pcc_pwm_fan_thermal_max_state(struct thermal_cooling_device *cdev,
+					 unsigned long *state)
+{
+	*state = 100;
+	return 0;
+}
+
+static int pcc_pwm_fan_thermal_get_current_pwm(struct thermal_cooling_device *cdev,
+					       unsigned long *state)
+{
+	struct pcc_acpi *pcc = cdev->devdata;
+	int current_pwm;
+	int pwm_mode;
+	int status;
+
+	guard(hwmon_lock)(pcc->pwm_fan_hwmon);
+
+	status = pcc_pwm_fan_mode_get(&pwm_mode);
+	if (status < 0) {
+		pr_err("failed to get fan pwm mode\n");
+		return status;
+	}
+	if (pwm_mode == HWMON_PCC_FAN_ENABLE_AUTO) {
+		*state = 100; /* Return max cooling when EC controls fan */
+		return 0;
+	}
+
+	status = pcc_pwm_fan_speed_read(&current_pwm);
+	if (status < 0)
+		return status;
+
+	if (current_pwm > 100)
+		current_pwm = 100;
+	if (current_pwm < 0)
+		return -EINVAL;
+
+	*state = current_pwm;
+	return 0;
+}
+
+static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct pcc_acpi *pcc = cdev->devdata;
+	int status;
+
+	guard(hwmon_lock)(pcc->pwm_fan_hwmon);
+
+	if (state > 100)
+		return -EINVAL;
+
+	status = pcc_pwm_fan_speed_set((int)state);
+	if (status < 0) {
+		pr_err("failed to set fan speed pwm\n");
+		return status;
+	}
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops pcc_pwm_fan_cdev_ops = {
+	.get_max_state = pcc_pwm_fan_thermal_max_state,
+	.get_cur_state = pcc_pwm_fan_thermal_get_current_pwm,
+	.set_cur_state = pcc_pwm_fan_thermal_set_fan_pwm,
+};
 
 /* hotkey input device driver */
 
@@ -977,10 +1360,28 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 
 	return 0;
 }
+
+static int acpi_pcc_hotkey_suspend(struct device *dev)
+{
+	struct pcc_acpi *pcc = acpi_driver_data(ACPI_COMPANION(dev));
+	int error;
+
+	if (!pcc->pwm_fan_hwmon)
+		return 0;
+
+	guard(hwmon_lock)(pcc->pwm_fan_hwmon);
+
+	error = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
+	if (error)
+		pr_warn("failed to set fan to auto mode on suspend\n");
+
+	return 0;
+}
 #endif
 
 static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct backlight_properties props;
 	struct acpi_device *device;
 	struct pcc_acpi *pcc;
@@ -1026,6 +1427,12 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
 
+	dmi_id = dmi_first_match(pcc_quirks);
+	if (dmi_id) {
+		pcc->quirks = dmi_id->driver_data;
+		pr_debug("quirk detect: enabled quirks for %s\n", dmi_id->ident);
+	}
+
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
@@ -1097,6 +1504,27 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	}
 
 	i8042_install_filter(panasonic_i8042_filter, NULL);
+
+	if (pcc->quirks && pcc->quirks->has_ospm_pwm_fan) {
+		pcc->pwm_fan_hwmon = hwmon_device_register_with_info(&pdev->dev,
+								     "panasonic_pwm_fan",
+								     pcc,
+								     &pcc_pwm_fan_hwmon_chip_info,
+								     NULL);
+		if (IS_ERR(pcc->pwm_fan_hwmon)) {
+			pr_err("failed to register hwmon device\n");
+			pcc->pwm_fan_hwmon = NULL;
+			return 0;
+		}
+
+		pcc->pwm_fan_cdev = thermal_cooling_device_register("panasonic_pwm_fan",
+								    pcc, &pcc_pwm_fan_cdev_ops);
+		if (IS_ERR(pcc->pwm_fan_cdev)) {
+			pr_err("failed to register thermal cooling device\n");
+			pcc->pwm_fan_cdev = NULL;
+		}
+	}
+
 	return 0;
 
 out_platform:
@@ -1123,6 +1551,18 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
 {
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	struct pcc_acpi *pcc = acpi_driver_data(device);
+	int error;
+
+	if (pcc->pwm_fan_cdev)
+		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
+	if (pcc->pwm_fan_hwmon)
+		hwmon_device_unregister(pcc->pwm_fan_hwmon);
+
+	if (pcc->quirks && pcc->quirks->has_ospm_pwm_fan) {
+		error = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
+		if (error)
+			pr_warn("failed to set fan to auto mode on driver unload\n");
+	}
 
 	i8042_remove_filter(panasonic_i8042_filter);
 
-- 
2.55.0

