Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE93C61DA4
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbjA1GEK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbjA1GEJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:09 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F4977D29D
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:08 -0800 (PST)
IronPort-SDR: t+NROiXVzhvtnhvh3kBwGkCMFL5c0WCfl3eWlqTP2R3UloNEyfdJhuF6R2a1Qwsq+ni5jcmJsB
 yzu/De/T3KNr9YK1Qs9UIoTTCQV52MVnbQeT6JwDNSQe7nzIPeEkX9HuIF+UHVIEd7qMGTbluM
 X83oNeMBrZI7+mYpB8YvWEH/dyZKlXo7VPAvPbtpadBfFB9puaR1FwpQ5EEVJtz3rY+T7LqEdR
 PLs3kNzEcqdWqOLCfHi/iDw/Hr/Pn+ENGPvXu4Wt5BUzuA5NzFGOBbNmMdtf1olfp/nRwpxE35
 XlA3UYJkA2H/PhQEnsgxAN9J
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:47 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63ChD2973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:43 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63ChD2973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885823; bh=i2XGXabeeiO+pdS/NSVl7gpDwA49NN/JXqrhvG0Iwds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o8KLiu7V8YNyU6e/cr7L9pBSF4yYNq1QgCJldAQsUJGj3Lqwb/1HCaN5r9cDKIlw5
         UUy5EV+7akA4Bhkqr2ZBwUrsWKrBxs7FedFwZSrCZPH3cITrLU4/sseymK69rQ+jsc
         Zy7eK2DXMhQPttShGNbOLnEed4Sd/KWFKJlfbDFd3h6dhuwgPEVyxRCw2ny4ttZRXK
         bvdFRHHuiYAQ2+6BZ0r96COpWOl9cnWqe6J0mNgsBdShbXqrflXdZpVzeK/oPKVHOE
         alTqmHls1K1NTUZobGgL5my+xZEiJehXE2xqjyvv8zxtvMS6AIeG4YvbbSELtnMu2x
         1+Rm/vc/pAc1g==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 5/7] hwmon: (it87) Allow multiple chip IDs for force_id
Date:   Sat, 28 Jan 2023 17:03:06 +1100
Message-Id: <20230128060308.1549707-6-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:43 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend the force_id module parameter to allow specifying one or both
chip IDs separately.  If only a single parameter is given it defaults
to using that value for all chips, similar to previous usage.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v3:
 * No change.

v2:
 * No change.

---
 drivers/hwmon/it87.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 450f0bfec328..83de34119d74 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -175,8 +175,9 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT87_SIO_VID_REG	0xfc	/* VID value */
 #define IT87_SIO_BEEP_PIN_REG	0xf6	/* Beep pin mapping */
 
-/* Force chip ID to specified value. Should only be used for testing */
-static unsigned short force_id;
+/* Force chip IDs to specified values. Should only be used for testing */
+static unsigned short force_id[2];
+static unsigned int force_id_cnt;
 
 /* ACPI resource conflicts are ignored if this parameter is set to 1 */
 static bool ignore_resource_conflict;
@@ -2410,7 +2411,7 @@ static const struct attribute_group it87_group_auto_pwm = {
 
 /* SuperIO detection - will change isa_address if a chip is found */
 static int __init it87_find(int sioaddr, unsigned short *address,
-			    struct it87_sio_data *sio_data)
+			    struct it87_sio_data *sio_data, int chip_cnt)
 {
 	int err;
 	u16 chip_type;
@@ -2426,8 +2427,12 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (chip_type == 0xffff)
 		goto exit;
 
-	if (force_id)
-		chip_type = force_id;
+	if (force_id_cnt == 1) {
+		/* If only one value given use for all chips */
+		if (force_id[0])
+			chip_type = force_id[0];
+	} else if (force_id[chip_cnt])
+		chip_type = force_id[chip_cnt];
 
 	switch (chip_type) {
 	case IT8705F_DEVID:
@@ -3419,7 +3424,7 @@ static int __init sm_it87_init(void)
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
 		isa_address[i] = 0;
-		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
+		err = it87_find(sioaddr[i], &isa_address[i], &sio_data, i);
 		if (err || isa_address[i] == 0)
 			continue;
 		/*
@@ -3468,8 +3473,8 @@ static void __exit sm_it87_exit(void)
 MODULE_AUTHOR("Chris Gauthron, Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("IT8705F/IT871xF/IT872xF hardware monitoring driver");
 
-module_param(force_id, ushort, 0);
-MODULE_PARM_DESC(force_id, "Override the detected device ID");
+module_param_array(force_id, ushort, &force_id_cnt, 0);
+MODULE_PARM_DESC(force_id, "Override one or more detected device ID(s)");
 
 module_param(ignore_resource_conflict, bool, 0);
 MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
-- 
2.39.1

