Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8035C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jun 2022 09:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiFNJvr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 05:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355247AbiFNJvg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 05:51:36 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BCA48303
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jun 2022 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655200285;
  x=1686736285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LbWe6OiURXvPxPGGaSw0RwN6x07xlI9crXYpbJdQx18=;
  b=DqKrCHSZkoqFm7bFi5tU/Q4udTGnSDBmWZzOZ8ygcvNb5QlQijik1nyV
   nHpIafFJkGHwyZQEMrNmGNFf1lQHKiEshSvAN8FceEcEM9ia1V3QWqpUD
   bzaD947j1AA7iFT7gzlvwU6rgXdwV+SePw7NuoV9LrjgX5ud7ffCMq7o7
   gMMfStewo+h5hb9Xr8Qeqf5gsmA5Vg1BW/v+vl7ysdqpCqfxxGOCRRLFz
   jtwzmKdPvt31I8j8oNM3Hzmh6TVDcsR11mYfINY2rnv0MBXJ6WIJbhXwU
   FZjc1NPrlrGmb4ZGQ3+ZpINju/xrISrxcjgeGOvfATQCQgvqFAc5Mslcz
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 0/3] hwmon: (pmbus/ltc2978) Set voltage resolution
Date:   Tue, 14 Jun 2022 11:51:09 +0200
Message-ID: <20220614095109.3472201-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi!

When checking if a regulator supports a voltage range, the regulator
needs to have support for listing the range or else -EINVAL will be
returned.

This support does not exist for the LTC2977 regulator, so this change
adds support for list voltage to the pmbus regulators by adding
regulator_list_voltage_linear to the pmbus_regulator_ops. It also
defines the voltage resolution for regulators LTC2972/LTC2974/LTC2975/
LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have the
same stepwise 122.07uV resolution, and scales the resolution to a 1mV
resolution which is easier to handle.

These patches have been tested on an ARTPEC-8 developer board with a group
of LTC2977 power regulators.

Kind regards
Mårten Lindahl

Changes in v3:
 - Move read of low/high margins into local functions
 - Add check for invalid selector value
 - Introduce new macro PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step)

Changes in v2:
 - Correct #define format
 - Change dev_err to dev_warn
 - Add new pmbus_regulator_list_voltage function
 - Cache low/high vout margins

Mårten Lindahl (3):
  hwmon: (pmbus) Introduce and use cached vout margins
  hwmon: (pmbus) Add list_voltage to pmbus ops
  hwmon: (pmbus/ltc2978) Set voltage resolution

 drivers/hwmon/pmbus/ltc2978.c    |  44 +++++++++++--
 drivers/hwmon/pmbus/pmbus.h      |   8 ++-
 drivers/hwmon/pmbus/pmbus_core.c | 108 ++++++++++++++++++++++++++-----
 3 files changed, 137 insertions(+), 23 deletions(-)

-- 
2.30.2

