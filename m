Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34420 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729820AbeLPLnr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Dec 2018 06:43:47 -0500
Date: Sun, 16 Dec 2018 12:43:44 +0100
From: Jean Delvare <jdelvare@suse.de>
To: =?UTF-8?B?T25kxZllaiBMeXNvbsSbaw==?= <olysonek@redhat.com>
Cc: linux-hwmon@vger.kernel.org
Subject: libsensors soname bump
Message-ID: <20181216124344.49d06b69@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Ondřej,

You have recently released lm-sensors 3.5.0 with a new soname for
libsensors:

-LIBMAINVER := 4
-LIBMINORVER := 4.0
+LIBMAINVER := 5
+LIBMINORVER := 0.0

-#define SENSORS_API_VERSION            0x440
+#define SENSORS_API_VERSION            0x500

This is declaring the new library as incompatible with the previous
version, meaning that distributions will have to build and ship both
libsensors4 and libsensors5 for a long time until all applications have
been updated and rebuilt to link with the new library. This is a
significant effort for the whole community and should only be done when
necessary.

In this specific case, I can't see what warranted such a change of
major library version change. From
lm-sensors/doc/developers/release_checklist:

  Remember: update main number when interface changes, minor if new
  functionality is added, and patch if only bugs are fixed.

In this case I can only see new functionality added, there is no
interface change. Therefore the correct value for SENSORS_API_VERSION
was 0x450, not 0x500. This would avoid the parallel maintenance and
installation of 2 versions of the library for several years to come.

Would you consider quickly releasing lm-sensors 3.5.1 with the proper
library version number, to save all that work to all application
authors/maintainers and distribution package maintainers?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
