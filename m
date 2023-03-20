Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD4EC761AF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Mar 2023 15:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjCTPuV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Mar 2023 11:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjCTPtR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Mar 2023 11:49:17 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C682ED58;
        Mon, 20 Mar 2023 08:40:56 -0700 (PDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KEIKe1028652;
        Mon, 20 Mar 2023 15:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2DAycKkNR5JzI421DzdYC9jkhTO5VG8838Qgc06IF9c=;
 b=V8CVYgwvc6D/47DbitnzwDEjZIgLr0xkOb5LcHh6In13zeBYgq0t09dc+Fo+8+WEYwEH
 zxLKqmX86swXRe7TD/IjglrkH8K2hmx2BFa0aggxwElNxudMJwJIgVRRV+xGRjBWYozj
 Huw/tDb17fhitXBc+GD1515FZG5XM6If7nAMsziVaECt//joXhtcmCfrQxn4aKXhUvYz
 EnVB5+lXbzypG61szK9ackMwQqj2T9ZNcHl/ye3Ek5w5YJmIjsklVEp/5fUNY/zBErFa
 DCAscQPfAgHcS76qnvgItEYiJzUmfsoMNY44//XYDAnF5M3hiV6iH5Kp2CaDLpsD4Slk TQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pes4q22gp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:40:34 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32KCZkN1003885;
        Mon, 20 Mar 2023 15:40:33 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
        by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x6wk2q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:40:33 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
        by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32KFeVjk32113138
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Mar 2023 15:40:32 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id ACA445805E;
        Mon, 20 Mar 2023 15:40:31 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 96F2A58054;
        Mon, 20 Mar 2023 15:40:31 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
        by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
        Mon, 20 Mar 2023 15:40:31 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
        id 1880074A47D; Mon, 20 Mar 2023 10:40:31 -0500 (CDT)
From:   Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To:     robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, Lakshmi Yadlapati <lakshmiy@us.ibm.com>
Subject: [PATCH v2 2/5] dt-bindings: trivial-devices: Add acbel,crps
Date:   Mon, 20 Mar 2023 10:40:16 -0500
Message-Id: <20230320154019.1943770-3-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154019.1943770-1-lakshmiy@us.ibm.com>
References: <20230320154019.1943770-1-lakshmiy@us.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vpPrbCaIJPUxCMGT8zs_6u0BvFSCF_on
X-Proofpoint-ORIG-GUID: vpPrbCaIJPUxCMGT8zs_6u0BvFSCF_on
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_12,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=642 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200131
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add Acbel CRPS Series power supply to trivial devices.

Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6f482a254a1d..ae2cf4411b39 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -30,6 +30,8 @@ properties:
     items:
       - enum:
             # SMBus/I2C Digital Temperature Sensor in 6-Pin SOT with SMBus Alert and Over Temperature Pin
+          - acbel,crps
+            # Acbel CRPS Series power supply
           - ad,ad7414
             # ADM9240: Complete System Hardware Monitor for uProcessor-Based Systems
           - ad,adm9240
-- 
2.37.2

