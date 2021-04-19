Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7595C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 18:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B936561001
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 18:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239912AbhDSSG6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 14:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238677AbhDSSG5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 14:06:57 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0584AC06174A
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 11:06:26 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id i20-20020a4a8d940000b02901bc71746525so7934884ook.2
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Apr 2021 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=B1xGK79M+Vu89acMIQiZhEpvs648OxSg+/sKOFAIFWU=;
        b=HIuXcs9xfNUcDn8/h53Xw8ORo4XsBrDXp5FLPMViHW5OUg6mnLOFPPova3bgDfQX2q
         GtIZtpOyzc/0IImbPGklsGLkY0EmVbXpca/tJ6qPyCzBGX8roYdfjTFaAV4jMqs/+WPJ
         WMja/Fuj2TTmy5UK+5eyZ225BUe29mQYiqtWv8E64h4xOoxZQdcn9tgB8z6FWJCbV0xf
         3U7ABpCf57eqkMg7OMDGFoWE4wqYfkBYoZxQWoZRzyBc6+K7JYtsLZZ9O7wt7rG9xYZ2
         0UN2oDybQuP70L7sSbLBu154ausw3o5HrUgphRoxFMdpxTt0kaIUedcpMhUR8DtzDS+D
         ILtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=B1xGK79M+Vu89acMIQiZhEpvs648OxSg+/sKOFAIFWU=;
        b=YrEEviq4x47uh1ELt69z2voVJuOf36tn4CtduZrYDxbFzaopvivr+saI25Ppttlfs5
         ptTU/yBCfjq0wa0GEiRiGvBnQ4ldhxeG5d3YiBwoBgnwMef9W1zPY9JHF/y4kWBl7kML
         7BemKPNBm/2YF03dCc9OYLCEVJjuMZMxD3bEkLAEOBuoJ+6Lx/E9gfoIzj4DU5+WdobC
         SL/xDYn3+DsnxIj8QddpYxQpD7IoE5OqvCIxAGQ7r+IU78eiBZeCr7F0nXMrIbjkwruC
         yUs52YvlXJhiwst1XDOVKXmmDFlrSk0c/EPlNzB3W+lnq7D5Jdx3RFdeezQtftx3s2bP
         aVbA==
X-Gm-Message-State: AOAM533EbVvzDtfo+lOZwyzgVLeFaFZKOfE7dtv1wKNCPpHGZ4WflyU0
        eEgW3HIg4aGWnxOtUwIZOFVBeRPema4=
X-Google-Smtp-Source: ABdhPJyGQOJCm1YC39CvunKnO/Gp8FAlsijxYx/nOQIG/+58WozKli1fqqeSlA9zkLTdutiBgtTqkQ==
X-Received: by 2002:a4a:e797:: with SMTP id x23mr14367761oov.24.1618855585123;
        Mon, 19 Apr 2021 11:06:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p22sm3728792otf.25.2021.04.19.11.06.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 11:06:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH] hwmon: Clarify scope of attribute access
Date:   Mon, 19 Apr 2021 11:06:20 -0700
Message-Id: <20210419180620.120100-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hardware monitoring sysfs attributes are used and displayed by unrestricted
userspace applications. Standard attributes therefore have to be world
readable, since otherwise those userspace applications would either have
to run as super-user or display an error. None of those makes sense.
Clarify the expected scope of attribute access in the ABI document.

Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/sysfs-interface.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index 678c9c60b5a3..13c5acb72d63 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -65,6 +65,14 @@ the desired value must be written, note that strings which are not a number
 are interpreted as 0! For more on how written strings are interpreted see the
 "sysfs attribute writes interpretation" section at the end of this file.
 
+Attribute access
+----------------
+
+Hardware monitoring sysfs attributes are displayed by unrestricted userspace
+applications. For this reason, all standard ABI attributes shall be world
+readable. Writeable standard ABI attributes shall be writeable only for
+privileged users.
+
 -------------------------------------------------------------------------
 
 ======= ===========================================
-- 
2.17.1

