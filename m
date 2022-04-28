Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C012CC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 14:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345638AbiD1OoK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 10:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348525AbiD1OoA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 10:44:00 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D486220CB
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651156845;
  x=1682692845;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AVGuMhswYKP6oNAq2bnAkMQDN/1LMBZ4R4fYieLWhqc=;
  b=iYAy7fwoF8IFgvrWUAoxh3C6sGozafe7e1qTzCoqj6iLI710ZyPDs7mt
   dCAU4fVtPV6UJWgFqrNLjb3D39+p3iytUoNvcRMMyIzyFWV9YwKQZkaD0
   ukmbgSsy/pjlbCY/JtELseQvFfKtN59wJnXssymXX3VgQzVifTTA5o4HT
   vcmAU3oZLS7Q+5qAI8L58r++9mNzjY7XACjnJs1VT0DFaXwJJggTPo40F
   pMQU4aPHXt4hybLZAHfr2Uy7bbkgYAQCgHW78gWI9N8OUQ+0BH3+NlbOF
   zhOJl5UvAtacGWA3eFnoV2xJnARPhxMjfkbSGIl6sAKG4K4wpc3PMUhnO
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 0/4] hwmon: (pmbus/ltc2978) Add regulator ops
Date:   Thu, 28 Apr 2022 16:40:35 +0200
Message-ID: <20220428144039.2464667-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi!

The LTC2978 driver supports a wide range of power regulator chips, but it
has limited functionality for using it in a dynamic regulator framework.
Since standard functions for setting and getting voltage are missing as
pmbus core operations this patchset adds it.

These patches have been tested on an ARTPEC-8 developer board with a group
of LTC2977 power regulators.

Kind regards
Mårten Lindahl

Changes in v2:
 - Add pmbus core _pmbus_write_byte_data to check for driver specific callback
 - Change pmbus_update_byte_data to use _pmbus_read/write_byte_data
 - Change pmbus_regulator_is_enabled to use _pmbus_read_byte_data
 - Export pmbus core functions enable/disable/is_enabled

Changes in v3:
 - Split patch "hwmon: (pmbus/ltc2978) Use driver specific ops if they exist"
   into two patches: (1) pmbus core, (2) ltc2978.
 - Move ltc2978_regulator_get/set_voltage functions to pmbus core.

Changes in v4:
 - Split (and rename) patch "hwmon: (pmbus) Use driver specific ops if they exist"
   into two patches where the first handle _pmbus_write_byte_data, and the
   second handle _pmbus_read_byte_data.
 - Use voltage conversion functions in pmbus_regulator_get/set_voltage.

Mårten Lindahl (4):
  hwmon: (pmbus) Introduce and use write_byte_data callback
  hwmon: (pmbus) Use _pmbus_read_byte_data with callback
  hwmon: (pmbus/ltc2978) Add chip specific write_byte_data
  hwmon: (pmbus) Add get_voltage/set_voltage ops

 drivers/hwmon/pmbus/ltc2978.c    |  12 +++
 drivers/hwmon/pmbus/pmbus.h      |   2 +
 drivers/hwmon/pmbus/pmbus_core.c | 133 +++++++++++++++++++++++++------
 3 files changed, 121 insertions(+), 26 deletions(-)

-- 
2.30.2

