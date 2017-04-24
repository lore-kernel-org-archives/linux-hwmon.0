Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57707 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S972163AbdDXPps (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Apr 2017 11:45:48 -0400
Date: Mon, 24 Apr 2017 08:45:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko Schocher <hs@denx.de>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: tmp103: use SIMPLE_DEV_PM_OPS helper macro
Message-ID: <20170424154540.GB31126@roeck-us.net>
References: <1492956651-15321-1-git-send-email-rahulbedarkar89@gmail.com>
 <6e36d265-294b-d700-3896-9f1a6d656a08@roeck-us.net>
 <58FD77DA.9000007@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58FD77DA.9000007@denx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Apr 24, 2017 at 05:58:18AM +0200, Heiko Schocher wrote:
> Hello Guenter, Rahul,
> 
> Am 23.04.2017 um 17:43 schrieb Guenter Roeck:
> >Hi Rahul,
> >
> >On 04/23/2017 07:10 AM, Rahul Bedarkar wrote:
> >>Replace ifdefs with SIMPLE_DEV_PM_OPS helper macro.
> >>
> >>Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> >
> >Thanks a lot for your patch.
> >
> >While I in general prefer code that avoids #ifdef, I have seen patches
> >which do the opposite when handling PM code. It appears that it is
> >unsettled if __maybe_unused or #ifdef should be used in such situations.
> >Until that is the case, I won't accept patches changing one into another
> >unless they are from the driver author or Acked by the driver author.
> 
> Hmm.. I like this patch too, but have also no idea, what is preffered.
> 
> Looking into drivers/hwmon
> 
> pollux:linux hs [master] $ grep -lr __maybe_unused drivers/hwmon/
> drivers/hwmon/tmp108.c
> drivers/hwmon/nct6775.c
> drivers/hwmon/hwmon-vid.c
> drivers/hwmon/max31722.c
> 
> Ok, there are hwmon drivers, which use this version already ...
> 
> pollux:linux hs [master] $ grep -lr CONFIG_PM drivers/hwmon/
> drivers/hwmon/max6639.c
> drivers/hwmon/jc42.c
> drivers/hwmon/fam15h_power.c
> drivers/hwmon/tmp102.c
> drivers/hwmon/gpio-fan.c
> drivers/hwmon/pwm-fan.c
> drivers/hwmon/tmp103.c
> drivers/hwmon/pmbus/Makefile
> drivers/hwmon/lm75.c
> drivers/hwmon/nct6683.c
> drivers/hwmon/adt7x10.h
> drivers/hwmon/w83627hf.c
> drivers/hwmon/abituguru3.c
> drivers/hwmon/Makefile
> drivers/hwmon/acpi_power_meter.c
> drivers/hwmon/adt7x10.c
> drivers/hwmon/abituguru.c
> drivers/hwmon/w83627ehf.c
> 
> May this conversion should be done in a patch, which touches more
> devices?
> 
> Nevertheless, I like this approach, so:
> 
> Acked-by: Heiko Schocher <hs@denx.de>
> 
Thanks, applied to hwmon-next.

Guenter

> bye,
> Heiko
> 
> >
> >Thanks,
> >Guenter
> >
> >>---
> >> drivers/hwmon/tmp103.c | 17 ++++-------------
> >> 1 file changed, 4 insertions(+), 13 deletions(-)
> >>
> >>diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
> >>index d0bb28b..7f85b14 100644
> >>--- a/drivers/hwmon/tmp103.c
> >>+++ b/drivers/hwmon/tmp103.c
> >>@@ -150,8 +150,7 @@ static int tmp103_probe(struct i2c_client *client,
> >>     return PTR_ERR_OR_ZERO(hwmon_dev);
> >> }
> >>
> >>-#ifdef CONFIG_PM
> >>-static int tmp103_suspend(struct device *dev)
> >>+static int __maybe_unused tmp103_suspend(struct device *dev)
> >> {
> >>     struct regmap *regmap = dev_get_drvdata(dev);
> >>
> >>@@ -159,7 +158,7 @@ static int tmp103_suspend(struct device *dev)
> >>                   TMP103_CONF_SD_MASK, 0);
> >> }
> >>
> >>-static int tmp103_resume(struct device *dev)
> >>+static int __maybe_unused tmp103_resume(struct device *dev)
> >> {
> >>     struct regmap *regmap = dev_get_drvdata(dev);
> >>
> >>@@ -167,15 +166,7 @@ static int tmp103_resume(struct device *dev)
> >>                   TMP103_CONF_SD_MASK, TMP103_CONF_SD);
> >> }
> >>
> >>-static const struct dev_pm_ops tmp103_dev_pm_ops = {
> >>-    .suspend    = tmp103_suspend,
> >>-    .resume        = tmp103_resume,
> >>-};
> >>-
> >>-#define TMP103_DEV_PM_OPS (&tmp103_dev_pm_ops)
> >>-#else
> >>-#define    TMP103_DEV_PM_OPS NULL
> >>-#endif /* CONFIG_PM */
> >>+static SIMPLE_DEV_PM_OPS(tmp103_dev_pm_ops, tmp103_suspend, tmp103_resume);
> >>
> >> static const struct i2c_device_id tmp103_id[] = {
> >>     { "tmp103", 0 },
> >>@@ -193,7 +184,7 @@ static struct i2c_driver tmp103_driver = {
> >>     .driver = {
> >>         .name    = "tmp103",
> >>         .of_match_table = of_match_ptr(tmp103_of_match),
> >>-        .pm    = TMP103_DEV_PM_OPS,
> >>+        .pm    = &tmp103_dev_pm_ops,
> >>     },
> >>     .probe        = tmp103_probe,
> >>     .id_table    = tmp103_id,
> >>
> >
> 
> -- 
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
