Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5451FC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 22:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiLNWHi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 17:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiLNWHf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 17:07:35 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A2C3D3B9
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:07:32 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id h16so3719962qtu.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 14:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=CNxtocgVdhiouRT/Ri2e/9sxGZ5y98GKUdSFwy5Vmh67zEhK01ktoEHSVMLfecEGAw
         QlekHUHH7+1q0F/a8RnHa+wgKkX3XB+KDyOZkE2EdZVNbSbjuMK5sqJYztiN05X0asl0
         gJHcfoVUdTDVXvPrjGDLoqEbHd4+aON1w120lmLW6jEABWrpQgwkHoplFPZP56dstEAz
         gruoeobxk+rM4SC4mw20G0evu0aVrol+J6YvMuJkWuSXQcAok3YiKCKou95TUm+dZXX2
         NvrnIUP73Ro9zOk1Gpvs9koNKVRMP6wo6s8eApWSlRr+Kvc37fhAk2JzaeN6JU/fKHcC
         ohlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JUpU8XbUBeWziRzLd+hSHISaqkRCe9RKeFMCtB/GcM=;
        b=0Oj9rNhICc0i9xIvcezqCphEP2Tq2VYTwgBLjejjFlIzWjrRlcV6S/z40K0FM1xmpI
         rRgwO6I2e5rbR2ulT1RakehILM5wYvEpaA3myyDYeLdIFCE6JQjO+UA5nqYQ7urKj5w8
         m6k2q3LAw6w6ZVdOSa3Ge4vE4Lt2F9GOJjJfrqtrDNE3CS4N1xxlpuGtcIbC+N0B0lnl
         XRXtRZa3FH9sUwt/+yQV7otLBHv/RZSFLW0cTg1N9wHPd5iZm0USUli46QDThljmmCy0
         diKmwGw81Ps89rXGUrdwGV2uP6xVfdZfYw8LaV5MySQFeRS0DqmzSrQk4y9mt6LJuLZX
         iW4w==
X-Gm-Message-State: ANoB5plKQ5hSTyLFxO9t7qU+QUyNNUD+19SrheMit+DTy6pILk64PWUm
        bk2gr189Kqx95FJxsRs1pfwmNY0HKmZZhvIQ
X-Google-Smtp-Source: AA0mqf5tyPh08++k7PkNxb1TO06Rfoi5LnlPetPnSNCqg2VUBm4yIRhrBhCeakXApAHZqJZoUOeiWw==
X-Received: by 2002:ac8:5756:0:b0:3a6:8700:b471 with SMTP id 22-20020ac85756000000b003a68700b471mr47000110qtx.38.1671055651738;
        Wed, 14 Dec 2022 14:07:31 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id l24-20020ae9f018000000b006fc2b672950sm10623939qkg.37.2022.12.14.14.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 14:07:31 -0800 (PST)
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
Date:   Wed, 14 Dec 2022 17:07:25 -0500
Message-Id: <20221214220727.1350784-1-jcormier@criticallink.com>
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

