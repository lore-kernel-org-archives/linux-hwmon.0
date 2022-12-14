Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5065C001B2
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 22:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiLNWEn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 17:04:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiLNWEn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 17:04:43 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8325B2A26B
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:04:42 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3e78d07ab4fso16651617b3.9
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=De73Fa1DANEEs3bK9FckNfYXZeJRPOkyuCzS+MVlC4tUgwzA2pBEj7/0/dEW86dNyz
         IlkvxyJ/lZh1rbMCws6xHqVHzWR9ld4fo5pqxKlHgmxRjabk9dl4PmeIlvZ6GMfEtAcT
         jNX7QzL4y5Nx/EwvJsjkCxpVuC4Z04cm+AUyceQdbLaHtCd/BdRXs7UqVHN1K0J23Qr8
         erOEhbqdeZQxeOLucVxqgF3m44/sCnpiHfB5kZhhQcbzB59V50gK/Cz02uZbJgNIdacn
         0uC4be0IIPXCzY1XEzH+n54DCk0tioSBljfRYRc1lmjO5hEogZzPU15O331x9Sc0YDZh
         zXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=EqW9qcztUmc2SSebyMgyvFijoy6FKEdUFrMDXivJtGFfY52F3FTg3YCd1AtPV/z2O7
         luRMGrn+MKatyCCaI+v/0vylTO7KS43Ss5Wi2g5aBpAGuf536j5rSW5HrW+E56IUZuJp
         tZ1fHKdubPULghWt4CAvK+g1kTs1rO8RkcOYGt7h1kct70XYk1GpAoqC/WnXcm3Xra0U
         6dVn428bqQNAZm76njINS0bYIbKSYmhqFfX+4LO23u5OBNSNTYuxc5rZnI9jyPx38UBP
         piAcT/hlh9+Q2gJcZluZhZreiK9P0rcuxWCCWf+2D4E2pi0pxkp4tRxnKDsUvIIqCRcc
         wm+A==
X-Gm-Message-State: ANoB5pl029t/LH4Jsjy94X1JwLCyy4hpcCx42tFf2j4zaHogIoft8Oq7
        /TAq6KH7BGqRQVCqMSIHNrqgE0vMVd1wpCgL
X-Google-Smtp-Source: AA0mqf4dSLN5xgccP3+4JhfC+7D2n4HMblfj3jWOgZIF7iowR0GVMdjUX/T/vRir/jeM/WsRZ/YQ+Q==
X-Received: by 2002:a05:7500:2315:b0:ea:6516:c423 with SMTP id t21-20020a057500231500b000ea6516c423mr3659135gac.76.1671055480871;
        Wed, 14 Dec 2022 14:04:40 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id s1-20020a05620a0bc100b006cfc01b4461sm10723143qki.118.2022.12.14.14.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 14:04:40 -0800 (PST)
From:   "Cormier, Jonathan" <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     "Cormier, Jonathan" <jcormier@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
Subject: [PATCH 0/2] hwmon: ltc2945: Add binding and shunt resistor support
Date:   Wed, 14 Dec 2022 17:04:21 -0500
Message-Id: <20221214220423.1183748-1-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Added the ability to specify the value of the shunt resistor in the
device tree instead of assuming it is 1 milliOhm.

Would be good to backport as well

Cormier, Jonathan (1):
  dt-bindings: hwmon: adi,ltc2945: Add binding

John Pruitt (1):
  hwmon: ltc2945: Allow setting shunt resistor

 .../bindings/hwmon/adi,ltc2945.yaml           | 50 +++++++++++
 drivers/hwmon/ltc2945.c                       | 86 ++++++++++++++-----
 2 files changed, 115 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml

-- 
2.25.1

