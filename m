Return-Path: <SRS0=CT/L=QE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AB1C282CA
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 00:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FADA2147A
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 00:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJ9trLBO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfA1A0r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Jan 2019 19:26:47 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33155 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfA1A0r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Jan 2019 19:26:47 -0500
Received: by mail-pf1-f195.google.com with SMTP id c123so7216404pfb.0
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Jan 2019 16:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=PNAYdgxiv6/T+WJ/ETqU8OKhb6B2zPq6KLajtAXFha0=;
        b=tJ9trLBOpz33bOQqE/PH7RgRJmT7H6We0YHwz8PUyMFpIqOJor+f7Mwuwmz6gcgWYb
         AH5CzhMhUfWgOz0hpymsrYxF7wijZOcjeEetXMQxyOT+VC4XPDJTpeWo2Q8hU6Pkr+1V
         0u4PaJmpzmJjWKgRxnJe0DugxreNDoSj5/3Bu11g5/QsXY2wZJg5lPwJCohK0f+3qvID
         Rv9rdab7zQpka+LVx2n5vFbNgL8nKuLbUFLkQNJQbP1IZ6ADDeXIcQjyxScjGu96Xh+Q
         A4N1vRXwYO+gIhwZwBzB/xVW4YTs2D59UHRqgQP5qjEqzIFfD7x7DzNm2gMZVBELNp41
         Y0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=PNAYdgxiv6/T+WJ/ETqU8OKhb6B2zPq6KLajtAXFha0=;
        b=gBgSJE4SidG0/P2j4sx2Z24CyEAzfpcs1yFHDUAJlySNGcRuVf1aijLLRan738flbp
         Ga+nC30EigMlgFWJnPTl8jOczGWaPy3zebvRM+T6u56wvS0WLFdgWHsjF+umAPaJE2/g
         6s3fKmG9etWwJPuGoM5U9+TJWAdmFfabB6zY7Oc6iepMROeLWNDU+vQsVFrkzW2zo2Sh
         MNsSYIumxDuAmEqtrK8MBs0lsx2OCs4MEcpTEDY0enKfnIFn/8t7VA5OzLgTYjbOYAEp
         VlLSy56KGHL3JE8tGcmtyOwQeeo3byCvmA6E3ey1kypAnJs34e/G1z9ItkytTwHQAkBL
         jOqg==
X-Gm-Message-State: AJcUukflh8KEKINXIu0v1u/IENvZomJzcXZzaz7eEJnBHVOUGEYPl05v
        fuETEMJoB5onK3dtXD1NZUrQjkzv
X-Google-Smtp-Source: ALg8bN63TvQa2+jFNF3BzfuLglesQ1awII7jMmsfQY8Bn1hyvY96MUCUOWfK4i8RPMIsfoKmidrq7Q==
X-Received: by 2002:a62:6503:: with SMTP id z3mr19324558pfb.169.1548635206565;
        Sun, 27 Jan 2019 16:26:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f67sm47817433pfc.141.2019.01.27.16.26.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 16:26:45 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Siebenmann <cks@cs.toronto.edu>
Subject: [PATCH] hwmon: (nct6775) Fix fan6 detection for NCT6793D
Date:   Sun, 27 Jan 2019 16:26:44 -0800
Message-Id: <1548635204-26474-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit 2d99925a15b6 ("hwmon: (nct6775) Separate fan/pwm configuration
detection for NCT6793D") accidentally removed part of the code detecting
if fan6 is enabled or not. As result, fan6 is no longer detected on Asus
PRIME Z370-A. Restore the missing detection code.

Fixes: 2d99925a15b6 ("hwmon: (nct6775) Separate fan/pwm configuration
	detection for NCT6793D")
Reported-by: Chris Siebenmann <cks@cs.toronto.edu>
Cc: Chris Siebenmann <cks@cs.toronto.edu>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 4adec4ab7d06..59ee01f3d022 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3594,7 +3594,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			fan5pin |= cr1b & BIT(5);
 			fan5pin |= creb & BIT(5);
 
-			fan6pin = creb & BIT(3);
+			fan6pin = !dsw_en && (cr2d & BIT(1));
+			fan6pin |= creb & BIT(3);
 
 			pwm5pin |= cr2d & BIT(7);
 			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
-- 
2.7.4

