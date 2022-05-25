Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2D7C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiEYHhR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiEYHhQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:16 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEB75DA14
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:15 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:11 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: Extend the device-tree binding for lm90
Date:   Wed, 25 May 2022 09:36:50 +0200
Message-Id: <20220525073657.573327-1-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464233;
        bh=2XR7LcsYHYqTEmlc1MvJknjMnFcNAr6Q09NoCw7+DoI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=Sug/nmGTgM/W4PtansM86Ik2BU0hOW3CWECHVmm1khpeEAPKOTLqhrZkIRYfjvSst
         uOhvhYIV7y+sCJTxMOAJ4e5wamR8kMkJLb5pIppHSNZVO5rw9i1HBGy78tYgCZFrve
         LjPS66Ine+vqAt833S/y05tvXqAXv//D/xCSXmKk=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

This series extends the device-tree binding for lm90.
Support for channel's label and channel's temperature offset has been added.

In lm90.c support for 2nd remote channel's temperature offset has been added (it is useful for
ADT7481 device) along side the needed changes for new bindings.

Note: this series has been rebased on hwmon/hwmon-lm90.


