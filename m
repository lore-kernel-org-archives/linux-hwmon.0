Return-Path: <SRS0=oaIe=4I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01499C11D05
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Feb 2020 14:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C81E1207FD
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Feb 2020 14:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rd+momq5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgBTOhv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Feb 2020 09:37:51 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33808 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgBTOhv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Feb 2020 09:37:51 -0500
Received: by mail-pl1-f193.google.com with SMTP id j7so1643144plt.1
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Feb 2020 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=rgrUIkU3JeBMWZPZ23WHmaNMiKmSGM/Sybox+yplA/Q=;
        b=Rd+momq515e69lmwvaJTafd3ps8A8aFTddAd4l5DHiCgoy6KKUYlWLTM8k96hjGn2E
         XfzolvCHa9aUThN2W7LKI1CUlwutpKseHSf6uo7UdyQp7VKmOxX4tA7krVARtlUAkmrv
         /Apn1HO5+dEQRxJjkkcjx8kH2KBrhwCjopIJCuqotHEZ3HyixGmpOAjxvDtv4zIOxqQM
         AZCcKaFoi9NpMyvJ/7WMA5LRG6T1J4JWU8tAFtXEySfbmD3bNl4rwmgX59d2g4X9JJqr
         hrFNqAFdOUK+658V4Oazjiz48Q4b0J3zlwMPBrz+vuJ7PID8qBELlsVtupn2OJJVpVYK
         okSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=rgrUIkU3JeBMWZPZ23WHmaNMiKmSGM/Sybox+yplA/Q=;
        b=CBdXvHy+lt6WkfrYCyJwEVJ40TWNokCzSb3kNJaB/7e4l9g4UZAr8oIi/RgAZ4ppnf
         aFfVY03phHpTnPRdpLR1CKIXnWSedRtA0LtGTDE/M5Q8gAD4IdwcRqvhQ3r+SjRMYKl3
         T8Le+MnaCIcRPutn6ZgAQ1OoA44gYkb9WjtgbNCeuRZwkYNqpIQ+LK9erSAL25rqAB+A
         /65AGlXssr/LVTdwERITTHGAezo/vtyqkgcL/FStF1OB7J5Eho4MfEt4Pu70hdiIms1X
         z57eyOnmakn+OW17YM5xlduo+0xjdqw923cD74XKIFoBVhwxvURtxwZk2O8iStjrl6WM
         aE1w==
X-Gm-Message-State: APjAAAXyrcK15uMFnQa3tz13OvOM3VA/Zy1YuhmBA43IMjOabeedGO5J
        RWtp2XiBWMz2zlvosrBzskd/JcBk
X-Google-Smtp-Source: APXvYqxCrOH4RwhXTkFekY2GoIiBUqhlZZXVd93vAzn9HxxpL20TlTYEgJIDOTEBMutviicE6VxZ4g==
X-Received: by 2002:a17:90a:7303:: with SMTP id m3mr4086465pjk.62.1582209469958;
        Thu, 20 Feb 2020 06:37:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s124sm4022829pfc.57.2020.02.20.06.37.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 06:37:48 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Meelis Roos <mroos@linux.ee>,
        "Dr . David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] hwmon: (w83627ehf) Fix crash seen with W83627DHG-P
Date:   Thu, 20 Feb 2020 06:37:44 -0800
Message-Id: <20200220143744.10278-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Loading the driver on a system with W83627DHG-P crashes as follows.

w83627ehf: Found W83627DHG-P chip at 0x290
BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 0 P4D 0
Oops: 0000 [#1] SMP NOPTI
CPU: 0 PID: 604 Comm: sensors Not tainted 5.6.0-rc2-00055-gca7e1fd1026c #29
Hardware name:  /D425KT, BIOS MWPNT10N.86A.0132.2013.0726.1534 07/26/2013
RIP: 0010:w83627ehf_read_string+0x27/0x70 [w83627ehf]
Code: [... ]
RSP: 0018:ffffb95980657df8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff96caaa7f5218 RCX: 0000000000000000
RDX: 0000000000000015 RSI: 0000000000000001 RDI: ffff96caa736ec08
RBP: 0000000000000000 R08: ffffb95980657e20 R09: 0000000000000001
R10: ffff96caaa635cc0 R11: 0000000000000000 R12: ffff96caa9f7cf00
R13: ffff96caa9ec3d00 R14: ffff96caa9ec3d28 R15: ffff96caa9ec3d40
FS:  00007fbc7c4e2740(0000) GS:ffff96caabc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000129d58000 CR4: 00000000000006f0
Call Trace:
 ? cp_new_stat+0x12d/0x160
 hwmon_attr_show_string+0x37/0x70 [hwmon]
 dev_attr_show+0x14/0x50
 sysfs_kf_seq_show+0xb5/0x1b0
 seq_read+0xcf/0x460
 vfs_read+0x9b/0x150
 ksys_read+0x5f/0xe0
 do_syscall_64+0x48/0x190
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
...

Temperature labels are not always present. Adjust sysfs attribute
visibility accordingly.

Reported-by: Meelis Roos <mroos@linux.ee>
Cc: Meelis Roos <mroos@linux.ee>
Cc: Dr. David Alan Gilbert <linux@treblig.org>
Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83627ehf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 7ffadc2da57b..5a5120121e50 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1346,8 +1346,13 @@ w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		/* channel 0.., name 1.. */
 		if (!(data->have_temp & (1 << channel)))
 			return 0;
-		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
+		if (attr == hwmon_temp_input)
 			return 0444;
+		if (attr == hwmon_temp_label) {
+			if (data->temp_label)
+				return 0444;
+			return 0;
+		}
 		if (channel == 2 && data->temp3_val_only)
 			return 0;
 		if (attr == hwmon_temp_max) {
-- 
2.17.1

