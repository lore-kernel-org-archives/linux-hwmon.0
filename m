Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA20C83F3F
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Aug 2023 19:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347117AbjHaTHl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Aug 2023 15:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243304AbjHaTHk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Aug 2023 15:07:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCB2E6A
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 12:07:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31c73c21113so946935f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Aug 2023 12:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693508855; x=1694113655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=YgkGIGYlJ9HVB/pFuSQOOscp1KV+U9svbao7qCnluSapCh65M7scFRbkYf5mBm1qhG
         /Udh9knmpD2tm6YLb0HTITo6ADClh4h0FDDToeHAhPALI1OFsS9YuQJ84y+cp7sVwYEf
         MbUCAnCYCR2x57ZnHMnuLqdJ6CkbAGXAyYNBAbcPS1W1+LddJMNkx4HuQhFxvqHkNGqN
         KAReW90Z5DhNMIfc0p8j0CGgGBwS+qprI8coqKXSFxtNKppDUXezInXqvpkzZax8EDyt
         nugMVJ0N7j7uQRmPnXJDoBOOdg8RvGtWydpcPWmr5NRqafj0kKwnxPkj66tU0eacGxHC
         3yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693508855; x=1694113655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EsAms/GBsK+1iUec9cOrJls/H2UjnYhAk3txEAwGRk=;
        b=W9Eqvhydx/5nP2lt29c9evMEXdoQKhCbxAJ0rQpcbfLKuIOLO30ze9qIIXkZ9MgQwe
         aDajmYsOs8SHEFw3XgiM+4wXbcAJh3p/uJFa22c+tfO6eYSjuhimiMBjRj9e/B/QhJ6V
         EpO/1lnCKkO0JVufE2PUmFoBWolvlcr0tujSOmqWIu2CXQ049elClSiMRfCxHcR/B/yE
         g4hAmhBvgOLPwvAMvHuYD9qIUSMHCkkxF17YvhDvkpScnBfMPdamHOs2CNu8hhflk4Sw
         Lethtn/Bft5oYin/RqBTPHacwqIvvwhkqdEIsywhz9qgLcjOiDlXcUNhvIsRDYbgL/GI
         tCUw==
X-Gm-Message-State: AOJu0YxPK1eKeAwXGlISYGphbFRVMnt2BGQEP9352ggKSU3NhnsvsoY9
        rMkx4mpGRy0NF70nd+hFvcnXvQ==
X-Google-Smtp-Source: AGHT+IGx0CGQC9l3NfFjNoHUHEDzMqfyTmN4dHA/fP9O3gi3JknNMneG6+M3VBI1hk0CJmGraHLdgw==
X-Received: by 2002:adf:f743:0:b0:317:5849:c2e0 with SMTP id z3-20020adff743000000b003175849c2e0mr303344wrp.9.1693508855659;
        Thu, 31 Aug 2023 12:07:35 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x9-20020adfdd89000000b003196b1bb528sm3058627wrl.64.2023.08.31.12.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 12:07:35 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] hwmon: (pmbus) Add ON_OFF_CONFIG register bits
Date:   Thu, 31 Aug 2023 21:07:28 +0200
Message-ID: <20230831190731.265099-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831190731.265099-1-Naresh.Solanki@9elements.com>
References: <20230831190731.265099-1-Naresh.Solanki@9elements.com>
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

