Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:46504 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751747AbeEDWWe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 May 2018 18:22:34 -0400
Received: by mail-qt0-f196.google.com with SMTP id m16-v6so29359296qtg.13
        for <linux-hwmon@vger.kernel.org>; Fri, 04 May 2018 15:22:34 -0700 (PDT)
Message-ID: <1525472549.6877.81.camel@gmail.com>
Subject: hwmon_device_register_with_info registration API issue
From: Lucas Magasweran <lucasrangit@gmail.com>
To: linux-hwmon@vger.kernel.org, jdelvare@suse.de
Date: Sat, 05 May 2018 00:22:29 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jean and al,

Thank you for your Kernel Recipes 2016 talk about the new hwmon
registration API [1].

I'm trying to use the latest hwmon_device_register_with_info() API
where hwmon core handles the sysfs attributes for me. However, I cannot
use it with a NULL parent struct device *dev and non-NULL struct
hwmon_chip_info *chip. My platform driver module_init() calls
hwmon_device_register_with_info(). __hwmon_device_register() has a NULL
pointer dereference error because it uses device managed memory
allocation internally.

For example,

my_hwmon_dev = hwmon_device_register_with_info(NULL, "my_name", NULL,
                                               &my_hwmon_chip_info,
                                               NULL);
--> __hwmon_device_register(NULL, "my_name", NULL,
                            &my_hwmon_chip_info, NULL);
----> hwdev->groups = devm_kcalloc(NULL, ngroups,
                                   sizeof(*groups), GFP_KERNEL);

I see that later in the function dev is checked for NULL in "hdev-
>of_node = dev ? dev->of_node : NULL;" but it cannot be NULL for
devm_kcalloc().

I tried the following 4.10.17 patch because I expected the hwmon
attributes to be stored with the hwmon device directly and not the
struct device *dev parent. However, none of my attributes are showing
up in /sys/class/hwmon#/.

Is my approach wrong?

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3932f92..2e32589 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -560,6 +560,17 @@ __hwmon_device_register(struct device *dev, const
char *name, void *drvdata,
 
        hdev = &hwdev->dev;
 
+       hwdev->name = name;
+       hdev->class = &hwmon_class;
+       hdev->parent = dev;
+       hdev->of_node = dev ? dev->of_node : NULL;
+       hwdev->chip = chip;
+       dev_set_drvdata(hdev, drvdata);
+       dev_set_name(hdev, HWMON_ID_FORMAT, id);
+       err = device_register(hdev);
+       if (err)
+               goto free_hwmon;
+
        if (chip) {
                struct attribute **attrs;
                int ngroups = 2; /* terminating NULL plus &hwdev-
>groups */
@@ -568,14 +579,14 @@ __hwmon_device_register(struct device *dev, const
char *name, void *drvdata,
                        for (i = 0; groups[i]; i++)
                                ngroups++;
 
-               hwdev->groups = devm_kcalloc(dev, ngroups,
sizeof(*groups),
+               hwdev->groups = devm_kcalloc(dev ? dev : hdev, ngroups,
sizeof(*groups),
                                             GFP_KERNEL);
                if (!hwdev->groups) {
                        err = -ENOMEM;
                        goto free_hwmon;
                }
 
-               attrs = __hwmon_create_attrs(dev, drvdata, chip);
+               attrs = __hwmon_create_attrs(dev ? dev : hdev, drvdata,
chip);
                if (IS_ERR(attrs)) {
                        err = PTR_ERR(attrs);
                        goto free_hwmon;
@@ -595,17 +606,6 @@ __hwmon_device_register(struct device *dev, const
char *name, void *drvdata,
                hdev->groups = groups;
        }
 
-       hwdev->name = name;
-       hdev->class = &hwmon_class;
-       hdev->parent = dev;
-       hdev->of_node = dev ? dev->of_node : NULL;
-       hwdev->chip = chip;
-       dev_set_drvdata(hdev, drvdata);
-       dev_set_name(hdev, HWMON_ID_FORMAT, id);
-       err = device_register(hdev);
-       if (err)
-               goto free_hwmon;
-
        if (chip && chip->ops->read &&
            chip->info[0]->type == hwmon_chip &&
            (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {


 [1] https://kernel-recipes.org/en/2016/talks/new-hwmon-device-registra
tion-api/
