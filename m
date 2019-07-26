Return-Path: <SRS0=2746=VX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4529C7618B
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jul 2019 09:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 808C42171F
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jul 2019 09:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfGZJWD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Jul 2019 05:22:03 -0400
Received: from skedge03.snt-world.com ([91.208.41.68]:45316 "EHLO
        skedge03.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGZJWC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Jul 2019 05:22:02 -0400
X-Greylist: delayed 338 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Jul 2019 05:22:02 EDT
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge03.snt-world.com (Postfix) with ESMTPS id 4D79367A867;
        Fri, 26 Jul 2019 11:16:22 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Jul
 2019 11:16:21 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Fri, 26 Jul 2019 11:16:21 +0200
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: nct7802.c bug : in4_input index is not 17 but 16
Thread-Topic: nct7802.c bug : in4_input index is not 17 but 16
Thread-Index: AQHVQ5LKiHtysIdnlkSqPbIDEqh97Q==
Date:   Fri, 26 Jul 2019 09:16:21 +0000
Message-ID: <5D3AC4E5.9050401@kontron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux i686; rv:24.0) Gecko/20100101
 Thunderbird/24.1.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E096B804D68BAF449F29CBA0FD64E2AB@snt-world.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 4D79367A867.A9C17
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: gilles.buloz@kontron.com
X-SnT-MailScanner-To: linux-hwmon@vger.kernel.org, linux@roeck-us.net
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Bug description :
The "in4" related entries in structure nct7802_in_attrs start at index 16, not 17 (the comment is wrong here)
Also nct7802_in_is_visible() should use 16 instead of 17 for the same reason (two occurences)

Impact of this bug :
- when RTD3_MD=11 (VSEN3 present), everything is as expected (no bug)
- but if we have RTD3_MD!=11 (no VSEN3), we unexpectedly have a in4_input file under /sys and the command "sensors" displays the 
in4_input. But as expected, we have no in4_min, in4_max, in4_alarm, in4_beep.

Best regards

Gilles BULOZ
Senior software(/hardware) engineer | R&D
Kontron Modular Computers S.A.S.
