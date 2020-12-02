Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24618C64E7B
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 16:57:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C07962173E
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 16:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgLBQ4y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Dec 2020 11:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgLBQ4y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Dec 2020 11:56:54 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFE5C0613D4
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Dec 2020 08:56:14 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id z129so1724969qkb.13
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Dec 2020 08:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=H0Lx50SxnIIzq7vdxrU5tdSCLsBn1UooFpJpI+vmNx0=;
        b=LGWULYKLmYseaGlBpFr0VLKT3quD+zRnAUWVKgLWK0z4+g7iRjme5rOGmC3FLCL9sf
         1gh5HghvmJy2Dj0dPz08xJBiWDYUsJkyfhexNtU8yEFFpuVOfMkpiFP9OCxUtMbSBctH
         RLmES9P3LBxpnKkJfo5rxSjb/pc1vfwyjn5+EdeX8sWzvACAkpi7RRgXjd/bh2nZBtLG
         BljQEy2G8HsVGEtOAbtUNdK/2w214g3N3nzYthEZ94M3IfxLYyI0cSJmxcZERKLCwN1F
         3bLP6W39o0Z84bj0AZYLr7Y5qDBthOOaTO4BkbApdoPK83XAFG0brnppFu3NspPRFrDK
         moDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=H0Lx50SxnIIzq7vdxrU5tdSCLsBn1UooFpJpI+vmNx0=;
        b=SqSPGAx85OMMG3Gqjqw6jtkk4p1BwnrByWE9QaLtV4/CekaEn9kf18UlgSQ5pmXPVi
         84r66JKT8dBfSP7cjqL2lZ2yB0L0d/+yG6McN9szPF/U2U6WxB4hcqSyVfHzCzAsIeaD
         UNxH/H/+YoX0ILJx4ROXg/l0yWU29IbVhe7St6dHtcBtz26cw5lwWD091IZrl1xXUK7Z
         xrIeHWZi0iiNDnQfED0jXnLUw9fuEry9XEAepesjHpLLa3oP6n4+3EcHENw7nZnh56dM
         zGudspopqBwF5fJWsxjI5jnTZ7AORQc7P13cKLC+s91UedQiFWV3eNplqILOGyo5+S1G
         n7gw==
X-Gm-Message-State: AOAM533D9WXCXxzeQGLa7yBJfJFeMbbch8WTYjQj7OBKkRDT8uKrVWxW
        faCsrKPkgyUle9yQ0bj+Dw2MaCoTsA==
X-Google-Smtp-Source: ABdhPJwSn/rOgK8TFtSRu2/m7GlbGrv95pPDs73+aOV6pufVL7iwq4wJYVgLy7E57bcSmSMQIqMtQMSTkQ==
Sender: "kunyi via sendgmr" <kunyi@kunyi0.svl.corp.google.com>
X-Received: from kunyi0.svl.corp.google.com ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a05:6214:a8a:: with SMTP id
 ev10mr3649574qvb.41.1606928173217; Wed, 02 Dec 2020 08:56:13 -0800 (PST)
Date:   Wed,  2 Dec 2020 08:55:58 -0800
Message-Id: <20201202165601.1532213-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH linux hwmon-next v4 0/3] SB-TSI hwmon driver v4
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
 drivers/hwmon/sbtsi_temp.c                    | 265 ++++++++++++++++++
 6 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.29.2.454.gaff20da3a2-goog

