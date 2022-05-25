Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B13FC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 13:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244581AbiEYN6T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 09:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244543AbiEYN6K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 09:58:10 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1AE9CCAC;
        Wed, 25 May 2022 06:58:09 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id w19-20020a9d6393000000b0060aeb359ca8so10969713otk.6;
        Wed, 25 May 2022 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rCKqXle6qbQe/IsqkcPkNDc9pAVJQLLMF9gxVrNillo=;
        b=MMOiqenKDsaYJpTEKcsULjVgVvfZ3EclXp5/kYdvBODxhGQ7ByFTwqLSMSILyYbD+w
         ttZ/Y0wG4s/5e0VTxmckFILltU6wsgF+qhqHu0sz9ddK3QtPDZ4DIAcFt5kfrD4mRLPl
         NugbqFtPlEH0q9OAMU+naq4DY1ZnyvcYYBnJRxAiPRqpVHyhINR3L4EDQVT7OiunYh4y
         aXWBruOmjU54tz2RMnUKjQIAu6C8O8hvFqIn79/MV4g5oTyVzHPN5xDM1+ePDNo2XYuH
         G1UWc+fyJTRYtOhVhM8+H471EfOcKl0QccX1Sh8o7+Ul5inMaJJpXSnRA+GWFYb+pkvc
         c2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=rCKqXle6qbQe/IsqkcPkNDc9pAVJQLLMF9gxVrNillo=;
        b=4JUqW51s8+ChantkVHBYGHUoHAqz5+bmiRMEtQOaRcHOE4t1/BFe2tJGIJKEgxSbRa
         Tb3VdFLVPvmfDPOgVB6QRdFSuqX9cT2XmOvOUmdTW4Ry6qD00MaD+CFmJvC4Y9Gqdvo5
         NLHE95qzp6voXGYbdTeD+K7FnNXegFtvuJNewGh+NCGA7127R15Avck5ZktFKvtbKXu1
         nxfUjNipJi81+ofRsXN6/1g1wbR4HWI3ZkUtSwk/J9HwQTfkZMpd7lnyvyQ/X4tw0zM+
         EFktWZkPt7Iy0UVwIQQ01R0ntygPgecjWDFMwpF2wHL/mK0bjKtfkFzlOHb62zdTYocQ
         PFuA==
X-Gm-Message-State: AOAM533c9vyv6m+hP0CY6yaJKNgLqDb9IqrIfuunB2gZyGcyUA256Jnv
        KJYACuFk1PcAf5CiTxa6IYYCGPnyWkEGUg==
X-Google-Smtp-Source: ABdhPJwihyfBN8k7mQw7B9ZIppfCIVBljrEHmVYWXkHQiy4N0TD7jAdK2uYvaNt/PVcAOYFkxxFOoQ==
X-Received: by 2002:a9d:6316:0:b0:606:9578:ffe with SMTP id q22-20020a9d6316000000b0060695780ffemr12410732otk.256.1653487088929;
        Wed, 25 May 2022 06:58:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a3-20020a056870b30300b000f1b1645a3esm6049669oao.1.2022.05.25.06.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 06:58:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Slawomir Stepien <sst@poczta.fm>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/40] hwmon: (lm90) Reorder chip enumeration to be in alphabetical order
Date:   Wed, 25 May 2022 06:57:22 -0700
Message-Id: <20220525135758.2944744-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525135758.2944744-1-linux@roeck-us.net>
References: <20220525135758.2944744-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Reorder chip enumeration in alphabetical order to make it easier to
see which chips are supported, and to clarify where to add support
new chip types. No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index b7f5b743c9f5..6728520a21ca 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -113,8 +113,10 @@ static const unsigned short normal_i2c[] = {
 	0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 	0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
 
-enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
-	max6646, w83l771, max6696, sa56004, g781, tmp451, tmp461, max6654 };
+enum chips { adm1032, adt7461, g781, lm86, lm90, lm99,
+	max6646, max6654, max6657, max6659, max6680, max6696,
+	sa56004, tmp451, tmp461, w83l771,
+};
 
 /*
  * The LM90 registers
-- 
2.35.1

