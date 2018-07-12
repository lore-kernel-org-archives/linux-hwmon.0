Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.215]:52966 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387724AbeGLBMS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 21:12:18 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 0/5] hwmon: adt7475: Add error handling for update function
Date: Thu, 12 Jul 2018 10:04:45 +0900
Message-Id: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Currently the device update function does not care the I2C SMBus error.
This causes a spurious sensor warining detection by sensor application.
To prevent this isseu add error handling for the update function.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org

Tokunori Ikegami (5):
  hwmon: adt7475: Split device update function to measure and limits
  hwmon: adt7475: Change read and write functions to return error
  hwmon: adt7475: Change to use adt7475_read macro
  hwmon: adt7475: Change to use adt7475_write macro
  hwmon: adt7475: Change update functions to add error handling

 drivers/hwmon/adt7475.c | 369 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 257 insertions(+), 112 deletions(-)

-- 
2.16.1

