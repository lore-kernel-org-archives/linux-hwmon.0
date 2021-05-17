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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FC5C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 06:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5539606A5
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 06:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbhEQGkf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 May 2021 02:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234617AbhEQGkf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 02:40:35 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78605C061573
        for <linux-hwmon@vger.kernel.org>; Sun, 16 May 2021 23:39:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id s19so2010635pfe.8
        for <linux-hwmon@vger.kernel.org>; Sun, 16 May 2021 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mLJfNTzEkOYJ0jzK6ByXCZMswcx7La/U4AL1KiSVZ4=;
        b=Zn3TppKxJkCXc4P41PFv9q3kw26MTF43GWPTJQVJie2BFkQBg113Hqj2+JpuknKxdv
         WTK0aSRKXkmdQ42FktnSuo0kuNd13xGF79mE1dtcbCFiHG3nDSN3ORJQQq95G790BsG5
         6XNpSRadVBs0G5l7CF6r5h5gzFqKwTPJgOEvz76JlDpVZZWDBruRUmg1Ulg/m2xKe1BS
         09x/1Nc2IZmigq8xUvVCmg8JIAqducdv1u5r+e+dwQEl8++Om+hY4ASTLPoMjN7hxuTt
         yUM7/1QgjJtkhwMFZSbfVlIRV6L/+x5zZad1t8/ZpibJjTbtxS37eguuSMkGTZL7MpLv
         paOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mLJfNTzEkOYJ0jzK6ByXCZMswcx7La/U4AL1KiSVZ4=;
        b=ejmwCBmzMk5o4nGZ/R6z3bWoKA/xUcVw1TmwNXt5Ktg16DeKXvIy+p2QeMrTsrulDL
         p1VY57yqNtF87Syauwhpdw/q+NXVWjT0/7MQN2bPF2BBC7nt1y7B9EU3bMmtXFXZZX2w
         PK6LDETMho2AeCvKAOLmhuEIHNdD7Nr+iKH4DnyVjEfyHP1gIthkLV8Dm1SWFTWMvndk
         vdJCifW53KSTJX0HcS1IkwrD/Kd/HbAFJW+mX6xZk8s6wsZVmVwMosasyKA/gCgJ9XZg
         XObK0m07i7oqS5BWZpz0ChVWZ/so144SmEwpSPJodOG4OS4uV7Lq1AWQrehNJ/CEWuGI
         984w==
X-Gm-Message-State: AOAM5318qyC+kIGpxg8KaaJw6iB9Ub7xKO3RwkvvxYZgW2tozrSABAaj
        sr1MuRhVe9QR2QYApyp2kF0=
X-Google-Smtp-Source: ABdhPJy3KIGOod6ckRaFzdyQG+wLJsBuEkdfBr3f4pJ/qBZ2knZ6FwFRwbKDGxq7woV+fttyhtFi7A==
X-Received: by 2002:a63:1c6:: with SMTP id 189mr49682009pgb.144.1621233557977;
        Sun, 16 May 2021 23:39:17 -0700 (PDT)
Received: from tardis.. ([2601:645:8203:5ef0:aaa1:59ff:fe3e:c140])
        by smtp.googlemail.com with ESMTPSA id f3sm13057605pjo.3.2021.05.16.23.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 23:39:17 -0700 (PDT)
From:   David Bartley <andareed@gmail.com>
To:     andareed@gmail.com
Cc:     linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] x86/amd_nb: add AMD family 19h model 50h PCI ids
Date:   Sun, 16 May 2021 23:39:12 -0700
Message-Id: <20210517063913.4015-1-andareed@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is required to support Zen3 APUs in k10temp.

Signed-off-by: David Bartley <andareed@gmail.com>
Cc: linux-hwmon@vger.kernel.org
---
 arch/x86/kernel/amd_nb.c | 3 +++
 include/linux/pci_ids.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 09083094eb57..23dda362dc0f 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -25,6 +25,7 @@
 #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F4 0x144c
 #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F4 0x1444
 #define PCI_DEVICE_ID_AMD_19H_DF_F4	0x1654
+#define PCI_DEVICE_ID_AMD_19H_M50H_DF_F4 0x166e
 
 /* Protect the PCI config register pairs used for SMN and DF indirect access. */
 static DEFINE_MUTEX(smn_mutex);
@@ -57,6 +58,7 @@ static const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{}
 };
 
@@ -72,6 +74,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 4c3fa5293d76..5356ccf1c275 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -555,6 +555,7 @@
 #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
 #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
 #define PCI_DEVICE_ID_AMD_19H_DF_F3	0x1653
+#define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3 0x166d
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
 #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
-- 
2.30.2

