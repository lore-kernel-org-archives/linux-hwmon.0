Return-Path: <SRS0=CT/L=QE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C0AC282C8
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 17:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA96A21741
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 17:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY7gN3W1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732267AbfA1RCK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jan 2019 12:02:10 -0500
Received: from mail-it1-f171.google.com ([209.85.166.171]:33761 "EHLO
        mail-it1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbfA1RCJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jan 2019 12:02:09 -0500
Received: by mail-it1-f171.google.com with SMTP id m8so11446014itk.0
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jan 2019 09:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=161vU+penShdsybBNDzJb2MJQ7yf7zHsTm1ycQGxzBA=;
        b=UY7gN3W19I+XwafRIRgiQtaOKg4WOg0unYdiABW0YVDAt4TVNBgFxtdcrx4ud7XchT
         dpAC4O/TUgsizyq7BnkehiR1HnwQ2O3DKKAI2Z2pHORFr21m/NpuZqpMviwTsPDBJsSc
         FfX5NUzABj1ZivgF7u5xbQnaPoTD4SwR4Y1/PPD5HVJb6FWx+t88MXXyNo22NZ6kT2Rg
         f+09S1APR3DHX0IbfV9jyY2/75cSvqKwbvcldAzvsPVQdoRb5CLFSQnnB1qEAMYYU9Yp
         HQUgiyfq400dC0aGbYy4AXMMO1oytgBPfk7BVx/sw+PUcDONiqxAO7pOliuTUrteABQv
         xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=161vU+penShdsybBNDzJb2MJQ7yf7zHsTm1ycQGxzBA=;
        b=pjpZs3LtHXWSQGCt/+lTT0jglv8ACxxGY+CIKa7WeaNYLIzY9H4Ims2RMAIPRwscGW
         9bGJap5pbG/yd7780TzevislLZn+gwkAkMa+4hh18dHMJhkRjwd+ScIbFDIIjSwDCdpL
         RfPZydNClpKjpqhrCcC+HO5FWDNzi4MYl4nIslv0rH0KIVMbn1f8IjeDszsK/mwjf/uq
         FUGV5lBYzymxGUNjeyHtVZEqRDjhez5w3vHRJ/acAvJigTdxZbtzIBOjro77AnErisqr
         3yKLv+pb+wz+I8HmM7ItPeT4D9+NllSFZomZSd0eoykxKmf/ZzM72H+AlEmboFpGHyf3
         Z9qw==
X-Gm-Message-State: AJcUukfZeKftzp6oMPxijqLvDErlFPYqeot0DTguTsYFCW8WXQgsAvkT
        tcr5+p89YKkzEQKu9doc8eWNS27J
X-Google-Smtp-Source: ALg8bN7VY/bJyguynObVM0OHuwZAG+C0hZP8/Ll9ulpxdvGEkdYTYv5n0EV9Wu68HtJ/E35WvUP4Kg==
X-Received: by 2002:a24:385:: with SMTP id e127mr10135474ite.32.1548694928077;
        Mon, 28 Jan 2019 09:02:08 -0800 (PST)
Received: from localhost.localdomain ([24.114.84.177])
        by smtp.gmail.com with ESMTPSA id v74sm18331962ita.27.2019.01.28.09.02.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 09:02:07 -0800 (PST)
From:   Matt Wilbur <wilburm@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Matt Wilbur <wilburm@gmail.com>
Subject: [PATCH 1/1] Fix swapped coeffs for LM5066 and LM5066i iin
Date:   Mon, 28 Jan 2019 12:00:34 -0500
Message-Id: <20190128170034.24348-2-wilburm@gmail.com>
X-Mailer: git-send-email 2.20.1.309.g16a465bc01
In-Reply-To: <20190128170034.24348-1-wilburm@gmail.com>
References: <20190128170034.24348-1-wilburm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

---
 drivers/hwmon/pmbus/lm25066.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 53db78753a0d..9d917b5f0a81 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -156,11 +156,11 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_CURRENT_IN] = {
-			.m = 10753,
+			.m = 5405,
 			.R = -2,
 		},
 		[PSC_CURRENT_IN_L] = {
-			.m = 5405,
+			.m = 10753,
 			.R = -2,
 		},
 		[PSC_POWER] = {
@@ -197,13 +197,13 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
 			.R = -2,
 		},
 		[PSC_POWER] = {
-			.m = 1701,
-			.b = -4000,
+			.m = 861,
+			.b = -965,
 			.R = -3,
 		},
 		[PSC_POWER_L] = {
-			.m = 861,
-			.b = -965,
+			.m = 1701,
+			.b = -4000,
 			.R = -3,
 		},
 		[PSC_TEMPERATURE] = {
-- 
2.17.1

