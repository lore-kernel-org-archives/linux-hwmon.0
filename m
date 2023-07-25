Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F594C001E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 12:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbjGYMyn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 08:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbjGYMyi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 08:54:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6AF21992
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:54:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso827860e87.1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690289672; x=1690894472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Puz3ztq+s5PMQIYSFqmtMplo+slwUgkmSW9O9rbzaQ=;
        b=eOX71mI8ivbPxd47f1eV4r7XwztgvsB/VUt6UiU2TRTzqzn/nnNc5dYBCQ7YDwpwcw
         4HBgy5/tA3pr37dG8a8OX60bkNrHIpBqrsLUJw4zccm3bqKV2Lw5vm4RGbwODH7N6Her
         yiQtddh86DliiC3qSQhIR9Y1vNaY5Gt5CLb1vHwHV9UgJ9kjuPH05HuPeM57qIhIGKAq
         zs6T3wIBWTz3h8E8FwJ6FFDuoTE9KEJ0yZQQZFzZBrKjF656WagqNBNREbD7l8OcgZj0
         jibS2zS5edmrdiyj3AmKMHjH7JmAAn9J894UFTXdqgXFhPnzh3Fk9sKgZqOyodCVziQL
         W9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690289672; x=1690894472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Puz3ztq+s5PMQIYSFqmtMplo+slwUgkmSW9O9rbzaQ=;
        b=B+1m4s9+lo8GCDi9mzv05A4NUOtUhta0ivP90/Bl/FxoYEDzgcQ+AVEtlgIpfBs5Kp
         KbpiG7aktVJjNqELi1/tBoC7VutQtGAGmLFv9leuhRs3SYp6uZCeusWSR5+elgPJAMxI
         sCgpXsBAqoZQEWUsG8YMFSO1XzCqpdGso98b/9bbUQm+xe3oxUWkvb8r4/Nw0lDg164i
         clHWHdCbxYNQ3A3e66DK7STKSBxc2NIsUjEajLJJl40v8SeeCinBOYCaqS/PS/rSWhue
         xADU43L70FjU8VatDwhAxiTnIeN1NL+z9mVZNj44ih0IB3rh3nVfyjhX43b4QF9QYkPf
         Kq3Q==
X-Gm-Message-State: ABy/qLZDq3YkPU1xy6J3Uw2FXCAjZi+X4+2FF+pO1/swJNtqf4AYitR0
        YQnzDelQG+ORisHWZ4tAubhZPw==
X-Google-Smtp-Source: APBJJlHZSFk1xstmzkc7CIM9TH+3PcYrQLyXquXF3/qVEGqAj4CIMfMvldYlGO/C3XlsJKxIowWyAQ==
X-Received: by 2002:ac2:4d96:0:b0:4fb:7532:35aa with SMTP id g22-20020ac24d96000000b004fb753235aamr7085307lfe.28.1690289671914;
        Tue, 25 Jul 2023 05:54:31 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402064b00b0051dfa2e30b2sm7516682edx.9.2023.07.25.05.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 05:54:31 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pmbus_core: Refactor pmbus_is_enabled function
Date:   Tue, 25 Jul 2023 14:54:25 +0200
Message-ID: <20230725125428.3966803-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Refactor the pmbus_is_enabled() function to return the raw status
without any additional processing as its already done in
_pmbus_is_enabled function.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index fa06325f5a7c..42fb7286805b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2768,7 +2768,7 @@ static int __maybe_unused pmbus_is_enabled(struct device *dev, u8 page)
 	ret = _pmbus_is_enabled(dev, page);
 	mutex_unlock(&data->update_lock);
 
-	return !!(ret & PB_OPERATION_CONTROL_ON);
+	return ret;
 }
 
 #define to_dev_attr(_dev_attr) \

base-commit: 55612007f16b5d7b1fb83a7b0f5bb686829db7c7
-- 
2.41.0

