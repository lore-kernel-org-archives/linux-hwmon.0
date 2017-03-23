Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:50355 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932449AbdCWNCS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2017 09:02:18 -0400
From: Peter Huewe <peterhuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH 4/5] w83627ehf: Drop FSFE template and replace with SPDX License information
Date: Thu, 23 Mar 2017 14:03:07 +0100
Message-Id: <20170323130308.29166-4-peterhuewe@gmx.de>
In-Reply-To: <20170323130308.29166-1-peterhuewe@gmx.de>
References: <20170323130308.29166-1-peterhuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

As indicated by checkpatch it makes sense to not use the FSFE Template
about GPLv2+

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/hwmon/w83627ehf.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index a6f56b12727b..c4b755cd506c 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -18,19 +18,8 @@
  *  This driver also supports the W83627EHG, which is the lead-free
  *  version of the W83627EHF.
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *  Released under the GPLv2 or later.
+ *  SPDX-License-Identifier: GPL-2.0+
  *
  *  Supports the following chips:
  *
-- 
2.10.2

