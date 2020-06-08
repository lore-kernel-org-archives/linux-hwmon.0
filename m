Return-Path: <SRS0=E0ck=7V=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A443DC433DF
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jun 2020 14:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E7882074B
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jun 2020 14:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwGUG7M3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgFHOYf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Jun 2020 10:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729975AbgFHOYc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Jun 2020 10:24:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D317C08C5C3
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2020 07:24:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x207so8619305pfc.5
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2020 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=q85AsuKrmY4IgPtm0mYuch5lt547T48wysZIba/Zk60=;
        b=NwGUG7M3RstcTShP/AE52ZtX7jNXwqlzxgS+8r0eebqIsWka5aBKloejGdX7NbrinQ
         OWurFVkCS62Cu4u1QY8AdBbNlovjeq56SaGHmROCc+VcgbjB+qLBXYq/AM3oC0XYgvgQ
         De6CbkCnme2wxHMqjfa0sxLGWe50VyWClxCO764/zy4OOMrwQBK+ssiXSFY1EAv5/+f4
         k7cwf5hwq9Em9gGxJ7fCdXRrKNEsxB4YjiZ6iOwuvDs8ru84MTuuW5MIpVi7hJzBW29t
         jnJDH+bwT2sYw2Z/ZOz/vZ+/nme5iz+NP4Ql1Myp619nwjUAntFrv6CgFLiZ5Ui1mJhx
         bQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=q85AsuKrmY4IgPtm0mYuch5lt547T48wysZIba/Zk60=;
        b=i5jtpZ9WowapiVUyjO8L3vFx/9zEKA1aYXThxj+YYEyFJ9dmRlpWe0wrHxZ8OVoCB7
         bLrDzWKeJcLTzr9i0ovWB3m+2kyvBsaccas7F0G9L12OAfXQ2IC5aCf39dBOaUaB5zQv
         LMaPy+R6TIO7Jlj1hJsh9JHOX4CZQ0GTVXT5XG9fGWgVQ34W0UqlJD1upgriug7Kmbgi
         dbS5j6irv5/Licmfk1k/KIDvyKcs4y6qJ5WFTkopgyxfDfzkQeHaPS5ue2LmfeuMVXi/
         OaCHKuOywRjC/Mnvfb4M7EFrbqNCGdOcn+iGQHiQPr1QO70XzySEZEGeBAq+kSqRJIjp
         Fneg==
X-Gm-Message-State: AOAM531tS09crHMVoFZndelVRIxzRWXtX90+kLxuxCCY4o0QGmES4TmN
        RhWJuoCgDFt/Z6Aio+1Yzzyy3oV7
X-Google-Smtp-Source: ABdhPJxbtBc1/9L1itl0MKKXkwWZRCKZEklNHGWWBoS0ZfAk2tPhh49YBZkIM8ohdCl1Xc18PPpfQg==
X-Received: by 2002:a63:2806:: with SMTP id o6mr20070506pgo.328.1591626270711;
        Mon, 08 Jun 2020 07:24:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y23sm6174354pgc.78.2020.06.08.07.24.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 07:24:29 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: [PATCH] hwmon: (bt1-pvt) Mark is_visible functions static
Date:   Mon,  8 Jun 2020 07:24:26 -0700
Message-Id: <20200608142426.46955-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

0-day reports:

drivers/hwmon/bt1-pvt.c:303:16: warning:
	no previous declaration for 'pvt_limit_is_visible'
drivers/hwmon/bt1-pvt.c:308:16: warning:
	no previous declaration for 'pvt_alarm_is_visible'

Declare both functions static.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 87976ce2825d("hwmon: Add Baikal-T1 PVT sensor driver")
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/bt1-pvt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index 8709b3f54086..94698cae0497 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -300,12 +300,12 @@ static irqreturn_t pvt_soft_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
+static inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
 {
 	return 0644;
 }
 
-inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
+static inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
 {
 	return 0444;
 }
@@ -462,12 +462,12 @@ static irqreturn_t pvt_hard_isr(int irq, void *data)
 
 #define pvt_soft_isr NULL
 
-inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
+static inline umode_t pvt_limit_is_visible(enum pvt_sensor_type type)
 {
 	return 0;
 }
 
-inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
+static inline umode_t pvt_alarm_is_visible(enum pvt_sensor_type type)
 {
 	return 0;
 }
-- 
2.17.1

