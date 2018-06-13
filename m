Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:37391 "EHLO
        faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935971AbeFMPVD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jun 2018 11:21:03 -0400
From: Jakob Albert <jakob.j.albert@fau.de>
To: devel@linuxdriverproject.org
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenz Kaestle <lorenz.kaestle@fau.de>,
        linux-kernel@i4.cs.fau.de, Jakob Albert <jakob.j.albert@fau.de>
Subject: [PATCH v2 0/3] hwmon: (nct7904) Fix style issues
Date: Wed, 13 Jun 2018 17:13:22 +0200
Message-Id: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This set of patches fixes style errors reported by checkpatch.pl. This
adapts the code to the coding style.

Changes since v1:
* Changed patch subjects and descriptions



Jakob Albert (3):
  hwmon: (nct7904) Fix SPACING errors
  hwmon: (nct7904) Fix CODE_INDENT error
  hwmon: (nct7904) Fix UNSPECIFIED_INT warning

 drivers/hwmon/nct7904.c | 68 ++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

-- 
2.7.4

