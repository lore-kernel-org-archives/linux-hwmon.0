Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF44C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Oct 2022 20:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiJLU7R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Oct 2022 16:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiJLU6y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Oct 2022 16:58:54 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87631162F9
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Oct 2022 13:58:08 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id bp11so15195827wrb.9
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Oct 2022 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yChYi7VY+m+DrvJmTQkA623G7MkHEI7cjTtlZ46QtfY=;
        b=CkCgF7grnn+w8+bJItdlr661kAayCwQrlS+1aeGHuq8gYnnRJPF4HieHCXLTwkIxAe
         za1clmxoMWwnduh/3idXfTUGqPEKVqrvRPogJr3n5XAOOTxoYvFHMVhtrW9QH264fgeq
         uhrvppR1B0RREFnNav8Cwi3MIF9xutHLImxep1Xhfa8nj/XnrDC/h9k0OLGdSxNHqD3I
         SeTC8e4jOD25SbWO1gCS1HFk484iXCtsa3pus56MLJa/9cywbu6Eg2SAt4+6OxnzwUWb
         Bvsnhj2WgOE74hJH0Lu/GG/LhJr7Fp4cGSemlgZJhOOMJJRe1h2jn2CQHEVjfyFiGdHC
         wG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yChYi7VY+m+DrvJmTQkA623G7MkHEI7cjTtlZ46QtfY=;
        b=rbqZIuzlG9yEWoXseEjnq60AQ3yqdmRcM4ir5x76uJ7PIOA8ZEBVKawdS5P7oIQRRe
         FXyuLn05jF5rWcswyiPbVgBomzBgVd6OsKkMnD2pd6n+fjo2yIYj1OaZkBZS0XjzngnO
         ZUPem458bT558B2PCrzIvCFcMOCTgw0jHhzvQic8zyc5Cy8QlKeZVXv2/TdJGJNjwR8d
         UhPSr38eak7p4v6wXoUlHsk7YIJRfljJatLq0J2kretCYswwoMq6uY8+4d5EA40n7IFp
         gLIRtoEJoji9scywCOdRAhV/1HCr6++Xb4rFHTB+/bNogPp5sESjP2+SLjj6746WBEax
         rbyg==
X-Gm-Message-State: ACrzQf1enUS6W01kk/DqLgQ/fWqAf5iRLk46r77cxhbEgOBb3KrsGKno
        gjtUwD03r1FiVcV02+dbQaII/g==
X-Google-Smtp-Source: AMsMyM422fyj+uXPgmFq4xnogUGAlOP6esCzEZx+cp5eLgZoihGh9AQb+BkS3fDKY5tdNEUx8mNdGw==
X-Received: by 2002:a5d:46d0:0:b0:22c:de2a:23e with SMTP id g16-20020a5d46d0000000b0022cde2a023emr19942738wrs.12.1665608260619;
        Wed, 12 Oct 2022 13:57:40 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c354700b003c6cd82596esm3165443wmq.43.2022.10.12.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 13:57:40 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v3 0/3] Add devicetree support for max6639
Date:   Wed, 12 Oct 2022 22:57:33 +0200
Message-Id: <20221012205736.1231514-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches adds devicetree support for MAX6639.

Changes V3:
- correct fan dt property name
- remove unrelevent changes
Changes V2:
- Fix dt schema error.
Changes:
- Add fan-common dt schema.
- add dt-binding support for max6639
- add max6639 specific property

Marcello Sylvester Bauer (1):
  dt-bindings: hwmon: Add binding for max6639

Naresh Solanki (2):
  dt-bindings: hwmon: fan: Add fan binding to schema
  hwmon: (max6639) Change from pdata to dt configuration

 .../devicetree/bindings/hwmon/fan-common.yaml |  48 ++++
 .../bindings/hwmon/maxim,max6639.yaml         |  86 ++++++++
 drivers/hwmon/max6639.c                       | 206 +++++++++++++-----
 3 files changed, 286 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml


base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
-- 
2.37.3

