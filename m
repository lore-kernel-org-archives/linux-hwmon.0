Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86730C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 22:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiLNWGl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 17:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiLNWGk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 17:06:40 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C062CE2D
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:06:39 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3b48b139b46so16497467b3.12
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=NDPFzJ9fbND686sGh8mSqpVBsUYGoGThHXm95cc7zr0hT+7Cwt6ZsWADoXQPw6AS6J
         geVLz3AHZZrEbtCyRW9HZuxhwWapDuczb+425AWcvHDXGm2tm6UHwF8QBDec8fQB6ISO
         Ztk0gksV8z6xWSrW7jCgl+yU+lgteuRUXLg68TCyW9MPM3Crdhze8sD3k0bmNBKIxOU8
         TrZHNRE0gFQM3SWrheRnMyGmBI7N2TmWHUDAGqBrL8y/COOp4a80cqivvOYBnUePqdyN
         AHOXaxMT97lmDhx7mUanlsLtDnJ906tjhKUspjhOAbphYpdAiBbDyX3d8aJ2Bjx51m0J
         FZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=KOXASXNE6QetWTX/6mgF4CHhQj3m3K5EHdX2+a0gt1GGzZ/brbRRcCrz5PHZmV3bd6
         3juuh8gF3cfhSNE+P5wXSysV1Z5WJKtYLzOmGLtzaicYS9gBQUnp7RYUtGLQz00ze7SY
         LYTy4/bvkA35TGawKJR6IaRf6xJmelu1qBLS0hvnNgfC1J054toK158Y6ljptDAJIFo2
         srwEiEDFjSo30hTq4JB+muAO/51jKB8d+9y7xsa/Es2HK9HClbyn8gXcvlm4GRNn5QQu
         onmkEDmG4DF3Hv9WFik1vjSGWf46kkLJe9cwx7DxQMZX1aDUWajPI1ReqIkiHjkalr8U
         g0zA==
X-Gm-Message-State: ANoB5pky051xPPGcN/r4d1GpeDVavGcfVNOqR8RAbpytRY85/q3tOzfb
        r4k1/Kk9TRNRMTCmh2B8BsUiwKXgNpHzBd7W
X-Google-Smtp-Source: AA0mqf4UiHF0MHMqFrLKvrXq3ETo8PhgdlzM1DGiZHfu2Z/DEl8NuHTSQ7vZX9TXXp+nBVT2mBK8FA==
X-Received: by 2002:a05:7500:3cf:b0:ea:730e:6007 with SMTP id p15-20020a05750003cf00b000ea730e6007mr2874719gab.28.1671055598158;
        Wed, 14 Dec 2022 14:06:38 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id bj17-20020a05620a191100b006b95b0a714esm10783173qkb.17.2022.12.14.14.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 14:06:37 -0800 (PST)
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
Date:   Wed, 14 Dec 2022 17:06:30 -0500
Message-Id: <20221214220632.1309739-1-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214220423.1183748-1-jcormier@criticallink.com>
References: <20221214220423.1183748-1-jcormier@criticallink.com>
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

