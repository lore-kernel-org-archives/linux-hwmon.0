Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425A4C77B61
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Apr 2023 09:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjDXJx7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Apr 2023 05:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbjDXJx6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Apr 2023 05:53:58 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0571FC0;
        Mon, 24 Apr 2023 02:53:57 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33O9rZte060868;
        Mon, 24 Apr 2023 04:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1682330015;
        bh=1dbXWi9KKyWCUVrlsQWfh2myKejUVwt83Bg2Xprp4nY=;
        h=From:To:CC:Subject:Date;
        b=N6neAnWopJoMomiGhST25n2bghSPu025bqeZs7+RvoC1mqV0o5KhA2CUlVjYMkVcz
         2y7ghvM9fNVCSoIAxrfWXTaZS7AkXAk4hmycovNW5HPSIcKFzYCPuKVf/dH1xo7MBv
         FkS+qv8P9QQxp/8gIBxr19lAXh5a0ri2hX5qQ2JU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33O9rZOi033929
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Apr 2023 04:53:35 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 24
 Apr 2023 04:53:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 24 Apr 2023 04:53:35 -0500
Received: from ula0497641.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33O9rV9q009313;
        Mon, 24 Apr 2023 04:53:32 -0500
From:   Neha Malcom Francis <n-francis@ti.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jdelvare@suse.com>,
        <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <n-francis@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <kristo@kernel.org>
Subject: [PATCH v3 0/3] Add support for ESM
Date:   Mon, 24 Apr 2023 15:23:28 +0530
Message-ID: <20230424095331.45351-1-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ESM (Error Signaling Module) is a fundamental IP responsible for
handling safety events. The driver currently present in U-Boot is
responsible for configuring ESM. This patch series adds dt-binding and
nodes for J721E and J7200. This goes towards end goal of having DTB sync
with that of U-Boot as well as ensuring completeness of hardware
description in devicetree.

Changes in v3:
	- formatting changes in dt-binding
	- modified example in dt-binding cbass_main -> bus

Changes in v2:
	- misc/esm-k3.yaml -> hwmon/ti,j721e-esm.yaml
	- formatting changes in dt-binding
	- modified example in dt-binding

Neha Malcom Francis (3):
  dt-bindings: misc: esm: Add ESM support for TI K3 devices
  arm64: dts: ti: k3-j721e: Add ESM support
  arm64: dts: ti: k3-j7200: Add ESM support

 .../bindings/hwmon/ti,j721e-esm.yaml          | 53 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     |  6 +++
 arch/arm64/boot/dts/ti/k3-j7200.dtsi          |  1 +
 arch/arm64/boot/dts/ti/k3-j721e.dtsi          |  1 +
 4 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,j721e-esm.yaml

-- 
2.34.1

