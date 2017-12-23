Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37178 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750842AbdLWNFp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 23 Dec 2017 08:05:45 -0500
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: Add reset support to aspeed-pwm-tach
Date: Sat, 23 Dec 2017 23:35:26 +1030
Message-Id: <20171223130528.5346-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series adds reset support so the ASPEED SoC can operate the
PWM/Tach unit without out of tree workarounds.

v3 drops the header sorting patch which is already applied, and adds
Rob's ack to the bindings change.

Joel Stanley (2):
  dt-bindings: hwmon: aspeed-pwm-tacho: Add reset node
  hwmon: (aspeed-pwm-tacho) Deassert reset in probe

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 14 +++++---------
 drivers/hwmon/aspeed-pwm-tacho.c                   | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.15.1

