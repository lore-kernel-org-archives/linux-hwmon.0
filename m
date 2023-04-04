Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CBBC6FD1D
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Apr 2023 17:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235721AbjDDRiX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Apr 2023 13:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235631AbjDDRiV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Apr 2023 13:38:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9011BC7;
        Tue,  4 Apr 2023 10:38:12 -0700 (PDT)
Received: from localhost (unknown [188.27.34.213])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: cristicc)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D66FF660316F;
        Tue,  4 Apr 2023 18:38:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680629891;
        bh=sZFCIz3WQaocYqGt8p6qjyCRTLYO1hDQ2ldahEwFXv4=;
        h=From:To:Cc:Subject:Date:From;
        b=hFHbiL3TJVhsYMuvzK8o18BLOGxDgwWEH81iBBbqrTyGS4mfzVyAX/3+/01lRfh1I
         wLGJmgr1PozqCNMvtbzGlH3o3X9pIiNFq6td/A0VE6678oUhNtnXJJ/KmSkfAaFBS3
         fK04DrX40o8AkUf/mckoZ+Iiq6asgZxEdKmnPD57XSw/ehhi2h1h7aC4exa5tc6zuf
         NNqjwLnT9PMsPbToEyBQ0OHmPYhPN55dOVV2Ha/dwKSqIOayz5oEiF81hYgxQcocXJ
         CcJWaV+PuIuoAGaFVjFgF27CVA5KUhok0C1e2rVH6XG8a4ZNSHFv7e1AxAtuTovzKe
         iLJaptXNdUmUw==
From:   Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v2 0/2] Add PWM fan support to Rock 5B board
Date:   Tue,  4 Apr 2023 20:38:05 +0300
Message-Id: <20230404173807.490520-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch series enables support for the PWM controlled heat sink fan 
on the Rock 5B SBC and, additionally, converts the hwmon PWM fan bindings 
to DT schema format.

Changes in v2:
 - Updated PATCH 1/2 according to Rob's review
 - Added Reviewed-by from Christopher to PATCH 2/2
 - v1: https://lore.kernel.org/lkml/20230403105052.426135-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (2):
  dt-bindings: hwmon: pwm-fan: Convert to DT schema
  arm64: dts: rockchip: rk3588-rock-5b: Add pwm-fan

 .../devicetree/bindings/hwmon/pwm-fan.txt     |  68 +---------
 .../devicetree/bindings/hwmon/pwm-fan.yaml    | 119 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |  12 ++
 3 files changed, 132 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml

-- 
2.40.0

