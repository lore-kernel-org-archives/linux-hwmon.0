Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ADDC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Oct 2022 20:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiJJUdC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Oct 2022 16:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiJJUck (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Oct 2022 16:32:40 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A66D4D806
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Oct 2022 13:31:14 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id qw20so26634537ejc.8
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Oct 2022 13:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sBiK+vbAyImg9kEuDq6EBbSbwMid7160KaW98IfOhY=;
        b=cdRSLezFtOdO8YALIaPRVQR+XQW1p79fMWkbZFN9ICu1ECnnoksUPF9nqCT/X9FiJP
         0vvDb7nFi50ybvml5q33Zg88xApolUxe3rbZkjT3r5EOR1uJ8dahsSMCJl38T+5vxxwE
         CAQWW3Ric1u+ykiZCq9+02NWyphwlWymd7Chs+wuvMbFf5CAx2dKK0Evfz9LLwB+MdBa
         MomXgcSIkpyV4DCRlFHcwsGNELb3e0MbNuTuw4cUi7Bl/rz6w5DTzLcrXE0bnp38Iqow
         azeAp3Vgyd+5zJb8uLSzaDMDmLSU7IkQhLnENERailKtXk1FIYJhmVUJr5RDjixN40tx
         +tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sBiK+vbAyImg9kEuDq6EBbSbwMid7160KaW98IfOhY=;
        b=ABHLri3ULSaDATjJ8zME7aIUotY64JDF3QDcJKFnIrn76bSGWWSBQQ1ZsdzdbsO8wA
         FH/Te5c6909mm1hWDstrsOhxamDC+ppYDyopGO2k37qZXs97BB+e0icEgdWHNpclhUrJ
         31AfXxfddX2YrJpQPhArA1z9db2ztr/d7+THwkwSZHN0WkJSyo2zXJC79ZgOAgMM1S53
         g01WfrhIjxtlZ3X1NlGMmK3jESBRWfslEIL3iXUwMM8b4wF6HRA3y5q1Gb9TFukw4uU+
         +u0rZzTgAcLmrKEaagAl5YRbPo3qYpUEs7qjDtugY3r0jxXjiuw19Zd57q4arDolm5Bi
         PDrw==
X-Gm-Message-State: ACrzQf0W3iDgLELA9f3Tpf6FaCw8y6zrZZaKwPOZqVDnG7ZprHpgb4lu
        uWJVjVcxzp64GxNb/mFM4tHkrw==
X-Google-Smtp-Source: AMsMyM4d2rMBdNHaz+Zh/0HPCNcWkACpXQQ+Am4CB+z+mYMSQwLFAuOl/l+a6MoIGR7+x4taORYK9g==
X-Received: by 2002:a17:906:7310:b0:782:cfd4:9c07 with SMTP id di16-20020a170906731000b00782cfd49c07mr16962842ejc.708.1665433872099;
        Mon, 10 Oct 2022 13:31:12 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id c18-20020aa7d612000000b0045720965c7asm7670385edr.11.2022.10.10.13.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 13:31:11 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 0/3] Add devicetree support for max6639
Date:   Mon, 10 Oct 2022 22:30:43 +0200
Message-Id: <20221010203046.3673663-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches adds devicetree support for MAX6639.

Changes:
- Add fan-common dt schema.
- add dt-binding support for max6639
- add max6639 specific property

Marcello Sylvester Bauer (2):
  dt-bindings: hwmon: Add binding for max6639
  hwmon: (max6639) Change from pdata to dt configuration

Naresh Solanki (1):
  dt-bindings: hwmon: fan: Add fan binding to schema

 .../devicetree/bindings/hwmon/fan-common.yaml |  77 ++++++
 .../bindings/hwmon/maxim,max6639.yaml         | 116 ++++++++
 drivers/hwmon/max6639.c                       | 251 +++++++++++++-----
 include/linux/platform_data/max6639.h         |  15 --
 4 files changed, 381 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h


base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
-- 
2.37.3

