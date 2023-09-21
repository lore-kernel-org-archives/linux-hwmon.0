Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580BFE7D0AB
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 19:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjIUT77 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 15:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjIUT7p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 15:59:45 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F531FFC
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:26:45 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id d75a77b69052e-414ad768944so11622551cf.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695317203; x=1695922003; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YIjCOkiBe6G45aEBYQSULZ5zzwzapCnaNAVKzWT/a/I=;
        b=amxZv4GnZBlIcy0UrjUFFKo96KIn1aGJvHqOuJSgpqi3DhVLr6otr3hHSoLz0usUp7
         inVYnS32vxWXYcPDlAyKamJCi9StIrKwcmFiIe1ZxK+cU+5L8x14jy66yWxaJy7YUK5d
         88g5PmuGMzzu844EV5BxSHgAlPVZAeLET5b1lVLsPMoOLhGSy2RkXU2Kt8neauVcIHFL
         cY6RgAWw4o3tpjr1AjJHpsMLDEzGT+4C57PxpA1ejnZFoNJgcXqG16ZsDBEF4oiMNDuQ
         +gchnMuBzbF/AWf3+JsqfKgd8H6yDzPHMrqGiPFf63KuqiTklkBzn/BmWeocJuzLfVPF
         bCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317203; x=1695922003;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIjCOkiBe6G45aEBYQSULZ5zzwzapCnaNAVKzWT/a/I=;
        b=NlEpQjnAMaLVGigFCJreagc5/HAfdB6J1n7IMZ0S0HkxliFEjZZKHaI4Pks8DcN+tc
         32QRvLnfAuRqByraX4/IAk1sTUSxibGpUOW4t7E0dwTIx7cMc9RIhZ4f3CpD++rFrN1j
         CP/BNLjxselVsZ1wE3qHLixhHU8sRMyix6IrVkN2bLpWg5ub7fp3mUjM2kMptM/VlTXX
         KtdEaYP6kMZPRsWBRj+rIwlf5KfPEHDR793kMsvnF3ZGEtMAJfbN+ZSN2s9BqxRp2B32
         M/P8GbZDFWEfiG9MmVnDfkTaDv0eMhvOGB/G4FbGB1W88Gv7Yg86e5sn08Rbfplwxkk9
         KfXA==
X-Gm-Message-State: AOJu0YzfZ8KjxAXhDwn6aL2isj/voyWIQpRvhkC21+2nIEMqMpS/Hkzh
        lQuPYH0LBUGatyz/zvKJXMpVA/WqMqJRQ4lkbw==
X-Google-Smtp-Source: AGHT+IH0fcnvvWbCy3tA1NPToTyzyqCok+/lRZ+hyvZgNHTbvdwmOOhSJ8DZQCY6OR97NUJ1S9CgcsEA9JZ3kY2F6A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:848e:0:b0:d82:9342:8627 with SMTP
 id v14-20020a25848e000000b00d8293428627mr65500ybk.6.1695274907625; Wed, 20
 Sep 2023 22:41:47 -0700 (PDT)
Date:   Thu, 21 Sep 2023 05:41:46 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJnXC2UC/53NQQ6CMBCF4auYrh0DbRHqynsYQ7AM0ERaMiVFQ
 ri7hZUudfne4vsX5pEMenY5LIwwGG+cjUMcD0x3lW0RTB034wkXiUol+JGsHmaoyQQkD93UOwu
 VHkw5uAmp7HFEAg1aNbwukkw8sGGRGwgb89pTt3vcnfGjo3kvh3R7/4iEFFJQScZVLnPVYHFtn WufeNKuZ1sl8E9Z/SDzKBdCFlLw+iwl/5LXdX0D8+S7ATsBAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695274906; l=2206;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=KXXNR06fDm8CjylUce2un2Htp6ByU6W92dU8RA1crQ0=; b=tRLI7Wgpm3CdsY5jEJd3FjvprLZLD8Phcapc19BeFcZk7gq7oTTv/7ibAxYIwzP3dYb+qpKyy
 lrJy6DcBeL0CVRcBMo3/zxp4L1fKyeXVokEzzyyqcYvL35mdA/5lfZC
X-Mailer: b4 0.12.3
Message-ID: <20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com>
Subject: [PATCH v3] hwmon: refactor deprecated strncpy
From:   Justin Stitt <justinstitt@google.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

Let's refactor this kcalloc() + strncpy() into a kmemdup_nul() which has
more obvious behavior and is less error prone.

To avoid truncating the last byte supply `...length + 1` to
kmemdup_nul() as `element->string.length` does not account for the
trailing null as made obvious from it's definition (and associated
comment):
|       u32 length;	/* # of bytes in string, excluding trailing null */

... this is precisely what the original kcalloc invocation did as well.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v3:
- refactor to use kmemdup_nul() (thanks Thomas and Kees)
- change commit msg to reflect ^
- rebase onto 2cf0f71562387282
- Link to v2: https://lore.kernel.org/r/20230919-strncpy-drivers-hwmon-acpi_power_meter-c-v2-1-8348432d6442@google.com

Changes in v2:
- use memcpy over strscpy (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-hwmon-acpi_power_meter-c-v1-1-905297479fe8@google.com
---
 drivers/hwmon/acpi_power_meter.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index fa28d447f0df..146c4f09c897 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -796,14 +796,13 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
 			goto error;
 		}
 
-		*str = kcalloc(element->string.length + 1, sizeof(u8),
-			       GFP_KERNEL);
+		*str = kmemdup_nul(element->string.pointer, element->string.length + 1,
+						 GFP_KERNEL);
 		if (!*str) {
 			res = -ENOMEM;
 			goto error;
 		}
 
-		strncpy(*str, element->string.pointer, element->string.length);
 		str++;
 	}
 

---
base-commit: 2cf0f715623872823a72e451243bbf555d10d032
change-id: 20230914-strncpy-drivers-hwmon-acpi_power_meter-c-c9f2d8053bef

Best regards,
--
Justin Stitt <justinstitt@google.com>

