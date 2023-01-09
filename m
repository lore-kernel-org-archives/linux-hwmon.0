Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60251C54EBD
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Jan 2023 23:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjAIXfv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjAIXfs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2023 18:35:48 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B4A12D1B
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Jan 2023 15:35:46 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id a25so2417598qto.10
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Jan 2023 15:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAQ5x8sXqId87oFdYjO4uZPHDrI2i2uwd2opX19vmOw=;
        b=PtRgl7ZnzX2PfS91nIuCf9T6u+h0mc6qpjvsYi06PuTmH3Tra4kD8UgkumH68gQIpN
         DCJ3lhvFqHqXtCBDohnawC6UnMgr7OJLM5Xqnd4EGPo8VXgwhSba2yv35Bt2ZibipIkc
         gqcxXnkWtXa6iwGB4Ino3aVS4/woNAkhnfWZWnd1OEYnLwdueScmV5GSGlh3/DoId5qZ
         JDxEab0uFowb1mXWSA2KxsAN6ULKoFCUXyiMhmWV1J/g1HwAfxSFsye3UdY0sClbbjdf
         Jy3Fn4/nUroZO0N4jpsYb4BH5EKsorGbcV1crq0CwKw9vfECzF6UXTMFs26VpW1sJ6dA
         5xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAQ5x8sXqId87oFdYjO4uZPHDrI2i2uwd2opX19vmOw=;
        b=EVGRBQ5aP9uOlS754q2HvKvpZA0o/GOiXNWxyXiLJV9vajWIRSH/Co2kcPveZlmAET
         Ir2HN3VXewuPvHMBAbD98uPhhw6NfmVcLxl2vAazlVKfHzrZMPEFXuKI7V9nvhQjtXN4
         2G9+rgw5VvxGyDzLSlEKVjGWvijg4b7CCtaQcfSoO/6xeU3aTcq29Xl9MhweFFyok/qr
         hhIjEGJfsp4BOb5w5M7L3MBKIJyIur0sXS1wc7NqcST8gjQAJaLfEA1mktsHDmmaGbn2
         6YhJXl/RZBh2mMPREOlt/LUnw0oISlYK1KddJMEzq4ix+cJib8dCV/3Hv78MyLtP9hOQ
         mlCw==
X-Gm-Message-State: AFqh2ko3xFsN3SrgDkFL7guTPlqxMAuYQvef7Tnwplqcuma4qfRAaujb
        jQ2OK16ffEGQjOZvF0XN5xu1BlBsGP70Drdc
X-Google-Smtp-Source: AMrXdXt8ysJVcxnoPwxrF94z9qSoCyw8/3o3aYVCG8qH1P4piLXsQUbG6bYRrvTdrTdQdYhL+G/M1w==
X-Received: by 2002:ac8:45c8:0:b0:3a8:5d1:aaca with SMTP id e8-20020ac845c8000000b003a805d1aacamr1389882qto.11.1673307345514;
        Mon, 09 Jan 2023 15:35:45 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006fa8299b4d5sm6294846qkp.100.2023.01.09.15.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:35:45 -0800 (PST)
From:   Jonathan Cormier <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jonathan Cormier <jcormier@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
Subject: [PATCH v3 0/2] hwmon: ltc2945: Add binding and shunt resistor support
Date:   Mon,  9 Jan 2023 18:35:29 -0500
Message-Id: <20230109233534.1932370-1-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214220727.1350784-3-jcormier@criticallink.com>
References: <20221214220727.1350784-3-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Added the ability to specify the value of the shunt resistor in the
device tree instead of assuming it is 1 milliOhm.

Would be good to backport as well

Changes since v2:
- Remove newline
- Combined overflow fix with "Allow setting shunt resistor" commit
- Add description to "Add devicetree match table"
- Add fix for unhandled error case in ltc2945_value_store
- Use imperative in descriptions
- Remove unneeded overflow check from ltc2945_reg_to_val
- Fix up DIV_ROUND_CLOSEST_ULL calls, per docs divisor should be 32-bit
- Split one DIV_ROUND_CLOSEST_ULL change into separate commit per
 Guenter Roeck's comment
Changes since v1:
- Add devicetree match table
- Add kerneldoc for the ltc2945_data struct
- Cleanup excesive comments about the shunt resistor
- Switch to device_property_read_u32()

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
