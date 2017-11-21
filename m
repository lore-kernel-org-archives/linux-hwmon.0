Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33040 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751318AbdKUQKB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Nov 2017 11:10:01 -0500
Date: Tue, 21 Nov 2017 17:09:59 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Drop reference to Jean's tree
Message-ID: <20171121170959.310e4636@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This tree has not been used for over a year, Guenter is taking all
the hwmon patches in practice.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS |    1 -
 1 file changed, 1 deletion(-)

--- linux-4.14.orig/MAINTAINERS	2017-11-12 19:46:13.000000000 +0100
+++ linux-4.14/MAINTAINERS	2017-11-21 17:07:29.991926400 +0100
@@ -6072,7 +6072,6 @@ M:	Jean Delvare <jdelvare@suse.com>
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
 W:	http://hwmon.wiki.kernel.org/
-T:	quilt http://jdelvare.nerim.net/devel/linux/jdelvare-hwmon/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
 S:	Maintained
 F:	Documentation/hwmon/


-- 
Jean Delvare
SUSE L3 Support
