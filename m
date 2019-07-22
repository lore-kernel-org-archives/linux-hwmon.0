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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737D0C76190
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 17:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F2E421901
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 17:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KitVP75s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfGVRrI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 13:47:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35567 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfGVRrH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 13:47:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so38494471ljh.2
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yi7tU5SUkCIGdqAUvgyD+UDtTx+gpXk7EYo/a4kpc88=;
        b=KitVP75sjqOnxi7AZofX97Qm5Mfio2e/+4pS0lwCzAxzYO88UI94ck/9Ij+fU1BwXz
         SPK0j53Om/Avv8FlqvqmR5rNWFWeZMLueC1ew7kJphetLlaHe2pi/kZhCcC0luj7HtWP
         yjIDd9Ean4kWvHxwm6v7A0wAKl1q/USAGjRpEUmzETeEtz2/nt3KA5LUbJOXsI+A0sHV
         qxF1/MD3lNcn6iYHbXyCIxr8/0TYczlylCtQTVsSkHJVA2pvt2CLIfx/yw6AREk9kJzw
         sx6HZY9dbEEfACLT6HVZ2ixh6cAu87TxrHoSA2yiuqtXD8PHwOAHB7onKV6CqVwWAxpJ
         6aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yi7tU5SUkCIGdqAUvgyD+UDtTx+gpXk7EYo/a4kpc88=;
        b=TeB3DTnBq2EyD7y/inRvBlMjT0nyYyxAc8qQLeHYgVg111WcoN/1doId0PI9Rb7mPT
         UNNNcSyt8DDeoU0gSU6jYOcC9eE6yZJvLQlLAxvNKJFBy8MJNgawN3vFmFKkxTuWBsv6
         CTMd9vWE9bNxNCCBz3RT17mXrvJwmr022N6bYlKw+R7ePpLvT++OqwFVUG6YTfqfSApN
         y3FHXn3AUFirSK49TmkHtGQnW/m74HmyoTQr1hhdXotDCmbCOEkPFlnnG4ldFtqsgvLl
         T67c75Z7YBvdYqwuNDd0m5nj+0JgkvC5C/tALaKcWV/n/SWYfoS4X7JnkQOQI/RwbDAu
         KcaA==
X-Gm-Message-State: APjAAAXUZc+YT55WByjXw/XfvSz0Rodt7rc1ph22fFnOIZ67C3DYPE14
        Q9kfEiKeH0StUqz67lo9W1c=
X-Google-Smtp-Source: APXvYqysu92WrLG9BBqbuOvUdewYpYEHffkxGjPSMfdf9xcMRgUzY8N02D4kzzfR3v06fJJkJEd28w==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr36195060ljh.79.1563817625976;
        Mon, 22 Jul 2019 10:47:05 -0700 (PDT)
Received: from cathaou.pp.htv.fi (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id p5sm7618577ljb.91.2019.07.22.10.47.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 10:47:05 -0700 (PDT)
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Marcel Bocu <marcel.p.bocu@gmail.com>, Vicki Pfau <vi@endrift.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon/k10temp: Add support for AMD family 17h, model 70h CPUs
Date:   Mon, 22 Jul 2019 20:46:53 +0300
Message-Id: <20190722174653.2391-1-marcel.p.bocu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190718182617.6964-2-marcel.p.bocu@gmail.com>
References: <20190718182617.6964-2-marcel.p.bocu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It would seem like model 70h is behaving in the same way as model 30h,
so let's just add the new F3 PCI ID to the list of compatible devices.

Unlike previous Ryzen/Threadripper, Ryzen gen 3 processors do not need
temperature offsets anymore. This has been reported in the press and
verified on my Ryzen 3700X by checking that the idle temperature
reported by k10temp is matching the temperature reported by the
firmware.

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
index c77e89239dcd..5c1dddde193c 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -349,6 +349,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
-- 
2.22.0

