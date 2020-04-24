Return-Path: <SRS0=OFCL=6I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB33C55186
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 03:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 597B62075A
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 03:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="skWc1iR8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgDXDV1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 23:21:27 -0400
Received: from mail-eopbgr680056.outbound.protection.outlook.com ([40.107.68.56]:10979
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbgDXDV0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 23:21:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTQd4Qqldl+0xT8fD1qbJ5Duz9Y54Y4NfhvqJaZes8dW4+GM2VzdXHRqE+vkCpddSEMl5Dc7hXlXWU3bYBHkamSwATADMu9EgsKD6n8DMD+z1+CB6H0VjfyIpLmq9rR5A5lCdg5RKdF8tmoUciL9aeveQRnvPuVBTsw0McZv1EFK56tFxz/VC2dSA5n6wLlMi3wGsmPothi9QGjELAcsRrjvRQPwb66pEqtIKjswrc0/X6fa0jzbGlqiz24J6AvRU/aDJtfUQlJyiwBj8ecY5ZWpIjkQ4iDriBmX1ZZcFM+0D0aHu0PCYpwuAckr6I7FFPn4gXDC0Z1H2CN/zqBDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQu+yqJA0IuYA0rOk+WOVsOYlL/zuXxW1+McOfixBzI=;
 b=LeJ6Qno3vSlcviFiDTD9MIYHD4ug0T/DZ9kYREwjIy006XibelcDeXeCwSieuUp9P5UJUe0J/eyvvY2+/b4QejsC3T2agaTPtnoRJjR5RTupvQMBwJxM774lI6YgAYfFFmBBHC02YELIG9o5l+vDY+nIl1uZmRYRI+DG2TAM86WnEt0ZjwWSnYU8JaUjHRJGOxHW7tNybxAIBNRK/sH8cKAAIznC5cC3DOLxgV3w4T3/eU0oiu8SyyT+edop/M4yLWjjHBWFZslb2i3jQnJbdAqKDb67ZwNegKu0SDiU1d5PCRCpDIltGUMZOgKk1nmSDcQkOLBuTHUf48jA69WQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQu+yqJA0IuYA0rOk+WOVsOYlL/zuXxW1+McOfixBzI=;
 b=skWc1iR8z+AM2FnQxTGgoaWBGg3xz0joUuz4shim2T1B94E6pk84SBBybIYzROPLTwgw0gKTuORWhdT8Vp31cPwsk1mw4yvxlIVHCsFm4wLGrK4+uLmDriukPacvSP+KCq8A9hiH3MpojgtZ7YZbZzY5Qla48W2vx1bZOLHR160=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3826.namprd12.prod.outlook.com (2603:10b6:a03:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 03:21:24 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 03:21:24 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for AMD energy driver
Date:   Fri, 24 Apr 2020 08:50:56 +0530
Message-Id: <20200424032056.16287-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424032056.16287-1-nchatrad@amd.com>
References: <20200424032056.16287-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::23) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 03:21:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0a926a6-29ac-460b-c4c7-08d7e7fe9134
X-MS-TrafficTypeDiagnostic: BY5PR12MB3826:|BY5PR12MB3826:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3826468DAF4B1EFF3212292FE8D00@BY5PR12MB3826.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(1076003)(6916009)(4326008)(54906003)(2906002)(2616005)(316002)(26005)(8676002)(6666004)(52116002)(478600001)(81156014)(66476007)(186003)(66556008)(7696005)(956004)(5660300002)(36756003)(16526019)(66946007)(4744005)(8936002)(6486002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4Vx2U4xLiR1K3UyHY6ootk+7RyLIlNR/0pC0Bylxo4RPCUNxg2RM9b7dN2cqcrFPbiHpkcy3ho1m1/kxlc5a7LqqUOtKnqzN62DZhpnDMmhLlLPvk625jSl9EwAETNRBiN9jCZwRp9AC4SgtlseWElcKlYrWAecV54Aw9ZuiMn9S4dZxQoTDxe9tRAYRWK5WRTh4/TbOId30oLo4FCQaKi9VQ4vH30tlv/YkSXA95yigxoTnfVUMvCrr7E8ccrtqizt0krZpFb5ARysSxNuOj+i8R5TELC8kt281zUHvsxmyEr7xbh4eyEDRZDglYnvEIxx/+wlKEwtKI5KMGq+6Ap+a4nzSIY+DkoVS1WIL2sDxHPFlJgwbO1DIYpvsLc4yfPXe/QTU9ydrybIW62G4/215WqE7tLPEUPGx1Na+xIYhRdY11KNZrDxutQXOC1r
X-MS-Exchange-AntiSpam-MessageData: yhdzSmkKY7pF836TFPhtIhRi5QDVa2P2xKKRMdjRql73kSzcr9grOOuWrDettf+PdXMb0oJ+/vLP7T04vHocWFSv8pfL0Xpq5YCBQZ0cw0QPhIZqvwNfr79IbdxkGR5cf9CNqDN+efBUgAaE7tQXxw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a926a6-29ac-460b-c4c7-08d7e7fe9134
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 03:21:24.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ax7cwJ66ihVfAgonqUVgzFqgOiZEtmms9AcepEBlpXu+kwI/YgpgUv6Gp2nzkMk8LDJqyy5vBVMavJX8kQqmEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3826
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The kernel driver is part of HWMON subsystem.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v4:
None

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1175fc0aadb..112ffd7742aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,6 +842,13 @@ S:	Supported
 T:	git git://people.freedesktop.org/~agd5f/linux
 F:	drivers/gpu/drm/amd/display/
 
+AMD ENERGY DRIVER
+M:	Naveen Krishna Chatradhi <nchatrad@amd.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/amd_energy.rst
+F:	drivers/hwmon/amd_energy.c
+
 AMD FAM15H PROCESSOR POWER MONITORING DRIVER
 M:	Huang Rui <ray.huang@amd.com>
 L:	linux-hwmon@vger.kernel.org
-- 
2.17.1

