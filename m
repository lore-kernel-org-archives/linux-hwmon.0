Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46776 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932248AbcFJQgl (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 10 Jun 2016 12:36:41 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: torvalds@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.7-rc3
Date: Fri, 10 Jun 2016 09:36:33 -0700
Message-Id: <1465576593-8553-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v4.7-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.7-rc3

Thanks,
Guenter
------

The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.7-rc3

for you to fetch changes up to 38bab98a8da4a2ff5c3f55b045b0c8bf6901362f:

  hwmon: (lm90) use proper type for update_interval (2016-06-07 20:13:05 -0700)

----------------------------------------------------------------
hwmon fixes for v4.7-rc3

Fix regression in fam15h_power driver
Minor variable type fix in lm90 driver
Document compatible statement for ina2xx driver

----------------------------------------------------------------
Borislav Petkov (1):
      hwmon: (fam15h_power) Disable preemption when reading registers

Krzysztof Kozlowski (1):
      hwmon: (ina2xx) Document compatible for INA231

Wolfram Sang (1):
      hwmon: (lm90) use proper type for update_interval

 Documentation/devicetree/bindings/hwmon/ina2xx.txt | 1 +
 drivers/hwmon/fam15h_power.c                       | 8 ++------
 drivers/hwmon/lm90.c                               | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
