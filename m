Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2904C00140
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Aug 2022 10:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242198AbiHHKPz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Aug 2022 06:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242446AbiHHKPY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 06:15:24 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B446421
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 03:15:11 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso14066696pjo.1
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Aug 2022 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc;
        bh=JGenpaCWyLLnK/xNR269H4GFp1amXxq0IdoGi7uZMtg=;
        b=PSRmwMD7IUR7LPgrhZxIJXxzNlr81fD092xN5DECH1Ss7cHXVbjW6lFH80gysk3GjC
         sLTQBiW+IS6s73vPgi0ThgP3LmBGUp+xdO6F/bvq0fhlyZWz2VBYC/+c11eh2K6ev6/s
         asXKwJRDyCmhyCVCduLIw8+FvzOSBXGsSnaBxvRaMsxNJkIeYN9IKqbC8blQIAGuiQ/W
         3/OSDfXZlDKpqT2Ia2pkuOsYb0/5JW2kNc3K9sz9hDSbXFxbPUKmy0rBe3j5KN4g+IHL
         Ppww1zoIiwJ6rdghhgsMaqAW/QVUThynQhjTjRVECEWwc2zlveSKH//XoL8CA/FeEyji
         omCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc;
        bh=JGenpaCWyLLnK/xNR269H4GFp1amXxq0IdoGi7uZMtg=;
        b=Wv6ZC5tdZN3XKGFiK+PlO3ur+yMDUcZ5jwIBY6tPO/k2hRiVstTB+OJc+tqe0tvhun
         KyZZGlgSAvwznx1WXBzN+LoGeBfs+fmL4Vuw6VorUw8osHxIihGIom60O92K58CJR8Lz
         vBDgOZgTozsM3Yp/InRzMS+PMwiMjV23gxOeWVgmY7OGNZd17xQzIECPDV6vApk638RS
         A+6A52yKn9KJ2SfVI5lYXKNFHv43dZIYuc4I6tL9W2pUJvFiMrhX2jrwfJnUInjOImk6
         6rfDCREeOic61IBMQ5jQHi45aQ/hxB6/FjoyhtPL9eizFT5radFjJtSBZRAYtioui6Eg
         BoKQ==
X-Gm-Message-State: ACgBeo2OIR0ktH322ntovLKtkwIPTDriI+sMgVhU6x6MZWm2Eg97NfXu
        9wcmcADKSzpZYCc6ZPn9mC5WJk9m8kw=
X-Google-Smtp-Source: AA6agR5G+dGrPkq7Q99qjXyxRzF+ponomRBI6Z8S4tz42QLPc8YRHujFl4ktscA2pX4cwU+LZ2cW+g==
X-Received: by 2002:a17:90b:198a:b0:1f5:2f97:12a0 with SMTP id mv10-20020a17090b198a00b001f52f9712a0mr19360055pjb.97.1659953710262;
        Mon, 08 Aug 2022 03:15:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l14-20020a170903244e00b001709f01c423sm3060685pls.32.2022.08.08.03.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 03:15:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] hwmon: (lm90) Fix error return value from detect function
Date:   Mon,  8 Aug 2022 03:15:04 -0700
Message-Id: <20220808101504.1933123-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

lm90_detect_nuvoton() is supposed to return NULL if it can not detect
a chip, or a pointer to the chip name if it does. Under some circumstances
it returns an error pointer instead. Some versions of gcc interpret an
ERR_PTR as region of size 0 and generate an error message.

  In function ‘__fortify_strlen’,
      inlined from ‘strlcpy’ at ./include/linux/fortify-string.h:159:10,
      inlined from ‘lm90_detect’ at drivers/hwmon/lm90.c:2550:2:
  ./include/linux/fortify-string.h:50:33: error:
      ‘__builtin_strlen’ reading 1 or more bytes from a region of size 0
     50 | #define __underlying_strlen     __builtin_strlen
        |                                 ^
  ./include/linux/fortify-string.h:141:24: note:
      in expansion of macro ‘__underlying_strlen’
    141 |                 return __underlying_strlen(p);
        |                        ^~~~~~~~~~~~~~~~~~~

Returning NULL instead of ERR_PTR() fixes the problem.

Fixes: c7cebce984a2 ("hwmon: (lm90) Rework detect function")
Reported-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
It is interesting that some versions of gcc interpret an ERR_PTR this way.
It did find a real bug, though the error message is quite confusing.
Would it be possible to enhance the fortify functions to detect a constant
ERR_PTR at compile time ? I think that might be quite useful.

 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 03d07da8c2dc..221de01a327a 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2321,7 +2321,7 @@ static const char *lm90_detect_nuvoton(struct i2c_client *client, int chip_id,
 	const char *name = NULL;
 
 	if (config2 < 0)
-		return ERR_PTR(-ENODEV);
+		return NULL;
 
 	if (address == 0x4c && !(config1 & 0x2a) && !(config2 & 0xf8)) {
 		if (chip_id == 0x01 && convrate <= 0x09) {
-- 
2.36.2

