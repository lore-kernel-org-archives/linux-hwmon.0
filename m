Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1692AC7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 17:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAD0021901
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 17:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf2eO0R8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbfGVRqX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 13:46:23 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36601 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfGVRqX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 13:46:23 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so27308471lfc.3
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5HeHAOW5qlVevbz0BfcyUjugFV4l67SA/glaqvYngV8=;
        b=bf2eO0R8FaO4Hwqb2JUs/Xl2VYM92cSAkafP0vs8CjTsA/kiHM6q6dXlbT0ZelvS1J
         SAlHzsGwv6a10YZ5Y1oaGuDYsomqK1z5eptPfZeRJrSFqdW7UO2jXYE5e+kD7v8za3In
         DAE9zafL5+QECX1JW7rCaVcBTeqxNccsQpT3yL+YHuZemyx6+5SjfF6uDdkt5jpQ6ErZ
         R/tXS2usFzkZ0Us5d3Z3QIUmJITNeRxqd4Yg8rDc8SMtkwOpEoLYwHanUaUobwW/fikI
         IM7MMgZZx/kuz6tu5j3d7tIN9YJ2zF5l/nTOeO54KxKzp70i1hS1y+0CI0Z6GeUdUQHT
         w4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5HeHAOW5qlVevbz0BfcyUjugFV4l67SA/glaqvYngV8=;
        b=DmZ+XjWXMqAopjEY8+sWecpqvJsrZUbXXyWhizLozuBn7Fb/BFR2GsrWaRbh9tQjfU
         cB0Ov11jOZnwzTMgjmHDCsN/OqPwOKFVfwOuX2MsMj8SIEftbakKBGvzx6vORovV+feZ
         OQ+7kNDH0C5xuJObhKhd+lpqNM8vrVNfkaZ40lalcc3eVZLuTUXQq7ewvkX1bDqGxX+s
         IDQ+KFGNvM2h1/dfCtAdpQPAaOafEQVJFHrDEThK+jkA40+qpnOFhNDF9e25A9kqbegG
         DToO0EgOxo9uVSdNYPY7/3NPov2NXxruuHitWQlAWKGXi2/4wMXM5qRL9wxpeii7+2cn
         tWtg==
X-Gm-Message-State: APjAAAXm16xfO/n8bgnTjdTAlhkFd2/pa1ZQKDb0eAXsW6AVIsHdjACz
        27bDhvTkFuSaMEronI0h/ZE=
X-Google-Smtp-Source: APXvYqx+mBCBzzkTm0aHvYcRTNvDGnsyngrVFaUuRtkJ1s+yJfI0HG/SCteePQqa4bxz9Z9fM+KSLg==
X-Received: by 2002:a19:f007:: with SMTP id p7mr32415022lfc.24.1563817581360;
        Mon, 22 Jul 2019 10:46:21 -0700 (PDT)
Received: from cathaou.pp.htv.fi (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id h78sm7647394ljf.88.2019.07.22.10.46.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 10:46:20 -0700 (PDT)
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Marcel Bocu <marcel.p.bocu@gmail.com>, Vicki Pfau <vi@endrift.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Brian Woods <brian.woods@amd.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model 70h
Date:   Mon, 22 Jul 2019 20:45:10 +0300
Message-Id: <20190722174510.2179-1-marcel.p.bocu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
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

Vicki Pfau sent an identical patch after I checked that no-one had
written this patch. I would have been happy about dropping my patch but
unlike for his patch series, I had already Cc:ed the x86 people and
they already reviewed the changes. Since Vicki has not answered to
any email after his initial series, let's assume he is on vacation
and let's avoid duplication of reviews from the maintainers and merge
my series. To acknowledge Vicki's anteriority, I added his S-o-b to
the patch.

v2, suggested by Guenter Roeck and Brian Woods:
 - rename from 71h to 70h

Signed-off-by: Vicki Pfau <vi@endrift.com>
Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Brian Woods <brian.woods@amd.com>

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
index d63e63b7d1d9..251c795b4eb3 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -21,6 +21,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F4 0x1494
+#define PCI_DEVICE_ID_AMD_17H_M70H_DF_F4 0x1444
 
 /* Protect the PCI config register pairs used for SMN and DF indirect access. */
 static DEFINE_MUTEX(smn_mutex);
@@ -50,6 +51,7 @@ const struct pci_device_id amd_nb_misc_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{}
 };
 EXPORT_SYMBOL_GPL(amd_nb_misc_ids);
@@ -63,6 +65,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index c842735a4f45..4b97f427cc92 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -548,6 +548,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
+#define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
 #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
-- 
2.22.0

