Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtp2.it.da.ut.ee ([193.40.5.67]:35553 "EHLO smtp2.it.da.ut.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752026AbdHPUtO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Aug 2017 16:49:14 -0400
Date: Wed, 16 Aug 2017 23:29:25 +0300 (EEST)
From: Meelis Roos <mroos@linux.ee>
To: Juerg Haefliger <juergh@gmail.com>
cc: linux-hwmon@vger.kernel.org
Subject: dme1737 and non-standard fan to pwm mapping
Message-ID: <alpine.LRH.2.20.1708162323520.16834@math.ut.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Just noticed on 4.13-rc5 that dme1737 asks me to report this to the 
driver maintainer:

[    0.000000] DMI: Sun Microsystems Sun Fire(TM) X2100      /2864, BIOS 1.1.8  05/15/2008
...
[    8.576056] i2c i2c-0: Found a DME1737 chip at 0x2e (rev 0x89).
[    8.604092] dme1737 0-002e: Optional features: pwm3=yes, pwm5=no, pwm6=no, fan3=yes, fan4=yes, fan5=no, fan6=no.
[    8.636046] dme1737 0-002e: Non-standard fan to pwm mapping: fan1->pwm1, fan2->pwm2, fan3->pwm1, fan4->pwm3. Please report to the driver maintainer.
[    8.680577] dme1737 0-002e: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    8.680665] i2c i2c-0: nForce2 SMBus adapter at 0x400
[    8.764050] i2c i2c-1: Found a DME1737 chip at 0x2e (rev 0x89).
[    8.792110] dme1737 1-002e: Optional features: pwm3=yes, pwm5=no, pwm6=no, fan3=yes, fan4=yes, fan5=no, fan6=no.
[    8.816036] dme1737 1-002e: Non-standard fan to pwm mapping: fan1->pwm1, fan2->pwm2, fan3->pwm1, fan4->pwm3. Please report to the driver maintainer.
[    8.892452] dme1737 1-002e: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().

-- 
Meelis Roos (mroos@linux.ee)
