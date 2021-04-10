Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5FFC433B4
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Apr 2021 06:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 239F66102A
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Apr 2021 06:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhDJGhD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Apr 2021 02:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhDJGgp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Apr 2021 02:36:45 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E93C061762
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Apr 2021 23:36:31 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so7827800otq.8
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Apr 2021 23:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=kV4a8TLjuWhFN6mDVHpqK8ZrYMgcVu/JV/48neIiKQQ=;
        b=hWWhlcJ1IPPINrl/HqHGKQQN6t8tbQj+SBCHjfM7tFSvMcm/SZ6GM99rIxQeyy+dqG
         ym1wsaLFtKdCLbPxexqsVCDUpIQvrzs4M25h+fBs574KnTt0br0Lj4M66PhNFafcoLoc
         Ej3kSxga8mXkuUMun433jrbPUO7b72RX45W15QHgacul3ta4X+BkWegfMnFk5fS0cQ9g
         fInVxshZCVAJ7szkt068Li8lDa10a0STH55Y98IrGDAiL6WDw3p2bwzrXIsG6a+dVGTw
         FmGe4KvO2ooPtcYYYEO2HGpXioGz8LmwoUHjb1Td71YCOLvLrazN6IMAB3toIeCHK5pm
         zs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=kV4a8TLjuWhFN6mDVHpqK8ZrYMgcVu/JV/48neIiKQQ=;
        b=rlen/1Yv/Zp/XQLnyfS6kyvKEIGqQL+AT1RMZaA8lHVboZRSjc9WPl4zQob2WEF0R7
         UQWclELu+Lpd7XUM228ywVl1TnGd1+lzCOBl/+qHE9zA/KMqz0uc5ggChCdmLJFDQ7xL
         yD7chihMQvPyCmm81JxmcL4qUajKJfAfCCZBYIZ8SQaLbbKzqXE3cjRIaT4pnURJmfu/
         +pUO595wWZZmN2o6BRQtAVjBq8kQSRwotOWYiNtWdvp9kPjkko/nB1dkyBf0fQ4Kecx5
         WRFW0akzJZtBbQ+ILyLmVd0xQYvwz4VFkAHqwkEQvJz9bau7e9jFhKKxbppjF3bbpjra
         LasA==
X-Gm-Message-State: AOAM533BKX8/U2k2wdlmMVngg2moknvxCjJzV8tr3MREhVGCS0SssBGV
        BcRk2t51/ve94eApXs+9h3NvguIQeoE=
X-Google-Smtp-Source: ABdhPJyVfzBbTgiNQ3uQOernLpoopHhJtQbtYuGrv6UdJ91enoXD7O8XCmhpEiyV/BTaoKXR9FFQTg==
X-Received: by 2002:a9d:4e95:: with SMTP id v21mr14682226otk.361.1618036590286;
        Fri, 09 Apr 2021 23:36:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h17sm1082034otj.38.2021.04.09.23.36.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 23:36:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MAINTAINERS: Add keyword pattern for hwmon registration functions
Date:   Fri,  9 Apr 2021 23:36:25 -0700
Message-Id: <20210410063625.139687-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

A pattern match for hardware monitoring registration functions ensures
that hardware monitoring maintainers are copied whenever hardware
monitoring drivers are added to the tree.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8f9fc5eaf08..f7513d8be996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7851,6 +7851,7 @@ F:	Documentation/hwmon/
 F:	drivers/hwmon/
 F:	include/linux/hwmon*.h
 F:	include/trace/events/hwmon*.h
+K:	(devm_)?hwmon_device_(un)?register(|_with_groups|_with_info)
 
 HARDWARE RANDOM NUMBER GENERATOR CORE
 M:	Matt Mackall <mpm@selenic.com>
-- 
2.17.1

