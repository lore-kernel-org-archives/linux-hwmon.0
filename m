Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2544C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Feb 2022 12:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbiBPMBc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Feb 2022 07:01:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbiBPMBb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Feb 2022 07:01:31 -0500
X-Greylist: delayed 325 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Feb 2022 04:01:19 PST
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BFF27019B
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Feb 2022 04:01:19 -0800 (PST)
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id E2E932F0929B
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Feb 2022 12:55:50 +0100 (CET)
Received: from s934.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id D2BB83087ED8;
        Wed, 16 Feb 2022 12:55:50 +0100 (CET)
Received: from s473.loopia.se (unknown [172.22.191.6])
        by s934.loopia.se (Postfix) with ESMTP id CEB4F7DCE6A;
        Wed, 16 Feb 2022 12:55:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s645.loopia.se ([172.22.191.6])
        by s473.loopia.se (s473.loopia.se [172.22.190.13]) (amavisd-new, port 10024)
        with LMTP id rQd6l0OMW_jy; Wed, 16 Feb 2022 12:55:50 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 94.234.42.160
Received: from localhost.localdomain (unknown [94.234.42.160])
        (Authenticated sender: carl@hgsystem.se)
        by s645.loopia.se (Postfix) with ESMTPSA id 8B62F1577923;
        Wed, 16 Feb 2022 12:55:49 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chu Lin <linchuyuan@google.com>,
        Jason Ling <jasonling@google.com>
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 0/1] hwmon: (pmbus) Try to match MFR_MODEL to pmbus device id
Date:   Wed, 16 Feb 2022 12:55:36 +0100
Message-Id: <20220216115537.44205-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The UCD3138 chip from TI used in a number of Flex pmbus converters
(BMR310, BMR458, BMR480, BMR490 and BMR491) has a bug in the PMBus
interface hardware that causes it to not respond properly after
trying to read a register that does not exist
(see the 'UCD3138 Integrated Power Controller Family Errata').
This will mess up the pmbus driver's auto-detection process.

To remedy this situation the current version of the driver
supports a flag named PMBUS_READ_STATUS_AFTER_FAILED_CHECK.
If this flag is set the driver will read the STATUS register
after each failed register check with the assumption that this
will reset the hardware interface to a known state.

This strategy significantly improves the situation but does
not completely resolve the issue. In rare cases this seems
to be insufficient to reset the interface and the auto-detection
still fails.

In addition to this, to use this workaround one must explicitly
instruct the driver to expect for instance a BMR490 module.
Otherwise the driver will default to the generic behaviour.

We have a situation where the client wants to use the generic
pmbus driver to monitor the temperature of the converter,
but does not know a priori exactly what converter model is
actually installed; only that it supports PMBus.

To solve this problem, it is possible to use the MFR_MODEL
command to try and match the model name to the device id name
and predefine the functions supported by this specific converter.
In this way one can avoid the auto-detection process
altogether for the problematic models. If there is no match,
the driver reverts to auto-detection.

Erik Rosen (1):
  Try to match MFR_MODEL to pmbus device id

 drivers/hwmon/pmbus/pmbus.c | 57 +++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)


base-commit: df0cc57e057f18e44dac8e6c18aba47ab53202f9
-- 
2.20.1

