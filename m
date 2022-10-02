Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD3AC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 17:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJBRpY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 13:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiJBRpV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 13:45:21 -0400
Received: from p3nlsmtpcp01-03.prod.phx3.secureserver.net (p3nlsmtpcp01-03.prod.phx3.secureserver.net [184.168.200.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F1A326CA
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 10:45:20 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id f30ko2gSMKzAwf30koV8Ze; Sun, 02 Oct 2022 10:44:18 -0700
X-CMAE-Analysis: v=2.4 cv=Dv2TREz+ c=1 sm=1 tr=0 ts=6339cdf2
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=jb-T2W6fKCUHUazWB00A:9
 a=ZXOyfd87I8AR-G90gsrY:22 a=AjGcO6oz07-iQ99wixmX:22 a=nlm17XC03S6CtCLSeiRr:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=51840 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1of30j-004aiB-VJ; Sun, 02 Oct 2022 10:44:18 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v2 0/2] it87: Add param to ignore ACPI resource conflicts
Date:   Sun,  2 Oct 2022 18:42:58 +0100
Message-Id: <20221002174259.14609-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl1062.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - khalifa.ws
X-Get-Message-Sender-Via: p3plcpnl1062.prod.phx3.secureserver.net: authenticated_id: ahmad@khalifa.ws
X-Authenticated-Sender: p3plcpnl1062.prod.phx3.secureserver.net: ahmad@khalifa.ws
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfHUtS5jqpMtA42ZCzylf+KTIgosNDxaKIvsNXKVSNJvXX0kVsyikb329c5T2Ubdi87wdqMMMRgXFXoHOmuvN83c3u/91S1K+Y2TgcqwSJMYzHV1br+kn
 48G4Ru/9l/pmUJfGp7+xcnTCzGszLTU4lZIfAGMfkkuBs3cMpBIHkIgNVSNHCIBIVO8XUCWmhAHNaFKAYE5WZ3I9aXaf7HvWaJbAysrLrb2ksfzWQjsfiFVe
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Add in the parameter to ignore ACPI resource conflicts so that modprobe
can use the force_id parameter when ACPI has the same address mapped.

This requires also checking the device id before assigning force_id to
avoid registering two devices. This may not be a visible issue as ACPI
conflict unregisters the whole driver, but with ignore_resource_conflict
added, both SIO addresses will register a device.

This is useful for those who don't compile their own modules from github
code and just want to configure modprobe with a /force_id/ value that
gives them coverage of the first 3-4 fans/temp/in values.

Code is inspired by the github it87 module floating out there, but didn't
merge in support for additional devices as there were objections to
that approach in past threads [1].

Tested with it8688 on Gigabyte board with id as it8628 and compared
against the out of tree module running the it8688 values (which in turn
is blindly based off of the it8686 values) and the results are the same
for the enabled sensors (i.e. not all 6 fans/temps/in are valid)


v2: updates with comments: [2]
* Add missing patch description, not just cover letter
* split change for the force_id check into separate commit

[1]: https://lore.kernel.org/linux-hwmon/6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au/
[2]: https://lore.kernel.org/linux-hwmon/20221002151148.GA2896730@roeck-us.net/T/#u

Ahmad Khalifa (2):
  it87: Add param to ignore ACPI resource conflicts
  it87: check device is valid before using force_id

 drivers/hwmon/it87.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)


base-commit: c3e0e1e23c70455916ff3472072437b3605c6cfe
-- 
2.30.2

