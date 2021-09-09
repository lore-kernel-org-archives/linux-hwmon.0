Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1267FC433FE
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 20:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E855F6113E
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 20:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344948AbhIIUmG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Sep 2021 16:42:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:61740 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245624AbhIIUmF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Sep 2021 16:42:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201099659"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; 
   d="scan'208";a="201099659"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 13:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; 
   d="scan'208";a="548747698"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2021 13:40:50 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mOQqn-0003Vl-9X; Thu, 09 Sep 2021 20:40:49 +0000
Date:   Fri, 10 Sep 2021 04:40:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     kbuild-all@lists.01.org, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH] hwmon: tmp421_disable_channels() can be static
Message-ID: <20210909204019.GA5684@f5e5cebfff48>
References: <d0a1be24701dcf19a2f7501a9bc7fddf2b739792.1631021349.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0a1be24701dcf19a2f7501a9bc7fddf2b739792.1631021349.git.krzysztof.adamski@nokia.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

drivers/hwmon/tmp421.c:356:6: warning: symbol 'tmp421_disable_channels' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 tmp421.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index cec25fb1c7719..162798f7491d9 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -353,7 +353,7 @@ void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
 	}
 }
 
-void tmp421_disable_channels(struct i2c_client *client, uint8_t mask)
+static void tmp421_disable_channels(struct i2c_client *client, uint8_t mask)
 {
 	int err;
 	int cfg = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
