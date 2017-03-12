Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54117 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755744AbdCLNZs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2017 09:25:48 -0400
Date: Sun, 12 Mar 2017 06:25:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170312132544.GA17687@roeck-us.net>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170312103413.GJ21222@n2100.armlinux.org.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Mar 12, 2017 at 10:34:13AM +0000, Russell King - ARM Linux wrote:
> Hi,
> 
> I recently upgraded a machine that backs up data at a club from a
> 2.6.30 based distribution to 4.8.0 based distribution, and I find
> that modprobing the it87 sensor driver on 4.8.0 causes the machine
> to lockup.
> 
> Unfortunately, as far as I'm aware, there is no kernel oops or
> kernel messages, it just locks the machine up such that it requires
> a power cycle.
> 
> With 2.6.30, it was possible to modprobe the driver and lm_sensors
> would then read out the fan and temperature information (which is
> necessary to monitor the head-less machine that is otherwise buried
> in an area that hardly anyone goes.)
> 
> it87-isa-0290
> Adapter: ISA adapter
> in0:         +1.60 V  (min =  +0.00 V, max =  +4.08 V)
> in1:         +2.50 V  (min =  +0.00 V, max =  +4.08 V)
> in2:         +3.34 V  (min =  +0.00 V, max =  +4.08 V)
> in3:         +2.29 V  (min =  +0.00 V, max =  +4.08 V)
> in4:         +3.14 V  (min =  +0.00 V, max =  +4.08 V)
> in5:         +2.72 V  (min =  +0.00 V, max =  +4.08 V)
> in6:         +2.11 V  (min =  +0.00 V, max =  +4.08 V)
> in7:         +2.10 V  (min =  +0.00 V, max =  +4.08 V)
> Vbat:        +0.00 V
> fan1:       3245 RPM  (min =    0 RPM, div = 8)
> fan2:          0 RPM  (min =    0 RPM, div = 8)
> temp1:        +9.0 C  (low  = +127.0 C, high = +127.0 C)  sensor = thermistor
> temp2:        +5.0 C  (low  = +127.0 C, high = +127.0 C)  sensor = thermistor
> temp3:       +27.0 C  (low  = +127.0 C, high = +127.0 C)  sensor = thermal diode
> 
> Looking at the changes between the two kernels, I'd imagine that
> unconditionally touching the registers at 0x4e/0x4f (which the
> driver never used to do) is upsetting the bridges, causing the
> machine to lock up.
> 
I found some reference suggesting that The IT8705F may respond on
both SIO addresses. Can you try the following patch ?

Guenter

---
>From 97ec1bb3274914b07ffb01a2c5d3501fee9af8c4 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 12 Mar 2017 06:18:58 -0700
Subject: [PATCH] hwmon: (it87) Don't check second SIO address for older chips

IT8705F is known to respond on both SIO addresses. Stop scanning for
chips after finding one.

Fixes: e84bd9535e2b ("hwmon: (it87) Add support for second Super-IO chip")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 3e57a6120551..cce0683cf2fd 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3215,7 +3215,15 @@ static int __init sm_it87_init(void)
 		err = it87_device_add(i, isa_address, &sio_data);
 		if (err)
 			goto exit_dev_unregister;
+
 		found = true;
+
+		/*
+		 * Don't continue searching after finding an older chip
+		 * which may respond on both SIO addresses.
+		 */
+		if (sio_data.type == it87)
+			break;
 	}
 
 	if (!found) {
-- 
2.7.4

