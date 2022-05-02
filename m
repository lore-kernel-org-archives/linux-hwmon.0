Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B15C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 11:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiEBLRU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 07:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384694AbiEBLRT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 07:17:19 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA862ADA
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651490031;
  x=1683026031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sA+iNk1Y9BcKz5uT0ZJTo7SyuA7pU8Ktr+staJUmEN4=;
  b=le7/SqaQceGbr49iKc7F3zc4+6e0MW+ohjUr936Vvqs1OPyw8IOzP5FM
   AzhXXwcn5K6++rpIIfBvxxDvud94t0qpLJLpXAOMEW9eACDqvCIMintL1
   yUf5Hi2XmRGvGZOecLvBJOE4YzqcFgaT5VuXV1WyIIQnw8lRHEvqbfgxY
   +stisfZb2ZhHWOINSs1wqL+QPiyzZjYh1yaHz1ZjkN7uGKJfpd7oTlltb
   DL7FImETCs6LMRiJjiNsC+x86zqAobtEhvEIIV0beGAklB90BjPuFDYKj
   qSRyQUBUa56ieDSfFjYXqoMtEOJM/uruUruIfEu7TfWiiSfk7MNPeKbzN
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v5 0/4] hwmon: (pmbus/ltc2978) Add regulator ops
Date:   Mon, 2 May 2022 13:13:41 +0200
Message-ID: <20220502111345.3100970-1-marten.lindahl@axis.com>
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

Changes in v5:
 - Remove PMBUS_VOUT_COMMAND voltage attribute added in v4 and use local
   sensor object for conversion.
 - Try to read MFR_VOUT_MIN and MFR_VOUT_MAX first, or else VOUT_MARGIN_LOW and
   VOUT_MARGIN_HIGH, to get voltage window.

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

