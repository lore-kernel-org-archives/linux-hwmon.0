Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B31DC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6898E20855
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWOPK1b/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfDDP6y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:54 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35587 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfDDP6x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so1397103plp.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LV0wxpIO94wgjhBdv1i+k4CyM74a5tRCfa6Gfh1SNNg=;
        b=oWOPK1b/33ER7Z0Ft6t6bCwWYalMPQDmwzY+QXToVDFvaiv7Gx+WSON34fI1iD55qo
         Y/ip8SvwJMf6NhWYEcER92NBnoL7wit/pdY8fOrRsLTWg9h5qHG4pD6cLWtbmVvujkf8
         urhDAt7N/K+vIkYD58ffHPNltXwRng+jcMIrPzteywfNzx4EMIpKgR/vrXYxKduaUKma
         sz0icbuW8tU4HWtrtAnBzTFpwHR5nRXheDq5N30hC3mAVLzNuBmUaSg0g9FUrKUq+ad+
         dTgURSr/gepClqbqoTh1OWRBTmOT4WOAG3OuSmSvzfizMeRY8ey4+kbzJbSwm9MqaEhc
         lGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LV0wxpIO94wgjhBdv1i+k4CyM74a5tRCfa6Gfh1SNNg=;
        b=nxVuMp+CssXNEDot+ivI1apgwr/8Y97GvwU/jeio+IJUMqSjGZyBOMj8OM1ZQ9Ttfj
         Cj806RBLALk44wYnfKDF3dvmyJC9c/yPHlhPd+7biV+Gu0rxFsoaRbYZUJ88CtrIrDhj
         GPQh03N5fgYqL46aafR+rJJBhpRdUsFVUwVCovU1gfoUglwe8A5c++PLFTar0/eaFXdj
         pzef5P2JvGH4YK/784nF4kuRxE7m9YZaGtGPSwI1KrdCeLg2sB/JTeyHmHc9jnWtIuth
         XMFJil2oMwiy2a2CcWnZrs0Ck7PwWiX8Gs/IzjSlFzCxl5cfTebAz8jPFGqqBQy9iXtz
         kK6A==
X-Gm-Message-State: APjAAAV0YSZ712h2FrhnGGUFlAmu/JVsM0CX65qEiPoHR/GXNOneBEWd
        /v+z1nxSGR3rvOorXxq02flvdkaY
X-Google-Smtp-Source: APXvYqyN0+WvLO5IWIJVGgOmD1TI8f6nrakdlajDz/3o6H7jQQpe9R33/fP17vSR1J8MzOrMGtT0dQ==
X-Received: by 2002:a17:902:ba8b:: with SMTP id k11mr7410906pls.40.1554393532198;
        Thu, 04 Apr 2019 08:58:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm26313259pgh.53.2019.04.04.08.58.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:51 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/24] hwmon: (ads1015) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:21 -0700
Message-Id: <1554393516-30316-9-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/ads1015.c:310:34: warning:
	‘ads1015_of_match’ defined but not used

Marking ads1015_of_match as __maybe_unused fixes the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ads1015.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
index c21b0529adb2..412ab7015d75 100644
--- a/drivers/hwmon/ads1015.c
+++ b/drivers/hwmon/ads1015.c
@@ -307,7 +307,7 @@ static const struct i2c_device_id ads1015_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ads1015_id);
 
-static const struct of_device_id ads1015_of_match[] = {
+static const struct of_device_id __maybe_unused ads1015_of_match[] = {
 	{
 		.compatible = "ti,ads1015",
 		.data = (void *)ads1015
-- 
2.7.4

