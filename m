Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4F0C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C4FC60F43
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245352AbhIXLrE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 07:47:04 -0400
Received: from mout.gmx.net ([212.227.15.19]:39705 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343582AbhIXLrE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 07:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632483913;
        bh=vDyU7DrZRdeSoHIK71K1oO/vtC8Lqlh/zJX9FciFbeg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=d+3cEzv58ejbi0+jibeHSdGWGT6Q1HZWpT17Wbu5zUCF/EKyakQRP+Q9OX6fml0/e
         kUo6dUr8f5tjfiYep4S4sHlS9MPqwmhwZFPI1QXccg7C0Fg13CteeBUlPbAJVQ4nqP
         JBSUNxxIjlQDQAuKzU/tifxtLOze1P3g7Sq1duVk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MWzfv-1mMs0e2Yrh-00XJcM; Fri, 24 Sep 2021 13:45:13 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (dell-smm) Remove unnecessary includes
Date:   Fri, 24 Sep 2021 13:45:05 +0200
Message-Id: <20210924114505.20416-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924114505.20416-1-W_Armin@gmx.de>
References: <20210924114505.20416-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wT/aIf1m3yL7kK/FQ+snp0eVaHEOis4lalsN3/tiTOU+rhbTDLW
 fBswRHkZw6USoP4UyI5G/KpBScTuaG1sswNN4v/VlJCbeipnLhMLD9MW8d/jQAGirmGEvCi
 1Phvw7QltEsj6e/JM0QrAxnd/gqraKfmr73gVxuqVQLnEIDnuUEQ6ve/uX06fiCT+AGaMpk
 9Zw7EN5Twb0P0pAHU69rQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vC87fISDJ80=:p3zdNGp0q2DxepBbnP9TtX
 QV3H/kkYCfTglEkOSttng9j0f9HBVkiFlOHkSFEit6nA3WxRQlKGMWKkBo/UPhd/BySKiqr9x
 nrxjuJru9z8jOkJc3cEEamLgGxqntlN+qrm4n29PpPDYoE3V1bqH0G3QDdDz0JovaKUzaXT19
 ziAQS9OjjkJ0A/J60TGClog9CZyysGhPQQEUOPWSiMa8RKOSrIKpsvtYfTkPkp4ItjdylsJib
 1rXPPbFULV8iO9ABItCOhpSIapt2V5arUyQYfol4duiu4hWDT69+ZqPhKJeLO/YfVT3CnGvHP
 iLa0xKWn3hw9mgTQw9vfvsp6HcgsD3hRdRCQPTV3epN88cjL/kfHNF2cVPy9H0Y5AYhtbg/WI
 fnoAbNLXOWNQ+ilz8yqWYEJehGUZ4PxZ0ZcabAA/Ns3yufCJHGNWg7OxTAEYWQ3a+yo5cXQy7
 W6hAIIjPakO+yd9DViqOzuLf9rSZBJhjfzHdXT5Nz8xU1mIQGdTCEZRJKUdXYtlC9DaDmNY/M
 UQSXnhS1CtemIiLuz+LAk07v6FvMXASz7s4N0HeI1cupPIXH6Fa6P9WKcMhmeyw5Q+lEDeT2a
 qUK+W2F20X6+y3pf9uAsYYetns7Rl12W9uHE/AdqYDM0zLYY7jaa9FhSkvAPgaBFk+2VLINV8
 njacGMiJrhawKf7FWuyxGFj2xYyEgjlLP8Xqw5QwziQOHInNjIAgbt2ZV47tZPHeGyAqqhwNe
 MsVB4stqhydptzbWpWcUItLryM72gWWY/XK/LYvFiWNWywVIpIrDp7pSC+2kMlvl05/K68H2h
 /frwS2HlSrC405ZZkJjatNLSQPZevdeTfdxZ6m9bOZkMXa8BOGFBDA83POMye9pY85apxLN8f
 648d2dNtkVV1tQAak0WQyRT4BKaeKhiwehLk2J3+RH8iCM5VWILpV2aiy+qKk8n5KJy18BQyT
 aXa+ApcsonmEQuUNUTWwTtUnsJbcCas0JYhSStw64M6ZgrxPWXCoH+0EcoaXHY9xFSBE8VgeD
 a/0WJSoiI5cOsy3lNKLw8o1YmPnycdeN5yK2uYQdsvG9pjDddynnQzpFA6y+twr8MgT8dtrvs
 kXa62R6E9Fcbac=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

sched.h and io.h are not used anywhere in dell-smm-hwmon.c.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index d7d8da4a63db..30be7e5574a3 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -26,8 +26,6 @@
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
 #include <linux/uaccess.h>
-#include <linux/io.h>
-#include <linux/sched.h>
 #include <linux/ctype.h>
 #include <linux/smp.h>

=2D-
2.20.1

