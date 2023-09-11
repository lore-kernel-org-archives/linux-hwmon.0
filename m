Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D662DEE801F
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 03:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjIKDnm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Sep 2023 23:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjIKDnl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Sep 2023 23:43:41 -0400
X-Greylist: delayed 90 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Sep 2023 20:43:37 PDT
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0CF19C
        for <linux-hwmon@vger.kernel.org>; Sun, 10 Sep 2023 20:43:37 -0700 (PDT)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
        by cmsmtp with ESMTP
        id fULSqv1OLEoVsfXoNqVXIf; Mon, 11 Sep 2023 03:42:07 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id fXoKqHdKmiPHUfXoMqKJ9R; Mon, 11 Sep 2023 03:42:06 +0000
X-Authority-Analysis: v=2.4 cv=JtLiEe0C c=1 sm=1 tr=0 ts=64fe8c8e
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=fXLTLdlhBoXFRLbt6LEA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=GhflVbz5vM28c/oqiKt0CeuCefN5C4x+tqAreTx3lzA=; b=Zb90C2TYcibGpN5sHqp4Pk4/3U
        25C82bIalgSFKNCSRoNruk5GJHnN7CtfCMPE6u0HnEXsUU7VqZzo8XboaO8ZUtAcmN7JTIXuRj437
        xb4qc/15Ex2ZhGdUIFdfEG2KsGU2qyy7Z8hqPzVEWFN0+su9+UBqTQecgo3ZSMoVm3GmIjaBsl4AD
        Q4pKU48BbDlixZOyz8ovZkC3PguoWBqpEzJZsaQlRZ3AAQ/v67z2uneTNrlidUnpVw/0N7/YIYbWz
        UIo1VGO1HCskvdGa5wpvSyDVIXk6FHzvWXuHRNLpmcWGsVyt5+NQ5BRT2TYEmSyD4FiJL7aqEri7O
        5fkzgWnQ==;
Received: from [103.163.95.214] (port=46382 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qfXoG-002lKM-08;
        Mon, 11 Sep 2023 09:12:00 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH 0/3] Add support for mpq2286 PMIC IC
Date:   Mon, 11 Sep 2023 09:11:47 +0530
Message-Id: <20230911034150.181880-1-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.163.95.214
X-Source-L: No
X-Exim-ID: 1qfXoG-002lKM-08
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.163.95.214]:46382
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 1
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG2t3AEQzHEhlSFv4YfOVqw3lH/OIq6RBED6FqGq9c5xZCWTFJX9ESoedpndlhF8PUdsAg2hDMohvi79cllRP2+gzRsQ5/yhFm4sxGz6ocdpd3mXsT8S
 u1bPOV0VpYWMR/2oN2yUurn+ZvRMwUQTXZPe+i5AsIhjlMQ5O5ijm4WqKkB4hk8pX0fLypxgBlRPP5ZmbqAqg7X3IogENpYPCL8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The MPQ2286 is a programmable, high frequency synchronous buck regulator with
integrated internal high side and low side power MOSFET. Application in
Automotive compenents such as ADAS, Infotainment, SOC System core, DDR memory.

Saravanan Sekar (3):
  hwmon: (pmbus/mpq7932) Get page count based on chip info
  dt-bindings: regulator: Add mps,mpq2286 power-management IC
  hwmon: (pmbus/mpq2286) Add a support for mpq2286 Power Management IC

 .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
 drivers/hwmon/pmbus/mpq7932.c                 |  9 ++-
 2 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml

-- 
2.34.1

