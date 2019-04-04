Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E0CC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 320FB2082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jmv6K8SY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfDDP7K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:10 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36235 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:09 -0400
Received: by mail-pg1-f195.google.com with SMTP id 85so1459509pgc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d/piTmbylBz58QXJSawYOav7esMA/qeXD+Ab9b+jvFo=;
        b=Jmv6K8SYkqgiIPzamZt4+pRdmlL7hV80lwHJLVF7P02ThcnyL43I2xkOjTARpsunkr
         ua9SyEd2SpkHxh3GvqAJ85eOk/QldihDSM7jd3HkDD/KV83TOGifnn2NFUYN6xebvMag
         n+sLnvA5R4Eq+qdJR8z3vmDGD/hV1Y2MmX2lmeBM66w1F5oi+Cq4RPgqjt36oHs/FQUs
         J2m6oy1IdtFp/dQ/6R+wzJezXGKNeCSzohpeesJrEz0K5tFf21gX5RK4N5vQGqxNiZZ6
         EOXSfcXdgJ33r9RDkSXbgpIopuHfe4Z790ZkGyVinbAxaJeDByYOuvorBBNlonXHOk+A
         WJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=d/piTmbylBz58QXJSawYOav7esMA/qeXD+Ab9b+jvFo=;
        b=nMKDFFGhrB5NggbEuBV+V2f/HlkTmkLdVClbPUiDjRTNKTo0cXLpvqr0r8lDSvViYJ
         0hbHN12J/+K4Fsqo/E8dBGjZYIE95Jg2+qGEdIi0Ofs29lzTLUMvwbYFmu3BsdjuKqT2
         KkNQkZJ26VUkuixaLhle3tAExCV4yf1S76i3BmvA+28UNMUuYmlfb0hHxgSvxFaMNyhy
         yjsxMFw64VX8A6L4xuF7tHaXqWjtE/efBL3WgB72deqvbVeaMSl1fET+DN5MUvjTkPWq
         6GaSi9213eZ+F0+dXMrQic9mioeLrzVwvGABBHevrwqpqeJ6Y/J2IGGUMZ7sV9qzhdJQ
         LAtw==
X-Gm-Message-State: APjAAAUsrBYEcVwll7LPjEdqhDHZy86gMHXMKRdnS6G0q36cagq1LOp4
        lCG5GoyiEFx5oCVPX687ZSNRvds4
X-Google-Smtp-Source: APXvYqx5zgSRUZ+Y1OMFfG3NtHM81oDHCk2WwCL5zyHJq1S3EpH2qTLt/KimQr05IQ/cAD5GeJRU3w==
X-Received: by 2002:a62:121c:: with SMTP id a28mr6719949pfj.58.1554393548983;
        Thu, 04 Apr 2019 08:59:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e126sm33075770pfh.35.2019.04.04.08.59.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:08 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 21/24] hwmon: (tmp421) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:33 -0700
Message-Id: <1554393516-30316-21-git-send-email-linux@roeck-us.net>
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

The following build warning is seen if CONFIG_OF is disabled.

drivers/hwmon/tmp421.c:73:34: warning:
	‘tmp421_of_match’ defined but not used

Mark tmp421_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp421.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 2732a71f3b39..5e63010dd3a0 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -70,7 +70,7 @@ static const struct i2c_device_id tmp421_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp421_id);
 
-static const struct of_device_id tmp421_of_match[] = {
+static const struct of_device_id __maybe_unused tmp421_of_match[] = {
 	{
 		.compatible = "ti,tmp421",
 		.data = (void *)2
-- 
2.7.4

