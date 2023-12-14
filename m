Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0DF11B;
	Thu, 14 Dec 2023 06:37:31 -0800 (PST)
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BEDbMT6014342;
	Thu, 14 Dec 2023 09:37:10 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3v02rj0751-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 09:37:10 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 3BEEb8dx003517
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Dec 2023 09:37:08 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 14 Dec
 2023 09:37:07 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 14 Dec 2023 09:37:07 -0500
Received: from daniel-Precision-5530.ad.analog.com ([10.48.65.152])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3BEEaqwe017595;
	Thu, 14 Dec 2023 09:37:03 -0500
From: Daniel Matyas <daniel.matyas@analog.com>
To: 
CC: Daniel Matyas <daniel.matyas@analog.com>,
        Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH 2/3] bindings: hwmon: Add adi,adaq4224_temp as compatible string
Date: Thu, 14 Dec 2023 16:36:46 +0200
Message-ID: <20231214143648.175336-2-daniel.matyas@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214143648.175336-1-daniel.matyas@analog.com>
References: <20231214143648.175336-1-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: NPN-raDe3KCBaY0qGUPPNgEqVvyXxn_v
X-Proofpoint-ORIG-GUID: NPN-raDe3KCBaY0qGUPPNgEqVvyXxn_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-02_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=917 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312140102

In the device ada4224 the max31827 temperature sensor will be used, so
the default values corresponding to adaq4224_temp are the same for
max31827.

Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
---
 Documentation/devicetree/bindings/hwmon/adi,max31827.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
index f60e06ab7d0a..9f3b0839aa46 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
@@ -20,6 +20,7 @@ properties:
       - const: adi,max31827
       - items:
           - enum:
+              - adi,adaq4224_temp
               - adi,max31828
               - adi,max31829
           - const: adi,max31827
@@ -81,7 +82,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: adi,max31827
+            enum:
+              - adi,max31827
+              - adi,adaq4224_temp
 
     then:
       properties:
-- 
2.34.1

