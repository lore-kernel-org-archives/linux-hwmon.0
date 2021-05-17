Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA221C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 06:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79B9260C40
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 06:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhEQGnb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 May 2021 02:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhEQGna (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 02:43:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18346C061573
        for <linux-hwmon@vger.kernel.org>; Sun, 16 May 2021 23:42:14 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ot16so1166527pjb.3
        for <linux-hwmon@vger.kernel.org>; Sun, 16 May 2021 23:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XebFSQtsLSbUYiwWv6433OCYgJYn3WFvSwpxSR9Ko2E=;
        b=hOG559ErA0l7Yc7YBKDMywYSfF/057ytuOPUOfQCeWSsi7eV/goCNHNVnDj/zSF/nZ
         Nzv9q5eXBryufjy9ztA8EzYy/O8UnwzaFgxyEEZiAKeqanIUluRlf5T9GxHbLPe+D/0m
         SygsHsEZTSFB6JfptFSPnuQlBTBAkq514fmLf9OQWAKL1SZzW55e9xhv89pkc70ZGEZF
         gfn+Z6zUvsf2R0DKLhdgq6gWQhnI5aR1fzk1VV3aPtiDWVGGcCHTqZ0h/gW2iH8y6ymu
         pruonZIumj7cbWJpGtLYdQs1s0EM7CEdRTATo5pMgGtVKcXc/ZxdncqLXBYKxoPo98Tr
         SDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XebFSQtsLSbUYiwWv6433OCYgJYn3WFvSwpxSR9Ko2E=;
        b=DM540SmuQyNWndw4wbdmxe8BIi0wTGuelgIL1pIeiJpU6tVwP8v7lvdCXuBCZCXg6L
         ztLehDr04PJFfxRcvYRRo4/XHrpwrEIqPlDzFI/UZiNmNG3JooMwBtfNaHVU2xf5P5/d
         MxLJAR/boGeCtmLpKyp22GL7dbzR3ky7ZBaL76aJlR5AQDEtBDjEpu9Q22qOjUDxnT+E
         KFxXca8mjf8fR0952KWpwLTUJrZ3j4JZHyukCzc/F3owCAHCOFyXXEZp2FVHYbLIz2W4
         SUS5DR30ZbM8Z+KoP3FSjAJjbQchs8Pqsqn/fd+QLEpTTYF02XY1asDUNLWQ8i+fc4BE
         3hug==
X-Gm-Message-State: AOAM533a/mBFNXIgtroVBo3F49rqrThiATAvzCyu7AEfV6FyQ4mgfBJE
        O5tOBa/RngTjMhw0rc5zex9AZK45aZ7pmQ==
X-Google-Smtp-Source: ABdhPJw1d5JaN1SQ6adws0ETjMwzCN0o69yBqGqxkAwJDAUREiT21rKvVXC/E92mYSmF40oPawNRFw==
X-Received: by 2002:a17:90a:fa91:: with SMTP id cu17mr13307505pjb.178.1621233733212;
        Sun, 16 May 2021 23:42:13 -0700 (PDT)
Received: from tardis.. ([2601:645:8203:5ef0:aaa1:59ff:fe3e:c140])
        by smtp.googlemail.com with ESMTPSA id d13sm8868936pfn.136.2021.05.16.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 23:42:12 -0700 (PDT)
From:   David Bartley <andareed@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     David Bartley <andareed@gmail.com>
Subject: [PATCH 2/2] k10temp: support Zen3 APUs
Date:   Sun, 16 May 2021 23:41:31 -0700
Message-Id: <20210517064131.4369-1-andareed@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: David Bartley <andareed@gmail.com>
---
 drivers/hwmon/k10temp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 5ff3669c2b60..fe3d92152e35 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -450,6 +450,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		switch (boot_cpu_data.x86_model) {
 		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
 		case 0x21:		/* Zen3 Ryzen Desktop */
+		case 0x50:		/* Zen3 Ryzen APU */
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
 		}
@@ -491,6 +492,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
-- 
2.30.2

