Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BC2C6FA82
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 05:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiIVFHh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 01:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiIVFHg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 01:07:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC03AA4E6
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 22:07:33 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r7so13636105wrm.2
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=tK5lHod9VIHuRKzd2GfoBvHOMOlwl6X/2A4iC9byFb8=;
        b=a9md+zipNrdcG51Uh3J+YDPzyDFpdS5vspX0xhvCCjhvHC7hX/jgD6RRtjMWCAlPh/
         ZJQBhdeyucGybkXSexctNtWZu+2wGFzaxsb32PQTND4DticEkFQp6ybznXkkXmQ0NXNN
         M6+R955dcU869qQjJiMuG8kWsh+cRD/R/E2/H1nARjEjpqfHuh3QDWnXXbNZanJA6rE9
         xmFQStY4c5GBmQXXK7nOaBtKa1EmvTjXV0qgK7BGL0NejFwGrUDs9iS8e9TOO8bj3ioK
         808FtGjqFhCuUhCAcooUr8Y0B35hw95EeMButTH55Os2lk5xgKB4S/5g/zO2RqfdlWb+
         FIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=tK5lHod9VIHuRKzd2GfoBvHOMOlwl6X/2A4iC9byFb8=;
        b=fgAoyy8+0N9guMNqzrTBuEVjZNqwvYGxixBxpEjrumalag7OI+nuiXaCmsW5n4+3WT
         gRzOSxWV8GYLxFV9U6THPaz+FAuQuCGxac/nPyXhuyHBq3bcfh38zwz3t+lAq0IRxE0/
         l3jIls/bHBghBEl82d6AnKDrN62t7woTbfg0MP4Usgqqq25i8wAc6/yR2cz0dT9Vp+Un
         rLXjGmZVTmBJHUMgGRpqWQrgH1Mxsty33Fgqm0+F2V7/6oEf1f7PyL4XhdRJtta40ngJ
         OX/8y772YwJglwFsiIVc7vHD9w33EogsQVfPKEO3fZL+B6eD+4sNUWEWz/MOlT7PaXcA
         Fwzw==
X-Gm-Message-State: ACrzQf0pRj4hXI8OTYdtWp4jPKRlJ3FW+kp++S6TbhFDHm6DF3EfEza3
        5gOQq8463/Inxm1FBaBIB7hFxw==
X-Google-Smtp-Source: AMsMyM5eCpN6/NrR5/m8G++8LJFcS8SxeD5LG49USZN9hSF4Aa6pRv+23IrjXrTI+WFSmDl93Op4vg==
X-Received: by 2002:a5d:5a9e:0:b0:22a:498d:d2fd with SMTP id bp30-20020a5d5a9e000000b0022a498dd2fdmr744732wrb.390.1663823252350;
        Wed, 21 Sep 2022 22:07:32 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003b47ff307e1sm4569595wmd.31.2022.09.21.22.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 22:07:31 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 0/2] Add max6639 regulator and devicetree support
Date:   Thu, 22 Sep 2022 07:07:16 +0200
Message-Id: <20220922050718.1079651-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches add devicetree support for MAX6639.

Changes:
- add dt-binding
- add max6639 specific property i.e., maxim,rpm-range

Marcello Sylvester Bauer (2):
  dt-bindings: hwmon: Add binding for max6639
  hwmon: (max6639) Change from pdata to dt configuration

 .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++
 drivers/hwmon/max6639.c                       | 162 +++++++++++++-----
 include/linux/platform_data/max6639.h         |  15 --
 3 files changed, 231 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h


base-commit: 9f6ca00b5be47e471e9703e6b017e1e2cfa7f604
-- 
2.35.3

