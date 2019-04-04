Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C1DC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E61282082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4ypB0pQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbfDDP6v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41968 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbfDDP6r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id 188so1577209pfd.8
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X4oMdlhScks0VoJuazfL2u7ZI3kRq8BgVa5PfiHUtsA=;
        b=M4ypB0pQoOg62VheFMC4buJMbVvlHDCqx48gG31+FRIHEVDEi5PAbrTTVi+j2YZbol
         V9QgmfhL0m7ce1NvppSGs5DGBK8g79mkO2lD9y64T9KHACwer8A1882mG4aptDqk3hBw
         IMgSgr4dVEN1WQN533SjR933PPK4XbLIl95GroNPLAeQ/1Y/tgIsQ14OUMBItqeQT/md
         GUQF1Km6tPQddxwoERQsmC5ZzHVJHE6lI1PTWpLgCIP3pKRZZNsUlQE7JirM06TOch/G
         Y1mkvXuYEMhVDx4TAf8sADEoB2VMT9fpMzbL09m3AZxCtZ7nkw2TNjYpKdcNBC/2ey5U
         hXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=X4oMdlhScks0VoJuazfL2u7ZI3kRq8BgVa5PfiHUtsA=;
        b=WPwioiZeEBST1YZlhwXg/ucOPLGaZ4Te9CBg3tszM7tBUp1Bfnuosjh7bxOREA0Ljo
         acsctZgRt5mjnSCoIaxujS4wf1/+DOQ+BDdmaMaZMZuHLnJRWvuEXTe9CIOZWOqRA9Iq
         SFoBqy5CINMKCNsOEiWwp2qYCG2O8zYHvd5OkkO11semLzbX07nwVEwiO+difXG0NDrU
         dSBvtvD68cj2H8QGhUX/zX3naWg+/fTVQbWu3IPwsiyMWoR0DQxXK/QvTQjVN4pBRQ3c
         YuMJUHLu/hFokArb0SQIFY7kH1ZLxv9ed/HmyKqbnDWfxwlmDPLHZtOxZnaWkBUCQGwG
         7Jvg==
X-Gm-Message-State: APjAAAV0uua2G8L4Imovs9c3fbM+JAMIT1uV6oGt8MGzIZCgDdapKPYz
        bXFL6PrcmzvyL01O0wFVDCejOygb
X-Google-Smtp-Source: APXvYqytpoMfOKq0LPaLvq513oOPzSomkcXcMDE9pOLB6nlc+u9EBIAAwyTYDQK+QSx79Wo4i9wOkA==
X-Received: by 2002:a62:ed08:: with SMTP id u8mr6581185pfh.200.1554393526808;
        Thu, 04 Apr 2019 08:58:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g4sm35115171pfm.115.2019.04.04.08.58.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:46 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/24] hwmon: (adc128d818) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:17 -0700
Message-Id: <1554393516-30316-5-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
References: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is observed.

drivers/hwmon/adc128d818.c:524:34: warning:
	‘adc128_of_match’ defined but not used

Mark adc128_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adc128d818.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index ca794bf904de..e640be442dae 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -521,7 +521,7 @@ static const struct i2c_device_id adc128_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adc128_id);
 
-static const struct of_device_id adc128_of_match[] = {
+static const struct of_device_id __maybe_unused adc128_of_match[] = {
 	{ .compatible = "ti,adc128d818" },
 	{ },
 };
-- 
2.7.4

