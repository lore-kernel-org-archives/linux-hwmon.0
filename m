Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3223C4361B
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Dec 2020 18:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8ED4225A9
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Dec 2020 18:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgLOSeN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Dec 2020 13:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24609 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731137AbgLOSeM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Dec 2020 13:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608057165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=V0mOKUC1c9jIdmBHrE2UTrYyCPIaALN4ciYRI/jsXN4=;
        b=TzvsO85l2m6SITXAHqTbsA3sztrVTZwuA6QSLnc4s9otpnNjt5wRzGffGm9S96Na1ey/1h
        FQkcYKmJ1Q9KLfGftUazgYlq17BbiWsxZIK32dfw0fTqXsEo6fmtMLIJm6H0Ze1sKFIHhd
        RDy4CofcaWX0nNvH1u3tUvd0tJTURSw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-5qLk8qnfN32HMgK7Ztf0fA-1; Tue, 15 Dec 2020 13:32:44 -0500
X-MC-Unique: 5qLk8qnfN32HMgK7Ztf0fA-1
Received: by mail-qk1-f198.google.com with SMTP id g26so8136324qkk.13
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 10:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0mOKUC1c9jIdmBHrE2UTrYyCPIaALN4ciYRI/jsXN4=;
        b=szEnT69tYa0/+Jp93wPzSpW/Rm3J1wayu1XMDinKftT71+wkqtZBbieuht/Q5ufTWi
         H0GfKIzO3M9do042CAd/Clm8EU7Gk9zzqr/mjjCiwkUUPdlRBQlWIc0CboomfOsJ24cH
         GlibnlwPzvohBgGOyvhe+wusVA+J8WzuR48zvYat6CfVCk/hRRmRA3i3Hv72j+0SctcY
         mfgRBSfgWvpUqkujbT/ksANH128NZyhY2aa4zPCrYvw9sUfshLJslTaUWsyF04IYt0/w
         JNtRRKqDayPhbGKNrvCkb++34kAS1SS9RulbvXmfEzNGviMN5K+oDEFcRdzJKgbdJSfN
         F5LQ==
X-Gm-Message-State: AOAM531lW35cp9g5OYMuddLBaJ3smbtH0dDtiznyc2rwLFtxNJr8/+Ve
        J5QVIrGHJlxGRulK6pYoMJts+lAgMBReQN6gZiRlRg13kfaB3gFIBjGZd/pGfBrT9UfnmaHlbzt
        Nm1kEumNtStl+PaJptglzfU4=
X-Received: by 2002:a37:a309:: with SMTP id m9mr39408174qke.477.1608057163626;
        Tue, 15 Dec 2020 10:32:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc5XN+2gohiXP7OSbNvjdyFmfV9/NJ44oCCK6YQmcFB2K7lGIoz9MSF/0FEVZdBB17AZAOCQ==
X-Received: by 2002:a37:a309:: with SMTP id m9mr39408149qke.477.1608057163421;
        Tue, 15 Dec 2020 10:32:43 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 6sm17779099qko.3.2020.12.15.10.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 10:32:42 -0800 (PST)
From:   trix@redhat.com
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] hwmon: remove h from printk format specifier
Date:   Tue, 15 Dec 2020 10:32:37 -0800
Message-Id: <20201215183237.2071770-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hwmon/smsc47m1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index b637836b58a1..37531b5c8254 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -682,7 +682,7 @@ static int __init smsc47m1_handle_resources(unsigned short address,
 			/* Request the resources */
 			if (!devm_request_region(dev, start, len, DRVNAME)) {
 				dev_err(dev,
-					"Region 0x%hx-0x%hx already in use!\n",
+					"Region 0x%x-0x%x already in use!\n",
 					start, start + len);
 				return -EBUSY;
 			}
-- 
2.27.0

