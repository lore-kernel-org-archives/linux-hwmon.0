Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:43319 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbfADO3B (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Jan 2019 09:29:01 -0500
From: Chengguang Xu <cgxu519@gmx.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Chengguang Xu <cgxu519@gmx.com>
Subject: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Date: Fri,  4 Jan 2019 22:27:22 +0800
Message-Id: <20190104142722.24824-1-cgxu519@gmx.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Just fix a typo in Documentation/hwmon/f71882fg.

Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
---
 Documentation/hwmon/f71882fg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/f71882fg b/Documentation/hwmon/f71882fg
index de91c0db5846..4c3cb8377d74 100644
--- a/Documentation/hwmon/f71882fg
+++ b/Documentation/hwmon/f71882fg
@@ -94,7 +94,7 @@ Note that the lowest numbered temperature zone trip point corresponds to
 to the border between the highest and one but highest temperature zones, and
 vica versa. So the temperature zone trip points 1-4 (or 1-2) go from high temp
 to low temp! This is how things are implemented in the IC, and the driver
-mimicks this.
+mimics this.
 
 There are 2 modes to specify the speed of the fan, PWM duty cycle (or DC
 voltage) mode, where 0-100% duty cycle (0-100% of 12V) is specified. And RPM
-- 
2.17.2
