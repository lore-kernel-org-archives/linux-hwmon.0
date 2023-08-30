Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CE3C83F1C
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243213AbjH3SrF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbjH3Kge (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 06:36:34 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006D719A
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 03:36:30 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99357737980so705852866b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693391789; x=1693996589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=IFqN6fcI14SmKLJbSqFU0GfgHP50LPqgXXuffoVNziQ9/tGlC/oEJNsoinbrhqL+oF
         iWEWFt8q/rmG6SwQUv7tqoCuHbuoQUG3JEvDHZx25oAdZEvdPhPkrBbrSJTJ5OL8U6Mn
         q6vSq+0j2N2F2Y2W5wzbVW25oml7jO0nyUFd9Q5ovY3VfYLRtCGDqloWeML+oMyncBJP
         J+KbTxJGn2MYs2K5l0zk4cfJPcPv7XcsDPx/dc0Z62pdpcLB5oH+POO275XQDigET+kA
         idpT7jbrsgp15SpUMQrMp2KQ/PF0mrq2P5wCEqwytiF5gFNcEpK2ldFoTATmAyNMfC/+
         Raew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693391789; x=1693996589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=JfWtQ+fC9cFNbUcSfzQMqXw8WEmxiQJ6wEW33w4mE0VRwRDwLARlfJVx/ZDPMYTCqp
         ADnvLAPsaBTgaAphIRXMo2B2/XpfX+9ejraTWUvYw7BbhAXtZhmXE+KS6o0AtcwRZ9lW
         008212vNfE7RW5C/AIZwucZcP+qqAqpTPMEUo5lzAgMnsdXcW1K/75WByx5+MrcLXRhi
         ChGhzHPsRim3iZkXJnpvzqOSSMzZ7EAyX6Ci2oA7EyyQoEPitrfTsb3GvYc4QD0KNUQt
         kpkVIbtnHRk4qLjzzvQk4JdmysPHXnBvzKQYHLmrkoFlyZ6H64EvSKbAGe4192lrgvxD
         dGlA==
X-Gm-Message-State: AOJu0YyUQOa12JJLxBCYrXF56VONOITZoRpRaAT/oafcCwukWaWdDhqC
        rIA0GqJJIU901ux1Ig5uvRoSN8M3MwsU6u2snGIJeQ==
X-Google-Smtp-Source: AGHT+IE/SnSPHAg/GcOvam5TY1r6/qYU5l+HI0OuRJBzs+e9T7fHkMR8XLJCwn4a61EDkKh4aQ7CKw==
X-Received: by 2002:a17:906:10ca:b0:9a1:f426:bba9 with SMTP id v10-20020a17090610ca00b009a1f426bba9mr1298905ejv.74.1693391789587;
        Wed, 30 Aug 2023 03:36:29 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906354b00b00992bea2e9d2sm7027620eja.62.2023.08.30.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 03:36:29 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] hwmon: (pmbus) Add ON_OFF_CONFIG register bits
Date:   Wed, 30 Aug 2023 12:36:17 +0200
Message-ID: <20230830103620.3611761-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830103620.3611761-1-Naresh.Solanki@9elements.com>
References: <20230830103620.3611761-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add bits found in the ON_OFF_CONFIG register.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b0832a4c690d..7a28bac7f171 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -243,6 +243,15 @@ enum pmbus_regs {
  */
 #define PB_OPERATION_CONTROL_ON		BIT(7)
 
+/*
+ * ON_OFF_CONFIG
+ */
+#define PB_ON_OFF_CONFIG_POWERUP_CONTROL	BIT(4)
+#define PB_ON_OFF_CONFIG_OPERATION_REQ		BIT(3)
+#define PB_ON_OFF_CONFIG_EN_PIN_REQ		BIT(2)
+#define PB_ON_OFF_CONFIG_POLARITY_HIGH		BIT(1)
+#define PB_ON_OFF_CONFIG_TURN_OFF_FAST		BIT(0)
+
 /*
  * WRITE_PROTECT
  */
-- 
2.41.0

