Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9F8C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28D4320855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfC/fglq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbfAQVOR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:17 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39990 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVOR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:17 -0500
Received: by mail-pf1-f194.google.com with SMTP id i12so5423232pfo.7
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AC83hBLGGI6zUHe+/xgoKgROla3H+am1sQBuu6A4cyc=;
        b=YfC/fglqPfBCgwj0PU1FijEE26jonhe4INREBdiWtT7QeEdab4RA12zj0L34aqMomC
         wmkVoGhPAMzlogmk4tRNP8nV3zrXJ4f5DGPgqa0gU7Oqq/X919Ewj8r0t480JuAKUGJu
         dKOAnOQ6CRMTDXXOWLuK+x5cphbA8/j5LDVdGx9TKh+idGXlYQjlEMtoCsKVsj+B2VUY
         OBOuxPgUjm5qZW58EH421Blf/PNLtX+VIozxNVjKnHiwcxKGV6+baL8REgoIyCmOqM2u
         yV6YvmT1LLHthQ8JB1D+ONgoJ+9JktRsz0EwwUB7bepOgFkbrbEqrl+lofxXPVxTmSZA
         +lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=AC83hBLGGI6zUHe+/xgoKgROla3H+am1sQBuu6A4cyc=;
        b=g6+44/OLiWGTeQvV1Fbx8jwMT8zhA3iQmMZ8kbzBSyz+WlEuLVMGvblirHq492U0hp
         PO1CE6KFiMwf3yyZeEDEzPR87W/Ff6Me4lcFpwi/UIzvt74U6X9sMSRMBeJ/u2GqFYuc
         4aq/GRlW6LJ8AxX6KRXozU/NsLxdfpKQXCI3inZ/fIVhtZ3ePP2dv/H7xniO/jYlyjCc
         mDysIw4PL/j7J9GzMj0jjEb0/NkQ1ES5IDhRy0sfO8DSMXiU6eLDbYrTsgXEkTnV2x09
         LhTy+9A1xCreOGdPD9dly0wXI7rp4tEaEbQEElkAPRIedCmH/IaDGBW2qJaQ/RObEEe1
         bsaQ==
X-Gm-Message-State: AJcUukdu/11VfWs2cuzOv5D6jnrbf7owcaE5arQkxylc5hPa2MowKSmt
        glqsdDmvNlxmR8XMODrTgAFgMC8q
X-Google-Smtp-Source: ALg8bN4ur71/ow06nsuITp6cFILJXiJY6dkCbqloZhOnuOa/qNs82v7ebawSOlkJYActOv6X9XJdpw==
X-Received: by 2002:a62:a99:: with SMTP id 25mr16297314pfk.121.1547759656821;
        Thu, 17 Jan 2019 13:14:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o84sm6326267pfi.172.2019.01.17.13.14.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:16 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rudolf Marek <r.marek@assembler.cz>
Subject: [PATCH 14/29] hwmon: (k8temp) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:34 -0800
Message-Id: <1547759629-23007-15-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Cc: Rudolf Marek <r.marek@assembler.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k8temp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/k8temp.c b/drivers/hwmon/k8temp.c
index e59f9113fb93..93a5d51f3c6d 100644
--- a/drivers/hwmon/k8temp.c
+++ b/drivers/hwmon/k8temp.c
@@ -109,8 +109,8 @@ static ssize_t name_show(struct device *dev, struct device_attribute
 }
 
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct sensor_device_attribute_2 *attr =
 	    to_sensor_dev_attr_2(devattr);
@@ -129,10 +129,10 @@ static ssize_t show_temp(struct device *dev,
 
 /* core, place */
 
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp, NULL, 0, 0);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, 0, 1);
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, 1, 0);
-static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 1, 1);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_input, temp, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_input, temp, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_input, temp, 1, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp4_input, temp, 1, 1);
 static DEVICE_ATTR_RO(name);
 
 static const struct pci_device_id k8temp_ids[] = {
-- 
2.7.4

