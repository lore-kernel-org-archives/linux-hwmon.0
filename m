Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38057 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437AbcFXUX1 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 16:23:27 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.7-rc5
Date: Fri, 24 Jun 2016 13:23:25 -0700
Message-Id: <1466799805-19043-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.7-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.7-rc5

Thanks,
Guenter
------

The following changes since commit 2744d2fde00dc8bcc3679eb72c81a63058e90faa:

  hwmon: (dell-smm) Disallow fan_type() calls on broken machines (2016-06-18 13:03:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.7-rc5

for you to fetch changes up to 5ce91714b0d8c0a3ff9b858966721f508351cf4c:

  hwmon: (dell-smm) Cache fan_type() calls and change fan detection (2016-06-23 06:24:23 -0700)

----------------------------------------------------------------
Improve fan type detection for dell-smm to prevent kernel hang

----------------------------------------------------------------
Pali Rohár (1):
      hwmon: (dell-smm) Cache fan_type() calls and change fan detection

 drivers/hwmon/dell-smm-hwmon.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)
