Return-Path: <SRS0=3aKW=S2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B91C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Apr 2019 07:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B8D52089F
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Apr 2019 07:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfDXHgV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Apr 2019 03:36:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:2695 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727055AbfDXHgU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Apr 2019 03:36:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Apr 2019 00:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,389,1549958400"; 
   d="scan'208";a="153276628"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2019 00:36:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hJCS2-0001ef-R5; Wed, 24 Apr 2019 15:36:18 +0800
Date:   Wed, 24 Apr 2019 15:36:01 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@01.org, linux-hwmon@vger.kernel.org
Subject: [RFC PATCH hwmon] hwmon: max6650_pwm_modes[] can be static
Message-ID: <20190424073601.GA168054@lkp-kbuild11>
References: <201904241520.vay0jaT0%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201904241520.vay0jaT0%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Fixes: 77d270a1d4db ("hwmon: (max6650) Convert to use devm_hwmon_device_register_with_info")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 max6650.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 3011841..6364bc9 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -599,7 +599,7 @@ static int max6650_read(struct device *dev, enum hwmon_sensor_types type,
 	return 0;
 }
 
-const u8 max6650_pwm_modes[] = {
+static const u8 max6650_pwm_modes[] = {
 	MAX6650_CFG_MODE_ON,
 	MAX6650_CFG_MODE_OPEN_LOOP,
 	MAX6650_CFG_MODE_CLOSED_LOOP,
