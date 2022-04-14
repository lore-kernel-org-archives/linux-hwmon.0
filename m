Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA64C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Apr 2022 07:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbiDNIBH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Apr 2022 04:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiDNIBH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Apr 2022 04:01:07 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C7B3B032;
        Thu, 14 Apr 2022 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649923122;
  x=1681459122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y2Vz/iR+WNnZ/15diZgBrP98pf/mRWi/cx3EZB4r+CQ=;
  b=m6Vywb62Yq5d29GEsSe8X3T61tOEDfyciIqzuR884MrTCUsTWMLQemDk
   kvlb17XYeW8kFJLkayoN7bhRKohpS+ijO4vgZV8YTQHla3s9MOZxRmBV8
   y/XXhf4TRSdZM2EKHprYRmPDMU69d3IDn6mYrZTMkljqlQWUgW+Zxi/V4
   tUdGrWPsB54JUlA40ySR88rA+fVOMm/WNqSm8miZJCjfpqkx5J3slM4NZ
   iYpDHzJe4GkNGmHKKSwI8kQF2I6csos00nOgIn9Oc4GRhSi6OTFVDyCYa
   sfeGkMvDp+JnojXxMdLdTXfEIcT3cRGrVAN5H5OL1B6AYsny+qJ54jnZv
   A==;
From:   Camel Guo <camel.guo@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC:     Camel Guo <camel.guo@axis.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>
Subject: [PATCH v4 0/2] hwmon/tmp401: add support of three advanced features
Date:   Thu, 14 Apr 2022 09:58:21 +0200
Message-ID: <20220414075824.2634839-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According the their datasheets:
- TMP401, TMP411 and TMP43x support extended temperature range;
- TMP411 and TMP43x support n-factor correction;
- TMP43x support beta compensation.

In order to make it possible for users to enable these features and set up them
based on their needs, this patch series adds the following devicetree bindings:
- ti,extended-range-enable;
- ti,n-factor;
- ti,beta-compensation.
In the meanwhile, tmp401 driver reads them and configures the coressponding
registers accordingly.

v4:
- just add reviewed-by, no change on code.

v3:
- dt-bindings: remove unused [address|size]_cells and ti,beta-compensation.items
  from ti,tmp401.yaml;
- dt-bindings: change ti,n-factor range to [-128, 127];
- tmp401.c: instead of u32, use s32 for ti,n-factor.

v2:
- dt-bindings: fix format and describe hardware properties instead of
  programming models in ti,tmp401.yaml.

Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Camel Guo (2):
  dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x
  hwmon: (tmp401) Add support of three advanced features

 .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 105 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/hwmon/tmp401.c                        |  44 +++++++-
 3 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml


base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
-- 
2.30.2

