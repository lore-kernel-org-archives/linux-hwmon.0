Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr00104.outbound.protection.outlook.com ([40.107.0.104]:29856
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752738AbdJTKjz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Oct 2017 06:39:55 -0400
From: Romain Porte <romain.porte@nokia.com>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] pmbus: Add MFR-specific commands for TPS544C20
Date: Fri, 20 Oct 2017 12:39:14 +0200
Message-ID: <20171020103916.3309-1-romain.porte@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

This patchset provides a new driver for tps544c20 component with
enhanced features by using 2 new sysfs entries. The added features
are VREF_TRIM (MFR-specific) and STORE_USER_ALL commands for
voltage fine-tuning. Since the driver has new features compared
to the generic pmbus driver it can now replace it.

This is my very first try to send a patch to the Linux kernel
so be kind. I am aware that these modifications are very
component-specific but were tested successfully on it. Maybe
we should design something more generic here or afterwards.

Please review!

Romain

