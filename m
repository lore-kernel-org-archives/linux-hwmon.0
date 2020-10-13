Return-Path: <SRS0=maGh=DU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB52C433E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCDAD222EB
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591412;
	bh=jxKgwQpqmG7edKBQ2bcpJ5DtU3FDZhmfZZD+7bojMRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=j+Iugi0OjGj0Id/qVMqgOJhQxKSRHMv8X/cVEn+0kgK+SQILybiBteff3tO2O0EpW
	 fy15ZCFYRWM42exXMl9K5Om4/y3yA+9bVcjAXoYO7gu65o8hqnikcvysq4hc8NAB7z
	 LciL+b30TfVomxalAwM0U/Ee7DiybUk/uo60rZOc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgJMMO4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:14:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726812AbgJMMOz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:55 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8BB22222E;
        Tue, 13 Oct 2020 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=jxKgwQpqmG7edKBQ2bcpJ5DtU3FDZhmfZZD+7bojMRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B05vey5IA5ksPe17cm6USjNJ51DIeGn6cpygtRtj03TlrIVA36n90SKtdIfB7igF9
         E3MS5n513P9kVcMWcAzi/Q3OtBBnwV+4wLFeavKIRgrT0Djs3UI8m+6A3qycf1FYF4
         RApS29AzSBLrbZQJ+fhUNJDWByDoGAYQJYkSeDO0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCe-006Cnr-MR; Tue, 13 Oct 2020 14:14:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/24] docs: hwmon: adm1266.rst: fix a broken reference
Date:   Tue, 13 Oct 2020 14:14:28 +0200
Message-Id: <240216628f613d85fd1191b56debda611e8f659e.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The reference was missing the extension, causing the
check script to complain.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/hwmon/adm1266.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/adm1266.rst b/Documentation/hwmon/adm1266.rst
index 9257f8a48650..2b877011cfdf 100644
--- a/Documentation/hwmon/adm1266.rst
+++ b/Documentation/hwmon/adm1266.rst
@@ -20,7 +20,7 @@ ADM1266 is a sequencer that features voltage readback from 17 channels via an
 integrated 12 bit SAR ADC, accessed using a PMBus interface.
 
 The driver is a client driver to the core PMBus driver. Please see
-Documentation/hwmon/pmbus for details on PMBus client drivers.
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
 
 
 Sysfs entries
-- 
2.26.2

