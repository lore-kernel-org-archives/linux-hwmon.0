Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, linux@roeck-us.net
Cc: linuxppc-dev@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ego@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH v6 0/2] hwmon/powernv: Add attributes to enable/disable sensors
Date: Wed, 18 Jul 2018 23:43:28 +0530
Message-Id: <1531937610-6454-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch series adds new attribute to enable or disable a sensor at
runtime.

Changes from v5:
- Dont store the sensor node and parse the device-tree for each sensor
  to find the sensor-group during init

v5 : https://lkml.org/lkml/2018/7/15/15
v4 : https://lkml.org/lkml/2018/7/6/379
v3 : https://lkml.org/lkml/2018/7/5/476
v2 : https://lkml.org/lkml/2018/7/4/263
v1 : https://lkml.org/lkml/2018/3/22/214

Shilpasri G Bhat (2):
  powernv:opal-sensor-groups: Add support to enable sensor groups
  hwmon: ibmpowernv: Add attributes to enable/disable sensor groups

 Documentation/hwmon/ibmpowernv                     |  43 +++-
 arch/powerpc/include/asm/opal-api.h                |   1 +
 arch/powerpc/include/asm/opal.h                    |   2 +
 .../powerpc/platforms/powernv/opal-sensor-groups.c |  28 +++
 arch/powerpc/platforms/powernv/opal-wrappers.S     |   1 +
 drivers/hwmon/ibmpowernv.c                         | 249 ++++++++++++++++++---
 6 files changed, 290 insertions(+), 34 deletions(-)

-- 
1.8.3.1
