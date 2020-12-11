Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C7AC4361B
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 22:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C586123C83
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 22:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393113AbgLKVz2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Dec 2020 16:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393156AbgLKVzQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Dec 2020 16:55:16 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154D8C0613CF
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 13:54:36 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id gt6so1717464pjb.7
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=hYQLpIQAE5/Axip10es018C6XUh3MhNHtJpTlD1WAo0=;
        b=Yq2V2+0S/HCmoRwuPzTrXXqUv25lxJFRuUv5r7ayLhb8FnOfnEARyaJkpBzfJL5h0W
         SLjC9hGEOX/MTmi+SY3koZs/ZkE2dfUWqywpj+e1ZUDVELZetvYSTt+BE/LNk11UIo6C
         KQ/9GhxMIaLFSlmA9li80DJZ53+biNSYNjJEUMHpA9JUh2X+P75thAjpPw24cEEU0xwv
         KegG221gNp94gxhUAiIJ1saLt1E7YAzulaySc4XMmZrWNa2tt+yRTj4/FFhlp0DCppUB
         OCptSkHJLUlehIwV0kzeXp6z/+Ezpt40k8gtYS2O28oe82tJ72ofv1DRUMphPfKsIVVk
         no6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=hYQLpIQAE5/Axip10es018C6XUh3MhNHtJpTlD1WAo0=;
        b=HJuSXHP2X/8glvY9diJhEIVEG8ul1VDcMH3OPyLcCHPm+KVv7fcmqvzgP8jroffU3r
         d3QMcmsarTYVvjIzz6o5dXB9bCLRbIG+tL0svm35Q3cmfvSRiidKCCecbH3bR5SN9JbW
         8oRAZ6eSSe/5GHn3XpO1G218Edpwszj3AG7KhzOw3OWEdzvvhYnYBq7ggAk6NSXRG/E0
         atsFC9TwUDf7wYtK/PFGZ8vpHbSk+VBgZ5gvpQMrf8jBMmKpPF4KkIwufgn+oelACPmm
         i4+Xhc/6WdwyBr8yD8cmpnwEo9rBElMwax7q8ctA65gN1WO9QNLLzAUnP6GIIqi2wGGH
         00CA==
X-Gm-Message-State: AOAM531xHdAbJfnaaVUb68xPMGYiPDIiILgVu8+VbH7fMEVrKpamCBIR
        dPQnDZsYCnX7/YCe+htNOmzApb4fIQ==
X-Google-Smtp-Source: ABdhPJxtfdrdKRpRKa4d5PNa0dLBVDAHtyXSihMPO14aQqpZ26aPmkyBpZu6VDejyrLbK+HND/kTNhUhag==
Sender: "kunyi via sendgmr" <kunyi@kunyi0.svl.corp.google.com>
X-Received: from kunyi0.svl.corp.google.com ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr1446850pja.0.1607723674991; Fri, 11 Dec 2020 13:54:34 -0800 (PST)
Date:   Fri, 11 Dec 2020 13:54:24 -0800
Message-Id: <20201211215427.3281681-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH linux hwmon-next v5 0/3] SB-TSI hwmon driver v5
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, supreeth.venkatesh@amd.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

v5: addressed comments in v4
v4: addressed comments in v3; converted DT binding to required schema
v3: addressed comment in v2 and improved documentation
v2: rewrote using devm_hwmon_device_register_with_info() API and addressed
    comments received in v1
v1: first version

Kun Yi (3):
  hwmon: (sbtsi) Add basic support for SB-TSI sensors
  hwmon: (sbtsi) Add documentation
  dt-bindings: (hwmon/sbtsi_tmep) Add SB-TSI hwmon driver bindings

 .../devicetree/bindings/hwmon/amd,sbtsi.yaml  |  54 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sbtsi_temp.rst            |  40 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sbtsi_temp.c                    | 250 ++++++++++++++++++
 6 files changed, 356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.29.2.684.gfbc64c5ab5-goog

