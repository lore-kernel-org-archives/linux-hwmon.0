Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72785C433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 21:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FE9864F11
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 21:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbhCRVZu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Mar 2021 17:25:50 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:11545 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbhCRVZR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Mar 2021 17:25:17 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 890D82467C84
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 22:25:15 +0100 (CET)
Received: from s500.loopia.se (unknown [172.22.191.6])
        by s807.loopia.se (Postfix) with ESMTP id 784D12E28445;
        Thu, 18 Mar 2021 22:25:15 +0100 (CET)
Received: from s475.loopia.se (unknown [172.22.191.6])
        by s500.loopia.se (Postfix) with ESMTP id 725011E32EB5;
        Thu, 18 Mar 2021 22:25:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s498.loopia.se ([172.22.191.5])
        by s475.loopia.se (s475.loopia.se [172.22.190.15]) (amavisd-new, port 10024)
        with LMTP id TvaIHwMkzHlx; Thu, 18 Mar 2021 22:25:14 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.131.157
Received: from localhost.localdomain (h-155-4-131-157.NA.cust.bahnhof.se [155.4.131.157])
        (Authenticated sender: carl@hgsystem.se)
        by s498.loopia.se (Postfix) with ESMTPSA id 8EF48489411;
        Thu, 18 Mar 2021 22:25:14 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 1/2] dt-bindings: Add trivial device entry for TPS53676
Date:   Thu, 18 Mar 2021 22:24:40 +0100
Message-Id: <20210318212441.69050-2-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210318212441.69050-1-erik.rosen@metormote.com>
References: <20210318212441.69050-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add trivial device entry for TPS53676

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..2e29c2a91966 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -288,6 +288,8 @@ properties:
           - ti,tmp103
             # Digital Temperature Sensor
           - ti,tmp275
+            # TI Dual channel DCAP+ multiphase controller TPS53676 with AVSBus
+          - ti,tps53676
             # TI Dual channel DCAP+ multiphase controller TPS53679
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53688
-- 
2.20.1

