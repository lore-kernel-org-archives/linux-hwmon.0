Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF785C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbiEYHhW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242165AbiEYHhV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:21 -0400
Received: from smtpo52.interia.pl (smtpo52.interia.pl [217.74.67.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B26A5EBDF
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:19 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:16 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 3/7] hwmon: (lm90) Add compatible entry for adt7481
Date:   Wed, 25 May 2022 09:36:53 +0200
Message-Id: <20220525073657.573327-4-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464238;
        bh=Cu9DSzf+D/f0WnNOpnyIQms3Cua41iKyM7IrQRi/yB0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=XTA5AZZm4nFANIazvXou8SqaitE5sZFkPlVt2416qop4HRfXS8WnWF9PWJRQ0dzyg
         wbV++AShQBIMtMoVm3rgGLT3V4h+W6GtP2z1+IjzCLKNC2+8htSh0VOGmDIZoo2uft
         5UCKtk7epsf0Pgh88Px7eLlkNhcwyvfMsuOT+VHg=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

This will allow binding the driver with the device from the device tree.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 4c25c9ffdfe9..02b211a4e571 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -294,6 +294,10 @@ static const struct of_device_id __maybe_unused lm90_of_match[] = {
 		.compatible = "adi,adt7461a",
 		.data = (void *)adt7461a
 	},
+	{
+		.compatible = "adi,adt7481",
+		.data = (void *)adt7481
+	},
 	{
 		.compatible = "gmt,g781",
 		.data = (void *)g781
-- 
2.36.1

