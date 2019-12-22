Return-Path: <SRS0=7+HN=2M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51891C2D0D5
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Dec 2019 14:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 290A420665
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Dec 2019 14:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tkSXv1GG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfLVOLA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:11:00 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44504 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfLVOK7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Dec 2019 09:10:59 -0500
Received: by mail-pl1-f194.google.com with SMTP id az3so6130245plb.11;
        Sun, 22 Dec 2019 06:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XihcnFBU6FZmO4PC7ivBARUp1VA4JLYIXN/CcgXN5JI=;
        b=tkSXv1GGC/QBRTxkn6ijWvKywnmM9gAe6Q/6rBHjuJv75QYveU9Qgc6BXOVV1dX2PU
         QbRWicGO7xssOOwJWnrK2Oc2UgMzLFicli04pKLPVBTU7bMqV0BetRRe31nC4O9FvAAy
         QUxyCmhhsqWvZCzmLGwlR5ETwA8Z+r9NFImcnSNamLxtoAgNjpxR7AduFmzRP7m9t2Yu
         v2uSPpzgAvQY4TVNkifuqo46JUYHTxMsvTj9OcmsGfGeUyuLhrJwi/b0wMnEoSYD4b83
         yFqQBY6POoOoPjva4znLqqyD4opH5hTg9p4LOGLcvyRNoO2hUgNetozQBf+0reutyjc5
         zWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XihcnFBU6FZmO4PC7ivBARUp1VA4JLYIXN/CcgXN5JI=;
        b=YFNTr0KF0RtDspkpoJbT5tx+oCIX/2t9j9MKPV8utCmGdz0vMh7m0l+n2gO2qqJqkb
         YZZPb3cQrkXW2ntSBicYj9Pm0taiowYNBNdlQl3ozUrXEycmxIrldLIVwAuccyWzm9tt
         ynXPCewGtURh4Ty/U97Uc6SO/zWG4rH0XsY6B9KL5pmiLZdwQX6IHghAssPkVn6/gcCt
         xWO306yRBlGenFfbKY464ZCLutBkeOnjhoY3/u6dUifq9Nb8ZEZjc3sgB7LTSpPaSiar
         Ih7nIWi5ftVUxF0R9EzhX8fnxDjtkLUPxMuBlct0bEgkq0CLixy2E0WJwGM0Wu3+f/Eu
         rDGA==
X-Gm-Message-State: APjAAAVJ77Fn7ksHGtH1Sbtzn+lAqBU+AtN8UvO9GfjVzsCrxvbvU6Bo
        h2zUU/KxcyszIFwLq9R0V2MSeH8DqV8=
X-Google-Smtp-Source: APXvYqzQNqicTdivACoxIrkqokJ4mHcUmIQDmZ3DW8/eB+xfBg3IBsjQL8MZeFkYhYcfMCsmL0g6uA==
X-Received: by 2002:a17:902:d70d:: with SMTP id w13mr8834137ply.113.1577023858854;
        Sun, 22 Dec 2019 06:10:58 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id x33sm18320073pga.86.2019.12.22.06.10.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 22 Dec 2019 06:10:58 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] dt-bindings: hwmon: (pwm-fan) add disable-state-shutdown property
Date:   Sun, 22 Dec 2019 23:10:23 +0900
Message-Id: <1577023823-9615-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
References: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document new disable-state-shutdown property that is introduced in case
someone wants to stop the fun running when shutting down the system.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Kamil Debski <kamil@wypas.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index 41b7676..1e25787 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -18,6 +18,8 @@ Optional properties:
 			  an integer (default is 2 interrupts per revolution).
 			  The value must be greater than zero.
 
+- disable-state-shutdown: Disable the state of the PWM on shutdown.
+
 Example:
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-- 
2.7.4

