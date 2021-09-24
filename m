Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56362C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E21B60238
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245357AbhIXJqP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:46:15 -0400
Received: from mail-eopbgr80114.outbound.protection.outlook.com ([40.107.8.114]:47065
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245384AbhIXJqE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:46:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEPTyuUJUSzpdKv2ebbYuv0Jm+muH9zx/wA/4LM/xOU4fWgqGN4W8D/v9z2DzeHRM+alasC4k6AhgQes30/dXTXpvaKZ2hBm7EytIGTBOsXJnbrtZl3skC4gKm76mXO7wxgbOEOoq+4KKiJ6vp/riMvNXIHmFN4XfyvCFS5v7OWJBhY5XVuWW/LXjzSOYdUDxp1L1eZrgHahF1ykeF6kLvjE4MXb75Ai7mI4mXmZvnfFKp1hRd8kzxKCk4jAu6RSwpVMNSjMvc+vx1wbrtPiVKrVP8VK7u3m9/y8ey17Bv/ZwrBr7CmdkAXNPAenB0qFYpswwopMWaA/z/HXzQvekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=Fu6bmSIPiBod7lMJ8HZUx/74LgaU5WzMWNaHJ1MsuayPtpHV2vdTDWNqM0ChTRCeNk8b4/PW5BtUn8GUuNvmembO0l27/Ad7Np0sapD/OIpC75NrEcQ/Otcp8BsJ2vs1kE3AIuv6mvrSJFVq8Mj8W6siktwmnIOZn6aHXdOOfQHN6qlQwqc2otToHwtO5QXJd+VXHCW1ZySE5dbtsVnWT3er36ySXKiVDPA9Tq+D2gsCqDREEitvL1EQMHDBM03C7Crl6juT6I8i4Rt3JMQRtrOJl6mg+nu0qxDmk9EBF3Q/ZOuS2b/v1pSZDl9BkyNZrSXpVIZdi9olr3NfB4jXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=La9B6bNPf1J1z6oaCH5tx5wXFnViskDUuK0jIXKcfRsjTToDygYrVKzywIqUFHsd668DWf591Yn+a7smmcRwSgS6NVixS7PlTN8Dlmx27MGL8RMgDMM+Ee5auIHvAfqbtC7ruaX+/KrikWunAWJqngX3nWyux2T+xMbZSk7KDtE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8151.eurprd07.prod.outlook.com (2603:10a6:10:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.14; Fri, 24 Sep
 2021 09:44:22 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:44:22 +0000
Date:   Fri, 24 Sep 2021 11:44:13 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 09/10] hwmon: (tmp421) update documentation
Message-ID: <aca7fa6dc33cb856bace78fcb200b287fd3e39a4.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0128.eurprd05.prod.outlook.com
 (2603:10a6:7:28::15) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0128.eurprd05.prod.outlook.com (2603:10a6:7:28::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a436e2d-7969-465a-4bf2-08d97f3fe35d
X-MS-TrafficTypeDiagnostic: DU2PR07MB8151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB8151936B666DDEE5DEEBAB1AEFA49@DU2PR07MB8151.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23GThcQyX24pLVCfsqXgGchZcbtOU7oVpFwYniDv7hGtbG6rzvuXIGQng1H81w2Re569cqJbtIU28QxUwKoUVmbaboAFQY0oaaoZZIt+FQiThKpvT2ykqqJc9AIH0QICjW7J2gYH/xviaS85sRgVBEfNaQckk3hgr0EnFhtAOl2oPkFQ/8RlO5+iD9C6qnPMqAIabvHB3nOURt1z7eTiVy05yOP+jOTm+ToXmU1kudWGDlg41aYD6WG5D6bclqsSkx4De9fz2qIjcFQqZLhZhLzMZDhEj1T3d3GNTSeIPkEWp9thsGCwHM7C2WefLnRdUrC867GTn7XvNZGi5X5Z7fHGdAsyP2RM0mMUAGcuV56Bs8ko1xWmyxYdJrFSKAFLGqxuSE29riJ9xX1RgUB4bZlJKF8SkYkLMpHLwvpLirN+qDN+AOMcb3mgpPiebckEfas7j8Lx42ClAmoZQk9KveVo5viAfE9RKPy/Q3lKdJC0jU+3zYjiConV1/aZpnuRHC/kHDoxZYp6dmwG4Z83jz86EkpZfPJvVDrKiobHAQwvXjOzkXhXFLLFkMc8V9VEFzr5Frxz2t+i/3ulqWqUfuW1kxtrahE33hISB/pK2QkM3iJpmLLjfsTD3hX7/4lI7rM1VcmY06aUYXqSW4WH1AmWokLLbHdX8jRLRY6mZk5/9URi7DEy0258Rr49LParvd+lPk+zq+cuk6KjBcZqsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6486002)(52116002)(66946007)(4326008)(107886003)(8676002)(66476007)(508600001)(8936002)(5660300002)(316002)(54906003)(110136005)(6512007)(15650500001)(2906002)(956004)(4744005)(66556008)(44832011)(26005)(186003)(86362001)(36756003)(38350700002)(6506007)(83380400001)(38100700002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjK8AYa6ZQuwvbCBWxkk5HAgyFUK+YwmVwf++Gf7D2gDZqODfUp2n+cf2NKK?=
 =?us-ascii?Q?hLAnrvRHo43gWcWv0F83vymKVRxDtcFrpyg7ZwAO/lih3OZSLSylj+4fjcK5?=
 =?us-ascii?Q?NPDFojWTbe4PYcWO6AItR6K5PoiDtt9RcJelcQNTZJHPsAC2qePGzRBAJGRp?=
 =?us-ascii?Q?ZCMU2MOWJMPWRlZUufdMMbXfeSdpdRzV1mzv/xGjN5/klNWfEv7uwqA3RtGs?=
 =?us-ascii?Q?Qp6aYDoVAIj0Q7u/P/UMuNSS6TFVn07NFyBMMETnP50EUig42GzZt++Y6ji4?=
 =?us-ascii?Q?D1sntEGMa/yTsyNt/lD9tHeSmUk0jzeR7cUyGNCgB8Gys4ZwpYzc5upAmHsR?=
 =?us-ascii?Q?AVz/Jq8oL7E7Gylblr6D5tW4793S+wNCV30CXdzuOM+1HIP2jedWzanQ2TfW?=
 =?us-ascii?Q?T/1CMgsgXEldnmIHWnmSL+qF01zT1S90YFdKnnOG0fTXqZ7PvYNcrBca2QEB?=
 =?us-ascii?Q?51LGWoMWWlPlzP+WQtSt9vnDAQPVNgILLHwjlfSFQ+9SSJh4RkStSYQXVgJE?=
 =?us-ascii?Q?XZyGdkfjZG7/J9LC2F+ncr7Rm1Q0XV609pdj2zr/C5lU0ggTvTmZZc0dthcR?=
 =?us-ascii?Q?aDev1FdNQQ3J3+Q86McA0hrI/FEH6DiXjsBO62LVG43uituOGCx941uCEvji?=
 =?us-ascii?Q?hltJHi/tH5yEPlpIdSFOpMiryXb4kik51v+S7blgejwfUy5G+NnCNyON2Tl2?=
 =?us-ascii?Q?vCMTSxVqKzdyHmVHSGc7/o3cftJkhPkV4urUDylX2U5iwZJ8L24NgupTB5Dg?=
 =?us-ascii?Q?RpoT5MWsxPFos0waLX7pLzASs/ceKJK/9OZcIhNY2SV73KzfKx7ZTqQGe2tT?=
 =?us-ascii?Q?OQUlna3GN7uKMjbMJQvBbgeLifchLfQijSAr1lOnzR0kCLrkKmTbgUOJStY/?=
 =?us-ascii?Q?C1oMWt/IreHfdH52LJBN+8vcwGrnqEQwb3UCKjbgy6KH7VDmYOwvTSxOCu14?=
 =?us-ascii?Q?eCAsgI8vMri0j6vTgwX9vdT1D+91BiWO1zFIAUq8WUwzaP5eZTyPVqPI79Hm?=
 =?us-ascii?Q?nOm/MHSaVmjiAEb/qauwmAczHHYeIIUMda6twYy2AetYuTY0ycRjVYmwAjUO?=
 =?us-ascii?Q?URQcyCoBPIzx+wBVBSA5T0Q+10WXfJoprd11Zi0kiAkPaKwWY5hR0gC+Ktqx?=
 =?us-ascii?Q?cpRczAa1ZAF2BP9fZSRzp4Rhw2fLHvKZYr1g4X7/MVWn5mJpNBCft65shXML?=
 =?us-ascii?Q?LNOvGYM4LwphY+FxY6Yv5ozUthrW25K0fCk/3K3H/+3QdkvnPlrATJeohJNs?=
 =?us-ascii?Q?XR4WVj9dWe70gFEzov3kRnkaLG2IHKcLp86WpWYYbZ5iZyifpwvN+mlb5iSZ?=
 =?us-ascii?Q?aFeMpMn7FtwpUMka93FLNd9W?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a436e2d-7969-465a-4bf2-08d97f3fe35d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:44:22.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKcxwUU/SVgMeV4iH7Bw6kS5DmWFQv2S+50iAwO2JmMWGt6kG6FRBd41ee0t4RViXwEgZff0jWpcEkWPGFtx6O7aIV7q1hjfabk9GWCE0p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8151
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Sysfs interface of the tmp421 driver was extended in the recent patches
so lets update the documentation to reflect that.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 Documentation/hwmon/tmp421.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/hwmon/tmp421.rst b/Documentation/hwmon/tmp421.rst
index ddcd5159c75d..a3002117bbd7 100644
--- a/Documentation/hwmon/tmp421.rst
+++ b/Documentation/hwmon/tmp421.rst
@@ -64,3 +64,13 @@ the temperature values via the following sysfs files:
 **temp[1-4]_input**
 
 **temp[2-4]_fault**
+
+Each sensor can be individually disabled via Devicetree or from sysfs
+via:
+
+**temp[1-4]_enable**
+
+If labels were specified in Devicetree, additional sysfs files will
+be present:
+
+**temp[1-4]_label**
-- 
2.31.1

