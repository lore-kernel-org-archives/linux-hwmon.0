Return-Path: <SRS0=CT/L=QE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82221C282C8
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 21:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FE732148E
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 21:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="MMbZj+E8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfA1VGw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jan 2019 16:06:52 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35055 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfA1VGv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jan 2019 16:06:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id x85-v6so15577834ljb.2
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jan 2019 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4/teC/9Qj54C/ORjUYkAMrw0bVEH0/K0MoNfCdsOp8=;
        b=MMbZj+E86sYVbn38wtyn4X515VWyzisAqqyGZoMzKHh5J5Ap/rjW/Eay05/kop9kYD
         jkb9Y9k/99GphXwF/RK0xA9FsqwEamOv0LaugYAXABgTQ3yCIOa9qUGYt4YB6nylvaCW
         wzZ3OZNC9mfedBZeCtKilM0bZKro401g9bwo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4/teC/9Qj54C/ORjUYkAMrw0bVEH0/K0MoNfCdsOp8=;
        b=q7ldM3gQgSx9wFqIzuKMj30zP/TpUD2wVRxsf0+1K/ZcJyajFShQQvvN3ICcc0NbeO
         bqz2b17mBsdFUjl2/VjBzE1Z9WmNGMANGx3bnZqMrELLgW5v9XGqxUXkmHKZ6z9+iycj
         6+pSGYrQu/GwF/WBdCWuXlkExrijNI8hwUE2RMHw9o73tqvep7ifQYKk3+q8/q6ZNo/+
         7qvEf+LsYVfgve/1yoQWtJf6xy6WzbvtMW5PkOVl3nrFrXR/hjOWyELo7o0UbzQbDm+W
         1TaIP6Qc0qm6P5c7a8+vNBWVPVOMV3DVWegCHUO38tF1bnBkPBDIQE6xNMZSShUVtWv0
         0hLA==
X-Gm-Message-State: AHQUAua7Jz6PZW/iY9JHvqOapBIPHScKBVVfIArQa9LostARuRCil91O
        mt/YwFAB8pgYnIpZa3dlmIh29g==
X-Google-Smtp-Source: AHgI3IaEc5hPrycJ6rWSnu8i4FMjB+VYxfJssLwy07NSQ4bFh6k7cokc4DtLw3bwuJj4bPCJdG/wAw==
X-Received: by 2002:a2e:1603:: with SMTP id w3-v6mr24219ljd.33.1548709609644;
        Mon, 28 Jan 2019 13:06:49 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se. [213.113.123.174])
        by smtp.gmail.com with ESMTPSA id u15-v6sm3555755lja.63.2019.01.28.13.06.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 13:06:48 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (ad741x) Add DT bindings for Analog Devices AD741x
Date:   Mon, 28 Jan 2019 22:06:36 +0100
Message-Id: <20190128210637.22323-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds device tree bindings for Analog Devices AD741x
as found in Gateway routers.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/hwmon/ad741x.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ad741x.txt b/Documentation/devicetree/bindings/hwmon/ad741x.txt
new file mode 100644
index 000000000000..9102152c8410
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ad741x.txt
@@ -0,0 +1,15 @@
+* AD7416/AD7417/AD7418 Temperature Sensor Device Tree Bindings
+
+Required properties:
+- compatible: one of
+		"adi,ad7416"
+		"adi,ad7417"
+		"adi,ad7418"
+- reg: I2C address
+
+Example:
+
+hwmon@28 {
+	compatible = "adi,ad7418";
+	reg = <0x28>;
+};
-- 
2.20.1

