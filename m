Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C132BC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347955AbiETJxe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241878AbiETJxd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:53:33 -0400
Received: from smtpo62.interia.pl (smtpo62.interia.pl [217.74.67.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D485814ACA0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:53:32 -0700 (PDT)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:28 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com
Subject: [PATCH 0/8] Add support for ADT7481 in lm90
Date:   Fri, 20 May 2022 11:32:36 +0200
Message-Id: <20220520093243.2523749-1-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040290;
        bh=gU78ddtmJMMoiasVp7eYRg71sDE4wptebLyLEaI071U=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=AkegXx9WvRE2EbE2DCOfF3Q6CbAhc3TD/3gsJcITHVyU72fpobxVJI92WAbDIA+4a
         itt3ZsU7MDbj9AK3OK003N6nW60aH03I4pZVZhEJFfJlwX/hxXKn1QnFJyM276MpN3
         se49py3dMMLeUCZ3HEsLGywciWiYIp8x1e5cQhUA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

This patch series adds support for ADT7481 in lm90.c driver and extends the
device-tree options for it.

The ADT7481 is quite similar to MAX6696 (already supported in lm90) so a lot of
code is reused.

One major problem in fitting the ADT7481 in lm90.c is the chip detection.
However it seems that the chip has been designed and produced with correct
values at locations: 0xfe (manufactured id) and 0xff (chip id), but this is not
documented in the datasheet.

$ i2cdump -y -f -r 254-255 1 0x4c
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
f0:                                           41 62                  Ab

The device-tree changes allow to: set the extended temperature range mode and
set the label and offset for specific channel.

Note: previous "attempts" for adding ADT7481 in lm90 where here: [1][2].

[1] https://www.spinics.net/lists/lm-sensors/msg25066.html
[2] https://marc.info/?l=lm-sensors&m=137786448326215&w=2

Slawomir Stepien (8):
      dt-bindings: hwmon: Add support for ADT7481 in lm90
      dt-bindings: hwmon: Add 'extended-range-enable' property support in lm90
      dt-bindings: hwmon: Allow specifying channels for lm90
      hwmon: (lm90) add support for ADT7481
      hwmon: (lm90) define maximum number of channels that are supported
      hwmon: (lm90) enable the extended temperature range
      hwmon: (lm90) read the channel's label from device-tree
      hwmon: (lm90) read the channel's offset from device-tree

 .../devicetree/bindings/hwmon/national,lm90.yaml          |  42 ++++
 Documentation/hwmon/lm90.rst                              |  12 +-
 drivers/hwmon/Kconfig                                     |  15 +-
 drivers/hwmon/lm90.c                                      | 251 ++++++++++++++++++++----
 4 files changed, 271 insertions(+), 49 deletions(-)


