Return-Path: <SRS0=fi2j=XT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E988CC432C1
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Sep 2019 12:50:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABE83207FD
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Sep 2019 12:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="iW/QALx2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395386AbfIXMuF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Sep 2019 08:50:05 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:28056 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390343AbfIXMuF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Sep 2019 08:50:05 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8OCbvd3018884;
        Tue, 24 Sep 2019 08:49:36 -0400
Received: from nam03-by2-obe.outbound.protection.outlook.com (mail-by2nam03lp2057.outbound.protection.outlook.com [104.47.42.57])
        by mx0b-00128a01.pphosted.com with ESMTP id 2v6hku1ty8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Sep 2019 08:49:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvdDXbHMbRhIXaq6U8MejgwGJaIn+hEq9ReLZl6Xh3PcyvKAQ/y5IBj3T9j4meWs+B5D1WamtrgJtN22IMbnQGq5pQF7Dsf3I50frCyyysnsHe9fEdjqCBpFyX0GmDFh3UWUJhSFJKIoglbvHic/ebDjhYNQfO+hiMja3PwIR5ZO89LV53NwRHDc6xTThJiTSgJqPz0OwVPvccgA2n9x+sUNPnJG6xQOZHBqrxEu9VJUaq1hcA5XiCBupnt0cA9pc+w/V2NYEr5nQgdn7rIGK70T52XJTxv+a7GEpa8I8x4JqWPbl51JZDyYNrXh3SD3HiQbHarNwh++/5gXArky/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d54zikz8kDz2a9h5GtyQiEICI8B3vLFpGoqn+n3HrKI=;
 b=R4CFmMbEK2303Q+h4vRMvbv4yhxTEaUJ9fdD981muKM+yYk/OuyKKe9+PBLP0gRujPBlI0lI5hxCC2CEKe6l5EIa06ynlkQ52I0N8yaCuRortoObV/Elhf45v/T91E5TAM6zPpRhNgWGkT6j/NHuPl0tFjF5CU8Rq1FcP4hHz2uvGC0qu+APOINMaFIg5H0xm6nv/TQXQ5gyQao7X+5sYHBDTrob+OvHkVUk2GSxIWPvPcONF8YTahD6t2heW0ktzu51AAmv5bSFLZJ8/uEeMcKmtghb52t/xdKcvSK/NTqwyvMiq1XUqZZXIcWt6UYKVoqSEE2Y234n6D7dVXVF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d54zikz8kDz2a9h5GtyQiEICI8B3vLFpGoqn+n3HrKI=;
 b=iW/QALx2sZeNkw8bwC1/YxrQrRDIroXsF6nhxE5JVaVEWaoxGEeED1qyJhg0m2MdFNfuLqaXpuFbauDKawILx9lkV+YIhxF0PscEbdGvJQIqATbG0RDOwF/cRX73U8g8KnieTU7c79RzI4ohojckbatX/JkPBZ7rl/LXjkE/QYo=
Received: from CH2PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:59::25)
 by BYAPR03MB4024.namprd03.prod.outlook.com (2603:10b6:a03:76::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Tue, 24 Sep
 2019 12:49:27 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::200) by CH2PR03CA0015.outlook.office365.com
 (2603:10b6:610:59::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22 via Frontend
 Transport; Tue, 24 Sep 2019 12:49:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2284.25
 via Frontend Transport; Tue, 24 Sep 2019 12:49:27 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x8OCnLqG020591
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 24 Sep 2019 05:49:21 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 24 Sep
 2019 08:49:26 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/3] LTC2947 support
Date:   Tue, 24 Sep 2019 14:49:42 +0200
Message-ID: <20190924124945.491326-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(486006)(106002)(316002)(2201001)(6666004)(86362001)(1076003)(2906002)(7636002)(2616005)(476003)(45776006)(70206006)(126002)(16526019)(7736002)(26005)(5820100001)(356004)(6116002)(3846002)(47776003)(478600001)(336012)(70586007)(23676004)(14444005)(8936002)(4326008)(5660300002)(186003)(50466002)(305945005)(426003)(36756003)(53416004)(50226002)(2870700001)(54906003)(110136005)(8676002)(246002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4024;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b5e69c-aec9-4403-76f0-08d740eda27a
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328)(7193020);SRVR:BYAPR03MB4024;
X-MS-TrafficTypeDiagnostic: BYAPR03MB4024:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4024D00B1D6AF4A6AED13EB299840@BYAPR03MB4024.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0170DAF08C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bgChqbXVPbNap+UUXdbqccUsMgP3i4Z2fLP52aKR7x7qa85tfVzNnhrPJ3YAG69NNyJtiuVOsoeYe+THjRzoRncvea5ptUju0dJmp46kZRXVZPhj8C1nf3ptS1Ro6jBillm6z6yFihCbtpBMbJ9TN66/wBujL73NFZcJ98zxhsmxBQybv0aRhBv+pBiAgJY940CJboGr8vCmEDe8mM3BXP8ky1umQrmr7PvwDAwDpFlUUHjNhZ5JgWQO0JIfiRRU8WJHcBmwUJwN+kogrQEnlzld1jgG/s0rX0Ng8IPzjAbt0+df/sxzQIlX2MWdIqz4N6zPoklg99+gkVSB8GHhWXvPsAp9YRKGJSnPSVVnWeGTmSOa35ObBtLYLg9xueJdEF+l1hZ/dt1Pv67TW3B4/UaDV0PUiBz628kZRH4seY4=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 12:49:27.3085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b5e69c-aec9-4403-76f0-08d740eda27a
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4024
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-24_05:2019-09-23,2019-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909240127
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds support for the LTC2947 hwmon device. The device
supports power[1-*]_min_alarm, so that it makes use of
the HWMON_P_MIN_ALARM mask. This brings me to the first patch, which is a
fix on the hwmon subsystem for the HWMON_P_MIN_ALARM mask. It was defining
the same mask as HWMON_P_MAX_ALARM.
The rest of the series is the usual for a new device.

Nuno Sá (3):
  hwmon: Fix HWMON_P_MIN_ALARM mask
  hwmon: Add support for  ltc2947
  dt-bindings: iio: Add ltc2947 documentation

 .../bindings/hwmon/adi,ltc2947.yaml           |  101 ++
 Documentation/hwmon/ltc2947.rst               |  110 ++
 MAINTAINERS                                   |   11 +
 drivers/hwmon/Kconfig                         |   27 +
 drivers/hwmon/Makefile                        |    3 +
 drivers/hwmon/ltc2947-core.c                  | 1421 +++++++++++++++++
 drivers/hwmon/ltc2947-i2c.c                   |   49 +
 drivers/hwmon/ltc2947-spi.c                   |   50 +
 drivers/hwmon/ltc2947.h                       |   12 +
 include/linux/hwmon.h                         |    2 +-
 10 files changed, 1785 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
 create mode 100644 Documentation/hwmon/ltc2947.rst
 create mode 100644 drivers/hwmon/ltc2947-core.c
 create mode 100644 drivers/hwmon/ltc2947-i2c.c
 create mode 100644 drivers/hwmon/ltc2947-spi.c
 create mode 100644 drivers/hwmon/ltc2947.h

-- 
2.23.0

