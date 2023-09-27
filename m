Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3C3E80A8B
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 05:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjI0Fej (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 01:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjI0FeE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 01:34:04 -0400
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EDC72A9
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 20:40:16 -0700 (PDT)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
        by cmsmtp with ESMTP
        id lH8BqYe7xQFHRlLPMqOGme; Wed, 27 Sep 2023 03:40:16 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id lLPKqnO7uPsTZlLPLqRrCA; Wed, 27 Sep 2023 03:40:16 +0000
X-Authority-Analysis: v=2.4 cv=eaguwpIH c=1 sm=1 tr=0 ts=6513a420
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=LxWt8M_ywhtm8WUVVfYA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=U4js+SM1U11yyB4riZ8YLEuGYKTsQkErTf8a0N1JnLc=; b=MC+WRP1pn4KkCodttFQzJrqd3W
        FvA0tc+tRbMmV5uB1xCJT6FTCp6pYY8L4fpP0NPXFXz3Fq8xCSMmK06Q92ytYnFbKzl65BOxDMige
        yeXIwoDUaf+yrJp9dA2Bpk++zBcPpjYPXumU3y5qRUJUWHTIjdBuk85t7zOnBw8JXj7+NGTPmDjYP
        uz1PPEVZVWDt9vC3tpTORuUtlv5Hlolifr+hM4NuyDGMK6QFYNc7tb+0k7FUmMaJrUvbr0OGg1ZXg
        sWfi3INxpzyBUltWOjwpXCjKfyN6RA7l87yVOymzy6Bng0yL96eqKomii20rQnY3CJdpFwP5sXjA7
        DYmvTvHw==;
Received: from [103.163.95.214] (port=59728 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1qlLPG-000tFx-26;
        Wed, 27 Sep 2023 09:10:10 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v2 0/3] Add support for mpq2286 PMIC IC
Date:   Wed, 27 Sep 2023 09:09:50 +0530
Message-Id: <20230927033953.1503440-1-saravanan@linumiz.com>
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
X-Exim-ID: 1qlLPG-000tFx-26
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.163.95.214]:59728
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 1
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfByR8TBObxe/ITPsj3Gn0YjxJR1mCddAySl6lfLSfRlFP0EnYFdPS75XsIwU2m0H4JXOr0Y3rc1j95zjhEYP1OOZs5O6wXpD4DziMYthDIDeJyi+n8yn
 i5FkCWvT6iJiWjD2flPFe0MTg5No/wjSGJYuSAFxuQts0zRc/OG9N++rQ5d2oTn5b3ByATHxj84d8GSsPKPSCZ4LeNvXGwGERuE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

changes in v2:
 - fix dt check warnings
 - fix compiler warning on cast device_get_match_data and lexicological order of compatible



The MPQ2286 is a programmable, high frequency synchronous buck regulator with
integrated internal high side and low side power MOSFET. Application in
Automotive compenents such as ADAS, Infotainment, SOC System core, DDR memory.

Saravanan Sekar (3):
  hwmon: (pmbus/mpq7932) Get page count based on chip info
  regulator: dt-bindings: Add mps,mpq2286 power-management IC
  hwmon: (pmbus/mpq2286) Add a support for mpq2286 Power Management IC

 .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
 drivers/hwmon/pmbus/mpq7932.c                 |  9 ++-
 2 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml

-- 
2.34.1

