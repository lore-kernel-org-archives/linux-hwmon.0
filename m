Return-Path: <SRS0=Wymy=5Q=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCA6C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Mar 2020 23:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3AC220787
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Mar 2020 23:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=autistici.org header.i=@autistici.org header.b="b81fIVXg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbgCaXHE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Mar 2020 19:07:04 -0400
Received: from latitanza.investici.org ([82.94.249.234]:50137 "EHLO
        latitanza.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbgCaXHE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Mar 2020 19:07:04 -0400
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Tue, 31 Mar 2020 19:07:03 EDT
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 3CF54120163;
        Tue, 31 Mar 2020 22:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1585695444;
        bh=EUVPNT4aWgWrg4j90L25aIYTU9A26GlX+O+Qitb1IOA=;
        h=From:To:Cc:Subject:Date:From;
        b=b81fIVXgf+sftvdkV3DQPKqaYQjX/wzNeGmXyoJM4CHmve+kgCQZZMVfFJ3bBPEl5
         CU1Fp57DP2S0K4Ryo4ZbQ7kQ5Yl8GPw4fNDqHwI829R5S5Scu9mGIyQLL6AlOuK9R4
         FAx+qnZKjvPOzWTCfC4gullJf7dcLeBjyiPl/cno=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: mikefender@cryptolab.net) by localhost (Postfix) with ESMTPSA id AB5E612015F;
        Tue, 31 Mar 2020 22:57:23 +0000 (UTC)
From:   Michele Sorcinelli <michelesr@autistici.org>
To:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Michele Sorcinelli <michelesr@autistici.org>
Subject: [PATCH] drivers/hwmon/dell-smm-hwmon.c: fix blank line
Date:   Tue, 31 Mar 2020 23:57:08 +0100
Message-Id: <20200331225708.52822-1-michelesr@autistici.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix missing blank line after declaration: reported by checkpatch.pl

There are other missing blank lines reported in the declaration of
struct smm_regs fields (line 120) but they are probably false positives
so I don't think they need to be changed.

Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
---
 drivers/hwmon/dell-smm-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index ab719d372b0d..7b61b613aff6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1276,6 +1276,7 @@ static int __init i8k_probe(void)
 	id = dmi_first_match(i8k_dmi_table);
 	if (id && id->driver_data) {
 		const struct i8k_config_data *conf = id->driver_data;
+
 		if (!fan_mult && conf->fan_mult)
 			fan_mult = conf->fan_mult;
 		if (!fan_max && conf->fan_max)
-- 
2.26.0

