Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2411CC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Apr 2022 15:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236333AbiDFPgw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Apr 2022 11:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236461AbiDFPgR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Apr 2022 11:36:17 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03B1657B1
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Apr 2022 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649249439;
  x=1680785439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VVV2Nxylk6HO3wV8wwM8X74kHMGm21p888ld2A/iX44=;
  b=NaM2X4e+x7hF3S7Fcbwm5Sn9fxrVnaF9nkX8aF8mZqlG4K/WfnGDC001
   DA2bGBDpUC87Sa1QX8mGY4Jg1WbBCFJ+OcQQDzyyGzoOPtLvIJtifRjhb
   STLzeH8m7sYLRluk+GAgIBRCBinVe0d4okz6S36ZxlW/RjGooBK8yKp34
   2SKFlDdkvCi1ybu0b6ZEASsjzLg+s7Es7nUGLIbqlFuCQnfMJF6Eqqkgu
   XpUSE1sna3QXvKNXL6Ug7yvl7Xga3cANSXlQGB6rgKvQbet/H+c66kp/A
   kPKt/WzOHojsjlxhQYYBspHmf9MQyMhsNZb+vpHPL07cqyp+9pmpoxoJZ
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH 0/2] hwmon: (pmbus/ltc2978) Add regulator ops
Date:   Wed, 6 Apr 2022 14:43:19 +0200
Message-ID: <20220406124321.1184133-1-marten.lindahl@axis.com>
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

Mårten Lindahl (2):
  hwmon: (pmbus/ltc2978) Add driver specific regulator ops
  hwmon: (pmbus/ltc2978) Add get_voltage/set_voltage ops

 drivers/hwmon/pmbus/ltc2978.c | 133 ++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 8 deletions(-)

-- 
2.30.2

