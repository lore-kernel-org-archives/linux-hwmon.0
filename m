Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0CAC43217
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Dec 2021 21:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbhLHVkt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Dec 2021 16:40:49 -0500
Received: from thorn.bewilderbeest.net ([71.19.156.171]:40851 "EHLO
        thorn.bewilderbeest.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238234AbhLHVkt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Dec 2021 16:40:49 -0500
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net [174.21.184.96])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 715D072A;
        Wed,  8 Dec 2021 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1638999436;
        bh=DLYbN0BwJINAopqXYHsMVrIfzEfDIDq+91j/Sj5/ryo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q0rc554wzqolxE3STaPq6ZFtZkTTLpPZZbiuemNsTTH3GEYR0bm0uEDhRuKaPZ7vK
         4UCNMMc51KZUWcDFnrSqlFb0Ir3ZlRqGPdqZdC+QA58RYkWLfXrvLB08ILVyhi25QK
         nQD5lFE7qjmfL8X73ogBQ81yQ4yTw+r1i97zjtnA=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Zev Weiss <zev@bewilderbeest.net>
Subject: [PATCH v4 2/2] dt-bindings: add Delta AHE-50DC fan control module
Date:   Wed,  8 Dec 2021 13:37:03 -0800
Message-Id: <20211208213703.2577-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211208213703.2577-1-zev@bewilderbeest.net>
References: <20211208213703.2577-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is the integrated fan control module of the Delta AHE-50DC Open19
power shelf.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 791079021f1b..1c43cc91f804 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -73,6 +73,8 @@ properties:
           - dallas,ds4510
             # Digital Thermometer and Thermostat
           - dallas,ds75
+            # Delta AHE-50DC Open19 power shelf fan control module
+          - delta,ahe50dc-fan
             # Delta Electronics DPS-650-AB power supply
           - delta,dps650ab
           # Delta Electronics DPS920AB 920W 54V Power Supply
-- 
2.34.1

