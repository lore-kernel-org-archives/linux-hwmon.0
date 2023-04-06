Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB451C7618D
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 18:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjDFSUI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 14:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjDFSUH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 14:20:07 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018275B83;
        Thu,  6 Apr 2023 11:20:05 -0700 (PDT)
Received: from localhost (unknown [188.27.34.213])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: cristicc)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 43FE566031CA;
        Thu,  6 Apr 2023 19:20:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680805204;
        bh=omSz48l0UybTV+HHA8qPpKFIFsAzs4QaGW3QYcwvn5Q=;
        h=From:To:Cc:Subject:Date:From;
        b=UoafeL73oyawyImCqQVOUR+Oz7Bv29BuAR+GZIRkRzHLnog1gAQ8ubMLPLjsiiCL3
         WyPrhAQxiSwW+kM/no+IX22d1usTnGL+JgqTXuItFXHlIvgpzBik/Ko+anxomjV/k3
         0+iA1eQ8t77i+ZOwBCGgFJ74278gn/Ulyh4K1w20CLYV+mgKTGfIYVNe0TfYTJIb6t
         FDjngyE6JCIA7tpHt5PxtBSLlj3c8SCP2Itbwpkd6sKGL7488RwN399WweTc4uXtL3
         NdM0Jfbe9EuESNwsjKD4f+EvkOjvsya9O+GqYcGcbYsAyy8vOXmJRXxmofTAJDGXxw
         nSrLzlSMDoJGg==
From:   Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v3 0/1] Add PWM fan support to Rock 5B board
Date:   Thu,  6 Apr 2023 21:19:59 +0300
Message-Id: <20230406182000.956275-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch series enables support for the PWM controlled heat sink fan 
on the Rock 5B SBC and, additionally, converts the hwmon PWM fan bindings 
to DT schema format.

Changes in v3:
 - Rebased on top of next-20230406 and dropped PATCH v2 2/2 already
   merged by Heiko
 - Updated PATCH v2 1/2 per Rob's review
 - v2: https://lore.kernel.org/lkml/20230404173807.490520-1-cristian.ciocaltea@collabora.com/

Changes in v2:
 - Updated PATCH 1/2 according to Rob's review
 - Added Reviewed-by from Christopher to PATCH 2/2
 - v1: https://lore.kernel.org/lkml/20230403105052.426135-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (1):
  dt-bindings: hwmon: pwm-fan: Convert to DT schema

 .../devicetree/bindings/hwmon/pwm-fan.txt     | 68 +------------
 .../devicetree/bindings/hwmon/pwm-fan.yaml    | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml

-- 
2.40.0

