Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F45C6FD1C
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Mar 2023 21:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjCWVRn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Mar 2023 17:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjCWVRm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2023 17:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79D725BA2
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Mar 2023 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679606220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6KV3+ggucumc5QD34On/pnyUwkWX5K53u9B57Btq2Dg=;
        b=IEetVWzjHoylUEe6lDHwGyDq3+yWeUxDFt8xBwKg2Y/wkQ3gvDrIumkb7WbsESZ2Bh4qlk
        XbbP5wZI9iQZ0njN714kAhtDxptxkaKWFu1PpiOMr9c4BMdKczB0Dz21Yvr2XmOm1ecl7W
        qSzSiBcDPuA4zUDPzSZFmX7U8GofB2g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-n7XNhaO5OMqvJD9yBUIhEQ-1; Thu, 23 Mar 2023 17:15:40 -0400
X-MC-Unique: n7XNhaO5OMqvJD9yBUIhEQ-1
Received: by mail-qk1-f199.google.com with SMTP id b34-20020a05620a272200b007460c05a463so10998370qkp.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Mar 2023 14:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679606140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KV3+ggucumc5QD34On/pnyUwkWX5K53u9B57Btq2Dg=;
        b=JpWlu1HgqJLFXpd5KYGsRedUYHB7dXFzSNdVXuzY595lny12GsoqzpqlpeeOKBX+4E
         7100gvi8LadaK9lLuHKks8HMd+N3priGj1wJSjveUnuj6FJOzGxI61HOYha602rf6AV8
         1IZ55dELpkJveiqpeX3ifO95Urj2SSvaLDPC2XrmHZFN5xmPvHCtdX/pRFXCYQraMOme
         4PgBOyLDmPRQBuumEhmU5UThd7gIla1lFnaF1mmrNu23Ua9fayf1XGR/AK8pS4Qj9k6R
         z5GYCP/5txNOWrwm4iT8n5G8s/X/4TcI2VpG/QZlfNWO9toKqpF9VrY83T9W6i3yZfxL
         mSiQ==
X-Gm-Message-State: AO0yUKW0ERCUmandloIqqg1IIa17aqBbiSBVIFs1SryjGwXFwxcF7+lp
        lBjXKcRsCZoaJMtIX72Bd78uTgsp+3W32XeiuZtO3SBaF3rZtWNT20RETDNHflkBiCLoctSxN93
        KKvTzB83UeqT4uqL/RS5Xtz8=
X-Received: by 2002:ad4:5ca7:0:b0:557:a5c5:7e01 with SMTP id q7-20020ad45ca7000000b00557a5c57e01mr11200930qvh.25.1679606139884;
        Thu, 23 Mar 2023 14:15:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+tvzAycBc1q7Z1SybzVhbz3gSyQZZjVzp64y0qPk4l+LZH6qxGccQxM9QKATFbt8WTwlMI0g==
X-Received: by 2002:ad4:5ca7:0:b0:557:a5c5:7e01 with SMTP id q7-20020ad45ca7000000b00557a5c57e01mr11200902qvh.25.1679606139628;
        Thu, 23 Mar 2023 14:15:39 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c23-20020a379a17000000b007436d0e9408sm8694926qke.127.2023.03.23.14.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:15:39 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     juergh@proton.me, jdelvare@suse.com, linux@roeck-us.net,
        nathan@kernel.org, ndesaulniers@google.com
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] hwmon: remove unused superio_outb function
Date:   Thu, 23 Mar 2023 17:15:35 -0400
Message-Id: <20230323211535.2637939-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

clang with W=1 reports
drivers/hwmon/vt1211.c:198:20: error: unused function
  'superio_outb' [-Werror,-Wunused-function]
static inline void superio_outb(int sio_cip, int reg, int val)
                   ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hwmon/vt1211.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index 4a5e911d26eb..fcd4be7a5a85 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -195,12 +195,6 @@ struct vt1211_data {
 /* VT1211 logical device numbers */
 #define SIO_VT1211_LDN_HWMON	0x0b	/* HW monitor */
 
-static inline void superio_outb(int sio_cip, int reg, int val)
-{
-	outb(reg, sio_cip);
-	outb(val, sio_cip + 1);
-}
-
 static inline int superio_inb(int sio_cip, int reg)
 {
 	outb(reg, sio_cip);
-- 
2.27.0

