Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725853BE15E
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 05:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451985; cv=none; b=ppi6Uag71DtKqStj+FKzAEq5VlDhrYL1YcGI2ZvpjzAMpRd08WZeahobxobOfZYWPslSekNmMTmfiqem0RJNjPDoSb+KOTAgOBFS4Ma3iOPNFNJl4P/F+cUu7Y0GDvBVCfcJUCXItxsVLsYSlpyZrtafPM8emI7e3ZH5ph2TLug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451985; c=relaxed/simple;
	bh=OPWuOCpXs1K8yRJy7u9hxDxd1C4Hc5b9oLvrIQH3GrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kg9+NrcAdM7LR60DnV8qg77w6XhNz319w3Mp8GCm+2iz/NNcuOKSDehFnsjKFSy2CRMo2RFBY6FWli+CkXQ35iVgailB8EMkwHbdsx0FsNdW1hPT/X8WaVQ9phsq79/o8gBTa/5NU+Ar+vq9NLq/1Rzpj+KWn8Ha0mtz9EGz9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJE1Xzwa; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJE1Xzwa"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84592b55832so247939b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 22:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782451971; x=1783056771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iM4cyhjW4R4Ra9vRlJsZ72WbAFF0W3+HNGOAnnwAmB8=;
        b=WJE1XzwaAFXBkRjppz63zYiMAT1qguz2EHPoKEh2ZizpdcA3vCr4RpGS8LnhlGNJZB
         M6Bfm7kHf+MZk5gR8q82Q5dslGSmqj+C3AZbTaBKa5cIjkdapxSxW8o90Z/vbnMbEgLS
         +3CgeGFe0Xw7NzbvMPw0fcOR3FnbkP35KGNnRl0o2gTyG+0xrISTGbnjgXADonTB2INB
         M9mtynperWVFUY//sBogpC7PoHugk9SP+wM4K6vuPoWHD6MieyVrwCRMtdKy/qvZHFYp
         qSj/S4XDh0qQ+vIOmyVQVHIJxOrSPPMAbnNlTC4dNlMhCPsbVKCYMpXOKPCAlFc329Oz
         A0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451971; x=1783056771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iM4cyhjW4R4Ra9vRlJsZ72WbAFF0W3+HNGOAnnwAmB8=;
        b=fCDq56Tw/M1caX8LySC2j8uP5+QlxbW24lvoGHzjAsaKeNLoddQYMzANqRzeti+m86
         yTVSpAbC68SCz+Nc2Xxe2/rqih5m7GoCUfGq8/MxVZWOBiX0IWMYfLvY6DRtUlSaqnEC
         FiC/z7xlG6C6jarh0HAKiob15lG4ULVZIfUbikt1zMDUrNDLmjuKYD9eTYIyNJ8Wsiow
         enhDzo8iqYKF9vtxpqC4Y4hvBabjseuumd+0r/wP+DCeBC4FOWtgtcyE+MU2ow0/KqTV
         JRzw4KgT5Pq1Bl8ymQv30MgUUbL09vX20T27QxE5AlWCBJubxJMeQRloiFjLcdVJx0cX
         OIig==
X-Forwarded-Encrypted: i=1; AFNElJ+bVy0YXhQ3ph+nW501Czv+yepICeFMuz69+v8HTCUpAkgrrFwED4GrAJRYKSD6rI3XLDhStr1pLeJolw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgcConxssSXS3I6jTaVs98+G6M7ryjStYD5IIH3/42MBwaABK
	xu9Iy1pXGVGrnQxRE94kbS4dOfmSHInhBBhZnmDFTnShcy4RDvgJnniI
X-Gm-Gg: AfdE7cnsmhwndkvNv67HOZnW+m+hO0jeBkWcDPdiG5IEW1mcu0Y1QZoYU6kNCJTEVwB
	CfXUNo8n4XrbRJZLTQ1yHEDwacPeoUavdvsQV3W2fGoIXBMc/8SdonpSHza81W+l+8Ociltwz6F
	7oAscMmihwf7O4/nKOKMpiV3m4HrkNv21ICcplPjxj6yRaI61eEhZ3QFpADnQy0OLjZr9eY9Dkw
	iKNXUPYdiymxDzPaoqrnHMt+vU7NfCM5DtmWnNpzJhu0mD6YfF8ZqT9P5+ACgwp3q4yu/FB+Dvo
	PR/lNMaWZD2aorahPxlJX0F5JOhmmC/GIDs369QT6f0sji0hHPvQ+wJa/6HNi52OL/msiT8Y00q
	EnMhYLQqUpOdz3E83XXuVZrgm3dHcqjTYWlKENn2SHegn6yf+2sKii3C6Fq6b6ocFvguFwL5yn7
	kezFVnlJ92msV2u5uCh7Dqplo7PglkzoU7nn0bZnn3X9be
X-Received: by 2002:a05:6a00:94f2:b0:845:bcf0:118 with SMTP id d2e1a72fcca58-845bcf00accmr4334840b3a.41.1782451971037;
        Thu, 25 Jun 2026 22:32:51 -0700 (PDT)
Received: from localhost ([112.204.126.243])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm5946152b3a.22.2026.06.25.22.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:32:49 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH v5] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Fri, 26 Jun 2026 13:32:33 +0800
Message-ID: <20260626053235.25834-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626033411.4C2C61F000E9@smtp.kernel.org>
References: <20260626033411.4C2C61F000E9@smtp.kernel.org>
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
This addresses the following concerns:
> - [High] The returned hwmon device pointer from `hwmon_device_register_with_info` is never assigned to `pcc->pwm_fan_hwmon` on success.
> - [Medium] Missing control flow abort after an error in `pcc_pwm_fan_hwmon_read` allows the evaluation of an uninitialized stack variable.
> - [Medium] Mixing POSIX error codes with `acpi_status` types causes continuous kernel log spam when reading the hwmon PWM attribute in AUTO mode.
> - [Medium] Writing 'auto' mode via the hwmon sysfs interface erroneously passes a hwmon constant to the hardware ACPI function, forcing the hardware into 'manual' mode instead.

> > @@ -507,6 +560,179 @@ static int set_optd_power_state(int new_state)
> >       return result;
> >  }
> > 
> > +/* get OSPM fan mode */
> > +
> > +static int pcc_pwm_fan_mode_read(int *pwm_mode)
> > +{
> [ ... ]
> > +/* read PWM fan speed */
> > +
> > +static int pcc_pwm_fan_speed_read(int *pwm_speed)
> > +{
> [ ... ]
> > +     if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> > +             result = -ENODATA; /* Indeterminate value */
> > +             goto out;
> > +     }
> 
> This successfully returns the POSIX error -ENODATA when the fan is in automatic
> mode. I will reference this below.
> 
> [ ... ]
> > +/* set PWM fan speed */
> > +
> > +static int pcc_pwm_fan_speed_set(int set_pwm_speed)
> > +{
> [ ... ]
> > +     if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> > +             status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
> 
> [Severity: Medium]
> Are we passing the wrong constant here? HWMON_PCC_FAN_PWM_MANUAL is defined
> for the hwmon sysfs interface. Does pcc_pwm_fan_mode_set() expect the hardware
> constant ACPI_PCC_FAN_PWM_MANUAL instead?

This is a mistake that has now been corrected. This is also a problem
that is mentioned below and the specifics including the code snippet
will be explained in detail below.

> [ ... ]
> > @@ -825,6 +1052,240 @@ static const struct attribute_group pcc_attr_group = {
> >       .is_visible     = pcc_sysfs_is_visible,
> >  };
> > 
> > +/* hwmon */
> [ ... ]
> > +static int pcc_pwm_fan_hwmon_read(struct device *dev,
> > +                               enum hwmon_sensor_types type, u32 attr,
> > +                               int channel, long *val)
> > +{
> [ ... ]
> > +     switch (attr) {
> > +     case hwmon_pwm_input:
> > +             mutex_lock(&pcc->pwm_fan_lock);
> > +
> > +             status = pcc_pwm_fan_speed_read(&pwm_speed);
> > +             if (ACPI_FAILURE(status)) {
> > +                     pr_err("%s: failed to get fan pwm speed\n", __func__);
> > +                     result = -ENODATA;
> > +             } else {
> 
> [Severity: Medium]
> Will this cause continuous kernel log spam when the fan is in auto mode?
> 
> As noted above, pcc_pwm_fan_speed_read() returns the POSIX error -ENODATA when
> in automatic mode. Here, the caller receives this negative integer into an
> acpi_status variable.
> 
> Since -ENODATA is non-zero, ACPI_FAILURE() evaluates to true, which triggers
> the error log. This could flood dmesg if userspace tools periodically read the
> hwmon attribute while the fan is in auto mode.

To address both of these concerns, I have made the following code
change:

> +	case hwmon_pwm_input:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +
> +		status = pcc_pwm_fan_speed_read(&pwm_speed);
> +		if (ACPI_FAILURE(status)) {
> +			result = status;
> +		} else {

Instead of generating an error message via pr_err and returning
-ENODATA, it relies on pcc_pwm_fan_speed_read instead.

> +	/* Get fan status first */
> +	/* If fan is not in manual mode, it will return a bogus value */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%s: failed to get fan status\n", __func__);
> +		result = -EIO;
> +		goto out;
> +	}
> +
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> +		result = -ENODATA; /* Indeterminate value */
> +		goto out;
> +	}
> +
> +	/* get pwm speed */
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
> +				      NULL, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%s: failed to get pwm speed\n", __func__);
> +		result = -EIO;
> +		goto out;
> +	}
> +
> +	obj = buffer.pointer;
> +
> +	/* the structure should have 3 values */
> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
> +		pr_err("Invalid _FST package structure (expected 3)\n");
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* the second element should be the pwm speed as an int */
> +	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
> +		pr_err("_FST element at index 1 is not an integer\n");
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	*pwm_speed = obj->package.elements[1].integer.value;
> +	result = AE_OK;

The function already returns its own set of error codes and error
messages. Here, the fan being on auto is normal so -ENODATA is returned
with no error message generated.

Just passing the output of this function should fix both the issue.

> > +     case hwmon_pwm_enable:
> > +             mutex_lock(&pcc->pwm_fan_lock);
> > +
> > +             status = pcc_pwm_fan_mode_read(&pwm_mode);
> > +             if (ACPI_FAILURE(status)) {
> > +                     pr_err("%s: failed to get fan pwm mode\n", __func__);
> > +                     result = -ENODATA;
> > +             }
> > +             if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> 
> [Severity: Medium]
> If pcc_pwm_fan_mode_read() fails, we log an error and set result = -ENODATA,
> but execution continues to the next line. Does this mean we might evaluate the
> uninitialized stack variable pwm_mode? Should there be a break or goto
> statement in the error path?

This mistake has been corrected by adding an else statement:

> +	case hwmon_pwm_input:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +
> +		status = pcc_pwm_fan_speed_read(&pwm_speed);
> +		if (ACPI_FAILURE(status)) {
> +			result = status;
> +		} else {
> +			*val = (pwm_speed * 255) / 100;
> +			result = 0;
> +		}
> +
> +		mutex_unlock(&pcc->pwm_fan_lock);
> +		return result;

This should now go straight to mutex_unlock then return.

> > +static int pcc_pwm_fan_hwmon_write(struct device *dev,
> > +                                enum hwmon_sensor_types type, u32 attr,
> > +                                int channel, long val)
> > +{
> [ ... ]
> > +     switch (attr) {
> > +     case hwmon_pwm_enable:
> > +             if (val == HWMON_PCC_FAN_PWM_AUTO) {
> > +                     mutex_lock(&pcc->pwm_fan_lock);
> > +                     status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_AUTO);
> 
> [Severity: Medium]
> Is the wrong constant being passed to pcc_pwm_fan_mode_set() here?
> 
> val == HWMON_PCC_FAN_PWM_AUTO matches the hwmon constant (2). However,
> passing HWMON_PCC_FAN_PWM_AUTO to pcc_pwm_fan_mode_set() means we are sending
> 2 to the ACPI firmware instead of the expected hardware constant
> ACPI_PCC_FAN_PWM_AUTO (0).
> 
> Since the firmware treats any value >0 as manual mode, does writing 'auto'
> (2) to the sysfs attribute inadvertently force the hardware into manual mode?

The wrong constants were passed to pcc_pwm_fan_mode_set as it expects
the actual hardware level equivalent int.

This has now all been corrected to use ACPI values and not HWMON:

> +		status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);

> [ ... ]
> > @@ -1097,6 +1571,39 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
> >       }
> > 
> >       i8042_install_filter(panasonic_i8042_filter, NULL);
> > +
> > +     /* check quirks */
> > +     if (pcc->quirks) {
> > +             /* has_ospm_pwm_fan - add hwmon and thermal if present */
> > +             if (pcc->quirks->has_ospm_pwm_fan) {
> > +                     mutex_init(&pcc->pwm_fan_lock);
> > +
> > +                     pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
> > +
> > +                     hwmon_dev = hwmon_device_register_with_info(
> > +                             &pdev->dev, "panasonic_pwm_fan", pcc,
> > +                             &pcc_pwm_fan_hwmon_chip_info, NULL);
> > +                     if (IS_ERR(hwmon_dev)) {
> > +                             pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
> > +                             /* not a critical error. just skip if error */
> > +                             pcc->pwm_fan_hwmon = NULL;
> > +                     }
> 
> [Severity: High]
> If hwmon_device_register_with_info() succeeds, we never assign hwmon_dev to
> pcc->pwm_fan_hwmon.
> 
> Because pcc->pwm_fan_hwmon remains NULL, the success path behaves as if the
> registration failed when checking for cleanup.
> 
> > +
> > +                     /* proceed with thermal */
> > +                     pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
> > +                     pcc->pwm_fan_cdev = thermal_cooling_device_register(
> > +                             "Panasonic_PWM_Fan", pcc, &pcc_pwm_fan_cdev_ops);
> > +                     if (IS_ERR(pcc->pwm_fan_cdev)) {
> > +                             pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
> > +                             pcc->pwm_fan_cdev = NULL;
> > +                     }
> > +
> > +                     /* cleanup: destroy mutex if both hwmon and thermal failed */
> > +                     if (!pcc->pwm_fan_hwmon && !pcc->pwm_fan_cdev)
> > +                             mutex_destroy(&pcc->pwm_fan_lock);
> 
> Since pcc->pwm_fan_hwmon is still NULL upon successful hwmon registration, if
> thermal registration fails here, won't we prematurely destroy the mutex while
> the hwmon device is still active and potentially using it?
> 
> [ ... ]
> > @@ -1124,6 +1631,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
> >       struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
> >       struct pcc_acpi *pcc = acpi_driver_data(device);
> > 
> > +     if (pcc->pwm_fan_hwmon)
> > +             hwmon_device_unregister(pcc->pwm_fan_hwmon);
> 
> Because pcc->pwm_fan_hwmon was never assigned, this unregistration is bypassed
> on module unload. This will leak the hwmon device and leave its sysfs attributes
> active. Accessing them after the module is unloaded would dereference freed
> memory.

This is now fixed:

> +			pcc->pwm_fan_hwmon = hwmon_device_register_with_info(
> +				&pdev->dev, "panasonic_pwm_fan", pcc,
> +				&pcc_pwm_fan_hwmon_chip_info, NULL);
> +			if (IS_ERR(pcc->pwm_fan_hwmon)) {
> +				pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
> +				/* not a critical error. just skip if error */
> +				pcc->pwm_fan_hwmon = NULL;
> +			}

I had missed this edge case when I tested my code on a CF-SR4 as this
only applies to a case where both hwmon and thermal failed (have not
encountered such a case so far). When unloading the driver via rmmod, it
did not return an error as the if statement checks first if the pointer 
is null before calling the unregister function.

After making all the changes, I have recompiled the code and tested it
on a CF-SR4 and loading and unloading the module works as expected.

I have also tested on an older model (CF-QV9) where this patch does not
apply to. I did not observe anything abnormal on dmesg. Loading and
unloading the module did not result in any error.

 drivers/platform/x86/panasonic-laptop.c | 541 +++++++++++++++++++++++-
 1 file changed, 527 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..a1837106ff6b 100644
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
+		status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
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
+			result = status;
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
+		} else {
+			if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+				*val = HWMON_PCC_FAN_PWM_AUTO;
+				result = 0;
+			} else if (pwm_mode == HWMON_PCC_FAN_PWM_MANUAL) {
+				*val = HWMON_PCC_FAN_PWM_MANUAL;
+				result = 0;
+			} else { /* Invalid value */
+				result = -EIO;
+			}
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
+			status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
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
+			status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
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
 
@@ -981,6 +1442,7 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 
 static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct backlight_properties props;
 	struct acpi_device *device;
 	struct pcc_acpi *pcc;
@@ -1026,6 +1488,17 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
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
@@ -1097,6 +1570,39 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
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
+			pcc->pwm_fan_hwmon = hwmon_device_register_with_info(
+				&pdev->dev, "panasonic_pwm_fan", pcc,
+				&pcc_pwm_fan_hwmon_chip_info, NULL);
+			if (IS_ERR(pcc->pwm_fan_hwmon)) {
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
@@ -1124,6 +1630,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
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

