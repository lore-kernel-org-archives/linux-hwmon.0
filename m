Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32806 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731592AbeISWdb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Sep 2018 18:33:31 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v4.19-rc5
Date: Wed, 19 Sep 2018 09:54:42 -0700
Message-Id: <1537376082-32219-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,
Hi Greg,

Please pull hwmon fixes for Linux v4.19-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.19-rc5

Thanks,
Guenter
------

The following changes since commit 57361846b52bc686112da6ca5368d11210796804:

  Linux 4.19-rc2 (2018-09-02 14:37:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.19-rc5

for you to fetch changes up to 55066354285b36ee09dc50e2527f43a97c567177:

  hwmon: (nct6775) Use different register to get fan RPM for fan7 (2018-09-17 05:38:50 -0700)

----------------------------------------------------------------
Various bug fixes for nct6775 driver

----------------------------------------------------------------
Dan Carpenter (1):
      hwmon: (nct6775) Set weight source to zero correctly

Guenter Roeck (4):
      hwmon: (nct6775) Fix access to fan pulse registers
      hwmon: (nct6775) Fix virtual temperature sources for NCT6796D
      hwmon: (nct6775) Fix RPM output for fan7 on NCT6796D
      hwmon: (nct6775) Use different register to get fan RPM for fan7

 drivers/hwmon/nct6775.c | 72 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 23 deletions(-)
