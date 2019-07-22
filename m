Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C764EC76188
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 14:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9104D2190D
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 14:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYeMZAb2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfGVOur (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 10:50:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50536 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfGVOur (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 10:50:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so35528034wml.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GDPmYrOV5FMLd7aC8+ljVluT3u69z15AjzVP5b88Ys8=;
        b=HYeMZAb2odk9o3/HFpMw3Z2j/CLefiJA5dVMvYdlNvl+ABR2wk21crjqGlQ/8Y54Sy
         M3HfSVWQpDDJi9JN1T3bF09LTxyESLoA69aKX6ak5fFcjsWpNSGHMymqUmgn0U9hS3FT
         AoEfmRSDHKyacQUIBCO+sooTLr6qTjt64fQbkOjL2jxx4CiihG1eHy3NFA9PdANXqKy4
         JyH85dv1CXGCi7WWtZGIQ6GOzgWRRkOfEfZe99nyGnVgiggi12Rkd7C3D8rFBgdFPTMf
         pn+AF5libviAFxObfQ44rPgeCByEa3JGT2XBSkSNNxfAyogxL+3ZALcf/iNsacc0PrYr
         vaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GDPmYrOV5FMLd7aC8+ljVluT3u69z15AjzVP5b88Ys8=;
        b=IgPBTcMj5rzcLWz+6h0nWJuFHB0F8eLv4zO0HnRiEwR7WiYb5bx76+AOwbHRm2IzSi
         bHeD72ZJk7ZlaRyLKUqzglHiOE6FEwQHJ6Uw8uWwH494rF4/tKw6biGRvFVSyBnoiBPU
         H68934X2DDnNFbMUvDa8bFdQwNEoBbwceqxJeBrucWuLE3HCgN1GxW0Ixny33uIWhyQT
         qmfe85836R0+cj+sTIWbmKbnV+Po9za+7qD3k0hbw53VDxMM04Gze7CEoGPYlobbJ06a
         y9dUElqqlIrVpu9TC5LzcU5ciuzgM9OsepZ0r+edXheYph6dYErj8rCCtEixn2gxH+VY
         Wx9A==
X-Gm-Message-State: APjAAAXbuvLePE/kmQgeNRsePZwAqvK83fMPd1fR8WSMJTYKiXghZ6VO
        VnIolRtEKEthp9iYtbYvv3QUh8/5GVlXkhxKWzM=
X-Google-Smtp-Source: APXvYqwjBn3GQ4koabNKTcwi15FSQqGUBZ0gBJ7l0p7elN4M5WjSKYdu+7wWt7rWvhgwI0q+6BYkkMEJGeCgpM8+zz4=
X-Received: by 2002:a1c:5602:: with SMTP id k2mr60172827wmb.173.1563807045065;
 Mon, 22 Jul 2019 07:50:45 -0700 (PDT)
MIME-Version: 1.0
From:   Shenran Wang <shenran268@gmail.com>
Date:   Mon, 22 Jul 2019 17:50:34 +0300
Message-ID: <CAGfeh__oPvTo4dskOoW8kmhhgM3_vDjoP7eXdYPbmA7e==cZzg@mail.gmail.com>
Subject: [PATCH] drivers/hwmon/acpi_power_meter.c: Change log level
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From ce991220c17873821bd1e2bd011686201b3daaff Mon Sep 17 00:00:00 2001
From: Wang Shenran <shenran268@gmail.com>
Date: Mon, 22 Jul 2019 14:38:10 +0300
Subject: [PATCH] drivers/hwmon/acpi_power_meter.c: Change log level

At boot time, the acpi_power_meter driver logs the following error level
message: "Ignoring unsafe software power cap". Having read about it from
a few sources, it seems that the error message can be quite misleading.

While the message can imply that Linux is ignoring the fact that the
system is operating in potentially dangerous conditions, the truth is
the driver found an ACPI_PMC object that supports software power
capping. The driver simply decides not to use it, perhaps because it
doesn't support the object.

The best solution is probably changing the log level from error to warning.
All sources I have found, regarding the error, have downplayed its
significance. There is not much of a reason for it to be on error level,
while causing potential confusions or misinterpretations.

Signed-off-by: Wang Shenran <shenran268@gmail.com>
---
 drivers/hwmon/acpi_power_meter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 6ba1a08253f0..ee0363e5be43 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -681,7 +681,7 @@ static int setup_attrs(struct
acpi_power_meter_resource *resource)

        if (resource->caps.flags & POWER_METER_CAN_CAP) {
                if (!can_cap_in_hardware()) {
-                       dev_err(&resource->acpi_dev->dev,
+                       dev_warn(&resource->acpi_dev->dev,
                                "Ignoring unsafe software power cap!\n");
                        goto skip_unsafe_cap;
                }
-- 
2.20.1
