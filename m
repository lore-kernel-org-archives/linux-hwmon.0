Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41555 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390726AbeIVCD0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 22:03:26 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, corbet@lwn.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] Add an initial DT binding doc for ina3221
Date: Fri, 21 Sep 2018 13:12:50 -0700
Message-Id: <20180921201252.12875-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series adds a initial DT binding doc for ina3221. It defines
a child node to describe the input source of each ina3221 channel.
Then it changes the driver to handle the information properly.

Changelog
v1->v2:
 * Redefined DT bindings (detail in PATCH-1)
 * Changed the driver code accordingly (detail in PATCH-2)

 .../devicetree/bindings/hwmon/ina3221.txt     |  38 ++++++
 Documentation/hwmon/ina3221                   |   1 +
 drivers/hwmon/ina3221.c                       | 126 ++++++++++++++++--
 3 files changed, 155 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

-- 
2.17.1
