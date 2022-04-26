Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9AAC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Apr 2022 10:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345295AbiDZKIB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Apr 2022 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348299AbiDZKHq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 06:07:46 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680C61B89EB
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 02:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650965388;
  x=1682501388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LhrwG8zqVtRi8OipKC10YBldYuPMzBdbg7byA5sngy4=;
  b=JexEAJ2fRB2KKDT9dhYuxwYYI0SaZA2yv+7zczqARwzH/tS25MGR2Fxo
   PB1DcSB8MvBrAvaHgzqJh7M+QZ7jZL9SJb4FGhs0/PAaaQUNlSjLWiByz
   kJtnbUKnXAuPt8cuUKuT/VP4n0gQtpoZX1F5K6PxAf50OIikmwyGGJBic
   kjlD9FhEyTc3D+ftSNmevnrY5iK7ic9FSKgzuxqRncBMHRomf64JO05VK
   SdzPWyk8HF9OEix/8gU+9s7zjhG1oAPQN/RQ9CwVkXHlLY4TviQycUyW3
   h3gmXSmuFNZEaAqP+vmjc2G8pcM6By488Lv3fIHInaiPvsxnP/r3i5pPG
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 0/2] hwmon: (pmbus/ltc2978) Add regulator ops
Date:   Tue, 26 Apr 2022 11:29:34 +0200
Message-ID: <20220426092936.1127114-1-marten.lindahl@axis.com>
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
Since functions for setting and getting voltage are missing this patchset
adds it.

These patches have been tested on an ARTPEC-8 developer board with a group
of LTC2977 power regulators.

Kind regards
Mårten Lindahl

Changes in v2:
 - Add pmbus core _pmbus_write_byte_data to check for driver specific callback
 - Change pmbus_update_byte_data to use _pmbus_read/write_byte_data
 - Change pmbus_regulator_is_enabled to use _pmbus_read_byte_data
 - Export pmbus core functions enable/disable/is_enabled

Mårten Lindahl (2):
  hwmon: (pmbus/ltc2978) Add driver specific regulator ops
  hwmon: (pmbus/ltc2978) Add get_voltage/set_voltage ops

 drivers/hwmon/pmbus/ltc2978.c | 133 ++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 8 deletions(-)

-- 
2.30.2

