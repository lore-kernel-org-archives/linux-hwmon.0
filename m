Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DB5C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 22:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiLNWB0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 17:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiLNWBZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 17:01:25 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4532CDFDD
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:01:24 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id x44-20020a05683040ac00b006707c74330eso2563641ott.10
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=YWp+DF9xBAl3T66CYp65RMTBPha/cVnAFe4kRmP9tCFQno+f68ol1vUKHbf/fC2MVO
         3qhzRhbD0g0OmLL9u83LCP7EAc6bgu/PTvJ18hwsU6CI9YNGF1oq05zLmZvZGvh+BXxU
         aCgyLgkv+5gf9GdJjORE2NsXHhNhykjUXOJxKBq+rx1Mbz6RAjtPwWnzGymR88BteNJ/
         C9WonwEwnEIUqnazMB6Y9KLE1xVkTJf+YSFcd1W/5udf5MaVIyuHY9/CBxdH0+GgQ1bN
         TP6YHKRl66zsl68coyT/K3o8WY7MUvfvjs4GIsmpPbT5S7SeeXKDuCbSFJT2tLWoCFA8
         D6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=rnnwH4pomZzZ1uC37jWqcjHAFdeeVW93O1Zfll3ov2bS7wtZRlTYRvrBbA7P+hTyIS
         o0cx+C7vZz4ADDH+af356YddAFESVYMiPL5Vw/UNfTbF3ULveq+qtyhNnWfFyo49V9Ly
         fAbmKezjbSH5yUEadEFjk8jKJBVfA/UmcKhgE+BsgCNXtMI/BQVUYed/kulX8yhmzry8
         LayCEDFPvXSgcK9vHBBaIx0MDUby8CE1nmBL+bWR+lL4EULA3inZTnDs+ImOTgruakPX
         Ug3oanqLYV81DYOGGyM9eN6drG8NphNu5DH/WPRi6YQgHLHorqjJakWkYHM0N5DMWzYx
         W+Og==
X-Gm-Message-State: ANoB5pl9AEIOKQAdBn5edmTRb3CLCv8DaQ4idsM6iZrAMEGQlOcm5Mbg
        KTtEoMJ7hES+ZmAJ6p9Hd/iz+w==
X-Google-Smtp-Source: AA0mqf5Sy3ytPOoKj76/MBT0X6Zq/xUPPDIOU/6PaGM+9U1mLIODvfKnRkzA+YGmAy4F0aLgtz5Wug==
X-Received: by 2002:a9d:7cd5:0:b0:670:99fe:2dcc with SMTP id r21-20020a9d7cd5000000b0067099fe2dccmr6281174otn.18.1671055283563;
        Wed, 14 Dec 2022 14:01:23 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a454700b006fb112f512csm11195043qkp.74.2022.12.14.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 14:01:22 -0800 (PST)
From:   "Cormier, Jonathan" <jcormier@criticallink.com>
To:     jcormier@criticallink.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] hwmon: ltc2945: Add binding and shunt resistor support
Date:   Wed, 14 Dec 2022 17:01:11 -0500
Message-Id: <20221214220113.1127408-1-jcormier@criticallink.com>
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

