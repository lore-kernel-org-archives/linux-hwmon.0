Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3C4C43214
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Sep 2021 09:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79A2161059
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Sep 2021 09:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243526AbhIAJUf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:20:35 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34549 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243508AbhIAJUe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 1 Sep 2021 05:20:34 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D68B6580B15;
        Wed,  1 Sep 2021 05:19:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 01 Sep 2021 05:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=mn7+yExtUVJrX
        meM8dP9smwIjAECnzjlQP6Jmb9X14A=; b=VPf0HL08brC46V0GhjbQrINnRqHoy
        T7zBulWGgiFhR3M64UQCuTdA0Mk/R/j64HwPV8eZqmbwtknDl67oiChVQx9bEGo2
        XF5nLdWqEMGHiJxo5avPdbRx4ElqvF689QdCccUQJJfxLUzzRkGSAgcS6GsstxKx
        D49pnYkLqBDH5MRyppT7sMbI59FwMCshaZsVeHiqPjTWN33Y6zAl4yHm01Yp/HQ/
        FzOGjqHHizq0GnDNzP6GIzlnXRmacgx7hYyuuyWtT5X1xzJpHDsg5X35URSGXYtm
        J7Rf4lkY7Osmc+R53yZF/LkSbNNaZAMUAf8FGxS4I6VR2rvgNRuHbpggw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=mn7+yExtUVJrXmeM8dP9smwIjAECnzjlQP6Jmb9X14A=; b=RfA8xOZ6
        i4DdAskKOyRWvLjNn0k6cYwajxPK7Kug4hQ7X60Swy27fCS9WGaQnFtDPqHoxuNG
        66ND6lwdp05lMSKm8/LCuxz5WM5+TqZ9FqvY1xK/fo+BY9jSxMJsvTcGPsD7DV3Y
        F1mnkp9/dndf17QtODHhIwFY9jNPHbXKBUW7les8arh3shmhfsrguguBdrPFXmu5
        GcCTZp2zij18ms/PYPy5AZ0YOFL/iCHiQyEDt9biSAMJTQ8qcooH6r/Em4dEEHGK
        ru28mlAc/l7r9fZN60NrMh6yoIUI2nalDrkdp/Td/ARV24z+0lnF40Uy3C9v1e6b
        1obx+urRreNpiQ==
X-ME-Sender: <xms:qUUvYQQXXUJd8AwP2aGPOASvD_maDDNlZrnkxaWa6IJHTruwDJOdqg>
    <xme:qUUvYdyA9tszBIgIeRgaNUp-ny7IXQ69A5f4EoYZh2DeOSv7LeZNqWRbTFX9ewgYl
    MOdnMwi8S8-SfXgvpY>
X-ME-Received: <xmr:qUUvYd3d6qkiGNtB_k-dWJegBUVG9CIzFeOxkBMIt6vB9FFYJ6eSfysi9OmQ3nh-jLkUO_y7G0XSgXxELRL9DggzxJdZJjWP6eWr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
    fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
    gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qUUvYUBx9M4-P85ioWp67lpHAgH-DlB11HMRJyaeuUkf_G_MKFae9w>
    <xmx:qUUvYZh8F9_k_fpugzziTOGc-X5ESsgIyGXz-4vKBmIAXmamERJjHQ>
    <xmx:qUUvYQo590NYhsme3ITH0GpUv1EE_bIYNpS6elNyhgPs7TMhbO5_Pw>
    <xmx:qUUvYeZkNtmOIEfPS5dG-oRum6rSzv7hVuF2zkRHn98az8NzbxqO6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 23/52] dt-bindings: hwmon: Add IIO HWMON binding
Date:   Wed,  1 Sep 2021 11:18:23 +0200
Message-Id: <20210901091852.479202-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
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

Changes from v1:
  - Reduced the maximum number of io-channels, and added a comment for
    the limitation
---
 .../devicetree/bindings/hwmon/iio-hwmon.yaml  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
new file mode 100644
index 000000000000..f5a6cc3efd33
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
+    maxItems: 8 # Should be enough
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

