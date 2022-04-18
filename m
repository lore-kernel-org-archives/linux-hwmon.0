Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D03C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Apr 2022 09:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbiDRJKX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Apr 2022 05:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbiDRJKS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Apr 2022 05:10:18 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1E5B85D
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Apr 2022 02:07:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id 12so11857508pll.12
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Apr 2022 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1JfjiBHa745fBq9ODwlVVyXBS/f+uswL4bgLFDFlP4o=;
        b=DvWOeQXw4aF7mjXsJ2xB+9xvw+hMiLTFksyOjIlx3dgLODR5kycX8vgVWhJFrOZwfY
         33QyUvKvX2SuUU76SbG8RzPn95odkWfxNsO56BIbf6HHymVBFYu6pIWO6o6MBJPch+D2
         QLeJuQ+wRK281wJaqyUvyq/oOPEAcUAD/fdTyyUw8C2kIyly7lT1injgN+A1I3K5WISV
         7sYlYoGLypBmGmgG5ncmYvHFo89eisyLPy731cU7IhM84t60CY5ARx96D9sghnLTd7Fd
         FoofqpdvuDRppdH/nC0QMFT3X5v3X5VSvs69+tToBLT1WbUS6zJg6v9gKzgl1kgC/85Z
         Uwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1JfjiBHa745fBq9ODwlVVyXBS/f+uswL4bgLFDFlP4o=;
        b=H1+j9lMGQkcAtwvQlaYUfbopzaDqvW5VUOW9twRAf9xvUXBo1MUBTeJMGwMDZmBpNZ
         U3u8p7NoVEJGnqpqPwTrj4rPtDAZ5fcgXejGNE7ea/wXZ+gD4qHr0ZZHZpFxco28q78c
         77EqhDiXyh8+v0X8AihIXHyo+1aXaEkyYTHshLHuSPhA989uyuPccanT+z8Xh6utqYkO
         +o2qvXIywSsV6oqc/JaQmvaqPNswPlSC/d0GpxOAzl1k6FPlX55GrIKGNWMhTM9hOSNX
         wM1PVaILXxjPmDV1F2B/CRa7MwWMaTyVYYdJRcOG/g0PhgfDb4yoeUW60W0FPVuts2HZ
         J4kw==
X-Gm-Message-State: AOAM532ovDfJz3ewDf9iHIC47lHbDQiZ4vjT09l3w8nyAAAVWJoCaBU2
        n8esRQycWtXdpn/jsWP/lv4=
X-Google-Smtp-Source: ABdhPJzx6gl/fMdbji5XYZEzXC0+LENFqwTs3EEiwbLTe8oFtuno9XnjYT6dzbN+A+V9GaubBAz7DQ==
X-Received: by 2002:a17:90a:f3d6:b0:1cb:a0aa:5e60 with SMTP id ha22-20020a17090af3d600b001cba0aa5e60mr11919799pjb.161.1650272859576;
        Mon, 18 Apr 2022 02:07:39 -0700 (PDT)
Received: from localhost (59-120-186-245.hinet-ip.hinet.net. [59.120.186.245])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090a4d8200b001cb41f25148sm12612349pjh.17.2022.04.18.02.07.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Apr 2022 02:07:39 -0700 (PDT)
From:   "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
X-Google-Original-From: "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
To:     linux@roeck-us.net
Cc:     Menghui_Wu@aaeon.com.tw, fercerpav@gmail.com,
        peter_hong@fintek.com.tw, acelan.kao@canonical.com,
        linux-hwmon@vger.kernel.org,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: [PATCH V2 1/1] hwmon:(f71882fg) Fix minus temperature
Date:   Mon, 18 Apr 2022 17:07:06 +0800
Message-Id: <20220418090706.6339-1-hpeter+linux_kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

All temperature of Fintek superio hwmonitor that using 1-byte reg will use
2's complement.

In show_temp()
	temp = data->temp[nr] * 1000;

When data->temp[nr] read as 255, it indicate -1C, but this code will report
255C to userspace. It'll be ok when change to:
	temp = ((s8)data->temp[nr]) * 1000;

Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
---
 drivers/hwmon/f71882fg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index 938a8b9ec70d..6830e029995d 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -1578,8 +1578,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 		temp *= 125;
 		if (sign)
 			temp -= 128000;
-	} else
-		temp = data->temp[nr] * 1000;
+	} else {
+		temp = ((s8)data->temp[nr]) * 1000;
+	}
 
 	return sprintf(buf, "%d\n", temp);
 }
-- 
2.17.1

