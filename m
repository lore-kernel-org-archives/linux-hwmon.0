Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E1AC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Oct 2022 21:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiJDVCx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Oct 2022 17:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJDVCx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2022 17:02:53 -0400
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net (p3nlsmtpcp01-02.prod.phx3.secureserver.net [184.168.200.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940B765270
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Oct 2022 14:02:51 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id fp2xoBjOPsM8efp2xoWENh; Tue, 04 Oct 2022 14:01:47 -0700
X-CMAE-Analysis: v=2.4 cv=L73Y/8f8 c=1 sm=1 tr=0 ts=633c9f3b
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=iihcBN-LAAAA:8 a=KT2vLV3kuGowUw7RsL4A:9
 a=ZXOyfd87I8AR-G90gsrY:22 a=AjGcO6oz07-iQ99wixmX:22 a=nlm17XC03S6CtCLSeiRr:22
 a=HcALgBdeMRM4wejQDfUI:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=39992 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1ofp2w-00Gpon-Sl; Tue, 04 Oct 2022 14:01:47 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v3 0/2] hwmon: (it87) Add param to ignore ACPI resource
Date:   Tue,  4 Oct 2022 22:00:59 +0100
Message-Id: <20221004210100.540120-1-ahmad@khalifa.ws>
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
X-CMAE-Envelope: MS4xfC5wB96ycewWYYcwBrRAec4F61B79+cCpgQF9ZC5a8aMgqVsDZFvgavNe+vG4OS20cg5ooKUhNTdbqR6nU8gl++/o1TLm1+dDkfeeBG+PrRwtuxwUYmT
 Y4aIjQnTix06XxZMvNLcfFvrXISoPzWETXqmhsJVEWLxyX/gOBDw6MKF26+kZ5CQvWEtR0npdClst3txzVe7NPi7AkbYJwBmxo/jNDXjeFodxlYAu6CY2yrD
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Changes in this patch set:

* Add parameter to ignore ACPI resource conflicts as an alternate to
  using 'acpi_enforce_resources=lax'.
  Some BIOSes reserve resources and don't use them and the system wide
  parameter may result in failures to certain drivers.

* Check there is a chip before using force_id parameter as there
  is no value in registering a non-existent chip


Code is inspired by the original it87 patchset dating back to 2017
(around 5 years and 2 weeks since the date of the original
ignore_resource_conflict param)

Tested with it8688 on Gigabyte board with id as it8628 and compared
against the out of tree module running the it8688 values (which in turn
is blindly based off of the it8686 values) and the results are the same
for the enabled sensors (i.e. not all 6 fans/temps/in are valid)


v2: updates with comments: [2]
* Add missing patch description, not just cover letter
* split change for the force_id check into separate commit

v3: v2 thread -> [3]
* Fix formatting and switch to 0 for permissions
* Patch descriptions and subject

[1]: https://lore.kernel.org/linux-hwmon/6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au/
[2]: https://lore.kernel.org/linux-hwmon/20221002151148.GA2896730@roeck-us.net/T/#u
[3]: https://lore.kernel.org/linux-hwmon/20221002174259.14609-1-ahmad@khalifa.ws/

Ahmad Khalifa (2):
  hwmon: (it87) Add param to ignore ACPI resource conflicts
  hwmon: (it87) Check for a valid chip before using force_id

 drivers/hwmon/it87.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)


base-commit: c3e0e1e23c70455916ff3472072437b3605c6cfe
-- 
2.30.2

