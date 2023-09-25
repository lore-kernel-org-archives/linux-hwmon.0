Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65E0CE7A89
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 03:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjIYDnd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Sep 2023 23:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjIYDnc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Sep 2023 23:43:32 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2B3C6
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Sep 2023 20:43:25 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d85fc108f0eso7683279276.2
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Sep 2023 20:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695613404; x=1696218204; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kGi+l4riuiaECjqmxxM9T013wn7H2VmKYNQkmtyxbEM=;
        b=fJC5qr8gg57/YeN024dGxE569nrPQ7n7Ms7eT+oerUUINbPVOFDA+JdoOzRv4WkVhd
         UpajUvo2i8wDGjuBdiyKPPMbFc2ZTqdHIti2kmRE3XglI+x436aTA528ItrdB1CsGWqG
         R5i//U/uAvW7T/EwiAT8+TciTyicA02YT6BJ1qlJ770XUZT5H2sN1Hg68lEHZzqf1s3J
         YIHbnTx87ZBvqCm52BOPE9cvwS3VbUlbkWrVklaJeQozxvKt0JTZQNx90cutgN126vS0
         jzBH7QZfQBRIn7nggv5MgqLeju2k7VpIN5BebkrlU0Cln4PdH3EAh6Y3Xp9disVKr3Ta
         CiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695613404; x=1696218204;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGi+l4riuiaECjqmxxM9T013wn7H2VmKYNQkmtyxbEM=;
        b=vhI9kOA7COqjuL/yo7aMrw4Mz/n5FnT6AZb9liM57PHkBsO7ssVWV2yuey66UrhSV9
         F2q+WR/k59JLOTLWDPm/Tgz79Gzb0Ipl4dU4lDNvwBEN2YwWEu5LdnbsA58jxmP76iYR
         v5kYiiwRKY73RHznaSTeQFeYA05q2n06FhJtWNFjMuR//N6fi5uMh3focHdDXCvA6TAj
         Nxx47lL5PUL+N/EUnhc75dLfm9Uuuq6aJdbUIr2pwElEWW3esjeUg4rjP+iGOlzj28u0
         u1VIiE2CX3NimdW3CmRGd6voFswQL6dxbvF6B34VJlrocgreBHYuODkMCw3ZtqiSdo52
         2nTQ==
X-Gm-Message-State: AOJu0Yw9HxGZb0B89mcMv0BM2WzwQqE1dcyJK2+exGVQFwTATNGv2Uf3
        dnXroshx/jsKWILrwyYNs5Zr506A8LmQ9xU77A==
X-Google-Smtp-Source: AGHT+IHCPc5EgxxRujqxihGGDCVQM4hAhwT+dn65Q42IWRVfZlIOVbw1xYKDwpW15j1rDyTCgAi3WLfG/J+Ani0eUA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:5050:0:b0:d81:7617:a397 with SMTP
 id e77-20020a255050000000b00d817617a397mr54759ybb.9.1695613404635; Sun, 24
 Sep 2023 20:43:24 -0700 (PDT)
Date:   Mon, 25 Sep 2023 03:43:23 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANoBEWUC/53NQW7CMBCF4asgrzuVPXZIzKr3qBACZ5xYauJoH
 BmiKHfHsKLqii7fW3z/KhJxoCQOu1Uw5ZBCHMswHzvh+vPYEYS2bIEStbTKQJp5dNMCLYdMnKC
 /DnGEs5vCaYpX4tNAMzE4cNZj28hKX8iLwk1MPtyeqe9j2X1Ic+TlWc7q8f4jkhUosLJCW5vae
 mq+uhi7H/p0cRCPSsZX2b4hY5EbbRqjsd0bg39k/SKjekPWRdayrip0e3La/5K3bbsDahucXJU BAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695613403; l=2092;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=ioSkjFW6xO8Zk6Hy0g0yjtRiiK1nC4uSchEb5oNum5w=; b=fMjWVGvcSh9yNcffpjEcUdHXCUXqgO+uc1xT2SyEgz2oCVkPicvItUudYEWRwJTfU561WP+ua
 RdtVThBRACuA8mljVOy6FIl3jboq2056DJkW4IqXe500CvQqhMj6Crn
X-Mailer: b4 0.12.3
Message-ID: <20230925-strncpy-drivers-hwmon-acpi_power_meter-c-v4-1-3bac7534f10f@google.com>
Subject: [PATCH v4] hwmon: (acpi_power_meter) replace open-coded kmemdup_nul
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

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v4:
- drop +1 from length arg (thanks Kees)
- reword subject line (thanks Kees)
- rebase onto 6465e260f4879080
- Link to v3: https://lore.kernel.org/r/20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com

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
index fa28d447f0df..c13b5c8a0433 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -796,14 +796,13 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
 			goto error;
 		}
 
-		*str = kcalloc(element->string.length + 1, sizeof(u8),
-			       GFP_KERNEL);
+		*str = kmemdup_nul(element->string.pointer, element->string.length,
+						 GFP_KERNEL);
 		if (!*str) {
 			res = -ENOMEM;
 			goto error;
 		}
 
-		strncpy(*str, element->string.pointer, element->string.length);
 		str++;
 	}
 

---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230914-strncpy-drivers-hwmon-acpi_power_meter-c-c9f2d8053bef

Best regards,
--
Justin Stitt <justinstitt@google.com>

