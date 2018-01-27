Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52039 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752967AbeA0QWk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:22:40 -0500
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/4] hwmon: (dell-smm) Disable fan support on Inspiron 7720 and Vostro 3360
Date: Sat, 27 Jan 2018 17:22:00 +0100
Message-Id: <20180127162204.13752-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch series disable fan support on two machines on which is BIOS
broken. And it changes measurement of SMM calls duration.

Oleksandr Natalenko (1):
  hwmon: (dell-smm) Disable fan support for Dell Vostro 3360

Pali Rohár (3):
  hwmon: (dell-smm) Enable broken functionality via "force" module param
  hwmon: (dell-smm) Disable fan support for Dell Inspiron 7720
  hwmon: (dell-smm) Measure time duration of SMM call around inlined asm

 drivers/hwmon/dell-smm-hwmon.c | 68 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 7 deletions(-)

-- 
2.11.0

