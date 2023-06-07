Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35981C8300C
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jun 2023 10:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239480AbjFGKYs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239150AbjFGKYn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jun 2023 06:24:43 -0400
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Jun 2023 03:24:40 PDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE581BD7;
        Wed,  7 Jun 2023 03:24:40 -0700 (PDT)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BABEB162;
        Wed,  7 Jun 2023 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1686133121;
        bh=0TfKAE2mXeDg/EY6rDRVQQvsbIYkCkGyx5BPV2spMFs=;
        h=From:To:Cc:Subject:Date:From;
        b=b4TLOcB37/0nxLpzUUE8WBcCVlpZz09Tysqn0Nd/sY2Q9uLtyvayxJcam+YOjN4AC
         zccDOktu7kTn3jpE9vkl86sjvHQNeiZDoyIJTcLfPGqxkuGHGOly3HWGI2lOUbqZiE
         P1JrwuCJs3BRrqSsrF6wgJQIdGht5B+XwXB+PfVk=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Zev Weiss <zev@bewilderbeest.net>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] Nuvoton NCT7362 driver & dt-binding
Date:   Wed,  7 Jun 2023 03:18:28 -0700
Message-ID: <20230607101827.8544-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

This patch series adds support for the Nuvoton NCT7362 fan/GPIO
controller.  The chip provides 16 pins that can be individually
configured for PWM, tach, or GPIO functionality, and is controlled via
an I2C interface.

There is a sibling NCT7360 chip covered by the same datasheet that's
very similar but only provides 8 fan/tach/gpio pins instead of 16; it
could be supported fairly easily with minor adjustments to the same
driver, but since I don't have an instance of it to test against I've
only implemented support for the NCT7362.

The first patch adds a DT binding, and the second adds a hwmon driver
with optional GPIO support enabled via CONFIG_SENSORS_NCT7362_GPIO.

Thanks,
Zev


Zev Weiss (2):
  dt-bindings: hwmon: Add Nuvoton NCT7362Y binding
  hwmon: (nct7362) Add nct7362 driver

 .../bindings/hwmon/nuvoton,nct7362.yaml       | 123 ++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  18 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct7362.c                       | 697 ++++++++++++++++++
 5 files changed, 846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
 create mode 100644 drivers/hwmon/nct7362.c

-- 
2.40.0.5.gf6e3b97ba6d2.dirty

