Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: linux@roeck-us.net, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ego@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH v2 0/2] hwmon: Add attributes to enable/disable sensors
Date: Wed,  4 Jul 2018 14:46:31 +0530
Message-Id: <1530695793-4584-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch series adds new attribute to enable or disable a sensor in
runtime.

v1 : https://lkml.org/lkml/2018/3/22/214

Shilpasri G Bhat (2):
  powernv:opal-sensor-groups: Add support to enable sensor groups
  hwmon: ibmpowernv: Add attributes to enable/disable sensor groups

 Documentation/hwmon/sysfs-interface                |  22 ++
 arch/powerpc/include/asm/opal-api.h                |   1 +
 arch/powerpc/include/asm/opal.h                    |   2 +
 .../powerpc/platforms/powernv/opal-sensor-groups.c |  28 ++
 arch/powerpc/platforms/powernv/opal-wrappers.S     |   1 +
 drivers/hwmon/ibmpowernv.c                         | 281 ++++++++++++++++++---
 6 files changed, 296 insertions(+), 39 deletions(-)

-- 
1.8.3.1
