Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC5BC43217
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 22:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356329AbhLFWuY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Dec 2021 17:50:24 -0500
Received: from thorn.bewilderbeest.net ([71.19.156.171]:59799 "EHLO
        thorn.bewilderbeest.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358539AbhLFWuC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Dec 2021 17:50:02 -0500
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net [174.21.184.96])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E704265E;
        Mon,  6 Dec 2021 14:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1638830792;
        bh=sJGoD0KGK28NF/XGudTV7ZOesD4oG76zvYJfSvr/Mjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dRr0ZFsYkpTJi4YZrHfW/njIhXwiebKtrwhmqu5QteZX9M1p8a1kXhb8bgUF1OcOI
         PsX0LukgZR52Mp53Uvn3bJ0yFVdX5OcJp/U3YNHBWC/GbgPsr0fr2+bPCZtvKzIX+s
         Rkefnn9aILmU+gTez7tC+cou0p5oAk6g2VZNj5AQ=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: add Delta AHE-50DC fan control module
Date:   Mon,  6 Dec 2021 14:44:18 -0800
Message-Id: <20211206224419.15736-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206224419.15736-1-zev@bewilderbeest.net>
References: <20211206224419.15736-1-zev@bewilderbeest.net>
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
index 791079021f1b..0cadfbf640b2 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -75,6 +75,8 @@ properties:
           - dallas,ds75
             # Delta Electronics DPS-650-AB power supply
           - delta,dps650ab
+            # Delta AHE-50DC Open19 power shelf fan control module
+          - delta,ahe50dc-fan
           # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
-- 
2.34.1

