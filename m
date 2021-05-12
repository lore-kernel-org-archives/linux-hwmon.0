Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B40C433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71B3461176
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242280AbhELX5A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 19:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbhELXof (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 19:44:35 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB76EC061234
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 16:33:49 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id k25so23784455oic.4
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/quYRO7IWfMYjnyg2hx5v9q13zdRmwbX0kLS8Tbrv8k=;
        b=coIt0oIjSQlt9WR0zkElH8lRH2G9GMdp8GcmMxuFX68YZ9vRBVV85c9SgPC7jP7lTc
         UtaBj6DKKbBJYUSPAOGieh/t3IRhX0hLsTLKjYpZZ9LLoltd4HcaDNtF1K8Zf6Vv+7iA
         3ab9KdwaPj6XucD98C5hg28IUoGTCbuR11EFjMRXcJja8f6dNogG72x5r90V+br7tGtY
         3ERPUWPoN4uwTvpBNqT2D9nRLgtwuyDgdj0HNjtHQopAzj2HKaZbaDzPER6qFlNVTSGi
         XOuD7HTCAVmmk+VmbvPtHlMDZ2lqSjo63uktcK82hbwIZxIsrghnq5mdDw+lYIfPTXwn
         6clQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/quYRO7IWfMYjnyg2hx5v9q13zdRmwbX0kLS8Tbrv8k=;
        b=s6A+bKCYDfLJhHxYLRWJx2j2HeU9CF0BNCJDuEqx3TghxBz3S/uZ41KXjqLun/bzoL
         VAESo8aoraESInkG+ZEvE1cGNX632ak2mo8tlPQRrdIqKGpTEGH/NuXiaMELLbOqxLLs
         QRLE5y6xRg1Hvu7RjzexQUVJ+COUqKp9yGoKrI1TOqoIDoX48qrufCWlZtof+hZ0g1DV
         D82/RNfEIE6XJqNwjpkuKRzH8ZVGIn9xetuuMyURcJOm1h6xL+QL3Kq6fzreB/1XupXS
         6I70S6mjDhzJcNVyV7u+sKgq+N2sg844HPggeNiIDvcG+c8qdfosegrmimEjZhegUz6M
         U9ow==
X-Gm-Message-State: AOAM531QjHASGenJpumMqXIifxxVgtHmoFw/EtUyxMaj7+iLuAMnZ7pz
        ay6Wu8rcKfCLwp5gHZNcLBk3YUigrz8=
X-Google-Smtp-Source: ABdhPJw0f+1lN3aHsmlI1Qu6kzdjmbaXNEhsjLKe7L1VrlyFuzmclD23CYaNOHRWyVliv1Zc3vlVVw==
X-Received: by 2002:aca:d18:: with SMTP id 24mr769012oin.56.1620862428952;
        Wed, 12 May 2021 16:33:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w85sm299928oif.42.2021.05.12.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 16:33:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (adm9240) Fix writes into inX_max attributes
Date:   Wed, 12 May 2021 16:33:46 -0700
Message-Id: <20210512233346.2876734-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When converting the driver to use the devm_hwmon_device_register_with_info
API, the wrong register was selected when writing into inX_max attributes.
Fix it.

Fixes: 124b7e34a5a6 ("hwmon: (adm9240) Convert to devm_hwmon_device_register_with_info API")
Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm9240.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 5677263bcf0d..483cd757abd3 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -485,7 +485,7 @@ static int adm9240_in_write(struct device *dev, u32 attr, int channel, long val)
 		reg = ADM9240_REG_IN_MIN(channel);
 		break;
 	case hwmon_in_max:
-		reg = ADM9240_REG_IN(channel);
+		reg = ADM9240_REG_IN_MAX(channel);
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1

