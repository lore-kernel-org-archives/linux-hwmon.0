Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ADDC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 02:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235587AbiAXCdJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Jan 2022 21:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236069AbiAXCcx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Jan 2022 21:32:53 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E8AC06173D
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Jan 2022 18:32:52 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso20347890otr.6
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Jan 2022 18:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXSeE62U5G+y1B4/C94NFntmOoBBzCntlQnIT4b6lLo=;
        b=ESUlOI0TK2OvUD5zntRRIDCBXsWFnu/Xax+4SVccrQszoONHDruDEzFeByot6p0IST
         RRdI+7qIzvdtOeoZrWtrsZte5fM8XA/QGw/67dC3sWdwSgBBaHLMY4QIxfxkjxfnAb1J
         TFzZwKNdyjZyk9HWp7bKm9JLsuGIaPV/IiQ89fHSND/sIYqnU95P8JGFbejAN2eUB/E0
         gB/atNzSzXphNWsFoQVQWru06jtCWtaf1kT/JxQpIf+OHCISIootlRaQlJFYNFbjPZ0I
         SmyQqVN2UzSZnD/xkkOq6dMPOhy+LzWw5lbt7C3uI/5Tmpuj+16yF040vSFrVNvyampJ
         P2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ZXSeE62U5G+y1B4/C94NFntmOoBBzCntlQnIT4b6lLo=;
        b=g9x1jt1OoVBTgkWSiKqxFoOYyBIClKf+qai71C2S7OZpr18+mG+IDQqrQlPpH9kHM8
         t7mP1HPu7Z7mCNo84X9VvnkXLfGr3N45bz59Bhrow+yIz8YBnzT+A5jidJmwNAgpQ7pX
         9cGtSGQhoITdNzGPC8ih1MXGEw6gwD9tD2PHQ6YPIaVosi1DmUffRdtbG5Faqlvu5WVZ
         u2gI+lsm88LaTxZvo0XnFBlD3BnnbYFwUC24EEDDYsAe1FpXqYh2rKWO+akKHXkmbztx
         hk6UKiBcI66dYCnr1+XOOBAuKvL4xlPvIE2iZERnyp3ooajD8V7Kj+hFO/z1G7yPoeLB
         JI3Q==
X-Gm-Message-State: AOAM532bilW+X9MyyJYWp/QXjfX601UHR4lIxim+qEpK9xTGX9DTM4/0
        tkkNXT/ZZU29kHlDEhWMqwxAeRv7EZg=
X-Google-Smtp-Source: ABdhPJxiiVf/Dr2z6lOvlNvYdEFY/ZqdHEIV4kfKxz/w2A7dcY+zQvrxKREaJHFTHfauktIQ260Nag==
X-Received: by 2002:a05:6830:12c1:: with SMTP id a1mr10174122otq.286.1642991571449;
        Sun, 23 Jan 2022 18:32:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s64sm385142oos.0.2022.01.23.18.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:32:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Denis Pauk <pauk.denis@gmail.com>,
        Bernhard Seibold <mail@bernhard-seibold.de>,
        =?UTF-8?q?Pawe=C5=82=20Marciniak?= <pmarciniak@lodz.home.pl>
Subject: [PATCH] hwmon: (nct6775) Fix crash in clear_caseopen
Date:   Sun, 23 Jan 2022 18:32:48 -0800
Message-Id: <20220124023248.475734-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Paweł Marciniak reports the following crash, observed when clearing
the chassis intrusion alarm.

BUG: kernel NULL pointer dereference, address: 0000000000000028
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 3 PID: 4815 Comm: bash Tainted: G S                5.16.2-200.fc35.x86_64 #1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z97 Extreme4, BIOS P2.60A 05/03/2018
RIP: 0010:clear_caseopen+0x5a/0x120 [nct6775]
Code: 68 70 e8 e9 32 b1 e3 85 c0 0f 85 d2 00 00 00 48 83 7c 24 ...
RSP: 0018:ffffabcb02803dd8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: ffff8e8808192880 RSI: 0000000000000000 RDI: ffff8e87c7509a68
RBP: 0000000000000000 R08: 0000000000000001 R09: 000000000000000a
R10: 000000000000000a R11: f000000000000000 R12: 000000000000001f
R13: ffff8e87c7509828 R14: ffff8e87c7509a68 R15: ffff8e88494527a0
FS:  00007f4db9151740(0000) GS:ffff8e8ebfec0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000028 CR3: 0000000166b66001 CR4: 00000000001706e0
Call Trace:
 <TASK>
 kernfs_fop_write_iter+0x11c/0x1b0
 new_sync_write+0x10b/0x180
 vfs_write+0x209/0x2a0
 ksys_write+0x4f/0xc0
 do_syscall_64+0x3b/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The problem is that the device passed to clear_caseopen() is the hwmon
device, not the platform device, and the platform data is not set in the
hwmon device. Store the pointer to sio_data in struct nct6775_data and
get if from there if needed.

Fixes: 2e7b9886968b ("hwmon: (nct6775) Use superio_*() function pointers in sio_data.")
Cc: Denis Pauk <pauk.denis@gmail.com>
Cc: Bernhard Seibold <mail@bernhard-seibold.de>
Reported-by: Paweł Marciniak <pmarciniak@lodz.home.pl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index fd3f91cb01c6..098d12b9ecda 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1175,7 +1175,7 @@ static inline u8 in_to_reg(u32 val, u8 nr)
 
 struct nct6775_data {
 	int addr;	/* IO base of hw monitor block */
-	int sioreg;	/* SIO register address */
+	struct nct6775_sio_data *sio_data;
 	enum kinds kind;
 	const char *name;
 
@@ -3559,7 +3559,7 @@ clear_caseopen(struct device *dev, struct device_attribute *attr,
 	       const char *buf, size_t count)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
+	struct nct6775_sio_data *sio_data = data->sio_data;
 	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
 	unsigned long val;
 	u8 reg;
@@ -3967,7 +3967,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->kind = sio_data->kind;
-	data->sioreg = sio_data->sioreg;
+	data->sio_data = sio_data;
 
 	if (sio_data->access == access_direct) {
 		data->addr = res->start;
-- 
2.33.0

