Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2C0C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC6BA2175B
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYTt8ae5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbfDEQCm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 Apr 2019 12:02:42 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36984 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDEQCm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Apr 2019 12:02:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id e6so3310596pgc.4
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Apr 2019 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KJYI0V856EdAcPj6P6UE3tSdIJi/vA8OMYy4IUjhsPY=;
        b=oYTt8ae5XZgfOs247Uqb14kDXqSJVmaNwSaTnopl79PehVdeXAefNxZmME/D1QREho
         q97er6FJP96PdrpXky0TT0IzZoOM6Rm+2r7oQTDv9fVTVenKOeLa4z2Y3gNglOWIdKsz
         +w0IZAKXQn97kPvYc3E6vHoCuX7EPIfe4H4kt13ObdcgmlCIE7SgD4alSboA4/msICwk
         4Y/OeRx74/0Ph8YcI4jV3ng96B5lo25xshX+HDjYmTC/s4BhGLOr5BELXGVkUtFlm99k
         wktxxYy67sz0AbSn8AYIr2MvQXu0GGcb7rDchZZDHuRCvvIquvYviGQlG009eXCTbPLD
         FKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=KJYI0V856EdAcPj6P6UE3tSdIJi/vA8OMYy4IUjhsPY=;
        b=ACqwU7mna7J0dQHHeIT8zb1AWAO7mAkuQGsJe86MTf5ehqOc9jLSPaTJVjQ/jg9f6B
         mEMqZZHSE+f17cTp6WRUbiTwgE9hfcTdzeyk6mcESr+VYRLVD1M3vpoRWty5wJLo1Wjo
         oUHpjgR12zyl33WtFnNyPc0ysW7PHoAwGPeabO0dcQHt/kSiAPj8OV1E0xbQ7t4AqTqU
         C3mBaPy8Lb8i/2minpcVH8WHfoSTvv6U5Fdluk/6XqDn4PRWJc9HX+JGiDuJIYoGO6Tk
         X/lvIMf1XsAIfPFBaTlNX2j3qt9SdcAL8xsB7X46UNJTfnoAhxVmyoUcSPKFa6/fz8sK
         FtDA==
X-Gm-Message-State: APjAAAWECAv8zc5cvG8XK5ey2KMr9Hcqla5SokKe4F6BZj8Hqj7/pVIS
        sZxoQO7fBjQhG31FTcdSZ4c=
X-Google-Smtp-Source: APXvYqwyL1ORWisfWrGhL42RILpyrkkmr1iZ5gCuvUrNAKBsI7HS5D68b/6TVpeTofbdxjlRqqMaFg==
X-Received: by 2002:a63:4819:: with SMTP id v25mr12952537pga.412.1554480161538;
        Fri, 05 Apr 2019 09:02:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q81sm41266085pfi.102.2019.04.05.09.02.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 09:02:39 -0700 (PDT)
Date:   Fri, 5 Apr 2019 09:02:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     John Garry <john.garry@huawei.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 4/4] hwmon: (smsc47b397) Use request_muxed_region for
 Super-IO accesses
Message-ID: <20190405160237.GA15577@roeck-us.net>
References: <1554402838-19008-1-git-send-email-linux@roeck-us.net>
 <1554402838-19008-4-git-send-email-linux@roeck-us.net>
 <dc742840-7a20-701d-87c7-775f2f85a2e2@huawei.com>
 <cacf8805-e253-79a3-40cc-cad573fbd3ed@huawei.com>
 <5a95deed-db26-4795-6234-f0509e845b16@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a95deed-db26-4795-6234-f0509e845b16@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 05, 2019 at 06:25:13AM -0700, Guenter Roeck wrote:
> On 4/5/19 1:46 AM, John Garry wrote:
> >On 05/04/2019 08:47, John Garry wrote:
> >>On 04/04/2019 19:33, Guenter Roeck wrote:
> >>>Super-IO accesses may fail on a system with no or unmapped LPC bus.
> >>>
> >
> >BTW, these may still require attention:
> >
> >sch56xx-common
> >smsc47m1
> 
> Those two already call request_muxed_region() in superio_enter().
> Though error handling in the latter is less than perfect - I may send
> a patch to fix it.
> 

... and that was because this patch has the wrong subject, and its error
handling is incomplete. I'll resend.

Guenter

> >w83627hf > vt1211
> 
> I missed those two. Patches will follow.
> 
> Thanks,
> Guenter
> 
> >
> >Thanks,
> >John
> >
> >>>Also, other drivers may attempt to access the LPC bus at the same time,
> >>>resulting in undefined behavior.
> >>>
> >>>Use request_muxed_region() to ensure that IO access on the requested
> >>>address space is supported, and to ensure that access by multiple drivers
> >>>is synchronized.
> >>>
> >>>Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")
> >>>Reported-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >>>Reported-by: John Garry <john.garry@huawei.com>
> >>>Cc: John Garry <john.garry@huawei.com>
> >>
> >>Acked-by: John Garry <john.garry@huawei.com>
> >>
> >>>Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>>---
> >>> drivers/hwmon/smsc47m1.c | 13 +++++++++++--
> >>> 1 file changed, 11 insertions(+), 2 deletions(-)
> >>>
> >>>diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
> >>>index c7b6a425e2c0..0736ca6a3aee 100644
> >>>--- a/drivers/hwmon/smsc47m1.c
> >>>+++ b/drivers/hwmon/smsc47m1.c
> >>>@@ -73,16 +73,21 @@ superio_inb(int reg)
> >>> /* logical device for fans is 0x0A */
> >>> #define superio_select() superio_outb(0x07, 0x0A)
> >>>
> >>>-static inline void
> >>>+static inline int
> >>> superio_enter(void)
> >>> {
> >>>+    if (!request_muxed_region(REG, 2, DRVNAME))
> >>>+        return -EBUSY;
> >>>+
> >>>     outb(0x55, REG);
> >>>+    return 0;
> >>> }
> >>>
> >>> static inline void
> >>> superio_exit(void)
> >>> {
> >>>     outb(0xAA, REG);
> >>>+    release_region(REG, 2);
> >>> }
> >>>
> >>> #define SUPERIO_REG_ACT        0x30
> >>>@@ -531,8 +536,12 @@ static int __init smsc47m1_find(struct
> >>>smsc47m1_sio_data *sio_data)
> >>> {
> >>>     u8 val;
> >>>     unsigned short addr;
> >>>+    int err;
> >>>+
> >>>+    err = superio_enter();
> >>>+    if (err)
> >>>+        return err;
> >>>
> >>>-    superio_enter();
> >>>     val = force_id ? force_id : superio_inb(SUPERIO_REG_DEVID);
> >>>
> >>>     /*
> >>>
> >>
> >
> >
> >
> 
