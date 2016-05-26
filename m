Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46156 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753634AbcEZJMX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 26 May 2016 05:12:23 -0400
Date: Thu, 26 May 2016 11:12:19 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon updates for Linux 4.7
Message-ID: <20160526111219.0f8c0341@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon subsystem updates for Linux 4.7 from:

 Documentation/hwmon/max34440 | 6 +++---
 drivers/hwmon/emc2103.c      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

---------------

Dan Carpenter (1):
      hwmon: (emc2103) Fix typo in MODULE_PARM_DESC

Glenn Dayton (1):
      Documentation/hwmon: Update links in max34440

Thanks,
-- 
Jean Delvare
SUSE L3 Support
