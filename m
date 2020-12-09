Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1D5C4361B
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 08:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68F6923B97
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 08:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgLIICb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 03:02:31 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46458 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbgLIICa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Dec 2020 03:02:30 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0B97uUSR009070;
        Wed, 9 Dec 2020 15:56:30 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Dec
 2020 15:59:25 +0800
From:   Troy Lee <troy_lee@aspeedtech.com>
To:     <openbmc@lists.ozlabs.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
CC:     <leetroy@gmail.com>, <troy_lee@aspeedtech.com>,
        <ryan_chen@aspeedtech.com>, <chiawei_wang@aspeedtech.com>,
        <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/4] hwmon: aspeed2600-pwm-tacho: Add driver support
Date:   Wed, 9 Dec 2020 15:59:16 +0800
Message-ID: <20201209075921.26689-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0B97uUSR009070
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Aspeed AST2600 is a server management SoC which has 16 PWM channels and 
16 fan tacho channel.

This series of patch provides AST2600 PWM/Fan tacho support in hwmon class.

The driver provides a sysfs interface, and user can configure PWM duty cycle
and read current FAN speed in RPM.

Troy Lee (4):
  dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
  ARM: dts: aspeed: Add Aspeed AST2600 PWM/Fan node in devicetree
  hwmon: Add Aspeed AST2600 support
  hwmon: Support Aspeed AST2600 PWM/Fan tachometer

 .../bindings/hwmon/aspeed2600-pwm-tacho.txt   |   69 ++
 Documentation/hwmon/aspeed_pwm_tachometer.rst |   24 +
 Documentation/hwmon/index.rst                 |    1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      |  149 +++
 arch/arm/boot/dts/aspeed-g6.dtsi              |   10 +
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/aspeed2600-pwm-tacho.c          | 1053 +++++++++++++++++
 8 files changed, 1317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed2600-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed_pwm_tachometer.rst
 create mode 100644 drivers/hwmon/aspeed2600-pwm-tacho.c

-- 
2.17.1

