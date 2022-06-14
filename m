Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD8CCA47A
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jun 2022 10:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbiFNKSh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 06:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbiFNKSg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 06:18:36 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963E24198C
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jun 2022 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655201914;
  x=1686737914;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LbWe6OiURXvPxPGGaSw0RwN6x07xlI9crXYpbJdQx18=;
  b=MkNqTrwlk0qaqN2gamjzk4BUhPpIHeQAHnGYoOgT3Uyk9gp7DIEMzwMh
   VGE4kQq4YbymUX/77Xos31e8vnmPHKEPh+otRajB0iXqQZzxeAUj6eQyV
   qGxn3H4Ak/XOYuQBfVVGgiTY3QgksulBH8LbLF2u2F0p1W8QcBvujKdxI
   OoiGFtWfZKB0k4xT9M2L7ZFQmZFr69EmJvpFGEpEvDrP6YceXgrnTZa7f
   A/MwiDr1tufvN3v0Q75gMxBXorf8+jZ6Y1dhlGeLt13srxaYnr+QxG7Et
   PZY7lWBxSQuoFamncX8GOJL5HZ9dwnSClcJk6/9mAm81AMJEaK86Uha6Y
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 0/3] hwmon: (pmbus/ltc2978) Set voltage resolution
Date:   Tue, 14 Jun 2022 11:38:53 +0200
Message-ID: <20220614093856.3470672-1-marten.lindahl@axis.com>
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

