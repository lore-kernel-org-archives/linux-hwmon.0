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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DDBC76196
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jul 2019 18:28:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5331E21019
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jul 2019 18:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm+JfZ59"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbfGRS2h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Jul 2019 14:28:37 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46775 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbfGRS2g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Jul 2019 14:28:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so15629954lfh.13
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2019 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=05QMYDXsNNMXVj9piYwyqDmkTCB/luaTlabh0+gD7+k=;
        b=Cm+JfZ59xsoyrHzG8Cd1badNddeuZVT2B31YojfDDBd/SGLz7ucmew8Ilgc6tOyAcA
         MdTlLp2rr6E+gwbB5Ued/yG8Os1vLwaSa8q1OhSt5GL0kcqdP71VCw4IDakSO1syO5UC
         Qk2VFRCFazbxS+ZX4zorvvvSfwKSjOSnkWrRYuZHecy85LeCUwxhcwb+SvKgt4S1CqQA
         oPG0mArWgqP+/Qf5oiPBV2rrbUEBMu/I9GN+iZIHpWRklKRFBgAJAyW8cWLLmF0y1Rke
         dVBS4OuL1K1/XAGmGDHfwloOsabWw8QRmyUh0sj9sdiK2TufXu1hzreV1pZZd3HcNfqE
         Ntzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=05QMYDXsNNMXVj9piYwyqDmkTCB/luaTlabh0+gD7+k=;
        b=hfIb8L84SkyF5V0i5jmhsE0F8UBuEiUzoI1uHwQvIjYrmiUSx8MDdHew/yc/PIg1Yh
         Q6hlvTXaIzr6ygqhtK4Mo7ZsU7Ormnal33eEOtfABhPyTMB9SYWmyImbNAL4y64uHRmU
         o7aADXo1FUaLLFG1zfrQFYY17R/hCsn5PB8poO7vEDoOzFEkM3SNY1L+zKLHcw7T1RoK
         HpjU5FK/RmB1+I1QAb/wn+Hs+JN/2qBptRdZOlY4WuykEK5zJpcmRtAgShJvk6/W5SXh
         0IFLwDsuh3ULRwKiM4W6GMvNgMY5caz59aHsk7msJoUPi/lZbAjK00aZbVrC2l66ur3u
         LnSA==
X-Gm-Message-State: APjAAAX4/ZtWC3IP+c6hMG4T19MiAAjSq6S1yuchT0MF/J6jAqyQ+YUs
        UjGLQ01qgH7xU/SWDxQMoXU=
X-Google-Smtp-Source: APXvYqzgBqiEUq4nfiNh+8a7LtNeAKO30RgGhGXFcE+zKDjpNMEHjF7U4B6qNRO5oge7fs+laMO+Ng==
X-Received: by 2002:ac2:568e:: with SMTP id 14mr22260605lfr.189.1563474514992;
        Thu, 18 Jul 2019 11:28:34 -0700 (PDT)
Received: from cathaou.pp.htv.fi (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id m10sm4059213lfd.32.2019.07.18.11.28.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 11:28:34 -0700 (PDT)
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Marcel Bocu <marcel.p.bocu@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon/k10temp: Add support for AMD family 17h, model 71h CPUs
Date:   Thu, 18 Jul 2019 21:26:17 +0300
Message-Id: <20190718182617.6964-2-marcel.p.bocu@gmail.com>
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

It would seem like model 71h is behaving in the same way as model 30h,
so let's just add the new F3 PCI ID to the list of compatible devices.

Unlike previous Ryzen/Threadripper, Ryzen gen 3 processors do not need
temperature offsets anymore. This has been reported in the press and
verified on my Ryzen 3700X by checking that the idle temperature
reported by k10temp is matching the temperature reported by the
firmware.

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
 drivers/hwmon/k10temp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index c77e89239dcd..a9c1108b377e 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -349,6 +349,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M71H_DF_F3) },
 	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
-- 
2.22.0

