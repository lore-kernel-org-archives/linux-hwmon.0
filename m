Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E2CC636CA
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 14:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA4961248
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 14:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239090AbhGUNYW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Jul 2021 09:24:22 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56163 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239096AbhGUNYW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:22 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7E34B5809C4;
        Wed, 21 Jul 2021 10:04:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 21 Jul 2021 10:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=hpVY+5wKfdtbk
        BH7Qw5vZW6MW96kNo48g2kdpxHBygk=; b=aZH6bgE5QrZyg1j9O4HL3x8dHoswV
        WrsXpQ2Z9is6f16om0s+zhOsKqcgOnP5kE7Ma1ilf3uxhJTuRREV4euovx47r7/U
        1R0/R7imalxJhbVG1J7ngNn9YiYeKhZAt3KNOmkYfYof3TUgYS9VAx0D7r9Zleke
        ZD3CYQg1uJ8MM29Yar99VUtEO3uir+lMG5a5CfODCbA7Q4Ck7w5id/fyWuDhoWJT
        sEmrljS/hhv3WxSYanLo6iuZJm5ooVuabC/W4BJ0Zn3Jx0u1A83NjWD0OMrv0vGL
        lUm/21X63tZ1qIckJi7LXfZLZmdGqj0oWXXb64HEJDu8NsWUW1EQmfsow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=hpVY+5wKfdtbkBH7Qw5vZW6MW96kNo48g2kdpxHBygk=; b=CiNUXNYU
        Q0W3JaKzkaXhsxNzm/voaNqsbTO1UBy0iuQFoWsWq5hLe+4aNtITjXEommyUdkTX
        KOjCX54VoHAYQ8KCFrtrDpYuVhiuY7u8I/9x1S6xYHCSQYcLdDQp3yQh3Q8GWHCa
        R7p6IW2XwlvGLyED8lOjqUdcLsD54KahPhRXBwtBr5SsNLOgzqRNZKgOhDyUb5yh
        k9pkHTAVmFruax35SRsA7j9IGXg5qlPAxjGkcyeNv6uotlCPdQP7JRd5yQpSbri8
        hMVjAKxPtI2NAot86S5QCIs9KiHQrShtJz0trg8OnEZtF4FcyfC+9L+ftR5+WQsZ
        krncDBk93TaCfg==
X-ME-Sender: <xms:iin4YCOw3lfa7_i3brjLxX9GBe4HUp5BWcDm3_hcDE2JLgT5FK_k0w>
    <xme:iin4YA-NSn68tSurGmmc4s9LO-rHy_A52FpZEFq9dGTUvnDI5_Bo8UnfL58fP433P
    6eOb15q3ycRK32NACw>
X-ME-Received: <xmr:iin4YJThrcPzOe7rsr-Q55PxiNLXl9U2E1SkgoPhScN8eKy4SersOVxGKUA1o608Vr96CTh9N_32i7W6C5BIgjqQtwbDjtB70OMN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iin4YCtwBxsLkpkrMbwZYo_iNetThEYLWWdK2otQvt3Y3el19gAy0g>
    <xmx:iin4YKco2R7FaHdGuPzE6sZmGe4BXqVTD5HhkL324j-W6pFPsoh46Q>
    <xmx:iin4YG311gmda2V_B3J3MKfB8zjJOUdD9LWeoYVj37kjqbyiyVRF6A>
    <xmx:iin4YLUyhyPNVB7ePfks0TtdpvnpcAdZzOk-SDdDXguLT1YAEo3THQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:04:57 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 14/54] dt-bindings: hwmon: Add IIO HWMON binding
Date:   Wed, 21 Jul 2021 16:03:44 +0200
Message-Id: <20210721140424.725744-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Even though we had the iio-hwmon driver for some time and a number of
boards using it already, we never had a binding for it. Let's add it
based on what the driver expects and the boards are providing.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/hwmon/iio-hwmon.yaml  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
new file mode 100644
index 000000000000..49dd40f663a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: ADC-attached Hardware Sensor Device Tree Bindings
+
+maintainers:
+  - Jonathan Cameron <jic23@kernel.org>
+
+description: >
+  Bindings for hardware monitoring devices connected to ADC controllers
+  supporting the Industrial I/O bindings.
+
+properties:
+  compatible:
+    const: iio-hwmon
+
+  io-channels:
+    minItems: 1
+    maxItems: 1024
+    description: >
+      List of phandles to ADC channels to read the monitoring values
+
+required:
+  - compatible
+  - io-channels
+
+additionalProperties: false
+
+examples:
+  - |
+      iio-hwmon {
+          compatible = "iio-hwmon";
+          io-channels = <&adc 1>, <&adc 2>;
+      };
-- 
2.31.1

