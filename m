Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06153C43217
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Apr 2022 10:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345003AbiDKKFx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Apr 2022 06:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238656AbiDKKFv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Apr 2022 06:05:51 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9421640E73;
        Mon, 11 Apr 2022 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649671418;
  x=1681207418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c+CrCB3jSesuxm+UkvkLWNLlRUO9xSMBS+b8dMwF3PA=;
  b=NgmWvDBSkvlbyF7ZjfNsDufI69S13VbQMB2VwQ2I6iOUNcmjX8TY3rK0
   /4+Qja0AZtuSy8uURGMxXKNqv0oK8BcpvV8QzQpI98g2de5RSF6Jjpw1R
   j6aa7aNkLkDFMGeE28QwKKRQmQ7Aporw0EQjSFiCIa++Fefnt6pcdkr2j
   LXuwOfqDEflTdjhkMcrx/0z5SK/SmAc+CBniGSvH47rUHG6JQap3Hav97
   /4Uit0/j6HwhgLYpCrQjyAGU1V+9nlKS+bYTmzK1uiLasQuRkdGY3DLqw
   S3Nll0dKIs8/Ik+LEq3K0eOVNC3BQ6Zt0g0426LoQjZPKBbkEWkSJgZ/X
   w==;
From:   Camel Guo <camel.guo@axis.com>
To:     <linux@roeck-us.net>, <jdelvare@suse.com>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>
CC:     <kernel@axis.com>, Camel Guo <camel.guo@axis.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] hwmon/tmp401: add support of three advanced features
Date:   Mon, 11 Apr 2022 12:03:27 +0200
Message-ID: <20220411100329.1783432-1-camel.guo@axis.com>
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

Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Camel Guo (2):
  dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x
  hwmon: (tmp401) Add support of three advanced features

 .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 111 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/hwmon/tmp401.c                        |  43 ++++++-
 3 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml


base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
-- 
2.30.2

