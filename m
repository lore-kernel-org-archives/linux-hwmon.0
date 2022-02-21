Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CD3C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 11:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355975AbiBULVr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 06:21:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356143AbiBULUd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 06:20:33 -0500
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB0EBFD;
        Mon, 21 Feb 2022 03:10:19 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4K2KMt2rCSz9sNq;
        Mon, 21 Feb 2022 12:10:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1645441816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xNUFNxKWHKbWr0EwyJqT3Z9MfYdoa38UoM5TsJ85ejU=;
        b=PmGbNw1z3YDza6ab7Uajm4PuJYZv2NNYEoXs3p+AsvflTUBxcgt/Judnu1EYPD2/lY+GMJ
        6pzvTLNxF0qRQkLI/ZJufu253VNu4xoLZxfyZQ88mPYBeV332VDgPePs3tqecw9reQ95uy
        VnI86Sw8TCxCLvfck3a0AeV1F754OF3aSfudiAulRM672sQWjB4DA12oUhj7Kf6bR8aVPZ
        b9u+ERnVKS2a9fpCZv7hTyG+kHppyhstKtZCNntf4GhObt+QTvYtHPYCoaQhaKkcW5VCPu
        L+3ysF2EZ7jfw9edAjwhYPWzcYv6Jru8KhqUmQMaxwp6yYLuqj0ahiKay84OnA==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
Subject: [PATCH v2 1/1] hwmon: (pmbus) Add regulator supply into macro
Date:   Mon, 21 Feb 2022 12:09:56 +0100
Message-Id: <58f2ff7b90233fad3d7ae2e9d66d5192e2c1ac01.1645437439.git.sylv@sylv.io>
In-Reply-To: <cover.1645437439.git.sylv@sylv.io>
References: <cover.1645437439.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add regulator supply into PWBUS_REGULATOR macro. This makes it optional
to define a vin-supply in DT. Not defining a supply will add a dummy
regulator supply instead and only cause the following debug output:

```
Looking up vin-supply property in node [...] failed
```

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
---
 drivers/hwmon/pmbus/pmbus.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index e0aa8aa46d8c..38f049d68d32 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -464,6 +464,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
 #define PMBUS_REGULATOR(_name, _id)				\
 	[_id] = {						\
 		.name = (_name # _id),				\
+		.supply_name = "vin",				\
 		.id = (_id),					\
 		.of_match = of_match_ptr(_name # _id),		\
 		.regulators_node = of_match_ptr("regulators"),	\
-- 
2.34.1

