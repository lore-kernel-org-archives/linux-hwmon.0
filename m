Return-Path: <SRS0=TjI3=5I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB65C4332B
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Mar 2020 23:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E983B2078B
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Mar 2020 23:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IHAJPl2o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgCWXeS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Mar 2020 19:34:18 -0400
Received: from mail-pj1-f73.google.com ([209.85.216.73]:40630 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgCWXeR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Mar 2020 19:34:17 -0400
Received: by mail-pj1-f73.google.com with SMTP id d10so1004466pjz.5
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2020 16:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=g1IXTxNeLuaEoIeAZquMIN8o8RyeqEvLaY82fpBZWjc=;
        b=IHAJPl2oTxONyfNceKZR24ED2EcxarW3ZSAI9FkMqFE0ID+RRsYVYXi/fqi8YylKMo
         xZC9QD9AIn59b5g/bRMjVT4gSbndx3PplMKjOoHeqCMVeb07iDVn3kco3S0VNdhmg0pY
         rZAEkQXs/YaXzYjK4qx1UpuatgbmdmooExWI5KIZ4t/aZ9oaIBIEymCkr9WPFdlxs8Xr
         biYrXf/F84ARMgUzOsMmb9Xbpo8PItkZbMK/Up5Uv3q0W/dHd2VDhVqyNzBJnlSKEfrI
         G373NRUxDdgwxiKbtjsuFhX/4Q9Uv5meYi6iK8UDoWK7rFRjTpGOWB3UJoFEHcwDdFn4
         LEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=g1IXTxNeLuaEoIeAZquMIN8o8RyeqEvLaY82fpBZWjc=;
        b=n+gtCyT3P+w4Vn23TAH0v8VDFv+mP2+1Ycf/T0VABTqg98VMjSTHAGluEvcSb2aEdA
         1TvG0Jdo7ZwC5QZ7aV+glUQg96S6rpjBJBb58ie5bIq/qgMcSM6/4+TDU2l7f+PIqGiB
         5OHEhWr8Ieos5lRCtICvtTG7Emxe9CZW0V6qwsdZqH+GCjZ2hsq/IsdTYnzboTOshxp7
         7s0/trh4J6lHROdAmCuzPkWCAs+h8Ot3lG6H2G1+xeMt3A2u5NzmG2OxGcBhlVv7sYy6
         O70MNTfFx6G05wVuj3qWj0ON+e+fDS3gpuraN/9hjENJi35zCIuNPg1hsyv9Wx9nSC7n
         BbAA==
X-Gm-Message-State: ANhLgQ1DcpunKkTxMc3aHMMg45Gs7+MOh+PJpkw5HNWaQcrDeDmirjKs
        YHteKdAzvu+1a59vJRKRuyHx1pfSDA==
X-Google-Smtp-Source: ADFU+vtuicKd9xEczdBa/a3me7A5WmLybcBMMiKtFPfL2j6mf5FWfWwsC5ap0rDRstz05QphVWxOQwQh5A==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id kb8mr1901152pjb.79.1585006456742;
 Mon, 23 Mar 2020 16:34:16 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:33:54 -0700
In-Reply-To: <20200323233354.239365-1-kunyi@google.com>
Message-Id: <20200323233354.239365-4-kunyi@google.com>
Mime-Version: 1.0
References: <20200323233354.239365-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v2 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
 SB-TSI hwmon driver bindings
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document device tree bindings for AMD SB-TSI emulated temperature
sensor.

Signed-off-by: Kun Yi <kunyi@google.com>
Change-Id: Ife3285afa4cf8d410cb7bee1eb930dc0717084f9
---
 .../devicetree/bindings/hwmon/sbtsi_temp.txt       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt b/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
new file mode 100644
index 000000000000..4020f075699e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
@@ -0,0 +1,14 @@
+*AMD SoC SB-TSI hwmon driver.
+
+Required properties:
+- compatible: manufacturer and chip name, should be
+	"amd,sbtsi",
+
+- reg: I2C bus address of the device
+
+Example:
+
+sbtsi@4c {
+	compatible = "amd,sbtsi";
+	reg = <0x4c>;
+};
-- 
2.25.1.696.g5e7596f4ac-goog

