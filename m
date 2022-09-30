Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E53C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Sep 2022 14:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiI3O4L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Sep 2022 10:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbiI3Ozw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Sep 2022 10:55:52 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Sep 2022 07:55:51 PDT
Received: from p3nlsmtpcp01-03.prod.phx3.secureserver.net (p3nlsmtpcp01-03.prod.phx3.secureserver.net [184.168.200.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7312D7B1FB
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Sep 2022 07:55:51 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.96])
        by : HOSTING RELAY : with ESMTP
        id eHIOojVVlKzAweHIOoEAqn; Fri, 30 Sep 2022 07:47:20 -0700
X-CMAE-Analysis: v=2.4 cv=Dv2TREz+ c=1 sm=1 tr=0 ts=63370178
 a=2X41b4ieGfoJAKBLAMfEgQ==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=xOM3xZuef0cA:10 a=sCYMkZJ_nKMA:10
 a=VwQbUJbxAAAA:8 a=QrgmnoRbCsd6USk9JSQA:9 a=ZXOyfd87I8AR-G90gsrY:22
 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=56216 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1oeHIN-00BAyT-N2; Fri, 30 Sep 2022 07:47:19 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH 0/1] it87: Add param to ignore ACPI resource conflicts
Date:   Fri, 30 Sep 2022 15:46:36 +0100
Message-Id: <20220930144637.48904-1-ahmad@khalifa.ws>
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
X-CMAE-Envelope: MS4xfFIAc7YyVO9MJ89Jq60D393h65DINckN1LnfZVH+Ib0INt7ATyayU4nza77hlm1KdA/e6DYJC9fBzW5fSL83Ewizak+1HeEwL2f6oUodqI78v52zcwwe
 pK4rAinf0B8iwHA8BH21V4cc8lD6WyZ/48VMX2A4CnzN17N+JKkTlxB0uOwHs5vQhXQ8f0Ds/UJ7fHUhCIQJCZ7LhbwYhNaqfQYjAvdXT1tfJ90uFLf7ryXC
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Add in the parameter to ignore ACPI resource conflicts so that modprobe
can use the force_id parameter when ACPI has the same address mapped.

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


[1]: https://lore.kernel.org/linux-hwmon/6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au/


Ahmad Khalifa (1):
  it87: Add param to ignore ACPI resource conflicts

 drivers/hwmon/it87.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)


base-commit: c3e0e1e23c70455916ff3472072437b3605c6cfe
-- 
2.30.2

