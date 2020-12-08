Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F40C2BB48
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F10B223A7B
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbgLHUWl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Dec 2020 15:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgLHUWj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Dec 2020 15:22:39 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABF4C0611CB
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Dec 2020 12:21:55 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id e2so4878954pgi.5
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Dec 2020 12:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pMlPaCjdMqqKfAe8Wr9RBnWL4O9dlKePKkuH2M+u0jE=;
        b=ZlsFW+gJJ21kqKdvSsbtKmwfGHU9pFSldEkrUjsAtw9ozZakTAiy8DhOk3+Ub5m8Ws
         Zpaa4es2Je1CZJO3WndXg9OB1VOk0nQvtIvyZHunyB54iUHorH7UKOjfYkrz2Vz3Klab
         /ZvgiAvhW8w6ZnuQ72rSJjcSdfYRS6yYrlfF4parGhz42IPHNSsDUQIHLUXLKX7hrkAB
         +bNqMnqy0/bjULP6ch+A1pCmJY1FER56vPyrjmHsI7XFBMNoiBFxHY1tvJZyu3wOswgV
         rB1HFUUl9GWaF3YEyyYkWG/C61SVEqDpPfc/VrMBW6bQxaduCTs0Ck9HkAs0HpdCbADq
         QuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pMlPaCjdMqqKfAe8Wr9RBnWL4O9dlKePKkuH2M+u0jE=;
        b=f9Efn+n2aJTOFV8n9dyuWcOiNC6V9BhhvZQxIBtX524Wkhq+Lh5SvE/i/j0Na2tCDZ
         Kuws/xFGseiT/DxUIXUReFxrf+4O0AuayUL39cWbJdlCpjErfjtQ3tCKLhHBKO2sLS66
         ZG+QlTPG805hCh3Fs2SNU/fH8oNCNf5E0lRFT7RUeGsyHNz/vXeGdF+48rx4moGA+HIi
         144dkbc1eM5dJGUfLp4a5GsuElb6btKwABIPB1IXiqUgCdE1EKrOFH/A37aVDVENskJ2
         eqJPG+zlw7LenAdLcfRbz7bBE5Pk5t+HCZPh0ae7qj2fu/ByKBmHVDiPvCqhLjtXcBxN
         iHuw==
X-Gm-Message-State: AOAM533LY8sdsP/ov+A8lmyffR9RY6yQjV9nqOVSYCP8+FtYM0oUJfpP
        r9LYnKwSdp4Qn4wBXdPH4aU=
X-Google-Smtp-Source: ABdhPJy3nVbSzFmFExlXJDpBtq1j4TViSvFX8DNHQz2aCsn7o/vBAI8DWp/vDumheSbYvKjqeLWHUw==
X-Received: by 2002:a17:90a:f00f:: with SMTP id bt15mr5872006pjb.209.1607458914542;
        Tue, 08 Dec 2020 12:21:54 -0800 (PST)
Received: from [192.168.86.233] ([49.207.137.174])
        by smtp.gmail.com with ESMTPSA id n127sm19052414pfd.143.2020.12.08.12.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 12:21:54 -0800 (PST)
To:     linux-hwmon@vger.kernel.org, nchatrad@amd.com
From:   Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
Message-ID: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
Date:   Wed, 9 Dec 2020 01:51:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds support for Zen 2 desktop CPUs to the amd_energy driver.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/hwmon/amd_energy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 0dee535e6c85..21341c8e1d6e 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -363,6 +363,7 @@ static struct platform_device *amd_energy_platdev;
 
 static const struct x86_cpu_id cpu_ids[] __initconst = {
        X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
+       X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x71, NULL),
        {}
 };
 MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
--
