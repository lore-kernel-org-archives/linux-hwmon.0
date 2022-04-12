Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2826C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Apr 2022 13:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239232AbiDLNzE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Apr 2022 09:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiDLNzD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Apr 2022 09:55:03 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C02A56779;
        Tue, 12 Apr 2022 06:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649771566;
  x=1681307566;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sw81HetSmMl7lbXyyIeCGFJ3QO8cFxHXwNZbEtDzDlE=;
  b=O49R+o93vemcgc+xoyyxEXOZnNuKyNmuJflVQ3PuwSAgHnVMcrAztJV7
   GRyNhWqDbWPidXNAZhaRkHkbBvXEMlQtouyhuaaZv8zDfafN6QGFoebpl
   tDsVVUMT503EzaHcXRCbaFlfHpRKx7QEU4+kZFEBZ5iy+yLplhnNEiRMc
   dtfjYGm5UFsgD9m1SdnLOeLR5CUw4oHWYJ/35hvXcWS5dTdpxluN4QIpy
   eSEQO3njdzhJUyws6XYdzC7b2jQQ4QZcl9Prz0wwFt5As//X98y0PX9Q4
   aYDw/wnr8LDlkivsXgLj/5e9fhtilbAFuZbucxFQe2NmE9UWUAexmqs+k
   A==;
From:   Camel Guo <camel.guo@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC:     Camel Guo <camel.guo@axis.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>
Subject: [PATCH v2 0/2] hwmon/tmp401: add support of three advanced features
Date:   Tue, 12 Apr 2022 15:52:30 +0200
Message-ID: <20220412135232.1943677-1-camel.guo@axis.com>
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

v2:
- dt-bindings: fix format and describe hardware properties instead of
  programming models in ti,tmp401.yaml.

Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Camel Guo (2):
  dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x
  hwmon: (tmp401) Add support of three advanced features

 .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 112 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/hwmon/tmp401.c                        |  43 ++++++-
 3 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml


base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
-- 
2.30.2

