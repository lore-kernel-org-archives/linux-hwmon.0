Return-Path: <SRS0=wGth=DL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89359C4363D
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 03:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 332C2206A2
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 03:14:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gx0u2kGi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgJDDOt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Oct 2020 23:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgJDDOt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Oct 2020 23:14:49 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596BBC0613D0
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Oct 2020 20:14:49 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id b18so4105522qto.4
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Oct 2020 20:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to;
        bh=bom9FZeXsvv6g2LDIbRtwXRbc8ldBMOIC3+l7yMhhgY=;
        b=gx0u2kGiEK54+PeK43yJiQv5E2SYxf95jrYNsEjs5b8tA6TCe6zSa9yWlvsB4dxVae
         zGKDBLHsgbi6MIc1Xag5JYE6YNPzGumv8eGm7ynMV5mjrtsuiDT1nXxTqsDlUD0TUHP8
         jMqw9Br0B9bBrpVCa62n2FoE/y2SQQ3IYTXkO7jwisZWk+gBb9GNedB8jnikOWQ8ljJq
         QHBV7FhdKh2fHNTWr5hPFGmZQphXurnEzSJikNTU1JYDm5SG5EYfjExcGh7WuT6FmiYC
         nbLWXmlds8bSTFdDlBwMHKLdRtOOT+UgqYz/sWeJrMaIlmdIHf3yhBq1LnW0vwo3ywCZ
         DEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to;
        bh=bom9FZeXsvv6g2LDIbRtwXRbc8ldBMOIC3+l7yMhhgY=;
        b=Mvf2VRZDLzHivmKeWw93xP33h42YSTWuUHOiUyjkMD6eRTMTLoyVPsbe3d2bPGTgfM
         Tf7fq8j/fp8ZNEa9/EKYouYpQ7Kp06dVt0gr3kyoCp/fQs9WfWqI51YfyBhWZ58inUmi
         P/8YaO2OXeh6eGBCgqdWHcZEAYMClJBJLLPfaVnJ2+gXIOWa0FLQPxXP/j+ZMgoBsnCD
         a94onFWMFGOQjsdP84bseYjAs8FxZMlvGws9uyAXRF3Bs4FrqM6oaQaluGCvDCVfbTi9
         1oHBdCbMpskwmdaw0Ny8dTPVnGrQhVD+nl3E7xeryoLDO4Ve8P4Jlbx5p6L8rvXr6ssc
         XeOg==
X-Gm-Message-State: AOAM531jo66VWRDHes3zFk95uJJiUcYrZp/xmbpzBZaEkhhHTaAFVch0
        FxyrCKOei1iHSNgPRzPTgBubOpxrqEuw1bc2
X-Google-Smtp-Source: ABdhPJyGieMhuZ+X6FhyESv0mu8dBR7cBPEvk0plMEI4Z14lPACB6PY2IQl2YXGU/NdcTtVP6HQUsu/+lhiZaF1h
Sender: "linchuyuan via sendgmr" <linchuyuan@chu-dev.c.googlers.com>
X-Received: from chu-dev.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3cfb])
 (user=linchuyuan job=sendgmr) by 2002:a0c:f982:: with SMTP id
 t2mr8653332qvn.5.1601781288480; Sat, 03 Oct 2020 20:14:48 -0700 (PDT)
Date:   Sun,  4 Oct 2020 03:14:43 +0000
Message-Id: <20201004031445.2321090-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH v4 0/2] hwmon: pmbus: max20730: adjust the vout base on
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@google.com, jdelvare@suse.com, linux@roeck-us.net,
        robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The patchset includes:
Patch #1 - Implmentation of adjusting vout base on voltage divider
Patch #2 - device tree binding documentation

ChangeLog v1 -> v2
  hwmon: pmbus: max20730:
  - Don't do anything to the ret if an error is returned from pmbus_read_word
  - avoid overflow when doing multiplication

ChangeLog v2 -> v3
  dt-bindings: hwmon: max20730:
  - Provide the binding documentation in yaml format
  hwmon: pmbus: max20730:
  - No change

ChangeLog v3 -> v4
  dt-bindings: hwmon: max20730:
  - Fix highefficiency to high efficiency in description
  - Fix presents to present in vout-voltage-divider
  - Add additionalProperties: false
  hwmon: pmbus: max20730:
  - No change

Chu Lin (2):
  dt-bindings: hwmon: max20730: adding device tree doc for max20730
  hwmon: pmbus: max20730: adjust the vout reading given voltage divider

 .../bindings/hwmon/maxim,max20730.yaml        | 65 +++++++++++++++++++
 drivers/hwmon/pmbus/max20730.c                | 18 +++++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml

-- 
2.28.0.806.g8561365e88-goog

