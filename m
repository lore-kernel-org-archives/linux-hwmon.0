Return-Path: <SRS0=/E4C=TD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A429C43219
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 May 2019 16:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 566D620651
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 May 2019 16:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfECQPG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 May 2019 12:15:06 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:34373 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfECQPG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 May 2019 12:15:06 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hMapz-0003gJ-GG; Fri, 03 May 2019 17:15:03 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hMapz-0007io-3S; Fri, 03 May 2019 17:15:03 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, devicetree@vger.kernel.org,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH v4 0/2] Support for TMP75B temperature sensor                    
Date:   Fri,  3 May 2019 17:14:59 +0100
Message-Id: <20190503161501.29489-1-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

This patch series adds support for the TMP75 temperature sensor to the 
lm75.c driver. Although the TMP75B has a configurable conversion rate,
this series just sets it to the default rate of 37Hz. Sample rate is set 
close to this.           
                                                                                 
In the future, I want to develop a function that allows the user choose        
the preferred conversion rate from user-land. 


Iker Perez del Palomar Sustatxa (2):
  hwmon: (lm75) Add support for TMP75B
  dt-bindings: hwmon: Add tmp75b to lm75.txt

 Documentation/devicetree/bindings/hwmon/lm75.txt |  1 +
 Documentation/hwmon/lm75                         |  7 +++++--
 drivers/hwmon/lm75.c                             | 11 +++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.11.0

