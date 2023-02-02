Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F8EC636CD
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Feb 2023 02:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjBBCSg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Feb 2023 21:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBBCSf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Feb 2023 21:18:35 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D45746090;
        Wed,  1 Feb 2023 18:18:33 -0800 (PST)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C5E923FE;
        Wed,  1 Feb 2023 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1675304313;
        bh=M/TiiamgoEuOPBv0/FYKxrV4c/yjfhQRaU4fbng+y9w=;
        h=From:To:Cc:Subject:Date:From;
        b=YMJRrGKKjc/poZmJMmfLqnQg1Pgp1/9mp6URbRZFO5iSMZlZyf5PFaSw1+FdV4k1e
         tY9+I0asH/MAcBbcPGx+LkQTD8yIX20MSAu+mSdVMzqFj9Ri+nrl3Mz+eZCf9h7s8D
         N/vLQApfx9yNOr08C9ABA4L8IA6zjGCP6HbNYkRc=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Iwona Winiarska <iwona.winiarska@intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: [PATCH] hwmon: (peci/cputemp) Fix off-by-one in coretemp_label allocation
Date:   Wed,  1 Feb 2023 18:18:25 -0800
Message-Id: <20230202021825.21486-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The find_last_bit() call produces the index of the highest-numbered
core in core_mask; because cores are numbered from zero, the number of
elements we need to allocate is one more than that.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: stable@kernel.org # v5.18
Fixes: bf3608f338e9 ("hwmon: peci: Add cputemp driver")
---
 drivers/hwmon/peci/cputemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index ec9851daf2e8..f13cc4170f58 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -431,7 +431,7 @@ static int create_temp_label(struct peci_cputemp *priv)
 	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
 	int i;
 
-	priv->coretemp_label = devm_kzalloc(priv->dev, core_max * sizeof(char *), GFP_KERNEL);
+	priv->coretemp_label = devm_kzalloc(priv->dev, (core_max + 1) * sizeof(char *), GFP_KERNEL);
 	if (!priv->coretemp_label)
 		return -ENOMEM;
 
-- 
2.39.1.236.ga8a28b9eace8

