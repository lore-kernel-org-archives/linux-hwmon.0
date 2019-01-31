Return-Path: <SRS0=50Tr=QH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3768C282DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Jan 2019 22:07:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B31F52087F
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Jan 2019 22:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sweptlaser-com.20150623.gappssmtp.com header.i=@sweptlaser-com.20150623.gappssmtp.com header.b="RVkqA+9X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbfAaWHJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Jan 2019 17:07:09 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:52300 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbfAaWG6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Jan 2019 17:06:58 -0500
Received: by mail-it1-f196.google.com with SMTP id d11so6253047itf.2
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Jan 2019 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Vw245cWn0g5x+EHUeJcq50G2A16G6gSxztuHmTu3Pu4=;
        b=RVkqA+9XmPMxQyaPHIL9zuSx+GXpOFVAmVWtufq+OO6f4AltvKsVonGdL543DfXBlH
         A0tkB+iJmrhEajErDu00dCZ8n0HbvQFdAlIPNP7VOZiUJMxt0EVkT20OahVZ66JsQeuz
         34h52+bj4L+PYZsMRwKvhjZQp8hzTpZIx46yun4VW8sI7Wa/68bB0VKuwD24CSEKBPCt
         xYSzXJbWcHwnAAjgG9s47gcc6dD/ExMXejyTK1783W4h0r+7+pQXEw47/z5E3DhcFDdk
         RqeT6GCq1efACi6gmg46AaGlg+SPGLwf0dySXAEv6HOPO8SKrYR8UJEEIrX6GVCtwYxt
         Fn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Vw245cWn0g5x+EHUeJcq50G2A16G6gSxztuHmTu3Pu4=;
        b=SiGgu/RXGb6fYs7M9Il56cRJnY+heR2yOb8gr2ojykM0wLLk3lTCWc0v9iGHwnxnXf
         p9f7BZlNYWngT55kcumf/O5JEXCAwNx5Pwb9nmpqZB4jJRLX1GYVbodBOPVc7HT4ERl7
         boL2zsSIaqYyHtkFE4BrFrXvNK5mOoPQQOV++rdNeZ5cwEgsTLlkGI3ehh6z7o5/W9VO
         85YIjl8MFeJcZNxOtbO3jyxDV7D6ogbCyi2Z31dDAplZNNDAY/PmjjQR1KklXKNpngHD
         WeeQxmyN2nvfVaapzAYGCGTbriuUMDkIYBO2Toaqhpi8cgccRgXoQtmv/YempcM9W4D9
         6UgA==
X-Gm-Message-State: AJcUukePEwaXzZRiXbdbIAzF6JnaMRkZFwYcuggKuBVS9kJylTBWcOMk
        vFsW2/s4hGcmrZECfAseV5Ckew==
X-Google-Smtp-Source: ALg8bN4YDmDOmsi9TL3GKBcYNKf9BuwV4wLwtRGsuKMGvO7gOsJvWxbUx7zY37jzDFCJGBjFBGfETg==
X-Received: by 2002:a05:660c:4b:: with SMTP id p11mr20478600itk.71.1548972417872;
        Thu, 31 Jan 2019 14:06:57 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id l186sm286439itl.22.2019.01.31.14.06.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 14:06:57 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] hwmon: (lm85) Document the LM96000 as supported
Date:   Thu, 31 Jan 2019 15:06:16 -0700
Message-Id: <20190131220617.15223-3-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190131220617.15223-1-jgebben@sweptlaser.com>
References: <20190131220617.15223-1-jgebben@sweptlaser.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It has been supported as a generic lm85 for quite some time.

Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
---
 Documentation/hwmon/lm85 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/lm85 b/Documentation/hwmon/lm85
index 7c49feaa7..9f3a945d1 100644
--- a/Documentation/hwmon/lm85
+++ b/Documentation/hwmon/lm85
@@ -3,9 +3,13 @@ Kernel driver lm85
 
 Supported chips:
   * National Semiconductor LM85 (B and C versions)
-    Prefix: 'lm85'
+    Prefix: 'lm85b' or 'lm85c'
     Addresses scanned: I2C 0x2c, 0x2d, 0x2e
     Datasheet: http://www.national.com/pf/LM/LM85.html
+  * Texas Instruments LM96000
+    Prefix: 'lm85'
+    Addresses scanned: I2C 0x2c, 0x2d, 0x2e
+    Datasheet: http://www.ti.com/lit/ds/symlink/lm96000.pdf
   * Analog Devices ADM1027
     Prefix: 'adm1027'
     Addresses scanned: I2C 0x2c, 0x2d, 0x2e
-- 
2.17.1

