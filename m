Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DFFC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84B1E60F92
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbhJLJcV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:32:21 -0400
Received: from mail-eopbgr30093.outbound.protection.outlook.com ([40.107.3.93]:55104
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJcU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:32:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSiv9p4+p4xgDHZGqbPpdU/cfUSjZqX3b8SieKt0+3kmeaonDHfMrtcyxEmtz8I7tGDq+dwMJzWSXdT3hpi01JmdWui4PeeAT9TNNacXNhJuPRbRzUCEeSevQ99djqwr06enhTg47LFsSDKDDhay3ZnRaQmMKscntwErFp5xUXs6iTWhNSiQ7TcK5K0tN5WSEn5ZTNWhEYD0YUFJEPUmwGK7932cBy6e8FyVZeHHxxoW4+uRZKAt8gq9+M8o5Y4apaphe7NkjHwpQVwnbvj3cJnJCrtQs73DsXm5BpHnyIWVRO1y6j/8UPnOf2GYBNKPf/dGa8NB+6U8Yem6uAhJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=jhI5V1a5oaOZ3wvx4e+lG8oJg7MgnrpW3Sza65EUKYKaHMDLjdQABQwmpCjaekeKDEKYHdQKxj3ZzlvDeWTxalLJdniZRJKJZu4b8dIkKrufswUz+4yHvIjvjGybt7rSMlYBulDmKs5BkmWcKHCU9iVfmH8KYo+fg0LbFZ1cZvrkTuOVhZQUndd3VRY7BuNhs1ublZvqxQPTf0tIhDQvKLOKy/AQTXVsaCOasEt9MKZECYDwUomctpQAr5nUrK4J1HIXZASex4U1326SuoEVdUkCp/7G3gHgp2CVo5wPE5tMd8Nz5PfaSuhX5wMcM0dEEua8ssJUAcrg1Wlh8npLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRR6d0VWmsySOvz3RnVrcJ1LnT/zSsQ7X0Wec0Ag5c=;
 b=sWRxkdqh6fSWkqJqW8n/WkCCmNBJ0psi9CsEg/nTPdvUrboX6xah4D7uXw3wT/XPRfd/xg7GzYfyAjTLhblMFADzQOuazXMJxNG1nE45uJU91Qox1Cq/5U1bYxkpjNr49NrzuOa+P5SKAF/D8cMLR5Isabi0LuzSbJuMGCY/iIA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8328.eurprd07.prod.outlook.com (2603:10a6:20b:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:30:17 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:30:17 +0000
Date:   Tue, 12 Oct 2021 11:30:12 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 08/10] hwmon: (tmp421) update documentation
Message-ID: <a201eebf656d06f54bd6926c20d4aec12db933e8.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::39) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0026.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend Transport; Tue, 12 Oct 2021 09:30:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4830f701-9875-472d-29ca-08d98d62e733
X-MS-TrafficTypeDiagnostic: AS8PR07MB8328:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8328D6E7F17258B373982BB4EFB69@AS8PR07MB8328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0lk0Tf+ZwBlqhnAqyRCcfQ05h4LaAAduT4Gs5b7zwSWmtSYpcPBGF1JAKG03SBJhm0fE5lt6x2DsyXDoVMhVUgP9zw3pfM4P7nqm94poz0U0vJHQ2vQtgNVImOqHsjOa2w/lZsj2YDFnFDezbSQWUSjdkDc0MAZqIS05nDWMZDX5vAVXufy5waiSYQMzHt/MlHNmgHuUberScah29hTcrpQrN/m7+Qk1w9R0ZFNEoZxwMW9D+XrAyQUl22MNWcwM1GAX+m5IL2FfBhvK1BFsZQBc7OzA1d1g7G7q+g7GIEu/SGRLWnqIdCZlx90Tc+F7m2+DJBc76qvwH3HLsE1rX25NSAX83aAOAhlwkksXey9QhlwCrt1/bQARfwi5d2WBh1PGLODEO1mpk+nNpolRFccoALOGMqgusZXkq+RDCs+zm4bkL+mZQGOP6hEl1ZBaqDi6Iq540xSpHXw1dgRr4HSoOTF6+OPGERxo3iU7TvoDOgoQMT3JcwW2+RjppV7ewXDPGgH4BWcOTQd1HzDmZd7qrQFxe5IWcEN386CSCdeLSLnsyuYHrF85Zca3qsdotJuslhyHiaDXgqQLBE/pgyoKXyZPiTg9nOBygmjVPpbAxrM6n1G3ptAqMlYN2Ooq9EzenzRQuuyGwGLTY2wO+eUutYPFd6YxrSlOYLmuKsfiotpRElNT2uTbcS5SQN7dBhYTKjfZtde56OeCehIXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38350700002)(186003)(26005)(956004)(316002)(110136005)(66556008)(83380400001)(38100700002)(6506007)(2616005)(4744005)(4326008)(6486002)(6512007)(2906002)(8936002)(8676002)(44832011)(5660300002)(508600001)(52116002)(66946007)(15650500001)(86362001)(6666004)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ae8AUHGLW5bsADjoBE8rriQW2j8XPOeiGU/slpVA6wf3oGktY6HPx4UzRIoX?=
 =?us-ascii?Q?8eKQ+SZoK8d9P9ZUbGIUTioz0ss+ckV4wo7U5a58suZ7dtj0SyTWm4o5SQLs?=
 =?us-ascii?Q?f/4CjheiwAV98haUe+QL3L02OL5sQ37EsQL4qDIRBBkrjShMwJdtZi7+YfDL?=
 =?us-ascii?Q?K60DLurxY0fl9EKuYt3rbU1wEzcKsOGFpLi3G/3HIxgMbbQ5mCx+ZSTRYfrH?=
 =?us-ascii?Q?zMSURQ2ek0El1NuBKq19mIis48CLvXzQQOI9QikpciLmNQrSHiLHZCdEh60n?=
 =?us-ascii?Q?ibDWvfgGyItg4QMo9Uh2mqQEqsWXJ9OgumpaM+0ghIEY9Xjszu7aFofTqUJw?=
 =?us-ascii?Q?fdulv5FDycAs2peV0huG3DI6Wj58waY4uIWhVuiJ12FDC2oxE+c4wV8o3TpV?=
 =?us-ascii?Q?x6bUQq0XEOqAntKrqbzb9aM+bFx8jbFPSjqf1QwXNA7EviGbzJUH2fLl6Bku?=
 =?us-ascii?Q?psBXOKa//JXNkzh6BBq86Qi7sTlxAfQCBjRYzVO5JjGWhCs2H2bbUVuYm8rd?=
 =?us-ascii?Q?HZc4k7b7iAHpi34inzggD2jmOsoS52UE+idf3BaXKjCW3EGSAgG3C8yYK3Gp?=
 =?us-ascii?Q?XrMkbp7A7rZ5VDzkIEydNLJzMF5xfwDuUwaHrJ/V0LRF9lu+DW7XANQ/by2/?=
 =?us-ascii?Q?JLmxyx0wt5rAA56TnnaVAiryCwNsEdoM8atTsVFeXH9rPavDkJ74YBAueGGJ?=
 =?us-ascii?Q?SPje0j5ntidKAXQspzhDfSxwTmmTjTCUts6pHPqFxj7xyob4atIuHI7q4Inx?=
 =?us-ascii?Q?ZYPIndtQ7H1tmb5HQn5RNuuan8wZo+7CZQ2L9b+Jg76J5jAElHnVj1dut4su?=
 =?us-ascii?Q?2qdwv72e4I+2yf9Qo4tMHpDRr8OcmmEj/Q7/Y/UC47mDT4vqoEAnBuBuvWAj?=
 =?us-ascii?Q?ALSeMw4uqijgkp/Jmu/ts8WjlQV34cVHQy30aOrzbDhFtD/HhlsF0MLkN+Zf?=
 =?us-ascii?Q?UgyiJ9cHRPlPMSjfcjcYOsJzNIoAF962WGHQNb3MeGzh1tjso9keLP0vzgvh?=
 =?us-ascii?Q?85oT7RLThVXyki73RDQjGsIHO+k3gVN3PJTVaXQvoZhOkNEscqFU88TIYzE1?=
 =?us-ascii?Q?5rKr22D2LcV6xyCZtm6DFsok8GJElJd/Gtq46cqizOC9ftaShcCCCblqNaH6?=
 =?us-ascii?Q?iIHOwdOPpIp6YqUz/dUaUjDhskYAB1omndJrleEUEp+e/NyzRj5F8HNvu6Xa?=
 =?us-ascii?Q?HM7AbP+c2HuQPA1TMyEQnHfXiInmFvSxGB/bYLHinhJ14jgI7qMxdPd8hj0c?=
 =?us-ascii?Q?bysVcYck1IhiH8E8JtJmJUKsOEsN8lnaa6CZpkdNiCfRxEift/dtkmfrbZdC?=
 =?us-ascii?Q?6+tMQ0MW4GHczmC207jsDKjA?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4830f701-9875-472d-29ca-08d98d62e733
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:30:17.7814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZG5a2iQgH8/nEO9MW/juNRA/wJIbf6bOnI3FFBYbvfhtQtrMxPEdw40V1RLrItO2DG0Dj+46hmGbe3ksaVY9aHqY8hy904eHSxev9uyodhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8328
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

