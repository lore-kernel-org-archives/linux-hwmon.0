Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B51AC10F0C
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEE1120855
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pqc2TZ/k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbfDDP6w (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34844 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbfDDP6v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:51 -0400
Received: by mail-pf1-f195.google.com with SMTP id t21so1591924pfe.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t9NbMViduLIiOsmYB5KsQ3ypzfaeRpdfF/BuHoOLFjA=;
        b=Pqc2TZ/keRuSNQKV/uY21JMOA+bvmoa2ATreclWA3tIGIUdzG2mmaUzKRVN259HiPN
         E3XTh6eYvKPBb0US1NTImMddH4jmfKkVt5TlJh20TMbvXqePOMHX53hUyBIWixfdspzd
         zJr1WbzuQd99HXSJfUDa/fg9DrswJrdUoXXKqF29C5h93ys1nXEfDRDpAZ3VZRXPOJHL
         B6rsXpbDQfr4/g+Ht39qirUmCNgZ7oiQD32GwUcmNFKdh4+IZxfxccT1HXX2sYaSAGQ3
         UVu09VNgkLqDw7yU6SjIzabmS1pUV/94WrwoGAWEoz8/+WpEvyPMKWCHigh/WEg2LzKW
         1kPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=t9NbMViduLIiOsmYB5KsQ3ypzfaeRpdfF/BuHoOLFjA=;
        b=m/U+1ez8EDhOA9XkJkyYDdFqpOQiSmXnxOyXeHUMnRifrgwiSTFuOjtZFBSFfWm/ar
         lBwOBuJY68P8UQ+AeIuU7mVmmtxqFYMY+so8u5rgNVKM/hMsaD84OYNM6jCJyF+ZcRxN
         PoNmYb2ksD7eJDU0dDdBd6IIVTjfKXJ4UhEbmtZ2+SFBS8FsW2FeZobL/7JNYVev2BZ+
         ll8HZgBBnT1wUvsv85Gfy8s3XvU265buXLDsZ4X0L4LNYZ9ogoaD+US3P5Mwgf0FDsXA
         a/RczQ3GAdp2AyYWhKFWalk1gWVimYOy9zsZydXN+BeiO6vFYB2iH5kbTJKUkVmzcUUC
         OC1A==
X-Gm-Message-State: APjAAAXoUcYBlpXscZnb170J68gn6OMkdTm+R0GmajPxjp4LowReDBUX
        j9XrLMcIQ0NKr7QAXrDLy2xmLnWe
X-Google-Smtp-Source: APXvYqxfxj3Ym6A/9dyO0UPtaCiLcStH1fxPAhggfdknjTZeGyjJd+U5PIkdQ2bDpzDj1rjeXBwDPQ==
X-Received: by 2002:a62:1d0d:: with SMTP id d13mr6784160pfd.96.1554393530846;
        Thu, 04 Apr 2019 08:58:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f71sm4691869pfc.109.2019.04.04.08.58.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:50 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/24] hwmon: (tmp103) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:20 -0700
Message-Id: <1554393516-30316-8-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/tmp103.c:173:34: warning:
	‘tmp103_of_match’ defined but not used

Marking tmp103_of_match as __maybe_unused fixes the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp103.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
index bda0fdc1eb53..a91726d33da8 100644
--- a/drivers/hwmon/tmp103.c
+++ b/drivers/hwmon/tmp103.c
@@ -170,7 +170,7 @@ static const struct i2c_device_id tmp103_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp103_id);
 
-static const struct of_device_id tmp103_of_match[] = {
+static const struct of_device_id __maybe_unused tmp103_of_match[] = {
 	{ .compatible = "ti,tmp103" },
 	{ },
 };
-- 
2.7.4

