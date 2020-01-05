Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A2DC33C9C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D834D21582
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgAEK6m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 05:58:42 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45653 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725930AbgAEK6l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 05:58:41 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 5 Jan 2020 12:58:35 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 005AwYmM020934;
        Sun, 5 Jan 2020 12:58:34 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 0/5] hwmon: (pmbus) Add support for vid mode calculation per page bases
Date:   Sun,  5 Jan 2020 10:58:28 +0000
Message-Id: <20200105105833.30196-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Currently "pmbus" infrastructure does not build for support reading
"vout" in "vid" mode, for cases when device is configured with the
different modes per page bases.
However some devices could be configured in such way.
The patchset includes:
Patch#1 allows selection mode per pmbus page bases, by extending
	"vrm_version" field to per page array and modify the drivers
	using this field.
Patch#2 introduces support for "vrm" mode "IMVP9".
Patch#3 makes use of "IMVP9" mode for "tps53679" driver.
Patch#4 extends binding documentation for trivial devices.
Patch#5 extends "tps53679" driver with support of the additional
devices:
	Texas Instruments Dual channel DCAP+ multiphase controllers:
	TPS53688, SN1906016.
	Infineon Multi-phase Digital VR Controller Sierra controllers
	XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and XDPE12250C.

Vadim Pasternak (5):
  hwmon: (pmbus/core) Add support for vid mode detection per page bases
  hwmon: (pmbus/core) Add support for Intel IMVP9 specification
  hwmon: (pmbus/tps53679) Allow support for Intel IMVP9 specification
  dt-bindings: Add TI and Infineon VR Controllers as trivial devices
  hwmon: (pmbus/tps53679) Extend device list supported by driver

 .../devicetree/bindings/trivial-devices.yaml       | 16 ++++++
 drivers/hwmon/pmbus/Kconfig                        |  5 +-
 drivers/hwmon/pmbus/max20751.c                     |  2 +-
 drivers/hwmon/pmbus/pmbus.c                        |  5 +-
 drivers/hwmon/pmbus/pmbus.h                        |  4 +-
 drivers/hwmon/pmbus/pmbus_core.c                   |  6 ++-
 drivers/hwmon/pmbus/pxe1610.c                      | 44 ++++++++-------
 drivers/hwmon/pmbus/tps53679.c                     | 62 ++++++++++++++--------
 8 files changed, 95 insertions(+), 49 deletions(-)

-- 
2.11.0

