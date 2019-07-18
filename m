Return-Path: <SRS0=FL+M=VP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EBC7618F
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jul 2019 18:28:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28AE721019
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jul 2019 18:28:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S52cDcAR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfGRS2f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Jul 2019 14:28:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38345 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRS2f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Jul 2019 14:28:35 -0400
Received: by mail-lj1-f195.google.com with SMTP id r9so28316751ljg.5
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2019 11:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sQWEvKqyWlAQlwCGU7Y0X8IGhxn8UG+iZGC6JNACHsA=;
        b=S52cDcARt1FeKsaeci0ws2L30T25mJ0Vsy5tlmzLyj7bagFY60d/2PF3IfOAOsCvBK
         Exd3aG6xu7HCpewAelL4sVQJ+IHaVhBPjRfJw4XYhoLbcTieX2wqQhs8krPt2mJBXbXV
         qoUyb8odsGsvXQOxisQbjAwYZ39ungAMl+nN6w7DZ5LzJXiXFkSJx5cuUMFY4Gmdo2t7
         zMdkiz0zXUzBQyraxTwvfjfqOlOwCsNcPXj0pfzXfYEaeJLRA+oxbKnuCTc7Ci7xaj96
         et6QAqXD6QYJyVP9UA/GQdZLo47tB8w5hc1YGSI50q7Nfx7ol1UGbmW1xXEFairg2rFx
         m/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sQWEvKqyWlAQlwCGU7Y0X8IGhxn8UG+iZGC6JNACHsA=;
        b=b+U/vjA7Kb48LN7i1Y3s8BoNR3AM1yLK0D8qAEbdyM/Z5bpHpOk+IucGTXyADPsMRg
         oyxUkXSB4BjWOjrBsHpKfMXrltpTS33BsBCiLnLRnRn7xy7sAYo0QrETSHfyM/HK6OHQ
         FKzF8ZRlO+fA6P/Q8kz/IZ0RvzPYfzIewOtzY6ImdWTG5qeo5V7eE+pTLrgB02d3KFSq
         NlmoGhIbzu73TaVmn7zMx4uvahEPTaWhEW+cnRHJaedbuHz5/WH4qM1N5BzIhtLRQY8N
         swNO0btb99NtzLy9ZGYOCgF79Lm6pPQfyHbAiA005z0CvqucaIisy2UhZydwYNrpa4U8
         zBFQ==
X-Gm-Message-State: APjAAAWWtsAJVElyUC+C7XYc73gwpU6lxelXYB4H9yIP3TbFgBlSNAkH
        20JkMpi5g+E9CY+F2gWWGqE=
X-Google-Smtp-Source: APXvYqzznHgITeUvKoK1yg6vU0C8hoqj9uN1f8hVFFF1yeHtxs2XF9Ki7KaB3p4qg4DLS0vss13NfQ==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr24505682ljg.216.1563474513907;
        Thu, 18 Jul 2019 11:28:33 -0700 (PDT)
Received: from cathaou.pp.htv.fi (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id m10sm4059213lfd.32.2019.07.18.11.28.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 11:28:33 -0700 (PDT)
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Marcel Bocu <marcel.p.bocu@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model 71h
Date:   Thu, 18 Jul 2019 21:26:16 +0300
Message-Id: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The AMD Ryzen gen 3 processors came with a different PCI IDs for the
function 3 & 4 which are used to access the SMN interface. The root
PCI address however remained at the same address as the model 30h.

Adding the F3/F4 PCI IDs respectively to the misc and link ids appear
to be sufficient for k10temp, so let's add them and follow up on the
patch if other functions need more tweaking.

Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: "Woods, Brian" <Brian.Woods@amd.com>
Cc: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 arch/x86/kernel/amd_nb.c | 3 +++
 include/linux/pci_ids.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index d63e63b7d1d9..297dc50da3bd 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -21,6 +21,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F4 0x1494
+#define PCI_DEVICE_ID_AMD_17H_M71H_DF_F4 0x1444
 
 /* Protect the PCI config register pairs used for SMN and DF indirect access. */
 static DEFINE_MUTEX(smn_mutex);
@@ -50,6 +51,7 @@ const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M71H_DF_F3) },
 	{}
 };
 EXPORT_SYMBOL_GPL(amd_nb_misc_ids);
@@ -63,6 +65,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M71H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index c842735a4f45..5f99cfac9c06 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -548,6 +548,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
+#define PCI_DEVICE_ID_AMD_17H_M71H_DF_F3 0x1443
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
 #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
-- 
2.22.0

