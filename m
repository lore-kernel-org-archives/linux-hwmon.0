Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD23C77B7D
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Apr 2023 13:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjDMN1J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Apr 2023 09:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjDMN1G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Apr 2023 09:27:06 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABB5213A;
        Thu, 13 Apr 2023 06:27:05 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DCWslK002107;
        Thu, 13 Apr 2023 13:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MZ8xHDXxvd55d7GkmH7Efrjfx3+t7H3EHF5QqjwpB+I=;
 b=pkgWyRmMlb4kLZHEGbDDfOoFb8e/STx7G3rrTQuriBdJ0rSOYTgXhd1e8RX8aGCWleak
 iTj3VwhgYqWPg5ypctXIzmIxXaatY6ANjdshmlksXLhDrIjiYfko3FAn3A8ph8ZusT3K
 4Eaz8Rsc00onLiEVGkjSKOYHkkrPmuwhKcB7mpwpss2MZJh0bIV2X4lY8MTHoEnCaUvf
 Q8j39EAdFRH40B43csCh67K7mg3/rHaolLfpMVm/V2YrEmxgoW+U4eJPPCxgRWQTPjdp
 bQU2O1uDS8OcWA2MeTT0UnKU9/wJZ3lqJ52MncFMBdGQW7VHfbcLaiQ007cSX0MybrIk uQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxgefp6bf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Apr 2023 13:26:39 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33DC7LC3029751;
        Thu, 13 Apr 2023 13:26:37 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
        by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pu0fqtg4j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Apr 2023 13:26:37 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
        by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33DDQZTG27656882
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Apr 2023 13:26:35 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 526C658068;
        Thu, 13 Apr 2023 13:26:35 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3B7CB58063;
        Thu, 13 Apr 2023 13:26:35 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
        by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
        Thu, 13 Apr 2023 13:26:35 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
        id 9C52B74514B; Thu, 13 Apr 2023 08:26:34 -0500 (CDT)
From:   Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To:     robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Subject: [PATCH v7 0/5] hwmon: (pmbus/acbel-fsg032) Add Acbel power supply
Date:   Thu, 13 Apr 2023 08:26:22 -0500
Message-Id: <20230413132627.3444119-1-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wxha0F46N20Cils9gMd9SDkD4Jv5ggmm
X-Proofpoint-ORIG-GUID: wxha0F46N20Cils9gMd9SDkD4Jv5ggmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_08,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=624 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130116
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding new acbel,fsg032 driver and documentation updates.

Changes since V6:
Remove ccin changes in V6.

Lakshmi Yadlapati (5):
  dt-bindings: vendor-prefixes: Add prefix for acbel
  dt-bindings: trivial-devices: Add acbel,fsg032
  hwmon: (pmbus/acbel-fsg032) Add Acbel power supply
  docs: hwmon: Add documentaion for acbel-fsg032 PSU
  ARM: dts: aspeed: p10bmc: Change power supply info

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 Documentation/hwmon/acbel-fsg032.rst          | 80 +++++++++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts  | 12 +--
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/acbel-fsg032.c            | 85 +++++++++++++++++++
 8 files changed, 186 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/hwmon/acbel-fsg032.rst
 create mode 100644 drivers/hwmon/pmbus/acbel-fsg032.c

-- 
2.37.2

