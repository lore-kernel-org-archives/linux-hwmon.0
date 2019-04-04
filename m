Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21121C4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2BB32082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i88qiZmk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbfDDP7I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37343 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:08 -0400
Received: by mail-pf1-f195.google.com with SMTP id 8so1588376pfr.4
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVJaFuGJGdTP1kGf15uzKs35wiJWg5aguzfABsDrbjQ=;
        b=i88qiZmkLJx/CjYRCiPxnJH+3mGQuRoaQgbHz8caA2RNndRhKhT25cx303D315oDHh
         AMf+DXoIKpqZwBGli7Jj1Ru9MNb/xbrOpyiEhjJzFEYf/faNFBpZhNR1OPYf4y6GcabV
         RaQAL51gvUzy1n4weKU28htSmMcamcSeV4hZmma+cmjXHm7PBpqtO2ZKArZ17WtDVvsc
         EjTMckkBHJH8iHqGmWSWwPFdrIB08pDcPizDg6Ov91mXuFrLBDoA51YHIRCfIkXZtpxL
         4/AoS6Gyc11HYFmHjvhoXskkVxXXhauOhUyiAdnP3uWqA8jyn2n2qPlZE9bqM9q7HJXa
         CSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pVJaFuGJGdTP1kGf15uzKs35wiJWg5aguzfABsDrbjQ=;
        b=Jr6PSxAbiAiyU4zY2+t/bY6QfS7OtbEMxMFK8D29hzGt2AvHtocrDC73OlA4t769se
         ZbSLpzrosZ/FfTJNYyAqflug6cTTVtMLZPar+ydQMum0i6biWrLO8lTRggDMWzW4pMgS
         Eo4M7Ld34RG1UeCJAMcS5tyMsfOc2shNzXJkh0/nuyyKMI+pCUElQjpdGfij5Yb6g+Pa
         Yhrmsrwg5bj9W/nIZ3LIPby6nfz2rEKQp6mH9i2Gbpjxx3JN387Hlw+e45PewvRzuzNY
         M8Jn7Ufwjtt8WeHLz168+9qsSKHmPOSK844Fuq4VADOZISdOVvXF6gLryX6HoZgS9OQw
         Z1mA==
X-Gm-Message-State: APjAAAUlD9MSyTzow9lCjk/Uo6f9PsyF3gQ63x+iuyiny3QnHTKoDJ00
        qpDeJt1B1xN3+3T89JltrdtMdBJg
X-Google-Smtp-Source: APXvYqwOJ7AQR9f63a2oUHOJ/3WtgxxyqoLs7AN+1RxtVvPcE9YOu5bbBMBkKvOgYB35L761BkG+eg==
X-Received: by 2002:a62:ab13:: with SMTP id p19mr6803100pff.131.1554393547648;
        Thu, 04 Apr 2019 08:59:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r24sm8657472pfd.120.2019.04.04.08.59.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:07 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 20/24] hwmon: (stts751) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:32 -0700
Message-Id: <1554393516-30316-20-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/stts751.c:88:34: warning:
	‘stts751_of_match’ defined but not used

Mark stts751_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/stts751.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 90b60297f2f7..f670796b609a 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -85,7 +85,7 @@ static const struct i2c_device_id stts751_id[] = {
 	{ }
 };
 
-static const struct of_device_id stts751_of_match[] = {
+static const struct of_device_id __maybe_unused stts751_of_match[] = {
 	{ .compatible = "stts751" },
 	{ },
 };
-- 
2.7.4

